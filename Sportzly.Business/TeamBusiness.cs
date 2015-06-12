using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Repository;
using Sportzly.Framework.Exceptions;

namespace Sportzly.Business
{
    public class TeamBusiness
    {
        public ActionResult<TeamEntity> GetTeams(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamEntity> result = new ActionResult<TeamEntity>();

            result.Results = new TeamRepository().GetTeams(teamQueryEntity);

            if (teamQueryEntity.SessionUserId.HasValue && result.Results != null)
            {
                result.Results.ToList().ForEach(rs =>
                {
                    var repository = new TeamRepository();
                    rs.Followed = repository.HasUserFollowed(rs.Id, teamQueryEntity.SessionUserId.Value);
                    rs.Joined = repository.HasUserJoined(rs.Id, teamQueryEntity.SessionUserId.Value);
                    var context = new Sportzly.DataAccess.SportzlyDataContext();
                    rs.MyTeam = rs.OwnerId == teamQueryEntity.SessionUserId;
                    rs.IsTeamAdmin = EntityExtensions.CheckTeamAdminNew(Convert.ToInt64(teamQueryEntity.SessionUserId), teamQueryEntity.Id, context);
                });
            }
            
            return result;
        }
        public ActionResult<TeamEntity> GetTeamsHome(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamEntity> result = new ActionResult<TeamEntity>();

            result.Results = new TeamRepository().GetTeamsHome(teamQueryEntity);

            return result;
        }
        public ActionResult<BaseEntity> JoinTeam(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            KeyValuePair<int, string> message = new KeyValuePair<int, string>();
            UserExceptionType messageType = UserExceptionType.Internal;

            new TeamRepository().JoinTeam(teamQueryEntity, out message, out messageType);

            if (messageType != UserExceptionType.Internal)
            {
                result.ResultError = ErrorEntity.Create(messageType, message);
            }

            return result;
        }

        public ActionResult<BaseEntity> FollowTeam(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            KeyValuePair<int, string> message = new KeyValuePair<int, string>();
            UserExceptionType messageType = UserExceptionType.Internal;

            if (!new TeamRepository().FollowTeam(teamQueryEntity, out message, out messageType))
            {
                result.ResultError = ErrorEntity.Create(messageType, message);
            }

            return result;
        }

        public ActionResult<TeamNoticeEntity> GetTeamNotices(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamNoticeEntity> result = new ActionResult<TeamNoticeEntity>();

            int totalRecords = 0;

            result.Results = new TeamRepository().GetTeamNotices(teamQueryEntity, out totalRecords);

            if (result.Results != null && result.Results.Count() > 0)
            {
                result.Results[0].PageText = string.Format("{0}-{1} of {2}",
                                                            teamQueryEntity.RecordsFrom + 1,
                                                            result.Results.Count() + teamQueryEntity.RecordsFrom,
                                                            totalRecords);
            }
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results.ToList().ForEach(rs =>
            {
                rs.MyTeam = (rs.OwnerId == teamQueryEntity.SessionUserId) ? true : EntityExtensions.CheckTeamAdmin(Convert.ToInt64(teamQueryEntity.SessionUserId), teamQueryEntity.Id, context);               
            });

            return result;
        }

        public ActionResult<TeamEntity> SaveTeam(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamEntity> result = new ActionResult<TeamEntity>();

            result.Results = new TeamRepository().SaveTeams(teamQueryEntity);

            return result;
        }

        public ActionResult<TeamMemberEntity> GetTeamMembers(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamMemberEntity> result = new ActionResult<TeamMemberEntity>();

            result.Results = new TeamRepository().GetTeamMembers(teamQueryEntity);

            result.Results.ToList().ForEach(rs => rs.IsMyTeam = (teamQueryEntity.SessionUserId == rs.OwnerId));

            return result;
        }
        public ActionResult<InviteEntity> GetPendingInvitesTeam(TeamQuery teamQueryEntity)
        {
            ActionResult<InviteEntity> result = new ActionResult<InviteEntity>();

            result.Results = new TeamRepository().GetPendingInvitesTeam(teamQueryEntity);         

            return result;
        }

