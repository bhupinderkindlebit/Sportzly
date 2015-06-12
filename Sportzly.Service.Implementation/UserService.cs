using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.Service.Interfaces;
using System.ServiceModel;
using System.ServiceModel.Activation;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
using System.ServiceModel.Channels;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.Business;
using Sportzly.Framework.Exceptions;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using System.ServiceModel.Web;

namespace Sportzly.Service.Implementation
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    [ExceptionShielding("WCFServicePolicy")]
    public class UserService : IUserService
    {
        public Message GetUsers(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUsers(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }

        public Message GetUsersLogin(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUsersLogin(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }

        public Message GetUserDetail(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUserDetail(userQueryEntity);
                return Serializer.ToMessage<UserDetailEntity>(results);
            });
        }

        public Message Signup(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().Signup(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }

        public Message GetNewUsersDetails(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetNewUsersDetails(userQueryEntity);
                return Serializer.ToMessage<UserNewEntity>(results);
            });
        }

        public Message SignupFacebook(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SignupFacebook(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }
        public Message SignupTwitter(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SignupTwitter(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }
        public Message CheckUserTwitter(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().CheckUserTwitter(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }
        public Message CheckViralSignup(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().CheckViralSignup(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }

        public Message SaveProfile(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SaveProfile(userQueryEntity);
                return Serializer.ToMessage<UserDetailEntity>(results);
            });
        }
        public Message SaveStreamProfile(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SaveStreamProfile(userQueryEntity);
                return Serializer.ToMessage<UserDetailEntity>(results);
            });
        }

        public Message ActivateUser(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().ActivateUser(userQueryEntity);
                return Serializer.ToMessage<UserEntity>(results);
            });
        }

        public Message SendFriendshipAction(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SendFriendshipAction(friendQueryEntity);
                return Serializer.ToMessage<FriendEntity>(results);
            });
        }

        public Message SendFriendshipActionPlayer(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SendFriendshipActionPlayer(friendQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message GetUserPhotos(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUserPhotos(userQueryEntity);
                return Serializer.ToMessage<ImageEntity>(results);
            });
        }
        public Message GetPendingInvitesUser(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetPendingInvitesUser(userQueryEntity);
                return Serializer.ToMessage<InviteEntity>(results);
            });
        }
        public Message GetUserPhotosNew(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUserPhotosNew(userQueryEntity);
                return Serializer.ToMessage<ImageThumbnailEntity>(results);
            });
        }

        public Message GetUserFriends(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUserFriends(friendQueryEntity);
                return Serializer.ToMessage<FriendUserEntity>(results);
            });
        }

        public Message GetPendingUserFriends(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetPendingUserFriends(friendQueryEntity);
                return Serializer.ToMessage<FriendUserEntity>(results);
            });
        }

        public Message GetCommunities(CommunityQuery communityQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new GroupBusiness().GetCommunities(communityQueryEntity);
                return Serializer.ToMessage<CommunityEntity>(results);
            });
        }

        public Message JoinCommunity(CommunityQuery communityQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new GroupBusiness().JoinCommunity(communityQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        //public Message FollowCommunity(CommunityQuery communityQueryEntity)
        //{
        //    return SportzlyServiceFault.HandleResponse<Message>(() =>
        //    {
        //        var results = new GroupBusiness().FollowTeam(teamQueryEntity);
        //        return Serializer.ToMessage<BaseEntity>(results);
        //    });
        //}

        public Message GetTeams(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetTeams(teamQueryEntity);
                return Serializer.ToMessage<TeamEntity>(results);
            });
        }

        public Message GetPendingInvitesTeam(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetPendingInvitesTeam(teamQueryEntity);
                return Serializer.ToMessage<InviteEntity>(results);
            });
        }

        public Message GetPolls(PollQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetPolls(teamQueryEntity);
                return Serializer.ToMessage<PollEntity>(results);
            });
        }

        public Message GetPollData(PollQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetPollData(teamQueryEntity);
                return Serializer.ToMessage<PollEntity>(results);
            });
        }

        public Message GetTeamsHome(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetTeamsHome(teamQueryEntity);
                return Serializer.ToMessage<TeamEntity>(results);
            });
        }
        public Message JoinTeam(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().JoinTeam(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message FollowTeam(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().FollowTeam(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message GetTeamNotices(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetTeamNotices(teamQueryEntity);
                return Serializer.ToMessage<TeamNoticeEntity>(results);
            });
        }

        public Message UpdatePassword(UserQuery userQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().UpdatePassword(userQuery);
                return Serializer.ToMessage<BaseEntity>(results);

            });
        }

        public Message ForgotPassword(UserQuery userQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().ForgotPassword(userQuery);
                return Serializer.ToMessage<BaseEntity>(results);

            });
        }

        public Message CheckUser(CheckUserQuery userQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().CheckUser(userQuery);
                return Serializer.ToMessage<BaseEntity>(results);

            });
        }

        public Message SaveTeam(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().SaveTeam(teamQueryEntity);
                return Serializer.ToMessage<TeamEntity>(results);
            });
        }

        public Message GetTeamMembers(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetTeamMembers(teamQueryEntity);
                return Serializer.ToMessage<TeamMemberEntity>(results);
            });
        }

        public Message GetTeamAdmins(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetTeamAdmins(teamQueryEntity);
                return Serializer.ToMessage<TeamMemberEntity>(results);
            });
        }

        public Message GetTeamMembersApproved(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetTeamMembersApproved(teamQueryEntity);
                return Serializer.ToMessage<TeamMemberEntity>(results);
            });
        }
        public Message ApproveTeamMember(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().ApproveTeamMember(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }
        public Message ApprovedTeamAdmin(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().ApprovedTeamAdmin(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }
        public Message UpdateNotice(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().UpdateNotice(teamQueryEntity);
                return Serializer.ToMessage<TeamNoticeEntity>(results);
            });
        }

        public Message Search(SearchQuery searchQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().Search(searchQuery);
                return Serializer.ToMessage<SearchResultEntity>(results);
            });
        }

        public Message InviteToTeam(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().InviteToTeam(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message GetInviteToken(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetInviteToken(teamQueryEntity);
                return Serializer.ToMessage<TokenEntity>(results);
            });
        }

        public Message GetInviteTokenTwitter(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetInviteTokenTwitter(teamQueryEntity);
                return Serializer.ToMessage<TokenEntity>(results);
            });
        }

        public Message GetInviteTokenUser(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetInviteTokenUser(friendQueryEntity);
                return Serializer.ToMessage<TokenEntity>(results);
            });
        }

        public Message GetInviteTokenTwitterUser(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetInviteTokenTwitterUser(friendQueryEntity);
                return Serializer.ToMessage<TokenEntity>(results);
            });
        }

        public Message InviteFriends(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().InviteFriends(friendQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });

        }

        public Message MailInvite(MailQuery mailQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().MailInvite(mailQuery);
                return Serializer.ToMessage<BaseEntity>(results);
            });

        }
        public Message Unsubscribe(FriendQuery friendQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().Unsubscribe(friendQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });

        }
        public Message SearchTeams(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().SearchTeams(teamQueryEntity);
                return Serializer.ToMessage<TeamEntity>(results);
            });
        }

        public Message GetPlayers(PlayerSearchQuery playerQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetPlayers(playerQueryEntity);
                return Serializer.ToMessage<PlayerDetailEntity>(results);
            });
        }

        public Message GetPlayersHome(PlayerSearchQuery playerQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetPlayersHome(playerQueryEntity);
                return Serializer.ToMessage<PlayerDetailEntity>(results);
            });
        }

        public Message SearchPlayers(PlayerSearchQuery playerQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().SearchPlayers(playerQueryEntity);
                return Serializer.ToMessage<PlayerDetailEntity>(results);
            });
        }

        public Message DeleteTeam(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().DeleteTeam(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message CheckTeamMember(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().CheckTeamMember(teamQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message GetCalendarList(CalendarQuery calendarQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetCalendarList(calendarQueryEntity);
                return Serializer.ToMessage<CalendarEntity>(results);
            });
        }

        public Message SaveCalendar(CalendarQuery calendarQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().SaveCalendar(calendarQueryEntity);
                return Serializer.ToMessage<CalendarEntity>(results);
            });
        }

        public Message SaveGameResult(ResultQuery resultQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().SaveGameResult(resultQueryEntity);
                return Serializer.ToMessage<ResultEntity>(results);
            });
        }

        public Message SaveEvent(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().SaveEvent(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }

        public Message SavePoll(PollQuery pollQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().SavePoll(pollQueryEntity);
                return Serializer.ToMessage<PollEntity>(results);
            });
        }

        public Message CancelEvent(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().CancelEvent(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }

        public Message GetEvents(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetEvents(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }

        public Message GetICalEvents(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetICalEvents(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }

        public Message GetUserEventsNotification(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetUserEventsNotification(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }

        public Message GetEventDistinctDates(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetEventDistinctDates(eventQueryEntity);
                return Serializer.ToMessage<NewEventEntity>(results);
            });
        }

        public Message GetUserEventsByDateGame(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetUserEventsByDateGame(eventQueryEntity);
                return Serializer.ToMessage<NewEventGameEntity>(results);
            });
        }
        public Message GetUserEventsByDate(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetUserEventsByDate(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }
        public Message GetEventDates(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetEventDates(eventQueryEntity);
                return Serializer.ToMessage<EventDateEntity>(results);
            });
        }

        public Message GetPhotoDetail(PhotoQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetPhotoDetail(userQueryEntity);
                return Serializer.ToMessage<PhotoEntity>(results);
            });
        }

        public Message GetUserPhotosByAlbum(AlbumPhotoQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetUserPhotosByAlbum(userQueryEntity);
                return Serializer.ToMessage<ImageThumbnailEntity>(results);
            });
        }

        public Message GetAlbums(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetAlbums(userQueryEntity);
                return Serializer.ToMessage<AlbumListEntity>(results);
            });
        }

        public Message GetAlbumCount(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetAlbumCount(userQueryEntity);
                return Serializer.ToMessage<ImageEntity>(results);
            });
        }

        public Message GetAlbumsByUser(UserQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetAlbumsByUser(userQueryEntity);
                return Serializer.ToMessage<AlbumEntity>(results);
            });
        }

        public Message GetEmail(UserEmailQuery userQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new UserBusiness().GetEmail(userQueryEntity);
                return Serializer.ToMessage<UserEmailEntity>(results);
            });
        }

        public Message GetMyTeams(TeamQuery teamQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().GetMyTeams(teamQueryEntity);
                return Serializer.ToMessage<KeyValueEntity>(results);
            });
        }

        public Message JoinEvent(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().JoinEvent(eventQueryEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }

        public Message GetForthComingEvents(EventQuery eventQueryEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CalendarBusiness().GetForthComingEvents(eventQueryEntity);
                return Serializer.ToMessage<EventEntity>(results);
            });
        }

        public Message SaveOption(PollQuery pollEntity)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new TeamBusiness().SaveOption(pollEntity);
                return Serializer.ToMessage<BaseEntity>(results);
            });
        }
    }
}
