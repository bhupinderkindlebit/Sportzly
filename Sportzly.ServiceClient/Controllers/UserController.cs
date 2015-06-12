using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.BusinessEntities;
using Sportzly.Framework;
using Sportzly.Framework.Exceptions;
using System.Web;

namespace Sportzly.ServiceClient.Controllers
{
    public static class UserController
    {
        public static bool IsAuthenticated(Guid userKey, UserDetailEntity CurrentUser = null)
        {
            return SecurityManager.Authenticate(userKey, CurrentUser) != null;
        }

        public static ActionResult<UserEntity> GetUsers(string userName, string password, string emailId, Guid userKey, string token = "")
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                Password = password,
                UserName = userName,
                Token = token,
                QueryPath = QueryConfig.GetUsers,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            //this is login mode
            if (password != null)
            {
                userQuery.AuthenticationRequired = false;
            }

            var result = GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery, userKey);

            if (password != null)
            {
                UserException.ThrowIf(result.Results.Count != 1, UserMessages.LoginFailed);

                var currentuser = result.Results.First();
                HttpCookie cookie = new HttpCookie("__key");
                cookie.Expires = DateTime.Now.AddDays(30);
                cookie.Path = "/";
                cookie.Value = password;

                HttpContext.Current.Response.SetCookie(cookie);

                if (HttpContext.Current.Request.Cookies["__keyS"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("__keyS");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    HttpContext.Current.Response.Cookies.Add(myCookie);
                }

                new SecurityManager().AddLoggedInUser(currentuser);
            }

            return result;
        }

        public static ActionResult<UserEntity> GetUsersViral(string password, string emailId, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                Password = password,
                QueryPath = QueryConfig.GetUsersLogin,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            //this is login mode
            if (password != null)
            {
                userQuery.AuthenticationRequired = false;
            }

            var result = GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery, userKey);

            if (password != null)
            {
                UserException.ThrowIf(result.Results.Count != 1, UserMessages.LoginFailed);

                var currentuser = result.Results.First();
                HttpCookie cookie = new HttpCookie("__keyS");
                cookie.Expires = DateTime.Now.AddYears(1);
                cookie.Path = "/";
                cookie.Value = password;

                HttpContext.Current.Response.SetCookie(cookie);
                if (HttpContext.Current.Request.Cookies["__key"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("__key");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    HttpContext.Current.Response.Cookies.Add(myCookie);
                }
                new SecurityManager().AddLoggedInUser(currentuser);
            }

            return result;
        }