        public ActionResult<PollEntity> GetPolls(PollQuery pollEntity)
        {
            ActionResult<PollEntity> result = new ActionResult<PollEntity>();

            result.Results = new TeamRepository().GetPolls(pollEntity);

            return result;
        }

        public ActionResult<PollEntity> GetPollData(PollQuery pollEntity)
        {
            ActionResult<PollEntity> result = new ActionResult<PollEntity>();

            result.Results = new TeamRepository().GetPollData(pollEntity);
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results.ToList().ForEach(rs =>
            {
                var repository = new TeamRepository();
                rs.IsTeamAdmin = EntityExtensions.CheckTeamAdminNew(Convert.ToInt64(pollEntity.SessionUserId), rs.TeamId, context);
            });

            return result;
        }

        public ActionResult<TeamMemberEntity> GetTeamAdmins(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamMemberEntity> result = new ActionResult<TeamMemberEntity>();

            result.Results = new TeamRepository().GetTeamAdmins(teamQueryEntity);

            result.Results.ToList().ForEach(rs => rs.IsMyTeam = (teamQueryEntity.SessionUserId == rs.OwnerId));

            return result;
        }

        public ActionResult<TeamMemberEntity> GetTeamMembersApproved(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamMemberEntity> result = new ActionResult<TeamMemberEntity>();
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results = new TeamRepository().GetTeamMembersApproved(teamQueryEntity);

            result.Results.ToList().ForEach(rs => rs.IsMyTeam = (teamQueryEntity.SessionUserId == rs.OwnerId));
            result.Results.ToList().ForEach(rs => rs.IsTeamAdmin = EntityExtensions.CheckTeamAdmin(rs.Id, rs.TeamId, context));

            return result;
        }
        public ActionResult<BaseEntity> InviteToTeam(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            var email = teamQueryEntity.Email;

            teamQueryEntity.Email = null;
            var team = new TeamRepository().GetTeams(teamQueryEntity).FirstOrDefault();

            //if (team == null || team.OwnerId != teamQueryEntity.SessionUserId)
            //{
            //    result.ResultError = new ErrorEntity(UserExceptionType.Error, 0, "You are not authorized to invite for this team");
            //}

            if (team == null)
            {
                result.ResultError = new ErrorEntity(UserExceptionType.Error, 0, "You are not authorized to invite for this team");
            }
            else
            {
                teamQueryEntity.Email = email;
                bool isSaved = new TeamRepository().InviteToTeam(teamQueryEntity);

                if (!isSaved)
                {
                    //result.Results = 
                }

            }


            return result;

        }

        public ActionResult<TokenEntity> GetInviteToken(TeamQuery teamQueryEntity)
        {
            ActionResult<TokenEntity> result = new ActionResult<TokenEntity>();

            result.Results = new TeamRepository().GetInviteToken(teamQueryEntity);

            return result;

        }
        public ActionResult<TokenEntity> GetInviteTokenTwitter(TeamQuery teamQueryEntity)
        {
            ActionResult<TokenEntity> result = new ActionResult<TokenEntity>();

            result.Results = new TeamRepository().GetInviteTokenTwitter(teamQueryEntity);

            return result;

        }
        public ActionResult<BaseEntity> ApproveTeamMember(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            var team = new TeamRepository().GetTeams(teamQueryEntity).FirstOrDefault();

            if (team == null || team.OwnerId != teamQueryEntity.SessionUserId)
            {
                result.ResultError = new ErrorEntity(UserExceptionType.Error, 0, "You are not authorized to approve members for this team");
            }
            else
            {
                bool isSaved = new TeamRepository().ApproveTeamMember(teamQueryEntity);

                if (!isSaved)
                {
                    //result.Results = 
                }

            }

            return result;

        }
        public ActionResult<BaseEntity> ApprovedTeamAdmin(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            var team = new TeamRepository().GetTeams(teamQueryEntity).FirstOrDefault();
            KeyValuePair<int, string> message = new KeyValuePair<int, string>();
            UserExceptionType messageType = UserExceptionType.Internal;



            if (team == null || team.OwnerId != teamQueryEntity.SessionUserId)
            {
                result.ResultError = new ErrorEntity(UserExceptionType.Error, 0, "You are not authorized to create team admin for this team");
            }
            else
            {


                bool isSaved = new TeamRepository().ApprovedTeamAdmin(teamQueryEntity, out message, out messageType);
                if (messageType != UserExceptionType.Internal)
                {
                    result.ResultError = ErrorEntity.Create(messageType, message);
                }
                if (!isSaved)
                {
                    //result.Results = 
                }

            }

            return result;

        }
        public ActionResult<TeamNoticeEntity> UpdateNotice(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamNoticeEntity> result = new ActionResult<TeamNoticeEntity>();

            result.Results = new TeamRepository().UpdateNotice(teamQueryEntity);

            return result;
        }

