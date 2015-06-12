// -----------------------------------------------------------------------
// <copyright file="EntityExtensions.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Repository
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Sportzly.DataAccess;
    using Sportzly.BusinessEntities.BusinessEntity;
    using Sportzly.Framework;
    using Sportzly.BusinessEntities.QueryEntity;
    using System.Web;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class EntityExtensions
    {
        public const string NOT_MENTIONED = "Not Mentioned";
        public static string GetProfileName(this User src)
        {
            if (src.FirstName != null)
                return string.Format("{0} {1}", src.FirstName, src.LastName);
            return src.Email;
        }

        public static string GetProfilePhoto(this User src)
        {
            if (src.Photo == null || src.Photo.PhotoPath == null)
                return Utility.DEFAULT_PROFILE_IMAGE;
            return src.Photo.PhotoPath;
        }



        public static KeyValueEntity GetCity(this User src)
        {
            if (src.Address != null && src.Address.Locality != null)
                return new KeyValueEntity() { Key = src.Address.Locality.City, Value = src.Address.Locality.City };
            return KeyValueEntity.Empty;
        }

        public static KeyValueEntity GetCountry(this User src)
        {
            if (src.Address != null && src.Address.Locality != null)
                return new KeyValueEntity() { Key = src.Address.Locality.Country, Value = src.Address.Locality.Country };
            return KeyValueEntity.Empty;
        }

        public static string GetZIP(this User src)
        {
            if (src.Address != null && src.Address.Locality != null)
                return src.Address.Locality.PostalCode;
            return "";
        }

        public static string GetGender(this User src)
        {
            if (src.Gender != null && src.Gender.Gender1 != null)
                return src.Gender.Gender1;
            return NOT_MENTIONED;
        }

        public static string GetEncryptedEmail(this User src)
        {
            if (src.Email != null)
            {
                EncryptDecryptQueryString obj = new EncryptDecryptQueryString();
                return HttpUtility.UrlEncode(obj.Encrypt(src.Email, "99841286"));
            }
            else
            {
                return NOT_MENTIONED;
            }
           
        }

        public static string GetMaritalStatus(this User src)
        {
            if (src.MaritalStatu != null && src.MaritalStatu.Status != null)
                return src.MaritalStatu.Status;
            return NOT_MENTIONED;
        }

        public static string GetDOBString(this User src)
        {
            if (src.DOB != null)
                return "Born on " + src.DOB.Value.ToString("MMM dd");
            return NOT_MENTIONED;
        }

        public static User GetUser(CalendarAttendee src)
        {
            if (src != null)
                return new UserRepository().GetUserByEmail(src.attendeesEmail);

            return new User() { Email = "" };
        }

        public static List<Team> GetTeams(this User src, bool? onlyApproved = null)
        {
            List<Team> teams = new List<Team>();
            if (src.TeamMembers != null)
            {
                foreach (TeamMember tm in src.TeamMembers)
                {
                    if (tm.Team.IsEnabled.HasValue && tm.Team.IsEnabled.Value && (!onlyApproved.HasValue || (onlyApproved.HasValue && tm.IsApproved == onlyApproved)))
                    {
                        teams.Add(tm.Team);
                    }
                }
            }

            if (src.Teams1 != null)
            {
                foreach (Team t in src.Teams1)
                {
                    if (t.IsEnabled.HasValue && t.IsEnabled.Value)
                    {
                        teams.Add(t);
                    }
                }
            }

            return teams;
        }
        public static List<Team> GetTeamsCookies(this User src, bool? onlyApproved = null)
        {
            List<Team> teams = new List<Team>();
            if (src.TeamMembers != null)
            {
                foreach (TeamMember tm in src.TeamMembers)
                {
                    if (tm.Team.IsEnabled.HasValue && tm.Team.IsEnabled.Value && (!onlyApproved.HasValue || (onlyApproved.HasValue && tm.IsApproved == onlyApproved)))
                    {
                        teams.Add(tm.Team);
                    }
                }
            }

            if (src.Teams1 != null)
            {
                foreach (Team t in src.Teams1)
                {
                    if (t.IsEnabled.HasValue && t.IsEnabled.Value)
                    {
                        teams.Add(t);
                    }
                }
            }
            var count = teams.Count;
            if (count > 1)
            {
                teams.RemoveRange(1, count - 1);
            }
            return teams;
        }
        public static bool CheckTeamAdmin(long userId, long teamId, SportzlyDataContext context)
        {
            var teamAdmin = context.TeamAdmins.FirstOrDefault(rs => rs.UserId == userId && rs.TeamId == teamId);
            if (teamAdmin == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public static bool CheckTeamAdminNew(long userId, long teamId, SportzlyDataContext context)
        {
            var status = false;
            var team = context.Teams.Where(i => i.OwnerId == userId && i.Id == teamId).FirstOrDefault();
            if (team != null)
            {
                status = true;
            }
            else
            {
                var teamAdmin = context.TeamAdmins.FirstOrDefault(rs => rs.UserId == userId && rs.TeamId == teamId);
                if (teamAdmin == null)
                {
                    status = false;
                }
                else
                {
                    status = true;
                }
            }
            return status;
        }
        public static User ToUser(this UserDetailEntity entity, User user, SportzlyDataContext context)
        {

            user.DOB = entity.DOB;
            user.Email = entity.EmailId;
            user.FirstName = entity.FirstName;

            user.GenderId = entity.GenderId;
            user.Id = entity.Id;
            user.LastModifyDate = DateTime.Now;
            user.LastName = entity.LastName;

            user.Phone = entity.Phone;
            user.Summary = entity.Summary;
            user.Collage = entity.Collage;
            user.MiddleSchool = entity.MiddleSchool;
            user.HighSchool = entity.HighSchool;
            user.LevelOther = entity.OtherLevel;
            user.RoleOther = entity.OtherSportsTag;
            user.Carrier = entity.CarrierValue;
            user.Role = entity.SportsTag;
            user.Level = entity.Level;

            user.Username = entity.EmailId;

            if (string.IsNullOrEmpty(entity.ProfileFoto) == false)
            {
                user.Photo = (user.Photo ?? new Photo());
                user.Photo.PhotoPath = entity.ProfileFoto;
            }

            if (user.Address == null)
                user.Address = new Address();

            if (entity.City != null
                && entity.Country != null
                && string.IsNullOrEmpty(entity.City.Value) == false
                && string.IsNullOrEmpty(entity.Country.Value) == false)
            {

                if (user.Address.Locality == null)
                    user.Address.Locality = new Locality();

                user.Address.Locality.City = entity.City.Value;
                user.Address.Locality.Country = entity.Country.Value;
                user.Address.Locality.PostalCode = entity.ZIP;
            }

            UpdateAwards(entity, user, context);

            UpdateTeams(entity, user, context);

            UpdateGroups(entity, user, context);

            UpdateFavSports(entity, user, context);

            return user;
        }
        public static User SaveUserInfoStream(this UserDetailEntity entity, User user, SportzlyDataContext context)
        {
            if (entity.Phone != null)
            {
                user.Phone = entity.Phone;
            }

            if (entity.CarrierValue != null)
            {
                user.Carrier = entity.CarrierValue;
            }

            if (string.IsNullOrEmpty(entity.ProfileFoto) == false)
            {
                user.Photo = (user.Photo ?? new Photo());
                user.Photo.PhotoPath = entity.ProfileFoto;
            }

            

            if (entity.City != null
                && entity.Country != null
                && string.IsNullOrEmpty(entity.Country.Value) == false)
            {

                if (user.Address == null)
                    user.Address = new Address();
                if (user.Address.Locality == null)
                    user.Address.Locality = new Locality();

                user.Address.Locality.City = entity.City.Value;
                user.Address.Locality.Country = entity.Country.Value;

            }

            return user;
        }
        private static void UpdateGroups(UserDetailEntity entity, User user, SportzlyDataContext context)
        {
            if (user.GroupMembers == null)
                user.GroupMembers = new System.Data.Objects.DataClasses.EntityCollection<GroupMember>();

            user.GroupMembers.ToList().ForEach(rs => context.GroupMembers.DeleteObject(rs));

            foreach (KeyValueEntity groupEntity in entity.Groups)
            {
                if (groupEntity == null) continue;
                decimal id;
                decimal.TryParse(groupEntity.Key, out id);
                var grp = context.Groups.FirstOrDefault(rs => rs.Name == groupEntity.Value);
                if (grp == null)
                    grp = new Group()
                    {
                        Name = groupEntity.Value,
                        Id = 0,
                        OwnerId = user.Id,
                        CreatedOn = DateTime.Now,
                        LastPostOn = DateTime.Now
                    };

                var grpMem = new GroupMember() { Group = grp, JoinDate = DateTime.Now };

                user.GroupMembers.Add(grpMem);
            }
        }

        private static void UpdateTeams(UserDetailEntity entity, User user, SportzlyDataContext context)
        {
            if (user.TeamMembers == null)
                user.TeamMembers = new System.Data.Objects.DataClasses.EntityCollection<TeamMember>();
            List<TeamMember> tempList = new List<TeamMember>();
            foreach (TeamMember tm in user.TeamMembers.ToList())
            {
                bool matched = false;
                foreach (KeyValueEntity teamEntity in entity.Teams)
                {
                    if (tm.Team.TeamName.Contains(teamEntity.Value))
                    {
                        matched = true;
                        break;
                    }
                }

                if (!matched)
                {
                    tempList.Add(tm);
                }
            }
            tempList.ToList().ForEach(rs => context.TeamMembers.DeleteObject(rs));
            foreach (KeyValueEntity teamEntity in entity.Teams)
            {
                if (teamEntity == null) continue;

                var tm = context.Teams.FirstOrDefault(rs => rs.TeamName == teamEntity.Value);
                if (tm != null)
                {
                    if (user.TeamMembers.ToList().Where(rs => rs.TeamId == tm.Id).Count() == 0)
                    {
                        if (user.Id != tm.OwnerId)
                        {
                            var tmMem = new TeamMember() { Team = tm };
                            user.TeamMembers.Add(tmMem);
                        }
                    }
                }
            }
        }

        private static void UpdateAwards(UserDetailEntity entity, User user, SportzlyDataContext context)
        {
            if (user.Awards1 == null)
                user.Awards1 = new System.Data.Objects.DataClasses.EntityCollection<Award>();

            user.Awards1.ToList().ForEach(rs => context.Awards.DeleteObject(rs));

            foreach (AwardEntity awardEntity in entity.Awards)
            {
                user.Awards1.Add(new Award() { id = 0, AwardDetails = awardEntity.AwardDetails });
            }
        }

        private static void UpdateFavSports(UserDetailEntity entity, User user, SportzlyDataContext context)
        {
            if (user.UserFavoriteSports == null)
                user.UserFavoriteSports = new System.Data.Objects.DataClasses.EntityCollection<UserFavoriteSport>();

            user.UserFavoriteSports.ToList().ForEach(rs => context.UserFavoriteSports.DeleteObject(rs));

            var favSport = entity.FavSports;
            if (favSport != null && string.IsNullOrEmpty(favSport.Value) == false)
            {
                var tm = context.Sports.FirstOrDefault(rs => rs.Name == favSport.Value);
                if (tm == null)
                    tm = new Sport() { Id = 0, Name = favSport.Value };

                user.UserFavoriteSports.Add(new UserFavoriteSport() { Sport = tm });
            }

        }

        internal static IEnumerable<AlbumPhoto> GetAlbumPhotos(this Album album)
        {
            if (album == null || album.AlbumPhotos == null)
            {
                yield return null;
            }
            else
            {
                var result = album.AlbumPhotos.OrderByDescending(i => i.PostDate);
                foreach (AlbumPhoto albumPhoto in result)
                {
                    yield return albumPhoto;
                }
            }
        }

        internal static IEnumerable<DocFile> GetDocFiles(this DocumentTitle doc)
        {
            if (doc == null || doc.Files == null)
            {
                yield return null;
            }
            else
            {
                var result = doc.Files;
                foreach (DocFile f in result)
                {
                    yield return f;
                }
            }
        }


        internal static void Join(this User src, string token, SportzlyDataContext context)
        {
            var tokenId = Guid.Empty;

            if (Guid.TryParse(token, out tokenId))
            {
                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteToken == tokenId);
                if (invite != null)
                {
                    switch (invite.inviteType)
                    {
                        case "t":
                            JoinAsTeamMember(src, context, invite);
                            break;
                        case "f":

                            JoinAsFriend(src, context, invite);
                            break;
                    }
                }
            }
        }

        private static void JoinAsTeamMember(User src, SportzlyDataContext context, Invitation invite)
        {
            var team = context.Teams.FirstOrDefault(rs => rs.Id == invite.inviteId);
            if (team != null)
            {
                var teamMember = context.TeamMembers.FirstOrDefault(rs => rs.UserId == src.Id && rs.TeamId == team.Id);
                if (teamMember == null)
                {
                    teamMember = new TeamMember()
                    {
                        IsApproved = true,
                        IsBlocked = false,
                        JoinDate = DateTime.Now,
                        TeamId = invite.inviteId,
                        UserId = src.Id
                    };
                    context.TeamMembers.AddObject(teamMember);
                }

                teamMember.IsApproved = true;
                context.SaveChanges();
            }
        }

        private static void JoinAsFriend(User src, SportzlyDataContext context, Invitation invite)
        {
            var friend = context.Friends.FirstOrDefault(rs =>
                (rs.FriendId == invite.inviteId && rs.UserId == src.Id)
                ||
                (rs.FriendId == src.Id && rs.UserId == invite.inviteId)
             );

            if (friend == null)
            {
                friend = new Friend()
                {
                    UserId = invite.inviteId,
                    FriendId = src.Id,
                };
                context.Friends.AddObject(friend);
            }

            friend.IsApproved = true;
            context.SaveChanges();
        }

        public static int IsMoreThanOneDay(this Calendar calendar)
        {
            if (calendar.EndTime.Value.Subtract(calendar.StartTime.Value).Days > 1)
            {
                return 1;                                                 //isMorethanOneDay
            }
            else
            {
                return 0;                                                 //isMorethanOneDay
            }
        }


        internal static string GetEventLogoUrl(long? teamId, User user)
        {
            if (teamId.HasValue && teamId.Value > 0)
                return new TeamRepository().GetTeamLogoUrl(teamId.Value);
            else if (user != null)
                return user.GetProfilePhoto();
            else
                return string.Empty;
        }


        internal static IList<EventEntity> GetEvents(string fromdate)
        {

            EventQuery calendarQuery = new EventQuery();
            calendarQuery = (EventQuery)System.Web.HttpContext.Current.Session["E"];
            calendarQuery.EventDate = fromdate;
            return new CalendarRepository().GetUserEventsByDate(calendarQuery);
        }

        internal static List<UrlEntity> GetUrl(string url)
        {
            if (url == null)
            {
                url = "";
            }

            var lst = url.Split(';').Select(i => new UrlEntity
            {
                Url = i.ToLower().IndexOf("http://") < 0 && i.ToLower().IndexOf("https://") < 0 ? "http://" + i : i
            }).ToList();

            return lst;
        }

        internal static IList<EventEntity> GetEventsGame(string fromdate)
        {

            EventQuery calendarQuery = new EventQuery();
            calendarQuery = (EventQuery)System.Web.HttpContext.Current.Session["E"];
            calendarQuery.EventDate = fromdate;
            return new CalendarRepository().GetUserEventsByDateGame(calendarQuery);

        }

        internal static string GetSourceName(long? teamId, User user)
        {
            if (teamId.HasValue && teamId.Value > 0)
                return new TeamRepository().GetTeamName(teamId.Value);
            else if (user != null)
                return user.GetProfileName();
            else
                return string.Empty;
        }
        internal static string GetTeamSports(long? teamId)
        {
            if (teamId.HasValue && teamId.Value > 0)
                return new TeamRepository().GetTeamSport(teamId.Value);
            else
                return string.Empty;
        }
        internal static string GetUserProfilePhoto(CalendarAttendee src)
        {
            return new UserRepository().GetProfilePhoto(src.attendeesEmail);
        }
    }
}
