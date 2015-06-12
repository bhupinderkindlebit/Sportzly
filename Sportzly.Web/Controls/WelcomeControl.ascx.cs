﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.BusinessEntities.QueryEntity;
using System.Configuration;

namespace Sportzly.Web.Controls
{
    public partial class WelcomeControl : BaseUserControl<WelcomeControl>
    {
        protected string licenseKey = ConfigurationSettings.AppSettings["LicenseKey"].ToString();
        protected string licenseKeyAll = ConfigurationSettings.AppSettings["LicenseKeyAll"].ToString();
        string FBAppId = ConfigurationSettings.AppSettings["FbAppId"].ToString();
        string FBLink = ConfigurationSettings.AppSettings["FBLink"].ToString();
        string FBPicLink = ConfigurationSettings.AppSettings["FBPicture"].ToString();
        string preSelect = ConfigurationSettings.AppSettings["DefaultSelection"].ToString();
        processor prHelper = new processor();
        protected static string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            licKey.Value = licenseKey;
            licKeyAll.Value = licenseKeyAll;
            if (!IsPostBack)
            {
                Page.RegisterStartupScript("load", "<script>formatSignature(['" + licenseKey + "']);</script>");//initialize to format license key
                Page.RegisterStartupScript("load1", "<script>formatSignatureAll(['" + licenseKeyAll + "']);</script>");//initialize to format license key
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "<script>friendsInviter.fbinitilize('" + FBAppId + "','test','" + FBLink + "','" + FBPicLink + "');</script>", false);
            }
            if (Page.IsPostBack == false)
            {
                if (Session["facebook"] != null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "fb", "FBLoad();", true);
                }
                if (Session["twitter"] != null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tw1", "LoadTw();", true);
                }
            }
            var currentUser = (this.Page as BasePage).CurrentUser;
            UserDetailEntity detailEntity = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];
            userName = detailEntity.FirstName + " " + detailEntity.LastName;
        }
        

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> InviteFriends(string userKey, string friends,string servicename)
        {
            return ApiMethods.InviteFriends(userKey, friends.Trim(';'), servicename);
        }

        [UserControlScriptMethod]
        public static string FetchContacts(string signatureKey, string serviceName, string userName, string password)
        {
            List<ContactDetails> listCD = new List<ContactDetails>();
            int flag = 0;
            string jsflag = "";
            string format = "json";
            string response = "";


            if ((serviceName == "gmail") || (serviceName == "facebook") || (serviceName == "yahoo") || (serviceName == "hotmail") || (serviceName == "msn") || (serviceName == "msnmessenger"))
            {
                if ((HttpContext.Current.Session["token"] != null) && (HttpContext.Current.Session["consumerkey"] != null) && (HttpContext.Current.Session["consumersecret"] != null))
                {
                    string token = HttpContext.Current.Session["token"].ToString();
                    string tokenSecret = HttpContext.Current.Session["tokensecret"].ToString();
                    string UID = HttpContext.Current.Session["uid"].ToString();
                    string tokenVerifier = HttpContext.Current.Session["tokenverifier"].ToString();
                    string consumerKey = HttpContext.Current.Session["consumerkey"].ToString();
                    string consumerSecret = HttpContext.Current.Session["consumersecret"].ToString();
                    var prHelper = new processor();
                    response = prHelper.doProcessing(serviceName, token, tokenSecret, tokenVerifier, UID, consumerKey, consumerSecret, signatureKey, format);
                }
                else
                    flag = 1;
            }
            else
            {
                var prHelper = new processor();
                response = prHelper.doProcessing(serviceName, userName, password, signatureKey, format);
            }

            if (flag == 0)
            {
                return response;
            }
            else
            {
                return "";
            }
        }

        [UserControlScriptMethod]
        public static string FetchTwitterContacts(string signatureKey, string serviceName)
        {
            string consumerKey = "", consumerSecret = "";
            if ((HttpContext.Current.Session["Token"] != null) || (HttpContext.Current.Session["TokenVerifier"] != null))
            {
                string oauthToken = HttpContext.Current.Session["Token"].ToString();
                string oauthTokenVerifier = HttpContext.Current.Session["TokenVerifier"].ToString();
                string oauthTokenSecret = HttpContext.Current.Session["TokenSecret"].ToString();

                if (serviceName == "twitter")
                {
                    consumerKey = ConfigurationSettings.AppSettings["TwApiKey"].ToString();
                    consumerSecret = ConfigurationSettings.AppSettings["TwSecretKey"].ToString();
                }
                else if (serviceName == "linkedin")
                {
                    consumerKey = ConfigurationSettings.AppSettings["LnApiKey"].ToString();
                    consumerSecret = ConfigurationSettings.AppSettings["LnSecretKey"].ToString();
                }
                FI_Processor prHelper = new FI_Processor();
                string response = prHelper.doProcessing(serviceName, oauthToken, oauthTokenSecret, oauthTokenVerifier, consumerKey, consumerSecret, signatureKey);
                return response;
            }
            else
            {
                return "";
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<TokenEntity> GetInviteToken(string userKey)
        {
            return ApiMethods.GetInviteTokenUser(userKey);
        }
        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }
        [UserControlScriptMethod]
        public static ActionResult<TokenEntity> GetInviteTokenTwitter(string userKey)
        {
            return ApiMethods.GetInviteTokenTwitterUser(userKey);
        }

       
        [UserControlScriptMethod]
        public static string SendTwitterContacts(string signatureKey, string serviceName, string friendsIDs)
        {
            string consumerKey = "", consumerSecret = "";
            if ((HttpContext.Current.Session["Token"] != null) || (HttpContext.Current.Session["TokenVerifier"] != null))
            {
                string oauthToken = HttpContext.Current.Session["Token"].ToString();
                string oauthTokenVerifier = HttpContext.Current.Session["TokenVerifier"].ToString();
                string oauthTokenSecret = HttpContext.Current.Session["TokenSecret"].ToString();
                string message = "Sportzly is a ecosystem created just for Sports and Fitness. Please register in sportzly and create your Personalized World of Sports.";
                if (serviceName == "twitter")
                {
                    consumerKey = ConfigurationSettings.AppSettings["TwApiKey"].ToString();
                    consumerSecret = ConfigurationSettings.AppSettings["TwSecretKey"].ToString();
                }
                else if (serviceName == "linkedin")
                {
                    consumerKey = ConfigurationSettings.AppSettings["LnApiKey"].ToString();
                    consumerSecret = ConfigurationSettings.AppSettings["LnSecretKey"].ToString();
                }
                FI_Processor prHelper = new FI_Processor();
                string status_send = prHelper.doProcessing(serviceName, oauthToken, oauthTokenSecret, oauthTokenVerifier, friendsIDs, "Sportzly Invitation", message, consumerKey, consumerSecret, signatureKey);
                ApiMethods.MailInvite(userName, friendsIDs.Split(',').Count().ToString(), "None", serviceName, "Friend Invite",0);
                return status_send;
            }
            else
            {
                return "";
            }
        }
    }
}