// -----------------------------------------------------------------------
// <copyright file="EntityMapper.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Repository
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using AutoMapper;
    using Sportzly.DataAccess;
    using Sportzly.BusinessEntities.BusinessEntity;
    using Sportzly.Framework;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class EntityMapper
    {
        static EntityMapper()
        {
            Map();
        }

        internal static void Map()
        {
            MapUser();
            MapUserDetail();
            MapActivity();
            MapCheers();
            MapTeams();
            MapTeamMembers();
            MapTeamMembers(true);
            MapAwards();
            MapGroups();
            MapGroupMembers();
            MapSport();
            MapKeyValue();
            MapAlbum();
            MapAlbumPhoto();
            MapVideo();
            MapFriendshipStatus();
            MapFriendUser();
            MapTeamEntity();
            MapTeamNotices();
            MapTeamFollowers();
            MapThumbAlbumPhoto();
            MapDocument();
            MapFile();
            MapTeamsLogos();
            MapCalendar();
            MapCalendarWithEvent();
            MapPlayerDetail();
            MapPlayerFriends();
            MapNewUser();
            MapCalendarDate();
            MapCalendarWithEventNew();
            MapResult();
            MapTeamAdmin();
            MapInvite();
            MapPoll();
            MapFeed();
        }

        private static void MapCalendarDate()
        {
            Mapper.CreateMap<Calendar, EventDateEntity>()
                 .ForMember(dest => dest.StartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("MM-dd-yyyy")))
                 ;
        }
        private static void MapInvite()
        {
            Mapper.CreateMap<InviteEmailaddress, InviteEntity>()
                 .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.InviteEmail))
                 ;
        }
        private static void MapPoll()
        {
            Mapper.CreateMap<PollOption, OptoinEntity>()
              .ForMember(dest => dest.OptionDetails, opt => opt.MapFrom(src => src.OptionPoll))
              .ForMember(dest => dest.OptionId, opt => opt.MapFrom(src => src.ID))
              .ForMember(dest => dest.VoteCount, opt => opt.MapFrom(src => src.Votes.Count()))
              ;

            Mapper.CreateMap<Poll, PollEntity>()
                 .ForMember(dest => dest.PollQuestion, opt => opt.MapFrom(src => src.PollQuestion))
                 .ForMember(dest => dest.PollId, opt => opt.MapFrom(src => src.ID))
                 .ForMember(dest => dest.PollOptions, opt => opt.MapFrom(src => src.PollOptions))
                 .ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.TeamId))
                 .ForMember(dest => dest.PollActive, opt => opt.MapFrom(src => src.EndPoll))
                 .ForMember(dest => dest.PollExpiry, opt => opt.MapFrom(src => src.PollExpiry))
                 ;
        }

        private static void MapFeed()
        {

            Mapper.CreateMap<FeedContent, FeedEntity>()
                 .ForMember(dest => dest.ContentId, opt => opt.MapFrom(src => src.Id))
                 .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                 .ForMember(dest => dest.FeedId, opt => opt.MapFrom(src => src.FeedId))
                 .ForMember(dest => dest.ImagePath, opt => opt.MapFrom(src => src.Image))
                 .ForMember(dest => dest.Link, opt => opt.MapFrom(src => src.Link))
                 .ForMember(dest => dest.PublishedDate, opt => opt.MapFrom(src => src.PublishedDate))
                 .ForMember(dest => dest.Title, opt => opt.MapFrom(src => src.Title))
                 .ForMember(dest => dest.VideoPath, opt => opt.MapFrom(src => src.Video))
                 ;
        }

        private static void MapResult()
        {
            Mapper.CreateMap<Result, ResultEntity>()
                 .ForMember(dest => dest.Result, opt => opt.MapFrom(src => src.Result1))
                 .ForMember(dest => dest.ResultFile, opt => opt.MapFrom(src => src.ResultFile))
                 .ForMember(dest => dest.ResultUrl, opt => opt.MapFrom(src => src.ResultUrl != "" ? (src.ResultUrl.ToString().ToLower().IndexOf("http://") != -1 ? src.ResultUrl : "http://" + src.ResultUrl) : src.ResultUrl))
                 ;
        }

        private static void MapCalendarWithEvent()
        {
            Mapper.CreateMap<CalendarAttendee, UserEntity>()
               .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => EntityExtensions.GetUser(src).Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(EntityExtensions.GetUser(src))))
               .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => EntityExtensions.GetUser(src).GetProfileName()))
               .ForMember(dest => dest.ProfileFoto, opt => opt.MapFrom(src => EntityExtensions.GetUserProfilePhoto(src)))
               ;

            Mapper.CreateMap<Calendar, EventEntity>()
                .ForMember(dest => dest.EventId, opt => opt.MapFrom(src => src.calendarId))
                .ForMember(dest => dest.EventName, opt => opt.MapFrom(src => src.Subject))
                .ForMember(dest => dest.TimeZone, opt => opt.MapFrom(src => src.TimeZone))
                .ForMember(dest => dest.Attendees, opt => opt.MapFrom(src => src.CalendarAttendees.Where(rs => "YES".Equals(rs.response, StringComparison.InvariantCultureIgnoreCase))))
                .ForMember(dest => dest.NotAttending, opt => opt.MapFrom(src => src.CalendarAttendees.Where(rs => "NO".Equals(rs.response, StringComparison.InvariantCultureIgnoreCase))))
                .ForMember(dest => dest.Pending, opt => opt.MapFrom(src => src.CalendarAttendees.Where(rs => rs.response == null)))
                .ForMember(dest => dest.EventType, opt => opt.MapFrom(src => src.CalendarType))
                .ForMember(dest => dest.Location, opt => opt.MapFrom(src => src.Location))
                .ForMember(dest => dest.Address, opt => opt.MapFrom(src => src.AddressLine))
                .ForMember(dest => dest.Comments, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.StartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("MM-dd-yyyy")))
                .ForMember(dest => dest.StartDateF, opt => opt.MapFrom(src => src.StartTime.Value.ToString("MMMM dd, yyyy")))
                .ForMember(dest => dest.EndDateF, opt => opt.MapFrom(src => src.EndTime.Value.ToString("MMMM dd, yyyy")))
                .ForMember(dest => dest.StartTime, opt => opt.MapFrom(src => src.StartTime.Value.ToString("hh:mm tt")))
                .ForMember(dest => dest.EndDate, opt => opt.MapFrom(src => src.EndTime.Value.ToString("MM-dd-yyyy")))
                .ForMember(dest => dest.EndTime, opt => opt.MapFrom(src => src.EndTime.Value.ToString("hh:mm tt")))
                .ForMember(dest => dest.FormatStartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("dddd, MMM dd")))
                .ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.TeamId))
                .ForMember(dest => dest.TeamLogoUrl, opt => opt.MapFrom(src => EntityExtensions.GetEventLogoUrl(src.TeamId, src.User)))
                .ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => EntityExtensions.GetSourceName(src.TeamId, src.User)))
                .ForMember(dest => dest.OppTeamId, opt => opt.MapFrom(src => src.opponentTeamId))
                .ForMember(dest => dest.OppTeamLogoUrl, opt => opt.MapFrom(src => EntityExtensions.GetEventLogoUrl(src.opponentTeamId, src.User)))
                .ForMember(dest => dest.OppTeamName, opt => opt.MapFrom(src => EntityExtensions.GetSourceName(src.opponentTeamId, src.User)))

                .ForMember(dest => dest.OppName, opt => opt.MapFrom(src => src.OppName))
                .ForMember(dest => dest.IsTeam, opt => opt.MapFrom(src => src.IsTeam))
                .ForMember(dest => dest.HomeGame, opt => opt.MapFrom(src => src.HomeGame))

                .ForMember(dest => dest.OwnerEmail, opt => opt.MapFrom(src => src.User.Email))
                .ForMember(dest => dest.Season, opt => opt.MapFrom(src => src.Season))
                .ForMember(dest => dest.IsPast, opt => opt.MapFrom(src => src.StartTime <= DateTime.Now))
                ;


        }

        private static void MapCalendarWithEventNew()
        {

            Mapper.CreateMap<Calendar, NewEventEntity>()
               .ForMember(dest => dest.StartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("MM-dd-yyyy")))
               .ForMember(dest => dest.FormatStartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("dddd, MMM dd")))
               .ForMember(dest => dest.Events, opt => opt.MapFrom(src => EntityExtensions.GetEvents(src.StartTime.Value.ToString("MM-dd-yyyy"))))
              ;
            Mapper.CreateMap<Calendar, NewEventGameEntity>()
              .ForMember(dest => dest.StartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("MM-dd-yyyy")))
              .ForMember(dest => dest.FormatStartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("dddd, MMM dd")))
              .ForMember(dest => dest.Events, opt => opt.MapFrom(src => EntityExtensions.GetEventsGame(src.StartTime.Value.ToString("MM-dd-yyyy"))))
             ;
            Mapper.CreateMap<CalendarAttendee, UserEntity>()
               .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => EntityExtensions.GetUser(src).Email))
                // .ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(EntityExtensions.GetUser(src))))
               .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => EntityExtensions.GetUser(src).GetProfileName()))
               .ForMember(dest => dest.ProfileFoto, opt => opt.MapFrom(src => EntityExtensions.GetUserProfilePhoto(src)))
               ;

            Mapper.CreateMap<Calendar, EventEntity>()
                .ForMember(dest => dest.EventId, opt => opt.MapFrom(src => src.calendarId))
                .ForMember(dest => dest.ResultsGames, opt => opt.MapFrom(src => src.Results))
                 .ForMember(dest => dest.TimeZone, opt => opt.MapFrom(src => src.TimeZone))
                .ForMember(dest => dest.EventName, opt => opt.MapFrom(src => src.CalendarType == "2" ? (EntityExtensions.GetSourceName(src.TeamId, src.User) + " (" + (src.HomeGame == "Home Game" ? "Home" : "Away") + ")" + " vs " + src.OppName + " (" + (src.HomeGame == "Home Game" ? "Away" : "Home") + ")") : src.Subject))
                .ForMember(dest => dest.Attendees, opt => opt.MapFrom(src => src.CalendarAttendees.Where(rs => "YES".Equals(rs.response, StringComparison.InvariantCultureIgnoreCase))))
                .ForMember(dest => dest.NotAttending, opt => opt.MapFrom(src => src.CalendarAttendees.Where(rs => "NO".Equals(rs.response, StringComparison.InvariantCultureIgnoreCase))))
                .ForMember(dest => dest.Pending, opt => opt.MapFrom(src => src.CalendarAttendees.Where(rs => rs.response == null)))
                .ForMember(dest => dest.EventType, opt => opt.MapFrom(src => src.CalendarType))
                .ForMember(dest => dest.Location, opt => opt.MapFrom(src => src.Location))
                .ForMember(dest => dest.Address, opt => opt.MapFrom(src => src.AddressLine))
                .ForMember(dest => dest.Comments, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.StartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("MM-dd-yyyy")))
                .ForMember(dest => dest.StartTime, opt => opt.MapFrom(src => src.StartTime.Value.ToString("hh:mm tt")))
                .ForMember(dest => dest.EndDate, opt => opt.MapFrom(src => src.EndTime.Value.ToString("MM-dd-yyyy")))
                .ForMember(dest => dest.EndTime, opt => opt.MapFrom(src => src.EndTime.Value.ToString("hh:mm tt")))
                .ForMember(dest => dest.FormatStartDate, opt => opt.MapFrom(src => src.StartTime.Value.ToString("dddd, MMM dd")))
                .ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.TeamId))
                .ForMember(dest => dest.TeamLogoUrl, opt => opt.MapFrom(src => EntityExtensions.GetEventLogoUrl(src.TeamId, src.User)))
                .ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => EntityExtensions.GetSourceName(src.TeamId, src.User)))
                .ForMember(dest => dest.TeamSports, opt => opt.MapFrom(src => EntityExtensions.GetTeamSports(src.TeamId)))
                .ForMember(dest => dest.OppTeamId, opt => opt.MapFrom(src => src.opponentTeamId))
                .ForMember(dest => dest.OppTeamLogoUrl, opt => opt.MapFrom(src => EntityExtensions.GetEventLogoUrl(src.opponentTeamId, src.User)))
                .ForMember(dest => dest.OppTeamName, opt => opt.MapFrom(src => EntityExtensions.GetSourceName(src.opponentTeamId, src.User)))
                .ForMember(dest => dest.OppName, opt => opt.MapFrom(src => src.OppName))
                .ForMember(dest => dest.IsTeam, opt => opt.MapFrom(src => src.IsTeam))
                .ForMember(dest => dest.AddResult, opt => opt.MapFrom(src => src.StartTime <= DateTime.Now && src.CalendarType == "2" ? true : false))
                .ForMember(dest => dest.HomeGame, opt => opt.MapFrom(src => src.HomeGame))
                .ForMember(dest => dest.OwnerEmail, opt => opt.MapFrom(src => src.User.Email))
                .ForMember(dest => dest.Season, opt => opt.MapFrom(src => src.Season))
                .ForMember(dest => dest.IsPast, opt => opt.MapFrom(src => src.StartTime <= DateTime.Now))
                ;


        }

        private static void MapCalendar()
        {
            Mapper.CreateMap<Calendar, CalendarEntity>()
                .ForMember(dest => dest.calendarId, opt => opt.MapFrom(src => src.calendarId))
                .ForMember(dest => dest.Color, opt => opt.MapFrom(src => src.Color))
                .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.EndTime, opt => opt.MapFrom(src => src.EndTime.Value))
                .ForMember(dest => dest.IsAllDayEvent, opt => opt.MapFrom(src => src.IsAllDayEvent))
                .ForMember(dest => dest.IsEditable, opt => opt.MapFrom(src => src.IsEditable))
                .ForMember(dest => dest.IsRecurring, opt => opt.MapFrom(src => src.IsRecurring))
                .ForMember(dest => dest.Location, opt => opt.MapFrom(src => src.AddressLine))
                .ForMember(dest => dest.StartTime, opt => opt.MapFrom(src => src.StartTime.Value))
                .ForMember(dest => dest.Subject, opt => opt.MapFrom(src => src.CalendarType == "2" ? (EntityExtensions.GetSourceName(src.TeamId, src.User) + " (" + (src.HomeGame == "Home Game" ? "Home" : "Away") + ")" + " vs " + src.OppName + " (" + (src.HomeGame == "Home Game" ? "Away" : "Home") + ")") : src.Subject))
                .ForMember(dest => dest.isMorethanOneDay, opt => opt.MapFrom(src => src.IsMoreThanOneDay()))
                ;

        }


        private static void MapTeamNotices()
        {
            Mapper.CreateMap<TeamNoticeBoard, TeamNoticeEntity>()
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => src.CreateDate.GetTimespanString()))
                .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.OwnerId))
                .ForMember(dest => dest.OwnerName, opt => opt.MapFrom(src => src.User.GetProfileName()))
                .ForMember(dest => dest.PhotoPath, opt => opt.MapFrom(src => src.User.GetProfilePhoto()))
                .ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.TeamId))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.User.Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src.User)))
                ;
        }

        private static void MapFriendUser()
        {
            Mapper.CreateMap<User, FriendUserEntity>()
                .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => src.GetProfileName()))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src)))
                .ForMember(dest => dest.ProfileFoto, opt => opt.MapFrom(src => src.GetProfilePhoto()))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                ;
        }

        private static void MapVideo()
        {
            Mapper.CreateMap<Video, VideoEntity>()
                .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.VideoId, opt => opt.MapFrom(src => src.YoutubeId))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.OwnerId))
                ;
        }

        private static void MapAlbum()
        {
            Mapper.CreateMap<Album, AlbumEntity>()
                .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.AlbumName))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.Photos, opt => opt.MapFrom(src => src.GetAlbumPhotos()))
                ;
        }

        private static void MapDocument()
        {
            Mapper.CreateMap<DocumentTitle, DocumentEntity>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.title, opt => opt.MapFrom(src => src.Title))
                .ForMember(dest => dest.postdate, opt => opt.MapFrom(src => src.CreatedDate.ToString("MM.dd.yyyy")))
                .ForMember(dest => dest.Files, opt => opt.MapFrom(src => src.GetDocFiles()))
                ;
        }

        private static void MapFriendshipStatus()
        {
            Mapper.CreateMap<Friend, FriendEntity>()
                .ForMember(dest => dest.FriendId, opt => opt.MapFrom(src => src.FriendId))
                .ForMember(dest => dest.UserId, opt => opt.MapFrom(src => src.UserId))
                .ForMember(dest => dest.IsApproved, opt => opt.MapFrom(src => src.IsApproved))
                ;
        }

        private static void MapAlbumPhoto()
        {
            Mapper.CreateMap<AlbumPhoto, ImageEntity>()
                .ForMember(dest => dest.AlbumName, opt => opt.MapFrom(src => src.Album.AlbumName))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.AlbumId, opt => opt.MapFrom(src => src.AlbumId))
                .ForMember(dest => dest.FilePath, opt => opt.MapFrom(src => Utility.GetUploadImagePath(src.User.Id, false) + src.UrlPath))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.OwnerId))
                ;
        }

        private static void MapThumbAlbumPhoto()
        {
            Mapper.CreateMap<AlbumPhoto, ImageThumbnailEntity>()
                .ForMember(dest => dest.AlbumName, opt => opt.MapFrom(src => src.Album.AlbumName))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.AlbumId, opt => opt.MapFrom(src => src.AlbumId))
                .ForMember(dest => dest.FilePath, opt => opt.MapFrom(src => Utility.GetUploadThumbnailImagePath(src.User.Id, false, src.UrlPath)))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.OwnerId))
                ;
        }

        private static void MapFile()
        {
            Mapper.CreateMap<DocFile, FileEntity>()
                .ForMember(dest => dest.filename, opt => opt.MapFrom(src => src.FileName))
                .ForMember(dest => dest.filepath, opt => opt.MapFrom(src => src.UrlPath))
                ;
        }
        private static void MapNewUser()
        {
            Mapper.CreateMap<User, UserNewEntity>()
                .ForMember(dest => dest.Password, opt => opt.MapFrom(src => src.Password))
                ;
        }
        private static void MapKeyValue()
        {
            Mapper.CreateMap<string, KeyValueEntity>()
                .ForMember(dest => dest.Value, opt => opt.MapFrom(src => src))
                .ForMember(dest => dest.Key, opt => opt.MapFrom(src => src));
        }

        private static void MapUserDetail()
        {
            Mapper.CreateMap<User, UserDetailEntity>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.Username))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src)))
                .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => src.GetProfileName()))
                .ForMember(dest => dest.ProfileFoto, opt => opt.MapFrom(src => src.GetProfilePhoto()))
                .ForMember(dest => dest.City, opt => opt.MapFrom(src => src.GetCity()))
                .ForMember(dest => dest.Country, opt => opt.MapFrom(src => src.GetCountry()))
                .ForMember(dest => dest.DateOfBirth, opt => opt.MapFrom(src => src.GetDOBString()))
                .ForMember(dest => dest.Gender, opt => opt.MapFrom(src => src.GetGender()))
                .ForMember(dest => dest.MaritalStatus, opt => opt.MapFrom(src => src.GetMaritalStatus()))
                .ForMember(dest => dest.MaritalStatusId, opt => opt.MapFrom(src => src.MaritalStatusId))
                .ForMember(dest => dest.GenderId, opt => opt.MapFrom(src => src.GenderId))
                .ForMember(dest => dest.DOB, opt => opt.MapFrom(src => src.DOB))
                .ForMember(dest => dest.Phone, opt => opt.MapFrom(src => src.Phone))
                .ForMember(dest => dest.Summary, opt => opt.MapFrom(src => src.Summary))
                .ForMember(dest => dest.FavSports, opt => opt.MapFrom(src => src.UserFavoriteSports.FirstOrDefault()))
                .ForMember(dest => dest.Level, opt => opt.MapFrom(src => src.Level))
                .ForMember(dest => dest.ZIP, opt => opt.MapFrom(src => src.GetZIP()))
                .ForMember(dest => dest.Awards, opt => opt.MapFrom(src => src.Awards1))
                .ForMember(dest => dest.Groups, opt => opt.MapFrom(src => src.GroupMembers))
                .ForMember(dest => dest.Teams, opt => opt.MapFrom(src => src.GetTeams()))
                .ForMember(dest => dest.ActiveTeams, opt => opt.MapFrom(src => src.GetTeams(true)))
                .ForMember(dest => dest.ActiveTeamsLogos, opt => opt.MapFrom(src => src.GetTeams(true)))
                .ForMember(dest => dest.SportsTag, opt => opt.MapFrom(src => src.Role))
                .ForMember(dest => dest.OtherLevel, opt => opt.MapFrom(src => src.LevelOther))
                .ForMember(dest => dest.OtherSportsTag, opt => opt.MapFrom(src => src.RoleOther))
                .ForMember(dest => dest.Collage, opt => opt.MapFrom(src => src.Collage))
                .ForMember(dest => dest.HighSchool, opt => opt.MapFrom(src => src.HighSchool))
                .ForMember(dest => dest.CarrierValue, opt => opt.MapFrom(src => src.Carrier))

            ;
        }

        private static void MapPlayerDetail()
        {
            Mapper.CreateMap<User, PlayerDetailEntity>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src)))
                .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => src.GetProfileName()))
                .ForMember(dest => dest.ProfilePhoto, opt => opt.MapFrom(src => src.GetProfilePhoto()))
                .ForMember(dest => dest.City, opt => opt.MapFrom(src => src.GetCity()))
                .ForMember(dest => dest.Country, opt => opt.MapFrom(src => src.GetCountry()))
                .ForMember(dest => dest.Summary, opt => opt.MapFrom(src => src.Summary))
                .ForMember(dest => dest.Level, opt => opt.MapFrom(src => src.Level))
                .ForMember(dest => dest.FavSports, opt => opt.MapFrom(src => src.UserFavoriteSports.FirstOrDefault()))

            ;
        }

        private static void MapUser()
        {
            Mapper.CreateMap<User, UserEntity>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.Username))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src)))
                .ForMember(dest => dest.Verified, opt => opt.MapFrom(src => src.IsVerified))
                .ForMember(dest => dest.LastName, opt => opt.MapFrom(src => src.LastName))
                .ForMember(dest => dest.GenderId, opt => opt.MapFrom(src => src.GenderId))
                .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => src.GetProfileName()))
                .ForMember(dest => dest.ProfileFoto, opt => opt.MapFrom(src => src.GetProfilePhoto()))
                .ForMember(dest => dest.Teams, opt => opt.MapFrom(src => src.GetTeamsCookies()))
            ;
        }

        private static void MapActivity()
        {
            Mapper.CreateMap<Activity, ActivityEntity>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.ParentId, opt => opt.MapFrom(src => src.ParentActivityId))
                .ForMember(dest => dest.Owner, opt => opt.MapFrom(src => src.User))
                .ForMember(dest => dest.MinutesAgo, opt => opt.MapFrom(src => src.PostDate.GetTimespanString()))
                .ForMember(dest => dest.Cheers, opt => opt.MapFrom(src => src))
                .ForMember(dest => dest.Album, opt => opt.MapFrom(src => src.Album))
                .ForMember(dest => dest.Video, opt => opt.MapFrom(src => src.Video))
                .ForMember(dest => dest.Doc, opt => opt.MapFrom(src => src.DocumentTitle))
                ;

        }

        private static void MapCheers()
        {
            Mapper.CreateMap<Activity, CheersEntity>()
                .ForMember(dest => dest.Cheers, opt => opt.MapFrom(src => src.ActivityCheers.Count(rs => rs.IsCheered)))
                .ForMember(dest => dest.Jeers, opt => opt.MapFrom(src => src.ActivityCheers.Count(rs => !rs.IsCheered)))
                ;
        }

        private static void MapTeams()
        {
            Mapper.CreateMap<Team, KeyValueEntity>()
                .ForMember(dest => dest.Value, opt => opt.MapFrom(src => src.TeamName))
                .ForMember(dest => dest.Key, opt => opt.MapFrom(src => src.Id))
                ;
        }

        private static void MapTeamsLogos()
        {
            Mapper.CreateMap<Team, TeamLogoEntity>()
                .ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.TeamName))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.Photo, opt => opt.MapFrom(src => src.Photo))
                ;
        }

        private static void MapTeamEntity()
        {
            Mapper.CreateMap<Team, TeamEntity>()
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => src.CreateDate))
                .ForMember(dest => dest.FoundedDate, opt => opt.MapFrom(src => src.CreateDate.ToString("MMM dd, yyyy")))
                .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.OwnerId))
                // .ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src.User)))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.User.Email))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.MemberCount, opt => opt.MapFrom(src => src.TeamMembers.Where(rs => rs.IsApproved.HasValue && rs.IsApproved.Value).Count()))
                .ForMember(dest => dest.FollowerCount, opt => opt.MapFrom(src => src.TeamFollowers.Count()))
                .ForMember(dest => dest.OwnerName, opt => opt.MapFrom(src => src.User.GetProfileName()))
                .ForMember(dest => dest.PhotoPath, opt => opt.MapFrom(src => src.User.GetProfilePhoto()))
                .ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.TeamName))
                .ForMember(dest => dest.Awards, opt => opt.MapFrom(src => src.Awards))
                .ForMember(dest => dest.Season, opt => opt.MapFrom(src => src.Season))
                .ForMember(dest => dest.PracticeGround, opt => opt.MapFrom(src => src.PracticeGround))
                .ForMember(dest => dest.Photo, opt => opt.MapFrom(src => src.Photo))
                .ForMember(dest => dest.TeamCategory, opt => opt.MapFrom(src => src.TeamCategory.Name))
                .ForMember(dest => dest.SportsName, opt => opt.MapFrom(src => src.Sport.Name))
                .ForMember(dest => dest.SportsId, opt => opt.MapFrom(src => src.Sport.Id))
                .ForMember(dest => dest.Members, opt => opt.MapFrom(src => src.TeamMembers.Where(rs => rs.IsApproved.HasValue && rs.IsApproved.Value)))
                .ForMember(dest => dest.TeamAdmins, opt => opt.MapFrom(src => src.TeamAdmins))
                .ForMember(dest => dest.Fans, opt => opt.MapFrom(src => src.TeamFollowers))
                .ForMember(dest => dest.TeamUrl, opt => opt.MapFrom(src => EntityExtensions.GetUrl(src.ScorecardUrl)))
                .ForMember(dest => dest.IsPrivate, opt => opt.MapFrom(src => src.IsPrivate == null ? false : (src.IsPrivate)))

            ;
        }

        private static void MapTeamMembers()
        {
            Mapper.CreateMap<TeamMember, KeyValueEntity>()
                .ForMember(dest => dest.Value, opt => opt.MapFrom(src => src.Team.TeamName))
                .ForMember(dest => dest.Key, opt => opt.MapFrom(src => src.Team.Id))
                ;
        }

        private static void MapTeamFollowers()
        {
            Mapper.CreateMap<TeamFollower, TeamMemberEntity>()
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.User.Email))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.User.Email))
                //.ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src.User)))
                .ForMember(dest => dest.Phone, opt => opt.MapFrom(src => ((src.User.Carrier != 0 && src.User.Carrier != null) || (src.User.Phone != null && src.User.Address.Locality.Country == "India")) ? true : false))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.UserId))
                .ForMember(dest => dest.JoinDate, opt => opt.MapFrom(src => src.Team.CreateDate))
                .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.User.GetProfileName()))
                .ForMember(dest => dest.Photo, opt => opt.MapFrom(src => src.User.GetProfilePhoto()))
                //.ForMember(dest => dest., opt => opt.MapFrom(src => src.Id))
                ;
        }

        private static void MapPlayerFriends()
        {
            Mapper.CreateMap<Friend, PlayerFriendEntity>()
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.User.Email))
                // .ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src.User)))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.UserId))
                .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => src.User.GetProfileName()))
                .ForMember(dest => dest.Profilephoto, opt => opt.MapFrom(src => src.User.GetProfilePhoto()))
                ;
        }

        private static void MapTeamAdmin()
        {
            Mapper.CreateMap<TeamAdmin, TeamMemberEntity>()
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.User.Email))
                // .ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src.User)))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.UserId))
                .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.User.GetProfileName()))
                .ForMember(dest => dest.Photo, opt => opt.MapFrom(src => src.User.GetProfilePhoto()))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.Team.OwnerId))
                .ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.Team.TeamName))
                .ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.TeamId))
                ;
        }

        private static void MapTeamMembers(bool detailed)
        {
            Mapper.CreateMap<TeamMember, TeamMemberEntity>()
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.User.Email))
                .ForMember(dest => dest.EmailId, opt => opt.MapFrom(src => src.User.Email))
                // .ForMember(dest => dest.EncryptEmailId, opt => opt.MapFrom(src => EntityExtensions.GetEncryptedEmail(src.User)))
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.UserId))
                .ForMember(dest => dest.IsApproved, opt => opt.MapFrom(src => src.IsApproved))
                .ForMember(dest => dest.JoinDate, opt => opt.MapFrom(src => src.JoinDate))
                .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.User.GetProfileName()))
                .ForMember(dest => dest.Photo, opt => opt.MapFrom(src => src.User.GetProfilePhoto()))
                .ForMember(dest => dest.OwnerId, opt => opt.MapFrom(src => src.Team.OwnerId))
                .ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.Team.TeamName))
                .ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.TeamId))
                .ForMember(dest => dest.Phone, opt => opt.MapFrom(src => ((src.User.Carrier != 0 && src.User.Carrier != null) || (src.User.Phone != null && src.User.Address.Locality.Country == "India")) ? true : false))
                ;
        }

        private static void MapAwards()
        {
            Mapper.CreateMap<Award, AwardEntity>()
                .ForMember(dest => dest.AwardDetails, opt => opt.MapFrom(src => src.AwardDetails))
                .ForMember(dest => dest.AwardId, opt => opt.MapFrom(src => src.id))
                ;
        }

        private static void MapGroups()
        {
            Mapper.CreateMap<Group, KeyValueEntity>()
                .ForMember(dest => dest.Value, opt => opt.MapFrom(src => src.Name))
                .ForMember(dest => dest.Key, opt => opt.MapFrom(src => src.Name))
                ;
        }

        private static void MapGroupMembers()
        {
            Mapper.CreateMap<GroupMember, KeyValueEntity>()
                .ForMember(dest => dest.Value, opt => opt.MapFrom(src => src.Group.Name))
                .ForMember(dest => dest.Key, opt => opt.MapFrom(src => src.Group.Name))
                ;
        }

        private static void MapSport()
        {
            Mapper.CreateMap<UserFavoriteSport, FavoriteSportsEntity>()
                .ForMember(dest => dest.SportsName, opt => opt.MapFrom(src => src.Sport.Name))
                .ForMember(dest => dest.SportsId, opt => opt.MapFrom(src => src.Sport.Id))
                ;

            Mapper.CreateMap<UserFavoriteSport, KeyValueEntity>()
               .ForMember(dest => dest.Value, opt => opt.MapFrom(src => src.Sport.Name))
               .ForMember(dest => dest.Key, opt => opt.MapFrom(src => src.Sport.Id.ToString()))
               ;
        }

        internal static IList<TDestination> MapList<TSource, TDestination>(IList<TSource> sourceData)
        {
            return Mapper.Map<IList<TSource>, IList<TDestination>>(sourceData);
        }

        internal static IList<TDestination> MapList<TSource, TDestination>(TSource sourceData)
        {
            return Mapper.Map<IList<TSource>, IList<TDestination>>(new List<TSource>() { sourceData });
        }
    }
}
