using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sportzly.ServiceClient.Controllers;
using Sportzly.Framework.Exceptions;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.Framework.ExceptionHandler;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.QueryEntity;

namespace Sportzly.Web.Common
{
    public static class ApiMethods
    {

        public static ActionResult<TeamEntity> SearchTeams(string userKey, string email, string keyWord, string sports, string level, string location)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.SearchTeams(email, keyWord, sports, level, location, userGuid);
            return result;
        }

        public static ActionResult<PlayerDetailEntity> SearchPlayers(string userKey, string email, string keyWord, string sports, string level, string location)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.SearchPlayers(email, keyWord, sports, level, location, userGuid);
            return result;
        }
        public static ActionResult<PlayerDetailEntity> GetPlayers(string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetPlayers(userGuid);
            return result;
        }
        public static ActionResult<PlayerDetailEntity> GetPlayersHome()
        {
            var result = UserController.GetPlayersHome();
            return result;
        }
        internal static ActionResult<UserEntity> Login(string email, string password, string token)
        {
            Validator.ValidateEmail(email);
            Validator.ValidatePassword(password);

            var user = UserController.GetUsers(null, password, email, Guid.Empty, token);

            UserException.ThrowIf(!user.Results.Any(), UserMessages.LoginFailed);

            return user;
        }

        internal static ActionResult<UserEntity> LoginWay(string email, string password)
        {

            var user = UserController.GetUsersViral(password, email, Guid.Empty);

            UserException.ThrowIf(!user.Results.Any(), UserMessages.LoginFailed);

            return user;
        }

        //internal static ActionResult<UserEntity> Signup(string email, string password, string userName, string token, DateTime dt, string code)
        //{
        //    Validator.ValidateEmail(email);
        //    Validator.ValidatePassword(password);
        //    Validator.ValidateUserName(userName);
        //    Validator.ValidateEmailAddress(email);
        //    Validator.ValidateCode(code);
        //    Validator.DOB(dt);
        //    return UserController.Signup(email, password, userName, token, dt);
        //}
        internal static ActionResult<UserEntity> Signup(string email, string password, string userName, string token, string code)
        {
            Validator.ValidateEmail(email);
            Validator.ValidatePassword(password);
            Validator.ValidateUserName(userName);
            Validator.ValidateEmailAddress(email);
            Validator.ValidateCode(code);
            //Validator.DOB(dt);
            return UserController.Signup(email, password, userName, token);
        }
        internal static ActionResult<UserEntity> SignupFacebook(string email, string password, string userName, string facebookId, string profilepic, string token)
        {
            return UserController.SignupFacebook(email, password, userName, facebookId, profilepic, token);
        }
        internal static ActionResult<UserEntity> SignupTwitter(string email, string password, string userName, string twitterId, string token)
        {
            return UserController.SignupTwitter(email, password, userName, twitterId, token);
        }
        internal static ActionResult<UserEntity> CheckUserTwitter(string twitterId)
        {
            return UserController.CheckUserTwitter(twitterId);
        }
        internal static ActionResult<UserNewEntity> GetNewUsersDetails(string facebookId, string twitterId)
        {
            return UserController.GetNewUsersDetails(facebookId, twitterId);
        }

        internal static ActionResult<UserEntity> CheckViralSignup(string email, string twitterId, string facebookId)
        {
            return UserController.CheckViralSignup(email, twitterId, facebookId);
        }
        internal static ActionResult<ActivityEntity> UpdateStatus(string userKey, string statusMessage, Nullable<long> parentId, long teamId, long eventId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            Validator.ValidateMessage(statusMessage);

            return ActivityController.UpdateStatus(userGuid, statusMessage, parentId, teamId, eventId);
        }

        internal static ActionResult<ActivityEntity> GetActivities(string userKey, int pageNumber, Nullable<long> parentId, string userEmail, ActivityType activityType, long teamId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            return ActivityController.GetActivities(userGuid, pageNumber, parentId, userEmail, activityType, teamId, eventId);
        }

        internal static void DeleteActivity(string userKey, long activityId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            ActivityController.DeleteActivity(userGuid, activityId);
        }


        internal static ActionResult<CheersEntity> Cheers(string userKey, long messageId, bool isCheers)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return ActivityController.SetCheers(userGuid, messageId, isCheers);
        }

        internal static ActionResult<InviteEntity> GetPendingInvitesUser(string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return UserController.GetPendingInvitesUser(userGuid);
        }
        internal static ActionResult<InviteEntity> GetPendingInvitesTeam(long teamId, string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return UserController.GetPendingInvitesTeam(teamId, userGuid);
        }
        internal static ActionResult<UserDetailEntity> SaveProfile(string userKey, string profileData)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return UserController.SaveProfile(userGuid, profileData);
        }
        internal static ActionResult<UserDetailEntity> SaveStreamProfile(string userKey, string profileData)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return UserController.SaveStreamProfile(userGuid, profileData);
        }
        internal static ActionResult<UserEntity> GetUser(string userKey, string email)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.GetUsers(null, null, email, userGuid);
            return result;
        }

        internal static bool AcivateUser(string emailEnc)
        {
            return UserController.ActivateUser(emailEnc);
        }

        internal static ActionResult<KeyValueEntity> GetKeyValueCollection(string userKey, KeyValueType keyValueType, string searchString)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return CommonController.GetKeyValueCollection(keyValueType, searchString, userGuid);
        }

        internal static ActionResult<ActivityEntity> MoveImagesToAlbum(string userKey, string albumName, long[] imageIds, string description, long teamId, long albumId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return ActivityController.MoveImagesToAlbum(albumName, imageIds, description, teamId, userGuid, albumId);
        }
        internal static ActionResult<DocumentEntity> SaveDocument(string userKey, string title, string files, string description, long teamId, string names)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return ActivityController.DocumentSave(title, files, description, teamId, userGuid, names);
        }

        internal static ActionResult<DocumentEntity> GetDocuments(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return ActivityController.GetDocuments(teamId, userGuid);
        }

        internal static ActionResult<DocumentEntity> GetAllDocuments(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return ActivityController.GetAllDocuments(teamId, userGuid);
        }
        internal static ActionResult<ImageEntity> AddImageToDefault(string userKey, string imageName, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return CommonController.AddImageToDefault(imageName, userGuid, teamId);
        }

        internal static ActionResult<ActivityEntity> AddYouTubeVideo(string userKey, string videoId, string description, long TeamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return CommonController.AddYouTubeVideo(videoId, description, userGuid, TeamId);
        }


        internal static ActionResult<UserDetailEntity> GetUserDetails(string userKey, string email)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.GetUserDetails(email, userGuid);
            return result;

        }

        internal static ActionResult<FriendEntity> SendFriendshipAction(string userKey, long friendId, bool? accept, FriendshipAction action)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.SendFriendshipAction(friendId, accept, action, userGuid);
            return result;
        }

        internal static ActionResult<FriendEntity> SendFriendshipActionPlayer(string userKey, long friendId, bool? accept, FriendshipAction action)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.SendFriendshipActionPlayer(friendId, accept, action, userGuid);
            return result;
        }

        internal static ActionResult<BaseEntity> InviteFriends(string userKey, string friends, string servicename)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.InviteFriends(friends, userGuid,servicename);
            return result;
        }
        internal static ActionResult<BaseEntity> MailInvite(string userName, string count, string teamname, string Mode, string inviteType, int teamId)
        {      
            var result = UserController.MailInvite(userName,count,teamname,Mode,inviteType,teamId);
            return result;
        }
        internal static ActionResult<ImageEntity> GetUserPhotos(string userKey, string email, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetUserPhotos(email, teamId, userGuid);
            return result;
        }

        internal static ActionResult<ImageThumbnailEntity> GetUserPhotosNew(string userKey, string email, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetUserPhotosNew(email, teamId, userGuid);
            return result;
        }

        internal static bool Logout(UserDetailEntity CurrentUser)
        {
            return UserController.Logout(CurrentUser);
        }

        internal static ActionResult<FriendUserEntity> GetUserFriends(string userKey, string email, bool mutual = false)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            Validator.ValidateEmail(email);

            var result = UserController.GetUserFriends(email, mutual, userGuid);
            return result;
        }
        internal static ActionResult<FriendUserEntity> GetPendingUserFriends(string userKey, string email, bool mutual = false)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            Validator.ValidateEmail(email);

            var result = UserController.GetPendingUserFriends(email, mutual, userGuid);
            return result;
        }

        internal static ActionResult<CommunityEntity> GetCommunities(string userKey, string email, string criteria)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetCommunities(email, criteria, userGuid);
            return result;
        }

        internal static ActionResult<CommunityEntity> GetCommunity(string userKey, long communityId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetCommunity(communityId, userGuid);
            return result;
        }


        internal static ActionResult<BaseEntity> FollowCommunity(string userKey, long communityId, bool join)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.FollowCommunity(communityId, join, userGuid);
            return result;
        }

        internal static ActionResult<BaseEntity> JoinCommunity(string userKey, long communityId, bool join)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.JoinCommunity(communityId, join, userGuid);
            return result;
        }

        internal static ActionResult<TeamEntity> GetTeams(string userKey, string email, string criteria)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeams(email, criteria, userGuid);
            return result;
        }

        internal static ActionResult<TeamEntity> GetTeams(string userKey, string email, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeams(email, teamId, userGuid);
            return result;
        }

        internal static ActionResult<TeamEntity> GetTeamsHome()
        {
            var result = UserController.GetTeamsHome();
            return result;
        }

        internal static ActionResult<BaseEntity> FollowTeam(string userKey, long teamId, bool join)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.FollowTeam(teamId, join, userGuid);
            return result;
        }

        internal static ActionResult<BaseEntity> JoinTeam(string userKey, long teamId, bool join)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.JoinTeam(teamId, join, userGuid);
            return result;
        }

        internal static ActionResult<TeamNoticeEntity> GetTeamNotices(string userKey, long teamId, long parentId, int pageNumber, int recordCount)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeamNotices(teamId, parentId, pageNumber, recordCount, userGuid);
            return result;
        }

        internal static ActionResult<TeamEntity> SaveTeam(string userKey, TeamEntity currentTeam)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.SaveTeam(currentTeam, userGuid);
            return result;

        }

        internal static ActionResult<TeamMemberEntity> GetTeamMembers(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeamMembers(teamId, userGuid);
            return result;
        }
        internal static ActionResult<TeamMemberEntity> GetTeamAdmins(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeamAdmins(teamId, userGuid);
            return result;
        }
        internal static ActionResult<TeamMemberEntity> GetTeamMembersApproved(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeamMembersApproved(teamId, userGuid);
            return result;
        }

        internal static ActionResult<TeamMemberEntity> GetTeamMembers(string userKey, string emailId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetTeamMembers(emailId, userGuid);
            return result;
        }

        internal static ActionResult<BaseEntity> ApprovedTeamAdmin(string userKey, string MembersList, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.ApprovedTeamAdmin(teamId, MembersList, userGuid);
            return result;
        }
        internal static ActionResult<BaseEntity> ApproveTeamMember(string userKey, long userId, long teamId, bool isApproved)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.ApproveTeamMember(teamId, userId, isApproved, userGuid);
            return result;
        }
        internal static ActionResult<TeamNoticeEntity> UpdateNotice(string userKey, string message, long teamId, long parentId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.UpdateNotice(message, teamId, parentId, userGuid);
            return result;
        }

        internal static ActionResult<SearchResultEntity> Search(string userKey, string searchString, bool authentication)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.Search(searchString, userGuid,authentication );
            return result;

        }

        internal static ActionResult<SearchResultEntity> Search(string searchString, bool authentication)
        {         

            var result = UserController.Search(searchString, authentication);
            return result;

        }

        internal static ActionResult<BaseEntity> InviteToTeam(string userKey, string emailIds, long teamId, string servicename)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.InviteToTeam(emailIds, teamId, userGuid, servicename);
            return result;
        }
        internal static ActionResult<BaseEntity> Unsubscribe(string emailIds)
        {
            var result = UserController.Unsubscribe(emailIds);
            return result;
        }
        internal static ActionResult<TokenEntity> GetInviteToken(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetInviteToken(teamId, userGuid);
            return result;
        }

        internal static ActionResult<TokenEntity> GetInviteTokenTwitter(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetInviteTokenTwitter(teamId, userGuid);
            return result;
        }

        internal static ActionResult<TokenEntity> GetInviteTokenUser(string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetInviteTokenUser(userGuid);
            return result;
        }

        internal static ActionResult<TokenEntity> GetInviteTokenTwitterUser(string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.GetInviteTokenTwitterUser(userGuid);
            return result;
        }

        internal static ActionResult<BaseEntity> ForgotPassword(string emailId)
        {
            Validator.ValidateEmail(emailId);
            var result = UserController.ForgotPassword(emailId);
            return result;
        }

        internal static ActionResult<BaseEntity> CheckUser(string userKey, string emailId, long TeamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.CheckUser(userGuid, emailId, TeamId);
            return result;
        }

        internal static ActionResult<BaseEntity> ChangePassword(UserDetailEntity currentUser, string oldPassword, string newPassword1)
        {
            var result = Login(currentUser.EmailId, oldPassword, string.Empty);
            var user = result.Results.FirstOrDefault();

            if (user != null)
            {
                return UserController.UpdatePassword(currentUser.EmailId, newPassword1, currentUser.UserKey);
            }

            return null;
        }

        internal static ActionResult<BaseEntity> DeleteTeam(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.DeleteTeam(teamId, userGuid);
            return result;
        }

        internal static ActionResult<BaseEntity> CheckTeamMember(string userKey, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.CheckTeamMember(teamId, userGuid);
            return result;
        }

        internal static ActionResult<ActivityEntity> GetPhotoComments(string userKey, int pageNumber, long photoId, string userEmail, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            return ActivityController.GetPhotoComments(userGuid, pageNumber, photoId, userEmail, teamId);
        }

        internal static void DeletePhoto(string userKey, long photoId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            ActivityController.DeletePhoto(userGuid, photoId);
        }

        internal static ActionResult<ActivityEntity> SavePhotoComment(string userKey, long imageIds, string description, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return ActivityController.SavePhotoComment(imageIds, description, teamId, userGuid);
        }

        internal static ActionResult<AlbumEntity> GetAlbumPhotos(string userKey, long albumId, long photoId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return CommonController.GetAlbumPhotos(albumId, photoId, userGuid);
        }

        internal static ActionResult<ImageThumbnailEntity> GetUserPhotosByAlbum(string userKey, string email, long teamId, long albumId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetUserPhotosByAlbum(email, teamId, userGuid, albumId);
            return result;
        }

        internal static ActionResult<AlbumListEntity> GetAlbums(string userKey, string email, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetAlbums(email, teamId, userGuid);
            return result;
        }

        internal static ActionResult<ImageEntity> GetAlbumCount(string userKey, string email, long teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetAlbumCount(email, teamId, userGuid);
            return result;
        }

        internal static ActionResult<PhotoEntity> GetPhotoDetail(string userKey, long photoId, long teamId, long albumId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetPhotoDetail(photoId, userGuid, teamId, albumId);
            return result;
        }

        internal static ActionResult<AlbumEntity> GetAlbumsByUser(string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email);

            var result = UserController.GetAlbumsByUser(userGuid);
            return result;
        }

        internal static ActionResult<UserEmailEntity> GetEmail(string userKey, long ownerId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            //Validator.ValidateEmail(email)
            var result = UserController.GetEmail(userGuid, ownerId);
            return result;
        }

        internal static ActionResult<CalendarEntity> GetCalendarList(string userKey, DateTime startDate, DateTime endDate, string viewType, string calendarType, long typeId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetCalendarList(userGuid, startDate, endDate, viewType, calendarType, typeId);
            return result;

        }

        internal static ActionResult<CalendarEntity> UpdateCalendar(string userKey, CalendarEntity calendarEntity, string calendarType, long typeId)
        {
            // Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.UpdateCalendar(Guid.Empty, calendarEntity, calendarType, typeId);
            return result;
        }

        internal static ActionResult<EventEntity> SaveEvent(string userKey, EventQuery eventQuery)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.SaveEvent(userGuid, eventQuery);
            return result;
        }
        internal static ActionResult<EventEntity> CancelEvent(string userKey, long EventId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.CancelEvent(userGuid, EventId);
            return result;
        }

        internal static ActionResult<PollEntity> SavePoll(string userKey, PollQuery pollQuery)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.SavePoll(userGuid, pollQuery);
            return result;
        }


        internal static ActionResult<ResultEntity> SaveGameResult(string userKey, Int64 gameId, string result, string url, string file)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result1 = CalendarController.SaveGameResult(userGuid, gameId, result, url, file);
            return result1;
        }

        internal static ActionResult<EventEntity> GetUserEventsNotification(string userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetUserEventsNotification(userGuid, userEmail, fromDate, eventTypeId, eventId);
            return result;
        }

        internal static ActionResult<EventEntity> GetEvents(string userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetEvents(userGuid, userEmail, fromDate, eventTypeId, eventId);
            return result;
        }

        internal static ActionResult<EventEntity> GetUserEventsByDate(string userKey, string userEmail, string fromDate, int eventTypeId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetUserEventsByDate(userGuid, userEmail, fromDate, eventTypeId, eventId);
            return result;
        }

        internal static ActionResult<EventDateEntity> GetEventDates(string userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetEventDates(userGuid, userEmail, fromDate, eventTypeId, eventId);
            return result;
        }

        internal static ActionResult<NewEventEntity> GetEventDistinctDates(string userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetEventDistinctDates(userGuid, userEmail, fromDate, eventTypeId, eventId);
            return result;
        }
        internal static ActionResult<NewEventGameEntity> GetUserEventsByDateGame(string userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId = 0)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetUserEventsByDateGame(userGuid, userEmail, fromDate, 2, eventId);
            return result;
        }
        internal static ActionResult<KeyValueEntity> GetMyTeams(string userKey, long userId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = UserController.GetMyTeams(userGuid, userId);
            return result;
        }

        internal static ActionResult<BaseEntity> JoinEvent(string userKey, long eventId, bool response)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.JoinEvent(userGuid, eventId, response);
            return result;
        }

        internal static ActionResult<EventEntity> GetForthComingEvents(string userKey, int teamId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            var result = CalendarController.GetForthComingEvents(userGuid, teamId);
            return result;
        }

        internal static ActionResult<EventEntity> GetICalEvents(string owner, int teamId)
        {

            var result = CalendarController.GetICalEvents(owner, teamId);
            return result;
        }

        internal static ActionResult<BaseEntity> SaveOption(string userKey, long id, long OptionId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            var result = UserController.SaveOption(id, OptionId, userGuid);
            return result;
        }

        internal static ActionResult<FeedEntity> GetFeeds(string userKey, int sportId)
        {
            Guid userGuid = Validator.ValidateUser(userKey);

            return ActivityController.GetFeeds(userGuid, sportId);
        }
        internal static ActionResult<PollEntity> GetPollData(long pollid, string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return UserController.GetPollData(pollid, userGuid);
        }
        internal static ActionResult<PollEntity> GetPolls(long teamId, string userKey)
        {
            Guid userGuid = Validator.ValidateUser(userKey);
            return UserController.GetPolls(teamId, userGuid);
        }

    }
}