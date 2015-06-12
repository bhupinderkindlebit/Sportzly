using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using AutoMapper;
using Sportzly.DataAccess;
using Sportzly.Repository;
using Sportzly.Framework.Exceptions;
using Sportzly.Framework.ExceptionHandler;
using Sportzly.BusinessEntities;
using Sportzly.Framework;

namespace Sportzly.Business
{
    public class UserBusiness
    {
        public ActionResult<UserEntity> GetUsers(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();

            result.Results = new UserRepository().GetUsers(userQueryEntity.UserName, userQueryEntity.PasswordEnc, userQueryEntity.EmailId, userQueryEntity.Token);

            if (result.Results.Count > 0 && result.Results[0].Verified == false)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.Activate);
            }
            else if (userQueryEntity.Password != null && !result.Results.Any())
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.LoginFailed);
            }


            return result;
        }

        public ActionResult<UserEntity> GetUsersLogin(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();

            result.Results = new UserRepository().GetUsers(userQueryEntity.UserName, userQueryEntity.Password, userQueryEntity.EmailId, userQueryEntity.Token);

            if (result.Results.Count > 0 && result.Results[0].Verified == false)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.Activate);
            }
            else if (userQueryEntity.Password != null && !result.Results.Any())
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.LoginFailed);
            }


            return result;
        }
        public ActionResult<UserNewEntity> GetNewUsersDetails(UserQuery userQueryEntity)
        {
            ActionResult<UserNewEntity> result = new ActionResult<UserNewEntity>();

            result.Results = new UserRepository().GetNewUsersDetails(userQueryEntity.FacebookId, userQueryEntity.TwitterId);

            return result;
        }

        public ActionResult<UserDetailEntity> GetUserDetail(UserQuery userQueryEntity)
        {
            ActionResult<UserDetailEntity> result = new ActionResult<UserDetailEntity>();

            result.Results = new UserRepository().GetUserDetail(userQueryEntity.UserName, userQueryEntity.PasswordEnc, userQueryEntity.EmailId, userQueryEntity.SessionUserId);

            if (userQueryEntity.Password != null && !result.Results.Any())
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.LoginFailed);
            }

            result.Results.ToList().ForEach(rs =>
            {
                rs.FriendshipStatus = new UserRepository().GetFriendshipStatus(rs.Id, userQueryEntity.SessionUserId);
                rs.TeamCount = new UserRepository().GetTeamCount(Convert.ToInt64(userQueryEntity.SessionUserId));
            });

            return result;
        }

        public ActionResult<UserEntity> CheckViralSignup(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();
            var resultData = new UserRepository().CheckUserFBTW(userQueryEntity.EmailId, userQueryEntity.FacebookId == "" ? false : true, userQueryEntity.TwitterId == "" ? false : true);
            result.Results = resultData;
            return result;
        }

        public ActionResult<UserEntity> SignupFacebook(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();
            var resultData = new UserRepository().CheckUserFB(userQueryEntity.EmailId, userQueryEntity.FacebookId);
            if (resultData.Any())
            {
                result.Results = resultData;
                return result;
            }

            string[] nameParts = userQueryEntity.UserName.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
            string firstName = nameParts[0] ?? string.Empty;
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;
            var isEmailExist = new UserRepository().CheckUserEmailFB(userQueryEntity.EmailId);
            new UserRepository().CreateUserFB(userQueryEntity.EmailId, userQueryEntity.PasswordEnc, firstName, lastName, userQueryEntity.FacebookId, userQueryEntity.ProfilePic,userQueryEntity.Token);

            resultData = new UserRepository().CheckUserFB(userQueryEntity.EmailId, userQueryEntity.FacebookId);

            if (resultData.FirstOrDefault() != null)
            {
                if (!isEmailExist)
                {
                    var user = resultData.First();
                    MailUtils.SendSignUpMailViral(user.DisplayName, user.EmailId, "Facebook", userQueryEntity.Password);
                }
            }

            result.Results = resultData;

            return result;

        }
        public ActionResult<UserEntity> CheckUserTwitter(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();
            var resultData = new UserRepository().CheckUserTwitterID(userQueryEntity.TwitterId);

            result.Results = resultData;
            return result;

        }

        public ActionResult<UserEntity> SignupTwitter(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();
            var resultData = new UserRepository().CheckUserTwitterID(userQueryEntity.TwitterId);
            if (resultData.Any())
            {
                result.Results = resultData;
                return result;
            }

            string[] nameParts = userQueryEntity.UserName.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
            string firstName = nameParts[0] ?? string.Empty;
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;
            var isEmailExist = new UserRepository().CheckUserEmailTw(userQueryEntity.EmailId);
            new UserRepository().CreateUserTW(userQueryEntity.EmailId, userQueryEntity.PasswordEnc, firstName, lastName, userQueryEntity.TwitterId,userQueryEntity.Token);

            resultData = new UserRepository().CheckUserTW(userQueryEntity.EmailId, userQueryEntity.TwitterId);

            if (resultData.FirstOrDefault() != null)
            {
                if (!isEmailExist)
                {
                    var user = resultData.First();
                     MailUtils.SendSignUpMailViral(user.DisplayName, user.EmailId, "Twitter", userQueryEntity.Password);
                }
            }

            result.Results = resultData;

            return result;

        }
        public ActionResult<UserEntity> Signup(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();

            var resultData = new UserRepository().GetUsers(null, null, userQueryEntity.EmailId, string.Empty);

            if (resultData.Any())
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.UserExist);
                return result;
            }

            string[] nameParts = userQueryEntity.UserName.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
            string firstName = nameParts[0] ?? string.Empty;
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;

            new UserRepository().CreateUser(userQueryEntity.EmailId, userQueryEntity.PasswordEnc, firstName, lastName, userQueryEntity.Token, userQueryEntity.DOB);

            resultData = new UserRepository().GetUsers(null, userQueryEntity.PasswordEnc, userQueryEntity.EmailId, string.Empty);

            if (resultData.FirstOrDefault() != null)
            {
                var user = resultData.First();
                MailUtils.SendSignUpMail(user.DisplayName, user.EmailId);

                //result.ResultError = ErrorEntity.Create(UserExceptionType.Message, UserMessages.SignupEmail);
            }

            result.Results = resultData;

            return result;

        }
        public ActionResult<TokenEntity> GetInviteTokenUser(FriendQuery friendQueryEntity)
        {
            ActionResult<TokenEntity> result = new ActionResult<TokenEntity>();

            result.Results = new UserRepository().GetInviteTokenUser(friendQueryEntity);

            return result;

        }
        public ActionResult<TokenEntity> GetInviteTokenTwitterUser(FriendQuery friendQueryEntity)
        {
            ActionResult<TokenEntity> result = new ActionResult<TokenEntity>();

            result.Results = new UserRepository().GetInviteTokenTwitterUser(friendQueryEntity);

            return result;

        }
        public ActionResult<UserDetailEntity> SaveProfile(UserQuery userQueryEntity)
        {
            ActionResult<UserDetailEntity> result = new ActionResult<UserDetailEntity>();

            var userEntity = Serializer.ToEntity<UserDetailEntity>(userQueryEntity.ProfileData);

            //userEntity.ProfileFoto = string.Format("{0}?token={1}", userEntity.ProfileFoto, Guid.NewGuid());

            result.Results = new UserRepository().SaveProfile(userEntity);

            return result;
        }
        public ActionResult<UserDetailEntity> SaveStreamProfile(UserQuery userQueryEntity)
        {
            ActionResult<UserDetailEntity> result = new ActionResult<UserDetailEntity>();

            var userEntity = Serializer.ToEntity<UserDetailEntity>(userQueryEntity.ProfileData);

            //userEntity.ProfileFoto = string.Format("{0}?token={1}", userEntity.ProfileFoto, Guid.NewGuid());

            result.Results = new UserRepository().SaveStreamProfile(userEntity);

            return result;
        }
        public ActionResult<UserEntity> ActivateUser(UserQuery userQueryEntity)
        {
            ActionResult<UserEntity> result = new ActionResult<UserEntity>();

            var resultData = new UserRepository().ActivateUser(userQueryEntity.EmailId);

            if (!resultData.Any())
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
                return result;
            }

            result.Results = resultData;
            return result;
        }

        public ActionResult<FriendEntity> SendFriendshipAction(FriendQuery friendQueryEntity)
        {
            ActionResult<FriendEntity> result = new ActionResult<FriendEntity>();

            var resultData = new UserRepository().SendFriendshipAction(friendQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<BaseEntity> SendFriendshipActionPlayer(FriendQuery friendQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            KeyValuePair<int, string> message = new KeyValuePair<int, string>();
            UserExceptionType messageType = UserExceptionType.Internal;

            new UserRepository().SendFriendshipActionPlayer(friendQueryEntity, out message, out messageType);

            if (messageType != UserExceptionType.Internal)
            {
                result.ResultError = ErrorEntity.Create(messageType, message);
            }

            return result;
        }

        public ActionResult<ImageEntity> GetUserPhotos(UserQuery userQueryEntity)
        {
            ActionResult<ImageEntity> result = new ActionResult<ImageEntity>();

            var resultData = new UserRepository().GetUserPhotos(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<ImageThumbnailEntity> GetUserPhotosNew(UserQuery userQueryEntity)
        {
            ActionResult<ImageThumbnailEntity> result = new ActionResult<ImageThumbnailEntity>();

            var resultData = new UserRepository().GetUserPhotosNew(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<FriendUserEntity> GetUserFriends(FriendQuery friendQueryEntity)
        {
            ActionResult<FriendUserEntity> result = new ActionResult<FriendUserEntity>();

            IList<FriendUserEntity> resultData = null;

            if (friendQueryEntity.Mutual)
                resultData = new UserRepository().GetMutualFriends(friendQueryEntity);
            else resultData = new UserRepository().GetUserFriends(friendQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<FriendUserEntity> GetPendingUserFriends(FriendQuery friendQueryEntity)
        {
            ActionResult<FriendUserEntity> result = new ActionResult<FriendUserEntity>();

            IList<FriendUserEntity> resultData = null;
            resultData = new UserRepository().GetPendingUserFriends(friendQueryEntity);
            result.Results = resultData;
            return result;
        }

        public ActionResult<BaseEntity> InviteFriends(FriendQuery friendQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            bool isSaved = new UserRepository().InviteFriends(friendQueryEntity);

            if (!isSaved)
            {
                //result.Results = 
            }



            return result;
        }

        public ActionResult<BaseEntity> MailInvite(MailQuery mailQuery)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            bool isSaved = new UserRepository().MailInvite(mailQuery);
            return result;
        }

        public ActionResult<BaseEntity> Unsubscribe(FriendQuery friendQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            bool isSaved = new UserRepository().Unsubscribe(friendQueryEntity);           

            return result;
        }

        public ActionResult<BaseEntity> ForgotPassword(UserQuery userQuery)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            bool isSaved = new UserRepository().ForgotPassword(userQuery);

            if (!isSaved)
            {
                result.ResultError = ErrorEntity.Create("EmailId does not exist in our dataabase");
            }

            return result;
        }
        public ActionResult<BaseEntity> CheckUser(CheckUserQuery userQuery)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            var resultData = new UserRepository().CheckUser(userQuery);
            if (resultData)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Message, UserMessages.Success);
            }
            else
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Message, UserMessages.Fail);
            }

            return result;
        }

        public ActionResult<BaseEntity> UpdatePassword(UserQuery userQuery)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            bool isSaved = new UserRepository().UpdatePassword(userQuery);

            if (!isSaved)
            {
                result.ResultError = ErrorEntity.Create("EmailId does not exist in our dataabase");
            }

            return result;
        }

        public ActionResult<PhotoEntity> GetPhotoDetail(PhotoQuery userQueryEntity)
        {
            ActionResult<PhotoEntity> result = new ActionResult<PhotoEntity>();

            var resultData = new UserRepository().GetPhotoDetail(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<ImageThumbnailEntity> GetUserPhotosByAlbum(AlbumPhotoQuery userQueryEntity)
        {
            ActionResult<ImageThumbnailEntity> result = new ActionResult<ImageThumbnailEntity>();

            var resultData = new UserRepository().GetUserPhotosByAlbum(userQueryEntity);

            result.Results = resultData;
            return result;
        }
        public ActionResult<InviteEntity> GetPendingInvitesUser(UserQuery userQueryEntity)
        {
            ActionResult<InviteEntity> result = new ActionResult<InviteEntity>();

            var resultData = new UserRepository().GetPendingInvitesUser(userQueryEntity);

            result.Results = resultData;
            return result;
        }
        public ActionResult<AlbumListEntity> GetAlbums(UserQuery userQueryEntity)
        {
            ActionResult<AlbumListEntity> result = new ActionResult<AlbumListEntity>();

            var resultData = new UserRepository().GetAlbums(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<ImageEntity> GetAlbumCount(UserQuery userQueryEntity)
        {
            ActionResult<ImageEntity> result = new ActionResult<ImageEntity>();

            var resultData = new UserRepository().GetAlbumCount(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<AlbumEntity> GetAlbumsByUser(UserQuery userQueryEntity)
        {
            ActionResult<AlbumEntity> result = new ActionResult<AlbumEntity>();

            var resultData = new UserRepository().GetAlbumsByUser(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<UserEmailEntity> GetEmail(UserEmailQuery userQueryEntity)
        {
            ActionResult<UserEmailEntity> result = new ActionResult<UserEmailEntity>();

            var resultData = new UserRepository().GetEmail(userQueryEntity);

            result.Results = resultData;
            return result;
        }

        public ActionResult<PlayerDetailEntity> SearchPlayers(PlayerSearchQuery playerQueryEntity)
        {
            ActionResult<PlayerDetailEntity> result = new ActionResult<PlayerDetailEntity>();

            result.Results = new UserRepository().SearchPlayers(playerQueryEntity);
            if (playerQueryEntity.SessionUserId.HasValue && result.Results != null)
            {
                result.Results.ToList().ForEach(rs =>
                {
                    var repository = new TeamRepository();
                    rs.Status = new UserRepository().GetFriendshipStatus((long)playerQueryEntity.SessionUserId, (long)rs.Id);
                });
            }



            return result;
        }

        public ActionResult<PlayerDetailEntity> GetPlayers(PlayerSearchQuery playerQueryEntity)
        {
            ActionResult<PlayerDetailEntity> result = new ActionResult<PlayerDetailEntity>();

            result.Results = new UserRepository().GetPlayers(playerQueryEntity);
            if (playerQueryEntity.SessionUserId.HasValue && result.Results != null)
            {
                result.Results.ToList().ForEach(rs =>
                {
                    var repository = new TeamRepository();
                    rs.Status = new UserRepository().GetFriendshipStatus((long)playerQueryEntity.SessionUserId, (long)rs.Id);
                });
            }
            return result;
        }

        public ActionResult<PlayerDetailEntity> GetPlayersHome(PlayerSearchQuery playerQueryEntity)
        {
            ActionResult<PlayerDetailEntity> result = new ActionResult<PlayerDetailEntity>();

            result.Results = new UserRepository().GetPlayersHome(playerQueryEntity);
           
            return result;
        }

    }
}
