using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.DataAccess;
using Sportzly.Framework;
using Sportzly.Framework.Exceptions;

namespace Sportzly.Repository
{
    public class GroupRepository
    {
        public IList<CommunityEntity> GetCommunities(CommunityQuery communityQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var email = communityQueryEntity.Email;
                var criteria = communityQueryEntity.Criteria;
                var groupId = communityQueryEntity.CommunityId;

                var result = context.Groups.AsQueryable<Group>();

                var requestingUser = context.Users.First(rs => rs.Id == communityQueryEntity.SessionUserId).Id;


                if (!string.IsNullOrEmpty(email))
                {
                    result = new List<Group>().AsQueryable();

                    var userId = context.Users.First(rs => rs.Email == email).Id;

                    var members = context.GroupMembers.Where(rs => rs.MemberId == userId);
                    var owners = context.Groups.Where(rs => rs.OwnerId == userId);

                    if (members.Any())
                        result = result.Concat(members.Select(rs => rs.Group));

                    if (owners.Any())
                        result = result.Concat(owners);
                }

                if (groupId != default(long))
                {
                    result = result.Where(rs => rs.Id == groupId);
                }

                if (string.IsNullOrEmpty(criteria))
                    criteria = string.Empty;

                switch (criteria.ToLower())
                {
                    case "popular":
                        result = result.OrderByDescending(rs => rs.GroupMembers.Count());
                        break;

                    case "new":
                        result = result.OrderByDescending(rs => rs.CreatedOn);
                        break;

                    default:
                        result = result.OrderByDescending(rs => rs.GroupMembers.Count());
                        break;

                }

                return EntityMapper.MapList<Group, CommunityEntity>(result.ToList());
            }
        }


        public bool HasUserJoined(long groupId, long userId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                return !(context.GroupMembers.FirstOrDefault(rs => rs.GroupId== groupId && rs.MemberId == userId) == null);
            }
        }

        public bool JoinCommunity(CommunityQuery communityQueryEntity, out KeyValuePair<int, string> message, out Framework.UserExceptionType messageType)
        {
            message = new KeyValuePair<int, string>();
            messageType = UserExceptionType.Internal;

            using (var context = new SportzlyDataContext())
            {
                Group group = context.Groups.FirstOrDefault(rs => rs.Id == communityQueryEntity.CommunityId);

                if (group == null)
                {
                    messageType = UserExceptionType.Error;
                    message = new KeyValuePair<int, string>(8000,
                        string.Format(UserMessages.GROUP_NOT_EXISTS));

                    return false;
                }

                if (group.OwnerId == communityQueryEntity.SessionUserId)
                {
                    messageType = UserExceptionType.Error;
                    message = new KeyValuePair<int, string>(8001,
                        string.Format(UserMessages.GROUP_MEMBER_OWNER, group.Name));

                    return false;
                }

                GroupMember groupMember = context.GroupMembers
                    .FirstOrDefault(rs => rs.GroupId == group.Id && rs.MemberId == communityQueryEntity.SessionUserId);

                if (communityQueryEntity.OptIn)
                {
                    if (groupMember != null && groupMember.IsApproved.HasValue && !groupMember.IsApproved.Value)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.GROUP_MEMBER_PENDING_APPROAVAL, group.Name));

                        return false;
                    }

                    if (groupMember != null && groupMember.IsBlocked.HasValue && groupMember.IsBlocked.Value)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.GROUP_MEMBER_BLOCKED, group.Name));

                        return false;
                    }


                    if (groupMember != null)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.GROUP_ALREADY_MEMBER, group.Name));

                        return false;
                    }

                    groupMember = new GroupMember()
                    {
                        MemberId = communityQueryEntity.SessionUserId.Value,
                        GroupId = communityQueryEntity.CommunityId,
                        JoinDate = DateTime.Now,
                        
                    };

                    context.GroupMembers.AddObject(groupMember);
                    context.SaveChanges();

                    if (true)
                    {
                        messageType = UserExceptionType.Message;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.GROUP_JOINED_PENDING_APPROVAL, group.Name));
                    }

                    return true;
                }
                else
                {
                    if (groupMember == null)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(7003,
                            string.Format(UserMessages.GROUP_NOT_MEMBER, group.Name));

                        return false;
                    }

                    context.GroupMembers.DeleteObject(groupMember);
                    context.SaveChanges();
                    return true;
                }
            }
        }

       
    }
}
