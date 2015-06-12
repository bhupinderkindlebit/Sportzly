using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.DataAccess;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework.Exceptions;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

namespace Sportzly.Repository
{
    public class UserRepository
    {
        public IList<UserEntity> GetUsers(string Username, string password, string emailId, string token)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                            .AsQueryable<User>();

                if (!string.IsNullOrEmpty(Username))
                    result = result.Where(rs => rs.Username == Username);

                if (!string.IsNullOrEmpty(password))
                {
                    result = result.Where(rs => rs.Password == password || rs.TempPassword == password);
                }

                if (!string.IsNullOrEmpty(emailId))
                    result = result.Where(rs => rs.Email == emailId);

                // result = result.Where(rs => rs.IsVerified.HasValue && rs.IsVerified.Value == true);

                var results = result.ToList();

                if (!string.IsNullOrEmpty(password))
                {
                    var currentUser = results.FirstOrDefault();
                    if (currentUser != null)
                    {
                        currentUser.Join(token, context);
                    }

                }


                return EntityMapper.MapList<User, UserEntity>(results);
            }
        }

        public IList<UserNewEntity> GetNewUsersDetails(string facebookId, string twitter)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                            .AsQueryable<User>();

                if (facebookId != "")
                {
                    result = result.Where(rs => rs.FacebookId == facebookId);
                }
                if (twitter != "")
                {
                    result = result.Where(rs => rs.TwitterId == twitter);
                }


                var results = result.ToList();


                EntityMapper.Map();

                return EntityMapper.MapList<User, UserNewEntity>(results);
            }
        }

        public IList<UserDetailEntity> GetUserDetail(string Username, string password, string emailId, long? sessionUserId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                            .AsQueryable<User>();

                if (!string.IsNullOrEmpty(Username))
                    result = result.Where(rs => rs.Username == Username);

                if (!string.IsNullOrEmpty(password))
                    result = result.Where(rs => rs.Password == password);

                if (!string.IsNullOrEmpty(emailId))
                    result = result.Where(rs => rs.Email == emailId);


                result.Where(rs => rs.IsVerified.HasValue && rs.IsVerified.Value);



                return EntityMapper.MapList<User, UserDetailEntity>(result.ToList());
            }
        }

        public IList<UserEntity> ActivateUser(string emailIdEnc)
        {
            User user = null;
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Users.AsQueryable<User>();

                var results = result.ToList();

                user = results.FirstOrDefault(rs => Utility.Encrypt(rs.Email) == emailIdEnc);
                if (user != null)
                {
                    user.IsVerified = true;
                    context.SaveChanges();
                }
            }
            if (user != null)
            {
                return GetUsers(null, null, user.Email, string.Empty);
            }
            return null;
        }

        public void CreateUser(string email, string password, string firstName, string lastName, string token, DateTime dt)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Users;

                var user = new User() { Email = email, Password = password, FirstName = firstName, LastName = lastName, IsVerified = true };
                result.AddObject(user);

                context.SaveChanges();
                var inviteEmailAddress = context.InviteEmailaddresses.Where(i => i.InviteEmail == email).FirstOrDefault();
                if (inviteEmailAddress != null)
                {
                    inviteEmailAddress.InviteRegistered = true;
                    context.SaveChanges();
                }
                user.Join(token, context);

            }

        }

        public IList<UserEntity> CheckUserFB(string email, string FacebookId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                           .AsQueryable<User>();

                result = result.Where(rs => rs.Email == email && rs.FacebookId == FacebookId);
                var results = result.ToList();


                EntityMapper.Map();

                return EntityMapper.MapList<User, UserEntity>(results);
            }
        }
        public IList<UserEntity> CheckUserTW(string email, string twitterID)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                           .AsQueryable<User>();

                result = result.Where(rs => rs.Email == email && rs.TwitterId == twitterID);
                var results = result.ToList();


                EntityMapper.Map();

                return EntityMapper.MapList<User, UserEntity>(results);
            }
        }
        public IList<UserEntity> CheckUserFBTW(string email, bool facebook, bool twitter)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                           .AsQueryable<User>();
                if (facebook)
                {
                    result = result.Where(rs => rs.Email == email);
                }
                else if (twitter)
                {
                    result = result.Where(rs => rs.Email == email);
                }
                var results = result.ToList();

                EntityMapper.Map();

                return EntityMapper.MapList<User, UserEntity>(results);
            }
        }

        public IList<UserEntity> CheckUserTwitterID(string twitterID)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.Users
                           .AsQueryable<User>();

                result = result.Where(rs => rs.TwitterId == twitterID);

                var results = result.ToList();

                EntityMapper.Map();

                return EntityMapper.MapList<User, UserEntity>(results);
            }
        }

        public bool CheckUserEmailFB(string email)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var u = context.Users.Where(i => i.Email == email && (i.FacebookId == null || i.FacebookId == "")).FirstOrDefault();
                if (u == null)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
        public bool CheckUserEmailTw(string email)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var u = context.Users.Where(i => i.Email == email && (i.TwitterId == null || i.TwitterId == "")).FirstOrDefault();
                if (u == null)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
        public void CreateUserFB(string email, string password, string firstName, string lastName, string FacebookId, string profilepic, string token)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var u = context.Users.Where(i => i.Email == email && (i.FacebookId == null || i.FacebookId == "")).FirstOrDefault();
                if (u == null)
                {
                    var result = context.Users;
                    var user = new User() { Email = email, Password = password, FirstName = firstName, LastName = lastName, IsVerified = true, FacebookId = FacebookId };
                    result.AddObject(user);
                    user.Photo = (user.Photo ?? new Photo());
                    user.Photo.PhotoPath = profilepic;
                    context.SaveChanges();
                    var inviteEmailAddress = context.InviteEmailaddresses.Where(i => i.InviteEmail == email).FirstOrDefault();
                    if (inviteEmailAddress != null)
                    {
                        inviteEmailAddress.InviteRegistered = true;
                        context.SaveChanges();
                    }
                    user.Join(token, context);
                }
                else
                {
                    u.FacebookId = FacebookId;
                    context.SaveChanges();
                }
            }
        }
        public void CreateUserTW(string email, string password, string firstName, string lastName, string TwitterId, string token)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var u = context.Users.Where(i => i.Email == email && (i.FacebookId == null || i.FacebookId == "")).FirstOrDefault();
                if (u == null)
                {
                    var result = context.Users;
                    var user = new User() { Email = email, Password = password, FirstName = firstName, LastName = lastName, IsVerified = true, TwitterId = TwitterId };
                    result.AddObject(user);
                    context.SaveChanges();
                    var inviteEmailAddress = context.InviteEmailaddresses.Where(i => i.InviteEmail == email).FirstOrDefault();
                    if (inviteEmailAddress != null)
                    {
                        inviteEmailAddress.InviteRegistered = true;
                        context.SaveChanges();
                    }
                    user.Join(token, context);
                }
                else
                {
                    u.TwitterId = TwitterId;
                    context.SaveChanges();
                }
            }
        }
        public IList<UserDetailEntity> SaveProfile(UserDetailEntity userEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Users;

                User user = result.Where(rs => rs.Id == userEntity.Id).FirstOrDefault();

                if (user == null)
                {
                    user = new User();
                    result.AddObject(user);
                }

                user = userEntity.ToUser(user, context);

                context.SaveChanges();



                return EntityMapper.MapList<User, UserDetailEntity>(user);

            }
        }
        public IList<UserDetailEntity> SaveStreamProfile(UserDetailEntity userEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Users;

                User user = result.Where(rs => rs.Id == userEntity.Id).FirstOrDefault();

                user = userEntity.SaveUserInfoStream(user, context);

                context.SaveChanges();

                return EntityMapper.MapList<User, UserDetailEntity>(user);

            }
        }
        public int GetTeamCount(long userId)
        {
            int count = 0;
            using (var context = new SportzlyDataContext())
            {
                count = context.Teams.Where(i => i.OwnerId == userId && i.IsEnabled == true).Count();
                if (count == 0)
                {
                    count = context.TeamAdmins.Where(i => i.UserId == userId).Count();
                }
            }
            return count;

        }

        public FriendshipStatus GetFriendshipStatus(long userId, long? friendId)
        {
            FriendshipStatus friendStatus = FriendshipStatus.None;

            if (friendId.HasValue && friendId.Value == userId)
                friendStatus = FriendshipStatus.Self;

            var friend = GetFriendship(userId, friendId);

            if (friend != null)
            {
                if (friend.IsApproved.HasValue)
                    if (friend.IsApproved.Value)
                        friendStatus = FriendshipStatus.Approved;
                    else
                        friendStatus = friend.UserId == friendId.Value ? FriendshipStatus.DeclineRecieved : FriendshipStatus.DeclineSent;
                else
                    friendStatus = friend.UserId == friendId.Value ? FriendshipStatus.Requested : FriendshipStatus.RequestRecieved;
            }

            return friendStatus;

        }

        private Friend GetFriendship(long friendId, long? userId)
        {
            if (!userId.HasValue) return null;
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Friends.AsQueryable();

                result = result.Where(rs => (rs.UserId == userId && rs.FriendId == friendId)
                    || (rs.FriendId == userId && rs.UserId == friendId));

                if (result.Any())
                    return result.FirstOrDefault();

                return null;
            }
        }

        public List<PlayerDetailEntity> SearchPlayers(PlayerSearchQuery playerQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Users.AsQueryable()
                               .Where(rs => rs.IsVerified.HasValue && rs.IsVerified.Value && rs.Id != playerQueryEntity.SessionUserId);

                if (!string.IsNullOrEmpty(playerQueryEntity.KeyWord) && playerQueryEntity.KeyWord != "Search players")
                {
                    var query = playerQueryEntity.KeyWord.Split(new string[] { ",", " ", "+" }, StringSplitOptions.RemoveEmptyEntries);

                    result = (from r in result
                              from q in query
                              where r.FirstName.Contains(q)
                                 || r.LastName.Contains(q)
                                 || r.Email.Contains(q)
                              select r
                              ).Distinct();
                }

                if (!string.IsNullOrEmpty(playerQueryEntity.Level))
                {
                    result = result.Where(rs => rs.LevelOther.Contains(playerQueryEntity.Level));
                }

                if (!string.IsNullOrEmpty(playerQueryEntity.Sports))
                {
                    result = from r in result
                             join us in context.UserFavoriteSports on r.Id equals us.UserId
                             join s in context.Sports on us.SportId equals s.Id
                             where s.Name.Contains(playerQueryEntity.Sports)
                             select r;
                }

                if (!string.IsNullOrEmpty(playerQueryEntity.Location))
                {
                    result = result.Where(rs => rs.Address.Locality.City.Contains(playerQueryEntity.Location));
                }

                return result.AsEnumerable().Select(i => new PlayerDetailEntity
                 {
                     DisplayName = i.FirstName + " " + i.LastName,
                     City = i.Address == null ? "" : i.Address.Locality.City,
                     Country = i.Address == null ? "" : i.Address.Locality.Country,
                     EmailId = i.Email,
                     FavSports = context.UserFavoriteSports.Where(j => j.UserId == i.Id).FirstOrDefault() == null ? "" : context.Sports.Where(k => k.Id == context.UserFavoriteSports.Where(j => j.UserId == i.Id).FirstOrDefault().SportId).FirstOrDefault().Name,
                     Id = Convert.ToInt64(i.Id),
                     Level = i.LevelOther,
                     Role = i.RoleOther,
                     ProfilePhoto = string.Format("{0}", (i.Photo == null || i.Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : i.Photo.PhotoPath),
                     Summary = i.Summary,
                     FriendCount = context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.FriendId == i.Id).Count() + context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.UserId == i.Id).Count(),
                     Friends = context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.FriendId == i.Id).AsEnumerable().Select(m => new PlayerFriendEntity
                     {
                         DisplayName = context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().FirstName + " " + context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().LastName,
                         EmailId = context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Email,
                         Id = context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Id,
                         Profilephoto = string.Format("{0}", (context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Photo == null || context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Photo.PhotoPath),
                     }).ToList(),
                     Friends1 = context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.UserId == i.Id).AsEnumerable().Select(m => new PlayerFriendEntity
                     {
                         DisplayName = context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().FirstName + " " + context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().LastName,
                         EmailId = context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Email,
                         Id = context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Id,
                         Profilephoto = string.Format("{0}", (context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Photo == null || context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Photo.PhotoPath),
                     }).ToList(),
                     MyFriend = (context.Friends.Where(k => k.FriendId == i.Id && k.UserId == playerQueryEntity.SessionUserId).Count() + context.Friends.Where(k => k.UserId == i.Id && k.FriendId == playerQueryEntity.SessionUserId).Count()) > 0 ? true : false
                 }).ToList();

                //return EntityMapper.MapList<User,PlayerDetailEntity>(result.Distinct().OrderByDescending(rs => rs.CreateDate).ToList());
            }
        }

        public List<PlayerDetailEntity> GetPlayers(PlayerSearchQuery playerQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Users.AsQueryable()
                               .Where(rs => rs.IsVerified.HasValue && rs.IsVerified.Value && rs.Id != playerQueryEntity.SessionUserId);


                var players = result.Where(i => i.Friends.Count > 0 || i.Friends1.Count > 0).OrderByDescending(i => (i.Friends.Count + i.Friends1.Count)).Take(10).AsEnumerable().Select(i => new PlayerDetailEntity
                 {
                     DisplayName = i.FirstName + " " + i.LastName,
                     City = i.Address == null ? "" : i.Address.Locality.City,
                     Country = i.Address == null ? "" : i.Address.Locality.Country,
                     EmailId = i.Email,
                     FavSports = context.UserFavoriteSports.Where(j => j.UserId == i.Id).FirstOrDefault() == null ? "" : context.Sports.Where(k => k.Id == context.UserFavoriteSports.Where(j => j.UserId == i.Id).FirstOrDefault().SportId).FirstOrDefault().Name,
                     Id = Convert.ToInt64(i.Id),
                     Level = i.LevelOther,
                     Role = i.RoleOther,
                     ProfilePhoto = string.Format("{0}", (i.Photo == null || i.Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : i.Photo.PhotoPath),
                     Summary = i.Summary,
                     FriendCount = context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.FriendId == i.Id).Count() + context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.UserId == i.Id).Count(),
                     Friends = context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.FriendId == i.Id).AsEnumerable().Select(m => new PlayerFriendEntity
                     {
                         DisplayName = context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().FirstName + " " + context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().LastName,
                         EmailId = context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Email,
                         Id = context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Id,
                         Profilephoto = string.Format("{0}", (context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Photo == null || context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : context.Users.Where(n => n.Id == m.UserId).FirstOrDefault().Photo.PhotoPath),
                     }).ToList(),
                     Friends1 = context.Friends.Where(k => k.IsApproved.HasValue && k.IsApproved == true && k.UserId == i.Id).AsEnumerable().Select(m => new PlayerFriendEntity
                     {
                         DisplayName = context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().FirstName + " " + context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().LastName,
                         EmailId = context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Email,
                         Id = context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Id,
                         Profilephoto = string.Format("{0}", (context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Photo == null || context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : context.Users.Where(n => n.Id == m.FriendId).FirstOrDefault().Photo.PhotoPath),
                     }).ToList(),
                     MyFriend = (context.Friends.Where(k => k.FriendId == i.Id && k.UserId == playerQueryEntity.SessionUserId).Count() + context.Friends.Where(k => k.UserId == i.Id && k.FriendId == playerQueryEntity.SessionUserId).Count()) > 0 ? true : false
                 }).ToList();
                return players.Where(i => i.FriendCount > 0).Take(10).OrderByDescending(i => i.FriendCount).ToList();
                //return EntityMapper.MapList<User,PlayerDetailEntity>(result.Distinct().OrderByDescending(rs => rs.CreateDate).ToList());
            }
        }

        public List<PlayerDetailEntity> GetPlayersHome(PlayerSearchQuery playerQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {

                IEnumerable<Team> result = context.Teams.AsEnumerable<Team>().Where(rs => rs.IsEnabled.HasValue && rs.IsEnabled.Value);
                var list = result.Where(rs => (rs.TeamMembers.Where(j => j.IsApproved.HasValue && j.IsApproved.Value).Count() > 0) && rs.Photo != null).OrderByDescending(rs => rs.TeamMembers.Where(j => j.IsApproved.HasValue && j.IsApproved.Value).Count()).ToList();

                // var teams = EntityMapper.MapList<Team, TeamEntity>(list);
                list = list.Where(i => !i.Photo.Contains("default.png")).ToList();
                list = list.Take(8).ToList();

                //var result = context.Users.AsQueryable()
                //               .Where(rs => rs.IsVerified.HasValue && rs.IsVerified.Value);

                //var r = result.Where(i => i.Photo != null && ((i.Friends.Count) + (i.Friends1.Count)) > 0);
                var players = list.AsEnumerable().Select(i => new PlayerDetailEntity
                {
                    DisplayName = i.User.FirstName + " " + i.User.LastName,
                    EmailId = i.User.Email,
                    ProfilePhoto = string.Format("{0}", (i.Photo == null || i.User.Photo.PhotoPath == null) ? Utility.DEFAULT_PROFILE_IMAGE : i.User.Photo.PhotoPath)
                }).ToList();
                // players = players.OrderByDescending(i => i.FriendCount).ToList();
                return players.ToList();
            }
        }


        public bool SendFriendshipActionPlayer(FriendQuery friendQueryEntity, out KeyValuePair<int, string> message, out Framework.UserExceptionType messageType)
        {

            message = new KeyValuePair<int, string>();
            messageType = UserExceptionType.Internal;
            long userId = friendQueryEntity.SessionUserId.Value;
            long friendId = friendQueryEntity.FriendId;
            Friend friend = null;

            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Friends.AsQueryable();
                result = result.Where(rs => (rs.UserId == userId && rs.FriendId == friendId)
                    || (rs.FriendId == userId && rs.UserId == friendId));

                friend = result.FirstOrDefault();

                switch (friendQueryEntity.FriendshipAction)
                {
                    case FriendshipAction.Request:
                        if (friend == null)
                        {
                            friend = new Friend() { UserId = userId, FriendId = friendId, IsApproved = null };
                            context.Friends.AddObject(friend);

                        }
                        friend.UserId = userId;
                        friend.FriendId = friendId;
                        friend.IsApproved = null;
                        break;

                    case FriendshipAction.AcceptOrDecline:
                        if (friend != null && friendQueryEntity.Accept.HasValue)
                        {
                            friend.IsApproved = friendQueryEntity.Accept.Value;

                        }
                        break;
                    case FriendshipAction.Terminate:
                    case FriendshipAction.CancelRequest:
                        if (friend != null)
                        {
                            context.Friends.DeleteObject(friend);

                        }
                        break;
                }
                context.SaveChanges();
                friend = GetFriendship(friendId, userId);
                messageType = UserExceptionType.Message;
                message = new KeyValuePair<int, string>(8002,
                    string.Format(UserMessages.FRIEND_REQUEST));
                return true;
            }
        }

        public IList<FriendEntity> SendFriendshipAction(FriendQuery friendQueryEntity)
        {
            if (friendQueryEntity.SessionUserId.HasValue == false) return null;

            long userId = friendQueryEntity.SessionUserId.Value;
            long friendId = friendQueryEntity.FriendId;
            Friend friend = null;

            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Friends.AsQueryable();
                result = result.Where(rs => (rs.UserId == userId && rs.FriendId == friendId)
                    || (rs.FriendId == userId && rs.UserId == friendId));

                friend = result.FirstOrDefault();

                switch (friendQueryEntity.FriendshipAction)
                {
                    case FriendshipAction.Request:
                        if (friend == null)
                        {
                            friend = new Friend() { UserId = userId, FriendId = friendId, IsApproved = null };
                            context.Friends.AddObject(friend);

                        }
                        friend.UserId = userId;
                        friend.FriendId = friendId;
                        friend.IsApproved = null;
                        break;

                    case FriendshipAction.AcceptOrDecline:
                        if (friend != null && friendQueryEntity.Accept.HasValue)
                        {
                            friend.IsApproved = friendQueryEntity.Accept.Value;

                        }
                        break;
                    case FriendshipAction.Terminate:
                    case FriendshipAction.CancelRequest:
                        if (friend != null)
                        {
                            context.Friends.DeleteObject(friend);

                        }
                        break;
                }
                context.SaveChanges();
                friend = GetFriendship(friendId, userId);

                return EntityMapper.MapList<Friend, FriendEntity>(friend);
            }
        }

        public IList<ImageEntity> GetUserPhotos(UserQuery userQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.AlbumPhotos.AsQueryable();

                if (!string.IsNullOrEmpty(userQueryEntity.EmailId))
                {
                    result = from u in context.Users
                             join a in context.AlbumPhotos on u.Id equals a.OwnerId
                             where u.Email == userQueryEntity.EmailId
                             orderby a.PostDate descending
                             select a;
                }
                if (userQueryEntity.TeamId > 0)
                {

                    var activities = context
                                           .ActivityTeams
                                           .Where(rs => rs.TeamId == userQueryEntity.TeamId)
                                           .Select(rs => rs.Activity);


                    if (activities != null)
                    {
                        result = from at in activities
                                 join a in context.Albums on at.PhotoId equals a.Id
                                 join ap in context.AlbumPhotos on a.Id equals ap.AlbumId
                                 orderby ap.PostDate descending
                                 select ap;
                    }

                }

                return EntityMapper.MapList<AlbumPhoto, ImageEntity>(result.ToList());

            }
        }

        public IList<InviteEntity> GetPendingInvitesUser(UserQuery userQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.InviteEmailaddresses.Where(i => i.InviteRegistered == false && i.InviteType == "f" && i.InviteBy == userQueryEntity.SessionUserId && i.TeamId == null);
                // result = result.Where(i => i.InviteRegistered == false && i.InviteType=="f" && i.InviteBy == userQueryEntity.SessionUserId && i.TeamId == null);
                return EntityMapper.MapList<InviteEmailaddress, InviteEntity>(result.ToList());

            }
        }

        public IList<ImageThumbnailEntity> GetUserPhotosNew(UserQuery userQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.AlbumPhotos.AsQueryable();

                if (!string.IsNullOrEmpty(userQueryEntity.EmailId))
                {
                    result = from u in context.Users
                             join a in context.AlbumPhotos on u.Id equals a.OwnerId
                             where u.Email == userQueryEntity.EmailId
                             orderby a.PostDate descending
                             select a;
                }
                if (userQueryEntity.TeamId > 0)
                {

                    var activities = context
                                           .ActivityTeams
                                           .Where(rs => rs.TeamId == userQueryEntity.TeamId)
                                           .Select(rs => rs.Activity);


                    if (activities != null)
                    {
                        result = (from at in activities
                                  join a in context.Albums on at.PhotoId equals a.Id
                                  join ap in context.AlbumPhotos on a.Id equals ap.AlbumId
                                  where ap.TeamId == userQueryEntity.TeamId || ap.TeamId == null
                                  select ap).Distinct().OrderByDescending(i => i.PostDate);
                    }

                }

                return EntityMapper.MapList<AlbumPhoto, ImageThumbnailEntity>(result.ToList());

            }
        }

        public IList<FriendUserEntity> GetUserFriends(FriendQuery friendQueryEntity)
        {

            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                IList<FriendUserEntity> listFriends = new List<FriendUserEntity>();
                var user = context.Users.Where(rs => rs.Email == friendQueryEntity.EmailId).FirstOrDefault();

                if (user != null)
                {
                    List<User> users = new List<User>();
                    var result = context.Friends.AsQueryable();

                    result = context.Friends.Where(rs => (rs.UserId == user.Id) && rs.IsApproved.HasValue && rs.IsApproved.Value); // initiated by user

                    result.ToList().ForEach(rs => users.Add(context.Users.Where(u => u.Id == rs.FriendId).FirstOrDefault()));

                    var templistFriends = EntityMapper.MapList<User, FriendUserEntity>(users);

                    templistFriends.ToList().ForEach(rs =>
                    {
                        rs.Status = GetFriendshipStatus((long)user.Id, rs.Id);
                        listFriends.Add(rs);
                    });


                }
                if (user != null)
                {
                    List<User> users = new List<User>();

                    var result = context.Friends.AsQueryable();

                    result = context.Friends.Where(rs => (rs.FriendId == user.Id)); // initiated by friend

                    result.ToList().ForEach(rs => users.Add(context.Users.Where(u => u.Id == rs.UserId).FirstOrDefault()));

                    var templistFriends = EntityMapper.MapList<User, FriendUserEntity>(users);

                    templistFriends.ToList().ForEach(rs =>
                    {
                        rs.Status = GetFriendshipStatus(rs.Id, (long)user.Id);
                        listFriends.Add(rs);
                    });
                }
                return listFriends;
            }
        }

        public IList<FriendUserEntity> GetPendingUserFriends(FriendQuery friendQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                IList<FriendUserEntity> listFriends = new List<FriendUserEntity>();
                var user = context.Users.Where(rs => rs.Email == friendQueryEntity.EmailId).FirstOrDefault();

                List<User> users = new List<User>();

                var result = context.Friends.AsQueryable();

                result = context.Friends.Where(rs => (rs.FriendId == user.Id && rs.IsApproved == null)); // initiated by friend

                result.ToList().ForEach(rs => users.Add(context.Users.Where(u => u.Id == rs.UserId).FirstOrDefault()));

                return EntityMapper.MapList<User, FriendUserEntity>(users);
            }
        }

        public IList<FriendUserEntity> GetMutualFriends(FriendQuery friendQueryEntity)
        {

            using (var context = new SportzlyDataContext())
            {

                List<User> users = new List<User>();

                var userSelf = context.Users.First(rs => rs.Id == friendQueryEntity.SessionUserId);
                var userOther = context.Users.First(rs => rs.Email == friendQueryEntity.EmailId);

                var commonFriends = userSelf.Friends.Intersect(userOther.Friends);
                commonFriends.ToList().ForEach(rs => users.AddRange(context.Users.Where(u => u.Id == rs.UserId || u.Id == rs.FriendId)));

                return EntityMapper.MapList<User, FriendUserEntity>(users.Distinct().ToList());
            }
        }

        public List<UserDetailEntity> SearchUser(string searchString, long? userId)
        {
            using (var context = new SportzlyDataContext())
            {

                var result = context.Users.AsQueryable();

                var query = searchString.Split(new string[] { ",", " ", "+" }, StringSplitOptions.RemoveEmptyEntries);

                result = (from r in result
                          from q in query
                          where r.FirstName.Contains(q)
                             || r.LastName.Contains(q)                            
                          select r
                          ).Distinct();


                //result = result.Where(rs =>
                //        rs.FirstName.Contains(searchString)
                //    || rs.LastName.Contains(searchString)
                //    || rs.Summary.Contains(searchString)
                //    || rs.Username.Contains(searchString)
                //);

                return EntityMapper.MapList<User, UserDetailEntity>(result.ToList()).ToList();
            }
        }
        public List<UserDetailEntity> SearchUserAuto(string searchString, long? userId)
        {
            using (var context = new SportzlyDataContext())
            {

                var result = context.Users.AsQueryable();

                var query = searchString.Split(new string[] { ",", " ", "+" }, StringSplitOptions.RemoveEmptyEntries);

                result = (from r in result
                          from q in query
                          where r.FirstName.Contains(q)
                             || r.LastName.Contains(q)                             
                          select r
                          ).Distinct();


                //result = result.Where(rs =>
                //        rs.FirstName.Contains(searchString)
                //    || rs.LastName.Contains(searchString)
                //    || rs.Summary.Contains(searchString)
                //    || rs.Username.Contains(searchString)
                //);

                return EntityMapper.MapList<User, UserDetailEntity>(result.ToList()).ToList();
            }
        }
        public List<TokenEntity> GetInviteTokenUser(FriendQuery friendQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Users.FirstOrDefault(rs => rs.Id == friendQueryEntity.SessionUserId);
                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteId == result.Id && rs.inviteType == "f");
                if (invite == null)
                {
                    invite = new Invitation()
                    {
                        inviteId = long.Parse(result.Id.ToString()),
                        inviteType = "f",
                        inviteToken = Guid.NewGuid()
                    };
                    context.Invitations.AddObject(invite);
                    context.SaveChanges();
                }
                var lst = new List<TokenEntity>();
                string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(invite.inviteToken.ToString()));
                var html = MailUtils.SendUserInvitationHTML(result.GetProfileName(), invite.inviteToken.ToString());
                lst.Add(new TokenEntity { Token = activationLink, MailHTML = html });
                return lst;
            }
        }

        public List<TokenEntity> GetInviteTokenTwitterUser(FriendQuery friendQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Users.FirstOrDefault(rs => rs.Id == friendQueryEntity.SessionUserId);
                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteId == result.Id && rs.inviteType == "f");
                if (invite == null)
                {
                    invite = new Invitation()
                    {
                        inviteId = long.Parse(result.Id.ToString()),
                        inviteType = "f",
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
                lst.Add(new TokenEntity { Token = tinyUrl, MailHTML = "" });
                return lst;
            }
        }


        public bool InviteFriends(FriendQuery friendQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                string type = "f";
                var result = context.Users.FirstOrDefault(rs => rs.Id == friendQueryEntity.SessionUserId);

                if (result == null)
                    return false;

                var invite = context.Invitations.FirstOrDefault(rs => rs.inviteId == result.Id && rs.inviteType == type);
                if (invite == null)
                {
                    invite = new Invitation()
                    {
                        inviteId = long.Parse(result.Id.ToString()),
                        inviteType = type,
                        inviteToken = Guid.NewGuid()
                    };
                    context.Invitations.AddObject(invite);
                    context.SaveChanges();
                }
                //  var emailIds = friendQueryEntity.EmailId;
                var objCom = new CommonRepository();
                var emailIds = objCom.ExtractEmailAddressesFromString(friendQueryEntity.EmailId);
                emailIds.ToList().ForEach(rs =>
                {
                    if (!rs.Contains("@facebook.com") && rs.Contains("@"))
                    {
                        var inviteEmailAddress = context.InviteEmailaddresses.Where(i => i.InviteType == type && i.InviteEmail == rs && i.InviteBy == friendQueryEntity.SessionUserId).FirstOrDefault();
                        if (inviteEmailAddress == null)
                        {
                            inviteEmailAddress = new InviteEmailaddress()
                            {
                                InviteBy = friendQueryEntity.SessionUserId,
                                InviteDate = DateTime.Now,
                                InviteEmail = rs,
                                InviteRegistered = false,
                                InviteType = type,
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
                MailUtils.SendFriendshipInvitation(result.GetProfileName(), emailIds, invite.inviteToken.ToString(), friendQueryEntity.ServiceName,result.GetProfilePhoto());
                return true;
            }
        }

        public bool MailInvite(MailQuery mailQuery)
        {
            if (mailQuery.TeamId > 0)
            {
                using (var context = new SportzlyDataContext())
                {
                    var result = context.Teams.FirstOrDefault(rs => rs.Id == mailQuery.TeamId);
                    mailQuery.TeamName = result.TeamName;
                }
            }
            MailUtils.SendInviteAdminMail(mailQuery.userName, mailQuery.count, mailQuery.TeamName, mailQuery.Mode, mailQuery.InviteType);
            return true;
        }


        public bool Unsubscribe(FriendQuery friendQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.InviteEmailaddresses.Where(i => i.InviteEmail == friendQueryEntity.EmailId && i.IsUnsubscribe == false).ToList();
                foreach (var item in result)
                {
                    var invite = context.InviteEmailaddresses.Where(i => i.InviteId == item.InviteId).FirstOrDefault();
                    invite.IsUnsubscribe = true;
                    context.SaveChanges();
                }
                return true;
            }
        }
        public bool CheckUser(CheckUserQuery userQuery)
        {
            var status = false;
            using (var context = new SportzlyDataContext())
            {
                if (userQuery.userEmailId != null && userQuery.userEmailId != "")
                {
                    var users = context.Users.FirstOrDefault(rs => rs.Email == userQuery.userEmailId).Id;
                    if (users == userQuery.SessionUserId)
                    {
                        status = true;
                    }
                    else
                    {
                        status = false;
                    }
                }

                if (userQuery.TeamId > 0)
                {
                    var members = context.TeamMembers.Where(i => i.TeamId == userQuery.TeamId && i.UserId == userQuery.SessionUserId).FirstOrDefault();
                    if (members == null)
                    {
                        var team = context.Teams.Where(i => i.OwnerId == userQuery.SessionUserId && i.Id == userQuery.TeamId).FirstOrDefault();
                        if (team != null)
                        {
                            status = true;
                        }
                        else
                        {
                            status = false;
                        }
                    }
                    else
                    {
                        status = true;
                    }
                }

            }
            return status;
        }


        public bool ForgotPassword(UserQuery userQuery)
        {
            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.FirstOrDefault(rs => rs.Email == userQuery.EmailId);

                if (user != null)
                {
                    var guid = Guid.NewGuid();

                    var guidStr = guid.ToString().Substring(0, 8);

                    guidStr = Utility.Encrypt(guidStr);

                    user.TempPassword = guidStr;
                    user.Password = string.Empty;
                    context.SaveChanges();

                    MailUtils.SendForgotPassword(user.Email, user.GetProfileName(), guid.ToString().Substring(0, 8));


                    return true;
                }
                return false;
            }
        }

        public bool UpdatePassword(UserQuery userQuery)
        {
            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.FirstOrDefault(rs => rs.Email == userQuery.EmailId);

                if (user != null)
                {

                    user.Password = Utility.Encrypt(userQuery.Password);
                    user.TempPassword = string.Empty;
                    context.SaveChanges();

                    MailUtils.SendPasswordChanged(user.Email, user.GetProfileName());


                    return true;
                }
                return false;
            }

        }

        public IList<ImageThumbnailEntity> GetUserPhotosByAlbum(AlbumPhotoQuery userQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.AlbumPhotos.AsQueryable();

                if (userQueryEntity.SessionUserId != 0)
                {
                    result = from u in context.Users
                             join a in context.AlbumPhotos on u.Id equals a.OwnerId
                             join b in context.Albums on a.AlbumId equals b.Id
                             where a.AlbumId == userQueryEntity.AlbumId
                             orderby a.PostDate descending
                             select a;
                }

                if (userQueryEntity.TeamId > 0)
                {
                    result = from u in context.Users
                             join a in context.AlbumPhotos on u.Id equals a.OwnerId
                             join b in context.Albums on a.AlbumId equals b.Id
                             where a.AlbumId == userQueryEntity.AlbumId && (a.TeamId == userQueryEntity.TeamId || a.TeamId == null)
                             orderby a.PostDate descending
                             select a;
                }

                //if (userQueryEntity.TeamId > 0)
                //{

                //    var activities = context
                //                           .ActivityTeams
                //                           .Where(rs => rs.TeamId == userQueryEntity.TeamId)
                //                           .Select(rs => rs.Activity);


                //    if (activities != null)
                //    {
                //        result = (from at in activities
                //                 join a in context.Albums on at.PhotoId equals a.Id
                //                 join ap in context.AlbumPhotos on a.Id equals ap.AlbumId
                //                 select ap).Distinct().OrderByDescending(i=>i.PostDate);

                //    }

                //}


                return EntityMapper.MapList<AlbumPhoto, ImageThumbnailEntity>(result.ToList());

            }
        }

        public List<PhotoEntity> GetPhotoDetail(PhotoQuery photoQuery)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                if (photoQuery.TeamId > 0)
                {
                    var result = (from p in context.AlbumPhotos
                                  join a in context.Albums on p.AlbumId equals a.Id
                                  where p.Id == photoQuery.PhotoId
                                  select p).AsEnumerable().Select(i => new PhotoEntity
                                  {
                                      Id = i.Id,
                                      ImagePath = string.Format("{0}", Utility.GetUploadBigThumbnailImagePath(Convert.ToDecimal(i.OwnerId), false, i.UrlPath)),
                                      IsOwner = i.OwnerId == photoQuery.SessionUserId ? true : false
                                  }).ToList();

                    return result;

                }
                else if (photoQuery.AlbumId > 0)
                {
                    var user = from p in context.Albums
                               join a in context.Users on p.OwnerId equals a.Id
                               where p.Id == photoQuery.AlbumId
                               select a;

                    var userid = 0.0M;
                    if (user != null)
                    {
                        userid = user.FirstOrDefault().Id;
                    }

                    var result = (from p in context.AlbumPhotos
                                  join a in context.Albums on p.AlbumId equals a.Id
                                  where p.Id == photoQuery.PhotoId
                                  select p).AsEnumerable().Select(i => new PhotoEntity
                                  {
                                      Id = i.Id,
                                      ImagePath = string.Format("{0}", Utility.GetUploadBigThumbnailImagePath(userid, false, i.UrlPath)),
                                      IsOwner = i.OwnerId == photoQuery.SessionUserId ? true : false
                                  }).ToList();

                    return result;

                }
                else
                {
                    var result = (from p in context.AlbumPhotos
                                  join a in context.Albums on p.AlbumId equals a.Id
                                  where p.Id == photoQuery.PhotoId
                                  select p).AsEnumerable().Select(i => new PhotoEntity
                                  {
                                      Id = i.Id,
                                      ImagePath = string.Format("{0}", Utility.GetUploadBigThumbnailImagePath(Convert.ToDecimal(photoQuery.SessionUserId), false, i.UrlPath)),
                                      IsOwner = i.OwnerId == photoQuery.SessionUserId ? true : false
                                  }).ToList();

                    return result;
                }

            }
        }

        public List<AlbumListEntity> GetAlbums(UserQuery userQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var user = context.Users.Where(u => u.Email == userQueryEntity.EmailId).FirstOrDefault();
                var userid = 0.0M;
                if (user != null)
                {
                    userid = user.Id;
                }


                var result = (from u in context.Users
                              join b in context.Albums on u.Id equals b.OwnerId
                              join c in context.AlbumPhotos on b.Id equals c.AlbumId
                              where u.Email == userQueryEntity.EmailId
                              orderby b.CreateDate descending
                              select b).Distinct().AsEnumerable().Select(i => new AlbumListEntity
                              {
                                  Id = i.Id,
                                  Name = i.AlbumName,
                                  TotalPhotosCount = context.AlbumPhotos.Where(j => j.OwnerId == userid).Count(),
                                  PhotosCount = context.AlbumPhotos.Where(j => j.AlbumId == i.Id).Count(),
                                  CoverPath = context.AlbumPhotos.Where(j => j.AlbumId == i.Id && j.IsCoverPage == true).Count() == 0 ? (context.AlbumPhotos.Where(j => j.AlbumId == i.Id).Count() > 0 ? string.Format("{0}", Utility.GetUploadThumbnailImagePath(userid, false, context.AlbumPhotos.Where(j => j.AlbumId == i.Id).Take(1).FirstOrDefault().UrlPath)) : Utility.GetNoImagePath()) : (context.AlbumPhotos.Where(j => j.AlbumId == i.Id && j.IsCoverPage == true).Count() > 0 ? string.Format("{0}", Utility.GetUploadThumbnailImagePath(userid, false, context.AlbumPhotos.Where(j => j.AlbumId == i.Id && j.IsCoverPage == true).Take(1).FirstOrDefault().UrlPath)) : Utility.GetNoImagePath())
                              });

                if (userQueryEntity.TeamId > 0)
                {

                    var activities = context
                                           .ActivityTeams
                                           .Where(rs => rs.TeamId == userQueryEntity.TeamId)
                                           .Select(rs => rs.Activity);


                    if (activities != null)
                    {
                        var photocount = from at in activities
                                         join a in context.Albums on at.PhotoId equals a.Id
                                         join ap in context.AlbumPhotos on a.Id equals ap.AlbumId
                                         where ap.TeamId == userQueryEntity.TeamId || ap.TeamId == null
                                         orderby ap.PostDate descending
                                         select ap;

                        result = (from at in activities
                                  join a in context.Albums on at.PhotoId equals a.Id
                                  select a).AsEnumerable().Distinct().Select(i => new AlbumListEntity
                                 {
                                     Id = i.Id,
                                     Name = i.AlbumName,
                                     TotalPhotosCount = photocount.Distinct().Count(),
                                     PhotosCount = context.AlbumPhotos.Where(j => j.AlbumId == i.Id && (j.TeamId == userQueryEntity.TeamId || j.TeamId == null)).Count(),
                                     CoverPath = context.AlbumPhotos.Where(j => j.AlbumId == i.Id && j.IsCoverPage == true).Count() == 0 ? (context.AlbumPhotos.Where(j => j.AlbumId == i.Id).Count() > 0 ? string.Format("{0}", Utility.GetUploadThumbnailImagePath(Convert.ToDecimal(i.OwnerId), false, context.AlbumPhotos.Where(j => j.AlbumId == i.Id && (j.TeamId == userQueryEntity.TeamId || j.TeamId == null)).Take(1).FirstOrDefault().UrlPath)) : Utility.GetNoImagePath()) : (context.AlbumPhotos.Where(j => j.AlbumId == i.Id && j.IsCoverPage == true).Count() > 0 ? string.Format("{0}", Utility.GetUploadThumbnailImagePath(Convert.ToDecimal(i.OwnerId), false, context.AlbumPhotos.Where(j => j.AlbumId == i.Id && j.IsCoverPage == true).Take(1).FirstOrDefault().UrlPath)) : Utility.GetNoImagePath())
                                 });
                    }

                }

                return result.ToList();
            }

        }

        public List<ImageEntity> GetAlbumCount(UserQuery userQueryEntity)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {

                var result = context.AlbumPhotos.AsQueryable();

                if (!string.IsNullOrEmpty(userQueryEntity.EmailId))
                {
                    result = from u in context.Users
                             join a in context.AlbumPhotos on u.Id equals a.OwnerId
                             join b in context.Albums on a.AlbumId equals b.Id
                             where u.Email == userQueryEntity.EmailId
                             orderby a.PostDate descending
                             select a;
                }

                else if (userQueryEntity.SessionUserId > 0)
                {
                    result = from u in context.Users
                             join a in context.AlbumPhotos on u.Id equals a.OwnerId
                             join b in context.Albums on a.AlbumId equals b.Id
                             where u.Id == userQueryEntity.SessionUserId
                             orderby a.PostDate descending
                             select a;
                }

                if (userQueryEntity.TeamId > 0)
                {

                    var activities = context
                                           .ActivityTeams
                                           .Where(rs => rs.TeamId == userQueryEntity.TeamId)
                                           .Select(rs => rs.Activity);


                    if (activities != null)
                    {
                        result = from at in activities
                                 join a in context.Albums on at.PhotoId equals a.Id
                                 join ap in context.AlbumPhotos on a.Id equals ap.AlbumId
                                 orderby ap.PostDate descending
                                 select ap;
                    }

                }


                var albumCount = 0;
                var lst = new List<ImageEntity>();
                if (result != null)
                {
                    albumCount = result.Select(i => i.AlbumId).Distinct().Count();

                    lst = result.Select(i => new ImageEntity
                    {
                        AlbumCount = albumCount
                    }).ToList();
                }

                return lst;

            }
        }

        public List<AlbumEntity> GetAlbumsByUser(UserQuery userQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var albums = context.Albums.Where(i => i.OwnerId == userQueryEntity.SessionUserId).OrderBy(i => i.AlbumName).Select(i => new AlbumEntity
                {
                    Id = i.Id,
                    Name = i.AlbumName
                }).ToList();
                albums.Insert(0, new AlbumEntity { Id = -1, Name = "Please Select the Existing Album" });
                return albums;
            }
        }

        public List<UserEmailEntity> GetEmail(UserEmailQuery userQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var users = context.Users.Where(i => i.Id == userQueryEntity.OwnerId).Select(i => new UserEmailEntity
                {
                    EmailId = i.Email
                }).ToList();

                return users;
            }
        }

        internal User GetUserByEmail(string emailId)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Users.FirstOrDefault(rs => rs.Email == emailId);

                if (result != null)
                {

                    return result;
                }

            }
            return new User() { Email = emailId };
        }

        internal string GetProfilePhoto(string emailId)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Users.FirstOrDefault(rs => rs.Email == emailId);

                if (result != null)
                {

                    return result.GetProfilePhoto(); ;
                }

            }
            return string.Empty;

        }
    }
}
