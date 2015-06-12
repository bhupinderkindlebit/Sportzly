using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Web.UI;
using Sportzly.Framework.Exceptions;
using Sportzly.BusinessEntities;
using System.Reflection;
using System.IO;
using Sportzly.Framework;
using Sportzly.ServiceClient.Controllers;
using System.Web.Security;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;

namespace Sportzly.Web.Common
{
    public abstract class BasePage : System.Web.UI.Page
    {
        internal UserDetailEntity CurrentUser = null;
        public const string LOGIN_COOKIE_NAME = "__sportzly";
        public const string REGISTER_COOKIE_NAME = "__register";
        public const string LOGOUT_QUERY_VALUE = "logout";
        public bool AuthenticateRequired = true;

        protected void Logout(UserDetailEntity currentUser)
        {
            if (ApiMethods.Logout(currentUser))
            {
                HttpCookie sportzlyCookie = new HttpCookie(LOGIN_COOKIE_NAME, "");
                sportzlyCookie.Expires = DateTime.Now.AddYears(-30);
                HttpContext.Current.Response.Cookies.Add(sportzlyCookie);

                if (this.AuthenticateRequired)
                {
                    FormsAuthentication.RedirectToLoginPage();
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.End();
                }
            }
        }

        protected void RedirectToUserPage()
        {
            HttpCookie sportzlyCookie = Request.Cookies[LOGIN_COOKIE_NAME];
            HttpCookie registerCookie = Request.Cookies[REGISTER_COOKIE_NAME];
            if (registerCookie == null)
            {
                if (sportzlyCookie != null && sportzlyCookie.Value != string.Empty)
                {
                    Response.Redirect("myupdates.aspx");
                }
            }
        }

    }
    public abstract class BasePage<T> : BasePage
    {

        protected virtual void SetAuthentication() { }


        public const string UnhandledErrorString = "{{'ResultError':{{'Message':'{0}','Code':'{1}','ErrorType':'{2}'}}}}";

        protected override void OnInit(EventArgs e)
        {

            CheckAuthentication();
            base.OnInit(e);
            RegisterPageServiceRequestProxy();
        }

        protected void GetCurrentUser()
        {
            var userCookie = Request.Cookies[LOGIN_COOKIE_NAME];
            HttpCookie registerCookie = Request.Cookies[REGISTER_COOKIE_NAME];
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (url.ToLower().IndexOf("profilesave") != -1)
            {
                if (userCookie != null && userCookie.Value != null)
                {
                    //MailUtils.ErrorLog(HttpContext.Current.Server.MapPath("upload/text.txt"), userCookie.Value);
                    var result = Serializer.ToActionResult<UserDetailEntity>(userCookie.Value);
                    if (result != null && result.Results.Count() == 1)
                    {
                        CurrentUser = result.Results[0];
                    }
                }
            }
            else
            {
                if (registerCookie == null)
                {
                    if (userCookie != null && userCookie.Value != null)
                    {
                        // MailUtils.ErrorLog(HttpContext.Current.Server.MapPath("upload/text.txt"), userCookie.Value);
                        var result = Serializer.ToActionResult<UserDetailEntity>(userCookie.Value);
                        if (result != null && result.Results.Count() == 1)
                        {
                            CurrentUser = result.Results[0];
                        }
                    }
                }
            }

        }

        private void CheckAuthentication()
        {
            if (!AuthenticateRequired) return;

            GetCurrentUser();

            if (CurrentUser == null || !UserController.IsAuthenticated(CurrentUser.UserKey, CurrentUser))
            {
                Logout(CurrentUser);
            }


        }


        protected override void OnPreInit(EventArgs e)
        {
            SetAuthentication();
            base.OnPreInit(e);
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            RegisterThemes();
        }

