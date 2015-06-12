using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel.Channels;
using Sportzly.BusinessEntities.QueryEntity;
using System.ServiceModel;
using System.ServiceModel.Web;
using Sportzly.Framework.Exceptions;
using Sportzly.Framework;

namespace Sportzly.Service.Interfaces
{
    [ServiceContract]
    public interface IUserService
    {
        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUsers, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUsers(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUsersLogin, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUsersLogin(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserDetail, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserDetail(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.Signup, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message Signup(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetNewUsersDetails, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetNewUsersDetails(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.CheckUserTwitter, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message CheckUserTwitter(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.CheckViralSignup, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message CheckViralSignup(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SignupTwitter, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SignupTwitter(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SignupFacebook, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SignupFacebook(UserQuery userQueryEntity);


        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveProfile, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveProfile(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveStreamProfile, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveStreamProfile(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.ActivateUser, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message ActivateUser(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SendFriendshipAction, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SendFriendshipAction(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SendFriendshipActionPlayer, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SendFriendshipActionPlayer(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserPhotos, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserPhotos(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPendingInvitesUser, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPendingInvitesUser(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserPhotosNew, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserPhotosNew(UserQuery userQueryEntity);
        
                [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetCalendarList, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetCalendarList(CalendarQuery calendarQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveCalendar, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveCalendar(CalendarQuery calendarQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveGameResult, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveGameResult(ResultQuery resultQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveEvent, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveEvent(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.CancelEvent, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message CancelEvent(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserEventsByDate, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserEventsByDate(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetEventDistinctDates, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetEventDistinctDates(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserEventsByDateGame, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserEventsByDateGame(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetICalEvents, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetICalEvents(EventQuery eventQueryEntity);


        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetEvents, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetEvents(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserEventsNotification, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserEventsNotification(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetEventDates, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetEventDates(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserFriends, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserFriends(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPendingUserFriends, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPendingUserFriends(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetCommunities, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetCommunities(CommunityQuery communityQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.JoinCommunity, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message JoinCommunity(CommunityQuery communityQueryEntity);

        //[OperationContract]
        //[WebInvoke(UriTemplate = QueryConfig.FollowCommunity, Method = "POST")]
        //[FaultContract(typeof(SportzlyServiceFault))]
        //Message FollowCommunity(CommunityQuery communityQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetTeams, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetTeams(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetTeamsHome, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetTeamsHome(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPendingInvitesTeam, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPendingInvitesTeam(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPolls, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPolls(PollQuery pollEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPollData, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPollData(PollQuery pollEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.JoinTeam, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message JoinTeam(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.FollowTeam, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message FollowTeam(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetTeamNotices, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetTeamNotices(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveTeam, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveTeam(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetTeamMembers, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetTeamMembers(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetTeamAdmins, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetTeamAdmins(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetTeamMembersApproved, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetTeamMembersApproved(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.ApproveTeamMember, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message ApproveTeamMember(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.ApprovedTeamAdmin, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message ApprovedTeamAdmin(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.UpdateNotice, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message UpdateNotice(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.Search, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message Search(SearchQuery searchQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.InviteToTeam, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message InviteToTeam(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetInviteToken, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetInviteToken(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetInviteTokenTwitter, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetInviteTokenTwitter(TeamQuery teamQueryEntity);


        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetInviteTokenUser, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetInviteTokenUser(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetInviteTokenTwitterUser, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetInviteTokenTwitterUser(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.InviteFriends, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message InviteFriends(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.MailInvite, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message MailInvite(MailQuery mailQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.Unsubscribe, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message Unsubscribe(FriendQuery friendQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SearchTeams, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SearchTeams(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SearchPlayers, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SearchPlayers(PlayerSearchQuery playerQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPlayersHome, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPlayersHome(PlayerSearchQuery playerQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPlayers, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPlayers(PlayerSearchQuery playerQueryEntity);


        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.ForgotPassword, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message ForgotPassword(UserQuery userQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.CheckUser, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message CheckUser(CheckUserQuery userQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.UpdatePassword, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message UpdatePassword(UserQuery userQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.DeleteTeam, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message DeleteTeam(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.CheckTeamMember, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message CheckTeamMember(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetUserPhotosByAlbum, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetUserPhotosByAlbum(AlbumPhotoQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetAlbums, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetAlbums(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPhotoDetail, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPhotoDetail(PhotoQuery photoQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetAlbumCount, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetAlbumCount(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetAlbumsByUser, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetAlbumsByUser(UserQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetEmail, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetEmail(UserEmailQuery userQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetMyTeams, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetMyTeams(TeamQuery teamQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.JoinEvent, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message JoinEvent(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetForthComingEvents, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetForthComingEvents(EventQuery eventQueryEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SaveOption, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SaveOption(PollQuery pollEntity);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SavePoll, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SavePoll(PollQuery pollQueryEntity);
    }
}