        public ActionResult<SearchResultEntity> Search(SearchQuery searchQuery)
        {
            ActionResult<SearchResultEntity> result = new ActionResult<SearchResultEntity>();
            if (searchQuery.Auto)
            {
                List<UserDetailEntity> users = new UserRepository().SearchUserAuto(searchQuery.SearchString, searchQuery.SessionUserId);
                List<TeamEntity> teams = new TeamRepository().SearchTeamsAutoComplete(searchQuery.SearchString, searchQuery.SessionUserId);

                users.ForEach(user =>
                {
                    result.Results.Add(new SearchResultEntity()
                    {
                        SearchType = SearchTypes.User,
                        UserResult = user
                    });
                });

                teams.ForEach(team =>
                {
                    result.Results.Add(new SearchResultEntity()
                    {
                        SearchType = SearchTypes.Team,
                        TeamResult = team
                    });
                });
                return result;
            }
            else
            {
                List<UserDetailEntity> users = new UserRepository().SearchUser(searchQuery.SearchString, searchQuery.SessionUserId);
                List<TeamEntity> teams = new TeamRepository().SearchTeams(searchQuery.SearchString, searchQuery.SessionUserId);

                users.ForEach(user =>
                {
                    result.Results.Add(new SearchResultEntity()
                    {
                        SearchType = SearchTypes.User,
                        UserResult = user
                    });
                });

                teams.ForEach(team =>
                {
                    result.Results.Add(new SearchResultEntity()
                    {
                        SearchType = SearchTypes.Team,
                        TeamResult = team
                    });
                });
                return result;
            }
        }



        public ActionResult<TeamEntity> SearchTeams(TeamQuery teamQueryEntity)
        {
            ActionResult<TeamEntity> result = new ActionResult<TeamEntity>();

            result.Results = new TeamRepository().SearchTeams(teamQueryEntity);

            if (teamQueryEntity.SessionUserId.HasValue && result.Results != null)
            {
                result.Results.ToList().ForEach(rs =>
                {
                    var repository = new TeamRepository();
                    rs.Followed = repository.HasUserFollowed(rs.Id, teamQueryEntity.SessionUserId.Value);
                    rs.Joined = repository.HasUserJoined(rs.Id, teamQueryEntity.SessionUserId.Value);
                    rs.MyTeam = rs.OwnerId == teamQueryEntity.SessionUserId;
                });
            }

            return result;
        }

        public ActionResult<BaseEntity> DeleteTeam(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            if (!new TeamRepository().DeleteTeam(teamQueryEntity))
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
            }

            return result;
        }

        public ActionResult<BaseEntity> CheckTeamMember(TeamQuery teamQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();
            var isTeam = 0;
            isTeam=new TeamRepository().CheckTeamMember(teamQueryEntity);

            if (isTeam==1)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.FanError);
            }
            else if (isTeam == 3)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.PrivateTeamError);
            }

            return result;
        }
        public ActionResult<KeyValueEntity> GetMyTeams(TeamQuery teamQueryEntity)
        {
            ActionResult<KeyValueEntity> result = new ActionResult<KeyValueEntity>();

            result.Results = new TeamRepository().GetMyTeams(teamQueryEntity);

            return result;
        }
        public ActionResult<BaseEntity> SaveOption(PollQuery pollQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();
            var team = new TeamRepository().SaveOption(pollQueryEntity);
            return result;
        }

    }
}
