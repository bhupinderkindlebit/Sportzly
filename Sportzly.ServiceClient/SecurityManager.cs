using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.BusinessEntities;
using Sportzly.ServiceClient.Controllers;
using Sportzly.Framework.Exceptions;
using System.Web.UI;
using System.Web;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Sportzly.ServiceClient
{
    public class SecurityManager
    {
        static Dictionary<Guid, UserEntity> LoggedInUsers = new Dictionary<Guid, UserEntity>();
        public void SetConnectionSettings()
        {

        }

        internal static bool Logout(UserDetailEntity user)
        {
            if (user != null)
                if (LoggedInUsers != null && LoggedInUsers.ContainsKey(user.UserKey))
                    return LoggedInUsers.Remove(user.UserKey);
            return true;
        }

        internal void Authenticate(BaseQuery queryEntity, Guid userKey)
        {
            if (queryEntity.AuthenticationRequired)
            {
                UserException.ThrowIf(userKey == Guid.Empty, UserMessages.UserLoggedOut);

                var user = Authenticate(userKey);

                UserException.ThrowIf(user == null, UserMessages.NotLoggedIn);

                //  UserException.ThrowIf(DateTime.Now - user.LastActivity > new TimeSpan(0, 10, 0), UserMessages.UserLoggedOut);

                //user.LastActivity = DateTime.Now;
                queryEntity.SessionUserId = user.Id;
            }
        }

        public static UserEntity Authenticate(Guid userKey, UserDetailEntity CurrentUser = null)
        {
            if (!LoggedInUsers.ContainsKey(userKey))
            {
                var userCookie = HttpContext.Current.Request.Cookies["__sportzly"];
                if (userCookie != null)
                {
                    if (HttpContext.Current.Request.Cookies["__key"] != null)
                    {
                        var userPassword = HttpContext.Current.Request.Cookies["__key"];
                        if (userPassword != null)
                        {
                           
                            if (CurrentUser != null)
                            {
                                var userentity = UserController.GetUsers(null, userPassword.Value, CurrentUser.EmailId, Guid.Empty, "");
                                var jsonstring = JsonConvert.SerializeObject(userentity);
                                CurrentUser.UserKey = userentity.Results[0].UserKey;
                                userKey = userentity.Results[0].UserKey;
                                HttpCookie cookieCode = new HttpCookie("__sportzly", jsonstring);
                                HttpContext.Current.Response.SetCookie(cookieCode);
                            }
                            else
                                return null;
                        }
                        else
                            return null;
                    }
                    else if (HttpContext.Current.Request.Cookies["__keyS"] != null)
                    {
                        var userPassword = HttpContext.Current.Request.Cookies["__keyS"];
                        if (userPassword != null)
                        {
                          
                            if (CurrentUser != null)
                            {
                                var userentity = UserController.GetUsersViral(userPassword.Value, CurrentUser.EmailId, Guid.Empty);
                                var jsonstring = JsonConvert.SerializeObject(userentity);
                                CurrentUser.UserKey = userentity.Results[0].UserKey;
                                userKey = userentity.Results[0].UserKey;
                                HttpCookie cookieCode = new HttpCookie("__sportzly", jsonstring);
                                HttpContext.Current.Response.SetCookie(cookieCode);
                            }
                            else
                                return null;
                        }
                        else
                            return null;
                    }
                   
                }
                else
                    return null;
            }

            if(!LoggedInUsers.ContainsKey(userKey)) return null;

            var user = LoggedInUsers[userKey];

            //if (user != null && DateTime.Now - user.LastActivity > new TimeSpan(0, 10, 0))
            //{
            //    LoggedInUsers.Remove(userKey);
            //}
            return user;
        }

        internal void AddLoggedInUser(UserEntity currentuser)
        {
            var user = SecurityManager.LoggedInUsers.Values.FirstOrDefault(rs => rs.Id == currentuser.Id);

            if (user != null)
            {
                //user.LastActivity = DateTime.Now;

                if (user.UserKey == Guid.Empty)
                {
                    currentuser.UserKey = Guid.NewGuid();
                    //currentuser.LastActivity = DateTime.Now;

                }
                else
                {
                    currentuser.UserKey = user.UserKey;
                    //currentuser.LastActivity = DateTime.Now;
                }

                //SecurityManager.LoggedInUsers.Remove(user.UserKey);
            }
            else
            {
                currentuser.UserKey = Guid.NewGuid();
                //currentuser.LastActivity = DateTime.Now;
                SecurityManager.LoggedInUsers.Add(currentuser.UserKey, currentuser);
            }


        }
    }
}