        private void RegisterThemes()
        {
            var requestUrl = HttpContext.Current.Request.Url.ToString().ToLower();
            LiteralControl js = new LiteralControl(@"
                   <script type='text/javascript' src='Scripts/jquery-1.9.1.min.js'></script>
                   <script type='text/javascript' src='caroufredsel/jquery.carouFredSel-6.2.1.js'></script>");

            LiteralControl allJS = new LiteralControl(@"  
                                            <link rel='Stylesheet' href='../Scripts/chosen/chosen.css' />
                                            <link rel='Stylesheet' href='../Scripts/ie.css' />                                         
                                            <script type='text/javascript' src='Scripts/jquery-ui.min.js'></script>
                                            <script type='text/javascript' src='Scripts/knockout-2.2.1.js'></script>
                                            <script type='text/javascript' src='Scripts/knockout.mapping.2.4.1.js'></script>
                                            <script type='text/javascript' src='Scripts/html5shiv.js'></script>
                                            <script type='text/javascript' src='Scripts/jquery.validate.min.js'></script>
                                            <script type='text/javascript' src='uploadify/jquery.uploadify-3.1.min.js'></script>
                                            <script type='text/javascript' src='Scripts/chosen/chosen.jquery.js'></script>
                                            
                                            
                                            <link rel='stylesheet' href='Common/Styles/css/bootstrap.min.css' />
                                            <link href='Common/Styles/css/font-awesome.min.css' rel='stylesheet' />
                                            <link type='text/css' href='Common/Styles/css/styles.css' rel='stylesheet' />   
                                            <link rel='stylesheet' href='Version1/Script/eventcalendar/dropkick.css' />
                                            <link rel='stylesheet' type='text/css' href='Version1/Script/fancybox/jquery.fancybox.css?v=2.1.5' media='screen' />
                                            <link rel='stylesheet' href='Version1/Script/eventcalendar/jquery-ui.css'>
                                            <link rel='stylesheet' href='Version1/Script/eventcalendar/jquery.ui.timepicker.css'>
                                            <link type='text/css' rel='stylesheet' href='Version1/css/easy-responsive-tabs.css' />
                                            <link rel='stylesheet' href='Version1/CSS/jquery.bxslider.css' type='text/css' />
                                            <script type='text/javascript' src='Scripts/jquery.js'></script>
                                            <script type='text/javascript' src='Scripts/modernizr.custom.82896.js'></script>
                                            <script type='text/javascript' src='Version1/Script/js/jquery.sticky-kit.js'></script>
                                            <script type='text/javascript' src='Version1/Script/js/example.js'></script>
                                            <script src='Scripts/bootstrap.min.js'></script>
                                            <link rel='stylesheet' href='Version1/css/example.css' />
                                            <script type='text/javascript' src='Version1/Script/js/jquery-ui.min.js'></script>
                                            <script type='text/javascript' src='Version1/Script/fancybox/jquery.fancybox.js?v=2.1.5'></script>
                                            <script type='text/javascript' src='Version1/Script/eventcalendar/jquery.ui.timepicker.js'></script>
                                            <script type='text/javascript' src='Version1/Script/js/jquery.bxslider.js'></script>
                                            <script src='Version1/Script/js/easyResponsiveTabs.js' type='text/javascript'></script>    
                                            <script type='text/javascript' src='Version1/Script/js/general.js'></script>                                      
                                            <script src='Version1/Script/eventcalendar/dropkick.min.js'></script>
                                            <script src='Version1/Script/eventcalendar/dropkick.jquery.js'></script>
                                            <script type='text/javascript' src='lightbox/jquery.colorbox-min.js'></script>   
                                            ");

            LiteralControl allCss = new LiteralControl("<link rel=Stylesheet href='Common/Styles/css/all.css' />");
            LiteralControl jqueryUI = new LiteralControl("<link rel=Stylesheet href='Common/Styles/css/jquery-ui.css' />");
            LiteralControl caroufredselCss = new LiteralControl("<link rel=Stylesheet href='caroufredsel/caroufredselstyle.css' />");
            LiteralControl colorboxcss = new LiteralControl("<link rel=Stylesheet href='lightbox/colorbox.css' />");
            LiteralControl mainJS = new LiteralControl("<script language=javascript  src='Common/Styles/main.js'></script>");
            LiteralControl frameworkJS = new LiteralControl("<script language=javascript  src='Common/Styles/framework.js'></script>");
            if (!requestUrl.Contains("default.aspx") && !requestUrl.Contains("welcome-sportzly.aspx") && !requestUrl.Contains("t.aspx"))
            {
                Page.Header.Controls.Add(js);
                Page.Header.Controls.Add(allCss);
            }
            Page.Header.Controls.Add(allJS);
            Page.Header.Controls.Add(caroufredselCss);
            Page.Header.Controls.Add(colorboxcss);
            Page.Header.Controls.Add(jqueryUI);
            Page.Header.Controls.Add(mainJS);
            Page.Header.Controls.Add(frameworkJS);
            RegisterPageStyle();
        }

        private void RegisterPageStyle()
        {
            LiteralControl control = null;
            string scriptPath = string.Format("Common/Styles/css/style.{0}.css", typeof(T).Name);
            if (File.Exists(Server.MapPath(scriptPath)))
            {
                control = new LiteralControl(string.Format("<link rel=Stylesheet href='{0}'/>", scriptPath));
            }
            else
            {
                var requestUrl = HttpContext.Current.Request.Url.ToString().ToLower();
                if (!requestUrl.Contains("default.aspx") && !requestUrl.Contains("welcome-sportzly.aspx") && !requestUrl.Contains("t.aspx"))
                {
                    control = new LiteralControl(string.Format("<link rel=Stylesheet href='{0}'/>", "Common/Styles/css/style.css"));
                }

            }
            if (control != null)
            {
                Page.Header.Controls.Add(control);
            }
        }

        private void RegisterPageServiceRequestProxy()
        {
            Page.ClientScript.RegisterClientScriptBlock(
                GetType(),
                "PageServiceRequestProxy",
                "function InvokeServiceRequest(typeName,methodName,successCallback,failureCallback){if(PageMethods.PageServiceRequest){try{var parms=[];for(var i=4;i<arguments.length;i++){parms.push(arguments[i]);}PageMethods.PageServiceRequest(typeName,methodName,parms,successCallback,failureCallback);}catch(e){}}}",
                true);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
        public static string PageServiceRequest(string typeName, string methodName, object[] args)
        {
            Type ctl = Type.GetType(typeName);
            if (ctl != null)
            {
                try
                {
                    var method = ctl.GetMethod(methodName, BindingFlags.IgnoreCase | BindingFlags.Static | BindingFlags.InvokeMethod | BindingFlags.Public);
                    var paramInfos = method.GetParameters();
                    object o = method.Invoke(null, args);
                    //object o = ctl.InvokeMember(
                    //    methodName,
                    //      System.Reflection.BindingFlags.Static
                    //    | System.Reflection.BindingFlags.InvokeMethod
                    //    | System.Reflection.BindingFlags.Public
                    //    | System.Reflection.BindingFlags.IgnoreCase,
                    //    null, null, args ?? new object[] { });
                    if (o != null)
                    {
                        if (o is string || o.GetType().IsValueType)
                            return o.ToString(); // If it is a string or value type, return a string

                        // If it is a complex object, return a serialized version of it.
                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        return serializer.Serialize(o); // allow anonymous types, etc
                    }
                }
                catch (Exception ex)
                {
                    string errorJson = string.Empty;
                    if (ex.InnerException != null && ex.InnerException is UserException)
                    {
                        var userEx = ex.InnerException as UserException;
                        errorJson = string.Format(UnhandledErrorString, userEx.Message, userEx.MessageIdentity.Key, userEx.ErrorType);
                        return errorJson.Replace("'", "\"");
                    }

                    errorJson = string.Format(UnhandledErrorString, ex.Message, UserMessages.ServerError.Key, UserExceptionType.Error);
                    return errorJson.Replace("'", "\"");
                }

            }

            return "{}"; // return an empty JSON object
        }



    }
}