using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class WelcomeSportzlyControl : BaseUserControl<WelcomeSportzlyControl>
    {
        protected string licenseKey = ConfigurationSettings.AppSettings["LicenseKey"].ToString();
        protected string licenseKeyAll = ConfigurationSettings.AppSettings["LicenseKeyAll"].ToString();
        string FBAppId = ConfigurationSettings.AppSettings["FbAppId"].ToString();
        string FBLink = ConfigurationSettings.AppSettings["FBLink"].ToString();
        string FBPicLink = ConfigurationSettings.AppSettings["FBPicture"].ToString();
        string preSelect = ConfigurationSettings.AppSettings["DefaultSelection"].ToString();
        processor prHelper = new processor();
        string userKey = string.Empty;
        protected static string userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            userKey = this.CurrentUser.UserKey.ToString();
            licKey.Value = licenseKey;
            licKeyAll.Value = licenseKeyAll;
            if (!IsPostBack)
            {
                var sports = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Sports, string.Empty);
                var countries = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Countries, string.Empty);
                var levels = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Levels, string.Empty);
                ltrSport.Controls.Add(new LiteralControl("<option disabled selected class='hidden-option'>Choose Sport</option>"));
                ltrCountry.Controls.Add(new LiteralControl("<option disabled selected class='hidden-option'>Choose Country</option>"));
                ltrLevel.Controls.Add(new LiteralControl("<option disabled selected class='hidden-option'>Choose Level</option>"));
                foreach (var item in sports.Results)
                {
                    ltrSport.Controls.Add(new LiteralControl("<option value='" + item.Key + "'>" + item.Value + "</option>"));
                }
                foreach (var item in countries.Results)
                {
                    ltrCountry.Controls.Add(new LiteralControl("<option value='" + item.Key + "'>" + item.Value + "</option>"));
                }
                foreach (var item in levels.Results)
                {
                    ltrLevel.Controls.Add(new LiteralControl("<option value='" + item.Key + "'>" + item.Value + "</option>"));
                }
                Page.RegisterStartupScript("load", "<script>formatSignature(['" + licenseKey + "']);</script>");//initialize to format license key
                Page.RegisterStartupScript("load1", "<script>formatSignatureAll(['" + licenseKeyAll + "']);</script>");//initialize to format license key
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "<script>friendsInviter.fbinitilize('" + FBAppId + "','test','" + FBLink + "','" + FBPicLink + "');</script>", false);
            }
        }
        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> InviteToTeam(string userKey, string emailIds, long teamId, string servicename)
        {
            return ApiMethods.InviteToTeam(userKey, emailIds.Trim(';'), teamId, servicename);
        }
        [UserControlScriptMethod]
        public static ActionResult<TokenEntity> GetInviteToken(string userKey, long teamId)
        {
            return ApiMethods.GetInviteToken(userKey, teamId);
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
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }

        [UserControlScriptMethod]
        public static ActionResult<TokenEntity> GetInviteTokenTwitter(string userKey, long teamId)
        {
            return ApiMethods.GetInviteTokenTwitter(userKey, teamId);
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
                ApiMethods.MailInvite(userName, friendsIDs.Split(',').Count().ToString(), "None", serviceName, "Friend Invite", 0);
                return status_send;
            }
            else
            {
                return "";
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> SaveNewTeam(string userKey, string teamName, string country, string sports, string city, string level)
        {
            var currentTeam = new TeamEntity();
            currentTeam.City = city;
            currentTeam.Country = country;
            currentTeam.TeamName = teamName;
            currentTeam.SportsName = sports;
            currentTeam.TeamCategory = level;
            currentTeam.Description = teamName;
            currentTeam.IsPrivate = false;
            currentTeam.Photo = "images/team/default.png";
            return ApiMethods.SaveTeam(userKey, currentTeam);

        }
        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> GetTeams(string userKey, string email, long teamId)
        {
            return ApiMethods.GetTeams(userKey, email, teamId);
        }
    }
}