        public static ActionResult<UserDetailEntity> GetUserDetails(string emailId, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                QueryPath = QueryConfig.GetUserDetail,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<UserDetailEntity, UserQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<UserNewEntity> GetNewUsersDetails(string facebookId, string twitterId)
        {
            UserQuery userQuery = new UserQuery()
            {
                FacebookId = facebookId,
                TwitterId = twitterId,
                QueryPath = QueryConfig.GetNewUsersDetails,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            var result = GenericController.Instance().FetchEntity<UserNewEntity, UserQuery>(userQuery);

            return result;
        }
        //public static ActionResult<UserEntity> Signup(string email, string password, string userName, string token, DateTime dt)
        //{
        //    UserQuery userQuery = new UserQuery()
        //    {
        //        UserName = userName,
        //        EmailId = email,
        //        Password = password,
        //        Token = token,
        //        DOB = dt,
        //        QueryPath = QueryConfig.Signup,
        //        ServiceUrl = AppSettingsEntity.UserServiceUrl,
        //        AuthenticationRequired = false
        //    };

        //    return GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
        //}
        public static ActionResult<UserEntity> Signup(string email, string password, string userName, string token)
        {
            UserQuery userQuery = new UserQuery()
            {
                UserName = userName,
                EmailId = email,
                Password = password,
                Token = token,
                QueryPath = QueryConfig.Signup,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            return GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
        }
        public static ActionResult<UserEntity> SignupFacebook(string email, string password, string userName, string facebookId, string profilepic, string token)
        {
            UserQuery userQuery = new UserQuery()
            {
                UserName = userName,
                EmailId = email,
                ProfilePic = profilepic,
                Password = password,
                FacebookId = facebookId,
                Token = token,
                QueryPath = QueryConfig.SignupFacebook,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            return GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
        }
        public static ActionResult<UserEntity> SignupTwitter(string email, string password, string userName, string twitterkId, string token)
        {
            UserQuery userQuery = new UserQuery()
            {
                UserName = userName,
                EmailId = email,
                Password = password,
                TwitterId = twitterkId,
                Token = token,
                QueryPath = QueryConfig.SignupTwitter,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            return GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
        }
        public static ActionResult<UserEntity> CheckUserTwitter(string twitterkId)
        {
            UserQuery userQuery = new UserQuery()
            {
                TwitterId = twitterkId,
                QueryPath = QueryConfig.CheckUserTwitter,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            return GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
        }
        public static ActionResult<UserEntity> CheckViralSignup(string email, string twitterId, string facebookId)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = email,
                TwitterId = twitterId,
                FacebookId = facebookId,
                QueryPath = QueryConfig.CheckViralSignup,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            return GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
        }
        public static ActionResult<UserDetailEntity> SaveProfile(Guid userGuid, string profileData)
        {
            UserQuery userQuery = new UserQuery()
            {
                ProfileData = profileData,
                QueryPath = QueryConfig.SaveProfile,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            return GenericController.Instance().FetchEntity<UserDetailEntity, UserQuery>(userQuery, userGuid);
        }
        public static ActionResult<UserDetailEntity> SaveStreamProfile(Guid userGuid, string profileData)
        {
            UserQuery userQuery = new UserQuery()
            {
                ProfileData = profileData,
                QueryPath = QueryConfig.SaveStreamProfile,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            return GenericController.Instance().FetchEntity<UserDetailEntity, UserQuery>(userQuery, userGuid);
        }
        public static bool ActivateUser(string emailEnc)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailEnc,
                QueryPath = QueryConfig.ActivateUser,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            var result = GenericController.Instance().FetchEntity<UserEntity, UserQuery>(userQuery);
            if (result.ResultError == null && result.Results.Count == 1)
                return true;
            else return false;
        }

        public static ActionResult<FriendEntity> SendFriendshipAction(long friendId, bool? accept, FriendshipAction action, Guid userGuid)
        {
            FriendQuery friendQuery = new FriendQuery()
            {
                FriendId = friendId,
                Accept = accept,
                FriendshipAction = action,
                QueryPath = QueryConfig.SendFriendshipAction,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            return GenericController.Instance().FetchEntity<FriendEntity, FriendQuery>(friendQuery, userGuid);
        }

        public static ActionResult<FriendEntity> SendFriendshipActionPlayer(long friendId, bool? accept, FriendshipAction action, Guid userGuid)
        {
            FriendQuery friendQuery = new FriendQuery()
            {
                FriendId = friendId,
                Accept = accept,
                FriendshipAction = action,
                QueryPath = QueryConfig.SendFriendshipActionPlayer,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            return GenericController.Instance().FetchEntity<FriendEntity, FriendQuery>(friendQuery, userGuid);
        }

        public static ActionResult<BaseEntity> InviteFriends(string friends, Guid userGuid, string servicename)
        {
            FriendQuery friendQuery = new FriendQuery()
            {
                EmailId = friends,
                FriendshipAction = FriendshipAction.Request,
                QueryPath = QueryConfig.InviteFriends,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                ServiceName=servicename
            };

            return GenericController.Instance().FetchEntity<BaseEntity, FriendQuery>(friendQuery, userGuid);
        }

        public static ActionResult<BaseEntity> MailInvite(string userName, string count, string teamname, string Mode, string inviteType,int teamId)
        {
            MailQuery friendQuery = new MailQuery()
            {
                count = count,
                InviteType = inviteType,
                QueryPath = QueryConfig.MailInvite,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                Mode = Mode,
                TeamId=teamId,
                TeamName=teamname,
                userName=userName,                
                AuthenticationRequired=false
            };

            return GenericController.Instance().FetchEntity<BaseEntity, MailQuery>(friendQuery);
        }

        public static ActionResult<BaseEntity> Unsubscribe(string friends)
        {
            FriendQuery friendQuery = new FriendQuery()
            {
                EmailId = friends,               
                QueryPath = QueryConfig.Unsubscribe,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired=false
            };

            return GenericController.Instance().FetchEntity<BaseEntity, FriendQuery>(friendQuery);
        }
        public static bool Logout(UserDetailEntity user)
        {
            return SecurityManager.Logout(user);
        }

        public static ActionResult<ImageEntity> GetUserPhotos(string emailId, long teamId, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                TeamId = teamId,
                QueryPath = QueryConfig.GetUserPhotos,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<ImageEntity, UserQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<ImageThumbnailEntity> GetUserPhotosNew(string emailId, long teamId, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                TeamId = teamId,
                QueryPath = QueryConfig.GetUserPhotosNew,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<ImageThumbnailEntity, UserQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<InviteEntity> GetPendingInvitesUser(Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                QueryPath = QueryConfig.GetPendingInvitesUser,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<InviteEntity, UserQuery>(userQuery, userKey);
            return result;
        }

        public static ActionResult<FriendUserEntity> GetUserFriends(string emailId, bool mutual, Guid userKey)
        {
            FriendQuery userQuery = new FriendQuery()
            {
                EmailId = emailId,
                Mutual = mutual,
                QueryPath = QueryConfig.GetUserFriends,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<FriendUserEntity, FriendQuery>(userQuery, userKey);

            return result;
        }
        public static ActionResult<FriendUserEntity> GetPendingUserFriends(string emailId, bool mutual, Guid userKey)
        {
            FriendQuery userQuery = new FriendQuery()
            {
                EmailId = emailId,
                Mutual = mutual,
                QueryPath = QueryConfig.GetPendingUserFriends,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<FriendUserEntity, FriendQuery>(userQuery, userKey);

            return result;
        }
        public static ActionResult<CommunityEntity> GetCommunities(string email, string criteria, Guid userKey)
        {
            CommunityQuery communityQuery = new CommunityQuery()
            {
                Email = email,
                Criteria = criteria,
                QueryPath = QueryConfig.GetCommunities,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<CommunityEntity, CommunityQuery>(communityQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> FollowCommunity(long teamId, bool join, Guid userKey)
        {
            CommunityQuery communityQuery = new CommunityQuery()
            {
                CommunityId = teamId,
                OptIn = join,
                QueryPath = QueryConfig.FollowCommunity,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, CommunityQuery>(communityQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> JoinCommunity(long teamId, bool join, Guid userKey)
        {
            CommunityQuery communityQuery = new CommunityQuery()
            {
                CommunityId = teamId,
                OptIn = join,
                QueryPath = QueryConfig.JoinCommunity,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, CommunityQuery>(communityQuery, userKey);

            return result;
        }

        public static ActionResult<CommunityEntity> GetCommunity(long teamId, Guid userKey)
        {
            CommunityQuery communityQuery = new CommunityQuery()
            {
                CommunityId = teamId,
                QueryPath = QueryConfig.GetCommunities,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<CommunityEntity, CommunityQuery>(communityQuery, userKey);

            return result;
        }

        public static ActionResult<TeamEntity> GetTeams(string email, string criteria, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {

                Email = email,
                KeyWord = criteria,
                QueryPath = QueryConfig.GetTeams,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<InviteEntity> GetPendingInvitesTeam(long id, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = id,
                QueryPath = QueryConfig.GetPendingInvitesTeam,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<InviteEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<PollEntity> GetPolls(long id, Guid userKey)
        {
            PollQuery pollQuery = new PollQuery()
            {
                TeamId = id,
                QueryPath = QueryConfig.GetPolls,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<PollEntity, PollQuery>(pollQuery, userKey);

            return result;
        }

        public static ActionResult<PollEntity> GetPollData(long id, Guid userKey)
        {
            PollQuery pollQuery = new PollQuery()
            {
                PollId = id,
                QueryPath = QueryConfig.GetPollData,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<PollEntity, PollQuery>(pollQuery, userKey);

            return result;
        }


        public static ActionResult<TeamEntity> GetTeamsHome()
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Email = "",
                KeyWord = "",
                QueryPath = QueryConfig.GetTeamsHome,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl,
                AuthenticationRequired = false
            };

            var result = GenericController.Instance().FetchEntity<TeamEntity, TeamQuery>(teamQuery);

            return result;
        }
        public static ActionResult<TeamEntity> GetTeams(string email, long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {

                Email = email,
                Id = teamId,
                QueryPath = QueryConfig.GetTeams,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> JoinTeam(long teamId, bool join, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                OptIn = join,
                QueryPath = QueryConfig.JoinTeam,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> FollowTeam(long teamId, bool join, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                OptIn = join,
                QueryPath = QueryConfig.FollowTeam,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }



        public static ActionResult<TeamNoticeEntity> GetTeamNotices(long teamId, long parentId, int pageNumber, int recordCount, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                ParentId = parentId,
                RecordsCount = recordCount,
                RecordsFrom = pageNumber,
                QueryPath = QueryConfig.GetTeamNotices,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamNoticeEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TeamEntity> SaveTeam(TeamEntity currentTeam, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Team = currentTeam,
                QueryPath = QueryConfig.SaveTeam,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TeamMemberEntity> GetTeamMembers(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.GetTeamMembers,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamMemberEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }


        public static ActionResult<TeamMemberEntity> GetTeamAdmins(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.GetTeamAdmins,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamMemberEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TeamMemberEntity> GetTeamMembersApproved(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.GetTeamMembersApproved,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamMemberEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }
        public static ActionResult<TeamMemberEntity> GetTeamMembers(string emailId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Email = emailId,
                QueryPath = QueryConfig.GetTeamMembers,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamMemberEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> ApproveTeamMember(long teamId, long userId, bool isApproved, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                MemberId = userId,
                OptIn = isApproved,
                QueryPath = QueryConfig.ApproveTeamMember,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }
        public static ActionResult<BaseEntity> ApprovedTeamAdmin(long teamId, string MembersList, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                MembersList = MembersList,
                QueryPath = QueryConfig.ApprovedTeamAdmin,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }
        public static ActionResult<TeamNoticeEntity> UpdateNotice(string message, long teamId, long parentId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                ParentId = parentId,
                Message = message,
                QueryPath = QueryConfig.UpdateNotice,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamNoticeEntity, TeamQuery>(teamQuery, userKey);

            return result;

        }

        public static ActionResult<SearchResultEntity> Search(string searchString, Guid userKey, bool authentication)
        {
            SearchQuery searchQuery = new SearchQuery()
            {
                SearchString = searchString,
                QueryPath = QueryConfig.Search,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired=authentication ,
                Auto=false
            };

            var result = GenericController.Instance().FetchEntity<SearchResultEntity, SearchQuery>(searchQuery, userKey);
            return result;
        }
        public static ActionResult<SearchResultEntity> Search(string searchString, bool authentication)
        {
            SearchQuery searchQuery = new SearchQuery()
            {
                SearchString = searchString,
                QueryPath = QueryConfig.Search,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = authentication,
                Auto=true 
            };

            var result = GenericController.Instance().FetchEntity<SearchResultEntity, SearchQuery>(searchQuery);
            return result;
        }

        public static ActionResult<BaseEntity> InviteToTeam(string emailIds, long teamId, Guid userKey, string servicename)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                Email = emailIds,
                QueryPath = QueryConfig.InviteToTeam,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl,
                ServiceName = servicename
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TokenEntity> GetInviteToken(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.GetInviteToken,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TokenEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TokenEntity> GetInviteTokenTwitter(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.GetInviteTokenTwitter,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TokenEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }


        public static ActionResult<TokenEntity> GetInviteTokenUser(Guid userKey)
        {
            FriendQuery teamQuery = new FriendQuery()
            {
                QueryPath = QueryConfig.GetInviteTokenUser,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TokenEntity, FriendQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TokenEntity> GetInviteTokenTwitterUser(Guid userKey)
        {
            FriendQuery teamQuery = new FriendQuery()
            {

                QueryPath = QueryConfig.GetInviteTokenTwitterUser,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TokenEntity, FriendQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<TeamEntity> SearchTeams(string email, string keyWord, string sports, string level, string location, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Email = email,
                KeyWord = keyWord,
                Sports = sports,
                Level = level,
                Location = location,
                QueryPath = QueryConfig.SearchTeams,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<TeamEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<PlayerDetailEntity> SearchPlayers(string email, string keyWord, string sports, string level, string location, Guid userKey)
        {
            PlayerSearchQuery playerQuery = new PlayerSearchQuery()
            {
                Email = email,
                KeyWord = keyWord,
                Sports = sports,
                Level = level,
                Location = location,
                QueryPath = QueryConfig.SearchPlayers,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<PlayerDetailEntity, PlayerSearchQuery>(playerQuery, userKey);

            return result;
        }
        public static ActionResult<PlayerDetailEntity> GetPlayersHome()
        {
            PlayerSearchQuery playerQuery = new PlayerSearchQuery()
            {
                Email = "",
                KeyWord = "",
                Sports = "",
                Level = "",
                Location = "",
                QueryPath = QueryConfig.GetPlayersHome,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AuthenticationRequired = false
            };

            var result = GenericController.Instance().FetchEntity<PlayerDetailEntity, PlayerSearchQuery>(playerQuery);

            return result;
        }
        public static ActionResult<PlayerDetailEntity> GetPlayers(Guid userKey)
        {
            PlayerSearchQuery playerQuery = new PlayerSearchQuery()
            {
                Email = "",
                KeyWord = "",
                Sports = "",
                Level = "",
                Location = "",
                QueryPath = QueryConfig.GetPlayers,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<PlayerDetailEntity, PlayerSearchQuery>(playerQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> ForgotPassword(string emailId)
        {
            UserQuery userQuery = new UserQuery()
            {
                AuthenticationRequired = false,
                EmailId = emailId,
                QueryPath = QueryConfig.ForgotPassword,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };
            var result = GenericController.Instance().FetchEntity<BaseEntity, UserQuery>(userQuery);

            return result;
        }

        public static ActionResult<BaseEntity> CheckUser(Guid userGuid, string emailId, long TeamId)
        {
            CheckUserQuery userQuery = new CheckUserQuery()
            {
                userEmailId = emailId,
                TeamId = TeamId,
                QueryPath = QueryConfig.CheckUser,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };
            var result = GenericController.Instance().FetchEntity<BaseEntity, CheckUserQuery>(userQuery, userGuid);

            return result;
        }
        public static ActionResult<BaseEntity> UpdatePassword(string emailId, string newPassword1, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                Password = newPassword1,
                QueryPath = QueryConfig.UpdatePassword,
                ServiceUrl = AppSettingsEntity.UserServiceUrl
            };
            var result = GenericController.Instance().FetchEntity<BaseEntity, UserQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> DeleteTeam(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.DeleteTeam,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };
            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }
        public static ActionResult<BaseEntity> CheckTeamMember(long teamId, Guid userKey)
        {
            TeamQuery teamQuery = new TeamQuery()
            {
                Id = teamId,
                QueryPath = QueryConfig.CheckTeamMember,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };
            var result = GenericController.Instance().FetchEntity<BaseEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }
        public static ActionResult<AlbumEntity> GetAlbumsByUser(Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                QueryPath = QueryConfig.GetAlbumsByUser,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<AlbumEntity, UserQuery>(userQuery, userKey);
            return result;
        }

        public static ActionResult<UserEmailEntity> GetEmail(Guid userKey, long ownerid)
        {
            UserEmailQuery userQuery = new UserEmailQuery()
            {
                QueryPath = QueryConfig.GetEmail,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                OwnerId = ownerid
            };

            var result = GenericController.Instance().FetchEntity<UserEmailEntity, UserEmailQuery>(userQuery, userKey);
            return result;
        }

        public static ActionResult<PhotoEntity> GetPhotoDetail(long photoId, Guid userKey, long teamId, long albumId)
        {
            PhotoQuery userQuery = new PhotoQuery()
            {
                PhotoId = photoId,
                QueryPath = QueryConfig.GetPhotoDetail,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                TeamId = teamId,
                AlbumId = albumId
            };

            var result = GenericController.Instance().FetchEntity<PhotoEntity, PhotoQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<ImageEntity> GetAlbumCount(string emailId, long teamId, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                TeamId = teamId,
                QueryPath = QueryConfig.GetAlbumCount,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<ImageEntity, UserQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<ImageThumbnailEntity> GetUserPhotosByAlbum(string emailId, long teamId, Guid userKey, long albumId)
        {
            AlbumPhotoQuery userQuery = new AlbumPhotoQuery()
            {
                EmailId = emailId,
                TeamId = teamId,
                QueryPath = QueryConfig.GetUserPhotosByAlbum,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
                AlbumId = albumId
            };

            var result = GenericController.Instance().FetchEntity<ImageThumbnailEntity, AlbumPhotoQuery>(userQuery, userKey);

            return result;
        }

        public static ActionResult<AlbumListEntity> GetAlbums(string emailId, long teamId, Guid userKey)
        {
            UserQuery userQuery = new UserQuery()
            {
                EmailId = emailId,
                TeamId = teamId,
                QueryPath = QueryConfig.GetAlbums,
                ServiceUrl = AppSettingsEntity.UserServiceUrl,
            };

            var result = GenericController.Instance().FetchEntity<AlbumListEntity, UserQuery>(userQuery, userKey);
            return result;
        }


        public static ActionResult<KeyValueEntity> GetMyTeams(Guid userKey, long userId)
        {
            TeamQuery teamQuery = new TeamQuery()
            {

                Id = userId,
                QueryPath = QueryConfig.GetMyTeams,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<KeyValueEntity, TeamQuery>(teamQuery, userKey);

            return result;
        }

        public static ActionResult<BaseEntity> SaveOption(long id, long OptionId, Guid userKey)
        {
            PollQuery teamQuery = new PollQuery()
            {
                PollId = id,
                OptionId = OptionId,
                QueryPath = QueryConfig.SaveOption,
                ServiceUrl = AppSettingsEntity.TeamServiceUrl
            };

            var result = GenericController.Instance().FetchEntity<BaseEntity, PollQuery>(teamQuery, userKey);

            return result;
        }
    }
}
