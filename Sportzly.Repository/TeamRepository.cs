using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.DataAccess;
using Sportzly.Framework;
using Sportzly.Framework.Exceptions;
using System.Web;

namespace Sportzly.Repository
{
    public class TeamRepository
    {
        public IList<TeamEntity> GetTeams(TeamQuery teamQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var email = teamQueryEntity.Email;
                var criteria = teamQueryEntity.KeyWord;
                IEnumerable<Team> result = context.Teams.AsEnumerable<Team>()
                    .Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value);

                var requestingUser = context.Users.First(rs => rs.Id == teamQueryEntity.SessionUserId).Id;

                if (!string.IsNullOrEmpty(email))
                {
                    result = new List<Team>().AsQueryable();

                    var userId = context.Users.First(rs => rs.Email == email).Id;

                    var members = context.TeamMembers.Where(rs => rs.UserId == userId && rs.IsApproved.HasValue && rs.IsApproved.Value);
                    var followers = context.TeamFollowers.Where(rs => rs.UserId == userId);
                    var owners = context.Teams.Where(rs => rs.OwnerId == userId);

                    if (members.Any())
                        result = result.Concat(members.Select(rs => rs.Team));

                    if (followers.Any())
                        result = result.Concat(followers.Select(rs => rs.Team));

                    if (owners.Any())
                        result = result.Concat(owners);

                    result = result.Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value);
                }

                if (teamQueryEntity.Id > 0)
                {
                    result = result.Where(rs => rs.Id == teamQueryEntity.Id);
                }
                if (string.IsNullOrEmpty(criteria))
                    criteria = string.Empty;

                //switch (criteria.ToLower())
                //{
                //    case "popular":
                //        result = result.OrderByDescending(rs => rs.TeamMembers.Count());
                //        break;

                //    case "new":
                //        result = result.OrderByDescending(rs => rs.CreateDate);
                //        break;

                //    default:
                //        result = result.OrderByDescending(rs => rs.TeamMembers.Count());
                //        break;

                //}

