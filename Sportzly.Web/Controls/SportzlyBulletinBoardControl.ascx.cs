using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
using System.Configuration;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;


namespace Sportzly.Web.Controls
{
    public partial class SportzlyBulletinBoardControl : BaseUserControl<SportzlyBulletinBoardControl>
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
            var currentUser = (this.Page as BasePage).CurrentUser;
            if (!IsPostBack)
            {
                Page.RegisterStartupScript("load", "<script>formatSignature(['" + licenseKey + "']);</script>");//initialize to format license key
                Page.RegisterStartupScript("load1", "<script>formatSignatureAll(['" + licenseKeyAll + "']);</script>");//initialize to format license key
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "<script>friendsInviter.fbinitilize('" + FBAppId + "','test','" + FBLink + "','" + FBPicLink + "');</script>", false);
            }
            var currentUsernew = (this.Page as BasePage).CurrentUser;
            UserDetailEntity detailEntitynew = ApiMethods.GetUserDetails(currentUsernew.UserKey.ToString(), currentUsernew.EmailId).Results[0];
            userName = detailEntitynew.FirstName + " " + detailEntitynew.LastName;
            if (Page.IsPostBack == false)
            {
                var carriers = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Carrier, string.Empty);
                this.ddlCarrier.DataSource = carriers.Results.ToList();
                this.ddlCarrier.DataTextField = "Key";
                this.ddlCarrier.DataValueField = "Value";
                this.ddlCarrier.DataBind();
                var countries = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Countries, string.Empty);
                this.ddlCountry.DataSource = countries.Results;
                this.ddlCountry.DataTextField = "Key";
                this.ddlCountry.DataValueField = "Value";
                this.ddlCountry.DataBind();

                var userDetail = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];
                txtPhone.Value = userDetail.Phone;



                if (userDetail.Country.Key == null)
                {
                    div3.Visible = true;
                }
                else
                {
                    if (userDetail.CarrierValue != null)
                    {
                        divcarrier.Style.Add("display", "none");
                    }
                    else
                    {
                        divcarrier.Style.Add("display", "block");
                    }

                    if (userDetail.Country.Key == "India")
                    {
                        divcarrier.Style.Add("display", "none");
                    }

                }


                if (userDetail.Country.Key == "India")
                {
                    divcarrier.Style.Add("display", "none");
                }

                if (userDetail.Phone != null && userDetail.Phone != "" && (userDetail.CarrierValue != null || userDetail.Country.Key == "India") && userDetail.Country.Key != null)
                {
                    div1.Visible = false;
                }
                else
                {
                    div2.Visible = true;
                }

                if (userDetail.City != null)
                    txtCity.Value = userDetail.City.Value;

                if (txtCity.Value != "")
                {
                    divcity.Visible = false;
                }
                else
                {
                    divcity.Visible = true;
                    div2.Visible = true;
                }

                txtPhone.Value = userDetail.Phone;
                if (txtPhone.Value != "")
                {
                    divMobile.Visible = false;
                }
                else
                {
                    divMobile.Visible = true;
                }

                if (userDetail.CarrierValue != null)
                {
                    try
                    {
                        this.ddlCarrier.Items.FindByValue(userDetail.CarrierValue.ToString()).Selected = true;
                    }
                    catch (Exception ex)
                    {

                    }
                }


                if (userDetail.Country.Key != null)
                {
                    try
                    {
                        this.ddlCountry.Items.FindByValue(userDetail.Country.Key.ToString()).Selected = true;
                    }
                    catch (Exception ex)
                    {

                    }
                }


            }
            else
            {
                UserDetailEntity detailEntity = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];
                if (detailEntity == null)
                    detailEntity = new UserDetailEntity();

                detailEntity.Phone = txtPhone.Value;
                if (this.ddlCarrier.SelectedValue != "")
                {
                    detailEntity.CarrierValue = Convert.ToInt32(this.ddlCarrier.SelectedValue);
                }
                else
                {
                    detailEntity.CarrierValue = null;
                }
                var city = txtCity.Value;
                //var index = city.LastIndexOf(',');
                //var newcity = txtCity.Value;
                //try
                //{
                //    newcity = city.Substring(0, index);
                //}
                //catch (Exception ex)
                //{

                //}

                detailEntity.City = new KeyValueEntity() { Key = city, Value = city };  //GetKeyValueEntity(txtCity);

                detailEntity.Country = new KeyValueEntity() { Key = ddlCountry.SelectedValue, Value = ddlCountry.SelectedValue };

                string key = currentUser.UserKey.ToString();
                string profileData = Serializer.ToJson<UserDetailEntity>(detailEntity);

                try
                {
                    var data = SaveStreamProfile(key, profileData);

                    var newurl = Request.Url.AbsoluteUri;
                    Response.Redirect(newurl, true);


                }
                catch (Exception ex)
                {

                }
            }
        }
        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> SaveStreamProfile(string userKey, string profileData)
        {
            return ApiMethods.SaveStreamProfile(userKey, profileData);
        }
        [UserControlScriptMethod]
        public static ActionResult<TeamNoticeEntity> GetTeamNotices(string userKey, long teamId, int pageNumber, int recordCount)
        {
            return ApiMethods.GetTeamNotices(userKey, teamId, 0, pageNumber, recordCount);
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
        public static ActionResult<TeamNoticeEntity> UpdateNotice(string userKey, string message, long teamId, long parentId)
        {
            return ApiMethods.UpdateNotice(userKey, message, teamId, parentId);
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
        public static string SendTwitterContacts(string signatureKey, string serviceName, string friendsIDs, int teamId)
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
                ApiMethods.MailInvite(userName, friendsIDs.Split(',').Count().ToString(), "None", serviceName, "Team Invite", teamId);
                return status_send;
            }
            else
            {
                return "";
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> GetTeams(string userKey, string email, long teamId)
        {
            return ApiMethods.GetTeams(userKey, email, teamId);
        }
    }
}