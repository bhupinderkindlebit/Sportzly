using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Repository;

namespace Sportzly.Business
{
    public class GroupBusiness
    {
        public ActionResult<CommunityEntity> GetCommunities(CommunityQuery communityQueryEntity)
        {
            ActionResult<CommunityEntity> result = new ActionResult<CommunityEntity>();

            result.Results = new GroupRepository().GetCommunities(communityQueryEntity);

            if (communityQueryEntity.SessionUserId.HasValue && result.Results != null)
            {
                result.Results.ToList().ForEach(rs =>
                {
                    var repository = new GroupRepository();
                    rs.Joined = repository.HasUserJoined(rs.Id, communityQueryEntity.SessionUserId.Value);
                });
            }

            return result;
        }

        public ActionResult<BaseEntity> JoinCommunity(CommunityQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            KeyValuePair<int, string> message = new KeyValuePair<int, string>();
            UserExceptionType messageType = UserExceptionType.Internal;
            
            new GroupRepository().JoinCommunity(teamQueryEntity, out message, out messageType);
            
            if (messageType != UserExceptionType.Internal)
            {
                result.ResultError = ErrorEntity.Create(messageType, message);
            }

            return result;
        }

        //public ActionResult<BaseEntity> FollowTeam(CommunityQuery teamQueryEntity)
        //{
        //    ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

        //    KeyValuePair<int, string> message = new KeyValuePair<int,string>();
        //    UserExceptionType messageType = UserExceptionType.Internal;

        //    if (!new TeamRepository().FollowTeam(teamQueryEntity, out message, out messageType))
        //    {
        //        result.ResultError = ErrorEntity.Create(messageType, message);
        //    }

        //    return result;
        //}
    }
}