                var list = result.Distinct().OrderByDescending(rs => rs.TeamMembers.Where(j => j.IsApproved.HasValue && j.IsApproved.Value).Count()).ToList();
                var teams = EntityMapper.MapList<Team, TeamEntity>(list);
                //foreach (var team in teams)
                //{
                //    //team.Members = new List<TeamMemberEntity>();
                //    var members = context.TeamMembers.Where(rs => rs.TeamId == team.Id);
                //    var membersEntity = EntityMapper.MapList<TeamMember, TeamMemberEntity>(members.ToList());
                //    team.Members = membersEntity;
                //}
                return teams;
            }
        }

        public IList<TeamEntity> GetTeamsHome(TeamQuery teamQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                IEnumerable<Team> result = context.Teams.AsEnumerable<Team>()
                    .Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value);
                var list = result.Where(rs => (rs.TeamMembers.Where(j => j.IsApproved.HasValue && j.IsApproved.Value).Count() > 0) && rs.Photo != null).OrderByDescending(rs => rs.TeamMembers.Where(j => j.IsApproved.HasValue && j.IsApproved.Value).Count()).ToList();
                //  list = list.Take(6).ToList();
                var teams = EntityMapper.MapList<Team, TeamEntity>(list);
                teams = teams.Where(i => !i.Photo.Contains("default.png")).ToList();
                teams = teams.Take(8).ToList();
                return teams;
            }
        }

        public bool HasUserFollowed(long teamId, long userId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                return !(context.TeamFollowers.FirstOrDefault(rs => rs.TeamId == teamId && rs.UserId == userId) == null);
            }
        }

        public bool HasUserJoined(long teamId, long userId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                return !(context.TeamMembers.FirstOrDefault(rs => rs.TeamId == teamId && rs.UserId == userId) == null);
            }
        }

        public bool JoinTeam(TeamQuery teamQueryEntity, out KeyValuePair<int, string> message, out Framework.UserExceptionType messageType)
        {
            message = new KeyValuePair<int, string>();
            messageType = UserExceptionType.Internal;

            using (var context = new SportzlyDataContext())
            {
                Team team = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id);

                if (team == null)
                {
                    messageType = UserExceptionType.Error;
                    message = new KeyValuePair<int, string>(8000,
                        string.Format(UserMessages.TEAM_NOT_EXISTS));

                    return false;
                }

                if (team.OwnerId == teamQueryEntity.SessionUserId)
                {
                    messageType = UserExceptionType.Error;
                    message = new KeyValuePair<int, string>(8001,
                        string.Format(UserMessages.TEAM_MEMBER_OWNER, team.TeamName));

                    return false;
                }

                TeamMember teamMember = context.TeamMembers
                    .FirstOrDefault(rs => rs.TeamId == team.Id && rs.UserId == teamQueryEntity.SessionUserId);

                if (teamQueryEntity.OptIn)
                {
                    if (teamMember != null && teamMember.IsApproved.HasValue && !teamMember.IsApproved.Value)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.TEAM_MEMBER_PENDING_APPROAVAL, team.TeamName));

                        return false;
                    }

                    if (teamMember != null && teamMember.IsBlocked.HasValue && teamMember.IsBlocked.Value)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.TEAM_MEMBER_BLOCKED, team.TeamName));

                        return false;
                    }


                    if (teamMember != null)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.TEAM_ALREADY_MEMBER, team.TeamName));

                        return false;
                    }

                    teamMember = new TeamMember()
                    {
                        UserId = teamQueryEntity.SessionUserId.Value,
                        TeamId = teamQueryEntity.Id,
                        JoinDate = DateTime.Now
                    };

                    if (team.AutoJoin)
                        teamMember.IsApproved = true;
                    else
                        teamMember.IsApproved = null;

                    context.TeamMembers.AddObject(teamMember);
                    context.SaveChanges();

                    if (!team.AutoJoin)
                    {
                        messageType = UserExceptionType.Message;
                        message = new KeyValuePair<int, string>(8002,
                            string.Format(UserMessages.TEAM_JOINED_PENDING_APPROVAL, team.TeamName));

                        var user = context.Users.First(rs => rs.Id == teamQueryEntity.SessionUserId);

                        MailUtils.SendTeamMembershipRequest(team.TeamName, team.User.Email, teamMember.User.GetProfileName(), teamMember.User.Email, user.GetProfilePhoto());
                    }

                    return true;
                }
                else
                {
                    if (teamMember == null)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(7003,
                            string.Format(UserMessages.TEAM_NOT_MEMBER, team.TeamName));

                        return false;
                    }

                    context.TeamMembers.DeleteObject(teamMember);
                    context.SaveChanges();
                    return true;
                }
            }
        }

        public bool FollowTeam(TeamQuery teamQueryEntity, out KeyValuePair<int, string> message, out UserExceptionType messageType)
        {
            message = new KeyValuePair<int, string>();
            messageType = UserExceptionType.Internal;

            using (var context = new SportzlyDataContext())
            {
                Team team = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id);

                if (team == null)
                {
                    messageType = UserExceptionType.Error;
                    message = new KeyValuePair<int, string>(7000,
                        string.Format(UserMessages.TEAM_NOT_EXISTS));

                    return false;
                }

                if (team.OwnerId == teamQueryEntity.SessionUserId)
                {
                    messageType = UserExceptionType.Error;
                    message = new KeyValuePair<int, string>(7001,
                        string.Format(UserMessages.TEAM_FOLLOWER_OWNER, team.TeamName));

                    return false;
                }

                TeamFollower teamFollower = context.TeamFollowers
                    .FirstOrDefault(rs => rs.TeamId == team.Id && rs.UserId == teamQueryEntity.SessionUserId);

                if (teamQueryEntity.OptIn)
                {
                    if (teamFollower != null)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(7002,
                            string.Format(UserMessages.TEAM_ALREADY_FOLLOWING, team.TeamName));

                        return false;
                    }

                    teamFollower = new TeamFollower()
                    {
                        UserId = teamQueryEntity.SessionUserId.Value,
                        TeamId = teamQueryEntity.Id
                    };

                    context.TeamFollowers.AddObject(teamFollower);
                    context.SaveChanges();
                    return true;
                }
                else
                {
                    if (teamFollower == null)
                    {
                        messageType = UserExceptionType.Warning;
                        message = new KeyValuePair<int, string>(7003,
                            string.Format(UserMessages.TEAM_ALREADY_FOLLOWING, team.TeamName));

                        return false;
                    }

                    context.TeamFollowers.DeleteObject(teamFollower);
                    context.SaveChanges();
                    return true;
                }

            }
        }

        public IList<TeamNoticeEntity> GetTeamNotices(TeamQuery teamQueryEntity, out int total)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.TeamNoticeBoards.AsQueryable();



                if (teamQueryEntity.ParentId != 0)
                {
                    result = result.Where(rs => (rs.ParentId.HasValue && rs.ParentId == teamQueryEntity.ParentId) || rs.Id == teamQueryEntity.ParentId);
                    result = result.OrderBy(rs => rs.CreateDate);
                }
                else
                {
                    result = result.Where(rs => rs.TeamId.HasValue && rs.TeamId.Value == teamQueryEntity.Id && (rs.ParentId == null || rs.ParentId == 0));
                    result = result.OrderByDescending(rs => rs.CreateDate);
                }



                total = result.Count();

                result = result
                        .Skip(teamQueryEntity.RecordsFrom)
                        .Take(teamQueryEntity.RecordsCount);


                return EntityMapper.MapList<TeamNoticeBoard, TeamNoticeEntity>(result.ToList());
            }
        }

        public IList<TeamEntity> SaveTeams(TeamQuery teamQueryEntity)
        {
            try
            {
                Team result = null;
                using (var context = new Sportzly.DataAccess.SportzlyDataContext())
                {
                    result = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Team.Id);

                    if (result == null)
                    {
                        result = new Team();
                        result.CreateDate = DateTime.Now;
                        result.OwnerId = decimal.Parse(teamQueryEntity.SessionUserId.Value.ToString());
                        context.Teams.AddObject(result);
                        try
                        {
                            var OwnerName = context.Users.Where(n => n.Id == teamQueryEntity.SessionUserId.Value).FirstOrDefault().FirstName + " " + context.Users.Where(n => n.Id == teamQueryEntity.SessionUserId.Value).FirstOrDefault().LastName;
                            MailUtils.SendTeamSignUpMail(teamQueryEntity.Team.TeamName, "http://sportzly.com/" + teamQueryEntity.Team.Photo, OwnerName);
                        }
                        catch (Exception ex) { }
                    }

                    result.TeamName = teamQueryEntity.Team.TeamName;
                    result.City = teamQueryEntity.Team.City;
                    result.Country = teamQueryEntity.Team.Country;
                    result.Description = teamQueryEntity.Team.Description;
                    result.ScorecardUrl = teamQueryEntity.Team.ScoreCardUrl;
                    result.IsRecruitmentOpen = true;
                    result.Photo = teamQueryEntity.Team.Photo;
                    result.PracticeGround = teamQueryEntity.Team.PracticeGround;
                    result.Season = teamQueryEntity.Team.Season;
                    result.IsEnabled = true;
                    result.IsPrivate = teamQueryEntity.Team.IsPrivate;
                    var sport = context.Sports.FirstOrDefault(rs => rs.Name == teamQueryEntity.Team.SportsName);
                    if (sport == null)
                    {
                        sport = new Sport() { Name = teamQueryEntity.Team.SportsName };
                        context.Sports.AddObject(sport);
                        context.SaveChanges();
                    }
                    result.Sport = sport;

                    var category = context.TeamCategories.FirstOrDefault(rs => rs.Name == teamQueryEntity.Team.TeamCategory);
                    if (category == null)
                    {
                        category = new TeamCategory() { Name = teamQueryEntity.Team.TeamCategory };
                        context.TeamCategories.AddObject(category);
                        context.SaveChanges();
                    }

                    result.CategoryId = category.Id;
                    context.SaveChanges();

                    return EntityMapper.MapList<Team, TeamEntity>(result);

                }


            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public IList<TeamMemberEntity> GetTeamMembers(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.TeamMembers.AsQueryable();

                if (teamQueryEntity.Id > 0)
                {
                    result = result.Where(rs => rs.TeamId == teamQueryEntity.Id);
                }

                if (!string.IsNullOrEmpty(teamQueryEntity.Email))
                {
                    result = result.Where(rs => rs.Team.User.Email == teamQueryEntity.Email);
                }

                result = result.Where(rs => (rs.IsApproved == null || rs.IsApproved.Value));

                return EntityMapper.MapList<TeamMember, TeamMemberEntity>(result.ToList());
            }
        }

        public IList<TeamMemberEntity> GetTeamAdmins(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.TeamAdmins.AsQueryable();

                if (teamQueryEntity.Id > 0)
                {
                    result = result.Where(rs => rs.TeamId == teamQueryEntity.Id);
                }


                return EntityMapper.MapList<TeamAdmin, TeamMemberEntity>(result.ToList());
            }
        }

        public IList<TeamMemberEntity> GetTeamMembersApproved(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.TeamMembers.AsQueryable();

                if (teamQueryEntity.Id > 0)
                {
                    result = result.Where(rs => rs.TeamId == teamQueryEntity.Id);
                }

                if (!string.IsNullOrEmpty(teamQueryEntity.Email))
                {
                    result = result.Where(rs => rs.Team.User.Email == teamQueryEntity.Email);
                }

                result = result.Where(rs => (rs.IsApproved.Value));

                return EntityMapper.MapList<TeamMember, TeamMemberEntity>(result.ToList());
            }
        }

        public List<TokenEntity> GetInviteToken(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id);
                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteId == result.Id && rs.inviteType == "t");
                if (invite == null)
                {
                    invite = new Invitation()
                    {
                        inviteId = result.Id,
                        inviteType = "t",
                        inviteToken = Guid.NewGuid()
                    };
                    context.Invitations.AddObject(invite);
                    context.SaveChanges();
                }
                var lst = new List<TokenEntity>();
                string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(invite.inviteToken.ToString()));
                var html = MailUtils.SendTeamInvitationHTML(result.User.GetProfileName(), invite.inviteToken.ToString());
                lst.Add(new TokenEntity { Token = activationLink, MailHTML = html });
                return lst;
            }
        }

        public List<TokenEntity> GetInviteTokenTwitter(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id);
                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteId == result.Id && rs.inviteType == "t");
                if (invite == null)
                {
                    invite = new Invitation()
                    {
                        inviteId = result.Id,
                        inviteType = "t",
                        inviteToken = Guid.NewGuid()
                    };
                    context.Invitations.AddObject(invite);
                    context.SaveChanges();
                }
                var lst = new List<TokenEntity>();
                string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(invite.inviteToken.ToString()));
                System.Uri address = new System.Uri("http://tinyurl.com/api-create.php?url=" + activationLink);
                System.Net.WebClient client = new System.Net.WebClient();
                string tinyUrl = client.DownloadString(address);
                // var html = MailUtils.SendTeamInvitationHTML(result.User.GetProfileName(), invite.inviteToken.ToString());
                lst.Add(new TokenEntity { Token = tinyUrl, MailHTML = "" });
                return lst;
            }
        }

        public bool InviteToTeam(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                string type = "t";
                var result = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id);
                if (result == null)
                    return false;



                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteId == result.Id && rs.inviteType == type);
                if (invite == null)
                {
                    invite = new Invitation()
                    {
                        inviteId = result.Id,
                        inviteType = type,
                        inviteToken = Guid.NewGuid()
                    };
                    context.Invitations.AddObject(invite);
                    context.SaveChanges();
                }
                try
                {
                    //  var emailIds = teamQueryEntity.Email;
                    var objCom = new CommonRepository();
                    var emailIds = objCom.ExtractEmailAddressesFromString(teamQueryEntity.Email);
                    emailIds.ToList().ForEach(rs =>
                    {
                        if (!rs.Contains("@facebook.com") && rs.Contains("@"))
                        {
                            var inviteEmailAddress = context.InviteEmailaddresses.Where(i => i.InviteType == type && i.InviteEmail == rs && i.InviteBy == teamQueryEntity.SessionUserId).FirstOrDefault();
                            if (inviteEmailAddress == null)
                            {
                                inviteEmailAddress = new InviteEmailaddress()
                                {
                                    InviteBy = teamQueryEntity.SessionUserId,
                                    InviteDate = DateTime.Now,
                                    InviteEmail = rs,
                                    InviteRegistered = false,
                                    InviteType = type,
                                    TeamId = result.Id,
                                    IsUnsubscribe = false
                                };
                                context.InviteEmailaddresses.AddObject(inviteEmailAddress);
                                context.SaveChanges();
                            }
                            else
                            {
                                if (inviteEmailAddress.IsUnsubscribe)
                                {
                                    int removeIndex = Array.IndexOf(emailIds, inviteEmailAddress.InviteEmail);
                                    if (removeIndex >= 0)
                                    {
                                        emailIds = emailIds.Where(i => i != emailIds[removeIndex]).ToArray();
                                    }
                                }
                                else
                                {
                                    inviteEmailAddress.InviteDate = DateTime.Now;
                                    context.SaveChanges();
                                }
                            }
                        }
                    });
                    MailUtils.SendTeamInvitation(result.User.GetProfileName(), emailIds, invite.inviteToken.ToString(), result.TeamName, teamQueryEntity.ServiceName, result.User.GetProfilePhoto());
                }
                catch (Exception ex)
                {
                    MailUtils.SendExceptionMessage(ex.ToString());
                }
                return true;
            }

        }

        public IList<InviteEntity> GetPendingInvitesTeam(TeamQuery teamEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.InviteEmailaddresses.AsQueryable();
                result = result.Where(i => i.InviteRegistered == false && i.InviteType == "t" && i.InviteBy == teamEntity.SessionUserId && i.TeamId == teamEntity.Id);
                return EntityMapper.MapList<InviteEmailaddress, InviteEntity>(result.ToList());
            }
        }

        public IList<PollEntity> GetPolls(PollQuery pollEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Polls.AsQueryable();
                result = result.Where(i => i.EndPoll == true && i.PollExpiry >= DateTime.Now && i.TeamId == pollEntity.TeamId);
                return EntityMapper.MapList<Poll, PollEntity>(result.ToList());
            }

        }

        public bool SaveOption(PollQuery pollEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Votes.Where(i => i.PolIId == pollEntity.PollId && i.UserId == pollEntity.SessionUserId).FirstOrDefault();
                if (result != null)
                {
                    result.OptionId = pollEntity.OptionId;
                    context.SaveChanges();
                }
                else
                {
                    var v = new Vote();
                    v.OptionId = pollEntity.OptionId;
                    v.PolIId = pollEntity.PollId;
                    v.UserId = pollEntity.SessionUserId;
                    context.Votes.AddObject(v);
                    context.SaveChanges();
                }
                return true;
            }

        }

        public IList<PollEntity> GetPollData(PollQuery pollEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Polls.AsQueryable();
                result = result.Where(i => i.ID == pollEntity.PollId);
                return EntityMapper.MapList<Poll, PollEntity>(result.ToList());
            }

        }

        public bool ApproveTeamMember(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.TeamMembers.FirstOrDefault(rs => rs.TeamId == teamQueryEntity.Id && rs.UserId == teamQueryEntity.MemberId);
                if (result == null)
                    return false;

                result.IsApproved = teamQueryEntity.OptIn;

                context.SaveChanges();

                MailUtils.SendTeamMembershipResponse(result.User.GetProfileName(), result.Team.TeamName, result.IsApproved.Value, result.Team.User.GetProfileName(), result.User.Email, result.User.GetProfilePhoto());
                return true;
            }

        }

        public bool ApprovedTeamAdmin(TeamQuery teamQueryEntity, out KeyValuePair<int, string> message, out UserExceptionType messageType)
        {
            using (var context = new SportzlyDataContext())
            {
                var TeamAdmins = context.TeamAdmins.Where(i => i.TeamId == teamQueryEntity.Id).ToList();
                foreach (var item in TeamAdmins)
                {
                    var admin = context.TeamAdmins.Where(i => i.TeamId == teamQueryEntity.Id && i.UserId == item.UserId).FirstOrDefault();
                    context.TeamAdmins.DeleteObject(admin);
                    context.SaveChanges();
                }
                var members = teamQueryEntity.MembersList;
                var adminusers = members.Split(',');
                foreach (var item in adminusers)
                {
                    TeamAdmin ta = new TeamAdmin();
                    ta.TeamId = teamQueryEntity.Id;
                    ta.UserId = Convert.ToDecimal(item);
                    context.TeamAdmins.AddObject(ta);
                    context.SaveChanges();
                }
                messageType = UserExceptionType.Message;
                message = new KeyValuePair<int, string>(8002, "The selected team members converted to team admin successfully");
                ;
                return true;
            }

        }

        public IList<TeamNoticeEntity> UpdateNotice(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = new TeamNoticeBoard()
                {
                    CreateDate = DateTime.Now,
                    Description = teamQueryEntity.Message,
                    IsActive = true,
                    OwnerId = teamQueryEntity.SessionUserId,
                    TeamId = teamQueryEntity.Id,
                };

                if (teamQueryEntity.ParentId > 0)
                    result.ParentId = teamQueryEntity.ParentId;

                context.TeamNoticeBoards.AddObject(result);
                context.SaveChanges();

                var members = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id).TeamMembers;

                var memberUsers = (from m in members join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                var memberText = (from m in members
                                  join u in context.Users on m.UserId equals u.Id
                                  join c in context.Carriers on u.Carrier equals c.Carrier_id_pk
                                  where u.Phone != null && u.Phone != ""
                                  select u.Phone + c.Carrier_Value).ToList();

                var memberSMS = (from m in members
                                 join u in context.Users on m.UserId equals u.Id
                                 join c in context.Addresses on u.AddressId equals c.Id
                                 join d in context.Localities on c.LocalityId equals d.Id
                                 where u.Phone != null && u.Phone != "" && d.Country == "India"
                                 select u.Phone).ToList();

                var OwnerEmailText = (from u in context.Users
                                      join c in context.Carriers on u.Carrier equals c.Carrier_id_pk
                                      where u.Id == result.Team.User.Id && u.Phone != null && u.Phone != ""
                                      select u.Phone + c.Carrier_Value).ToList();

                var user = context.Users.First(rs => rs.Id == teamQueryEntity.SessionUserId);
                MailUtils.SendNoticeUpdate(memberUsers, result.Team.User.Email, result.Team.TeamName, result.Team.Id, teamQueryEntity.Message + "-" + GetName(Convert.ToInt64(teamQueryEntity.SessionUserId)), GetFirstName(Convert.ToInt64(teamQueryEntity.SessionUserId)), user.GetProfilePhoto());
                MailUtils.SendNoticeUpdateText(memberText, OwnerEmailText.Count > 0 ? OwnerEmailText[0] : "", result.Team.TeamName, teamQueryEntity.Message + "-" + GetFirstName(Convert.ToInt64(teamQueryEntity.SessionUserId)), result.Team.User.Email, GetName(Convert.ToInt64(teamQueryEntity.SessionUserId)));
                MailUtils.SendNoticeUpdateIndia(memberSMS, OwnerEmailText.Count > 0 ? OwnerEmailText[0] : "", result.Team.TeamName, teamQueryEntity.Message + "-" + GetFirstName(Convert.ToInt64(teamQueryEntity.SessionUserId)), result.Team.User.Email, GetName(Convert.ToInt64(teamQueryEntity.SessionUserId)));

                return EntityMapper.MapList<TeamNoticeBoard, TeamNoticeEntity>(result);
            }
        }

        public List<TeamEntity> SearchTeams(string searchString, long? userId)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.AsQueryable().Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value && (rs.IsPrivate == null || rs.IsPrivate == false));

                var query = searchString.Split(new string[] { ",", " ", "+" }, StringSplitOptions.RemoveEmptyEntries);

                result = (from r in result
                          from q in query
                          where r.TeamName.Contains(q)
                             || r.Description.Contains(q)
                             || r.TeamCategory.Name.Contains(q)
                             || r.Sport.Name.Contains(q)
                          select r
                          ).Distinct().OrderByDescending(rs => rs.CreateDate);

                //result = result.Where(rs =>
                //        rs.TeamName.Contains(searchString)
                //    || rs.Description.Contains(searchString)
                //    || rs.TeamCategory.Name.Contains(searchString)
                //    || rs.Sport.Name.Contains(searchString)
                //);

                return EntityMapper.MapList<Team, TeamEntity>(result.ToList()).ToList();
            }
        }
        public List<TeamEntity> SearchTeamsAutoComplete(string searchString, long? userId)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.AsQueryable().Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value && (rs.IsPrivate == null || rs.IsPrivate == false));

                var query = searchString.Split(new string[] { ",", " ", "+" }, StringSplitOptions.RemoveEmptyEntries);

                result = (from r in result
                          from q in query
                          where r.TeamName.Contains(q)
                             || r.Sport.Name.Contains(q)
                          select r
                          ).Distinct().OrderByDescending(rs => rs.CreateDate);

                //result = result.Where(rs =>
                //        rs.TeamName.Contains(searchString)
                //    || rs.Description.Contains(searchString)
                //    || rs.TeamCategory.Name.Contains(searchString)
                //    || rs.Sport.Name.Contains(searchString)
                //);

                return EntityMapper.MapList<Team, TeamEntity>(result.ToList()).ToList();
            }
        }
        public IList<TeamEntity> SearchTeams(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.AsQueryable()
                               .Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value);

                if (!string.IsNullOrEmpty(teamQueryEntity.KeyWord))
                {
                    var query = teamQueryEntity.KeyWord.Split(new string[] { ",", " ", "+" }, StringSplitOptions.RemoveEmptyEntries);

                    result = (from r in result
                              from q in query
                              where r.TeamName.Contains(q)
                                 || r.Description.Contains(q)
                                 || r.TeamCategory.Name.Contains(q)
                                 || r.Sport.Name.Contains(q)
                              select r
                              ).Distinct();
                }

                if (!string.IsNullOrEmpty(teamQueryEntity.Level))
                {
                    result = result.Where(rs => rs.TeamCategory.Name.Contains(teamQueryEntity.Level));
                }

                if (!string.IsNullOrEmpty(teamQueryEntity.Sports))
                {
                    result = result.Where(rs => rs.Sport.Name.Contains(teamQueryEntity.Sports));
                }

                if (!string.IsNullOrEmpty(teamQueryEntity.Location))
                {
                    result = result.Where(rs => rs.City.Contains(teamQueryEntity.Location));
                }

                return EntityMapper.MapList<Team, TeamEntity>(result.Distinct().OrderByDescending(rs => rs.CreateDate).ToList());
            }
        }

        public bool DeleteTeam(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.FirstOrDefault(rs => rs.Id == teamQueryEntity.Id && rs.OwnerId == teamQueryEntity.SessionUserId);

                if (result != null)
                {
                    result.IsEnabled = false;
                    context.SaveChanges();
                    return true;
                }
            }
            return false;
        }

        public int CheckTeamMember(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                //var team = context.Teams.Where(rs => rs.OwnerId == teamQueryEntity.SessionUserId ||
                //       rs.TeamMembers.Any(rs1 => rs1.UserId.Value == teamQueryEntity.SessionUserId && rs1.IsApproved.HasValue && rs1.IsApproved.Value));

                //   team = team.Where(rs => rs.Id == teamQueryEntity.Id);

                //   if (!team.Any())
                //   {
                //       return false;
                //   }
                //   else {

                //       return true;
                //   }
                var isTeam = 0;
                //var teams = GetTeams(teamQueryEntity);
                //if (!teams.Any(rs => rs.OwnerId == teamQueryEntity.SessionUserId
                //    || rs.Members.Any(rs1 => rs1.Id == teamQueryEntity.SessionUserId)
                //    || rs.Fans.Any(rs1 => rs1.Id == teamQueryEntity.SessionUserId)))
                //{
                //    isTeam = 1;
                //}
                //else
                //{

                //    isTeam = 2;
                //}

                //if (teams.Any(rs => rs.IsPrivate == true))
                //{
                //    isTeam = 3;
                //}

                var teams = GetTeams(teamQueryEntity);
                if (teams.Any(rs => rs.OwnerId == teamQueryEntity.SessionUserId
                    || rs.Members.Any(rs1 => rs1.Id == teamQueryEntity.SessionUserId)))
                {
                    isTeam = 2;
                }
                else
                {
                    if (teams.Any(rs => rs.IsPrivate == true))
                    {
                        isTeam = 3;
                    }
                    else if (teams.Any(rs => rs.Fans.Any(rs1 => rs1.Id == teamQueryEntity.SessionUserId)))
                    {
                        isTeam = 2;
                    }
                    else
                    {
                        isTeam = 1;
                    }
                }

                return isTeam;
            }

        }

        internal string GetTeamName(long teamId)
        {
            string result = string.Empty;
            using (var context = new SportzlyDataContext())
            {
                var team = context.Teams.FirstOrDefault(rs => rs.Id == teamId);
                if (team != null)
                    result = team.TeamName;
            }
            return result;
        }

        internal string GetTeamSport(long teamId)
        {
            string result = string.Empty;
            using (var context = new SportzlyDataContext())
            {
                var team = context.Teams.FirstOrDefault(rs => rs.Id == teamId);
                if (team != null)
                    result = team.Sport.Name;
            }
            return result;
        }

        internal string GetTeamLogoUrl(long teamId)
        {
            string result = string.Empty;
            using (var context = new SportzlyDataContext())
            {
                var team = context.Teams.FirstOrDefault(rs => rs.Id == teamId);
                if (team != null)
                    result = team.Photo;
            }
            return result;

        }

        internal string GetFirstName(long userId)
        {
            string result = string.Empty;
            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.FirstOrDefault(rs => rs.Id == userId);
                if (user != null)
                    result = user.FirstName;
            }
            return result;

        }

        internal string GetName(long userId)
        {
            string result = string.Empty;
            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.FirstOrDefault(rs => rs.Id == userId);
                if (user != null)
                    result = user.FirstName + " " + user.LastName;
            }
            return result;

        }

        public IList<KeyValueEntity> GetMyTeams(TeamQuery teamQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Teams.AsQueryable();

                result = result.Where(rs => rs.OwnerId == teamQueryEntity.Id && rs.IsEnabled == true);

                var team = context.Teams.AsQueryable();
                var finalresult = result;

                var teamadmin = context.TeamAdmins.Where(i => i.UserId == teamQueryEntity.Id).ToList();
                if (teamadmin.Count > 0)
                {
                    var resultadmin = team.Where(i => i.TeamAdmins.Any(k => k.TeamId == i.Id && k.UserId == teamQueryEntity.Id));
                    finalresult = finalresult.Concat(resultadmin);
                }


                return EntityMapper.MapList<Team, KeyValueEntity>(finalresult.ToList());
            }
        }
    }
}
