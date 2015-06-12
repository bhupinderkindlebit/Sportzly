using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class ProfileUpdateControl : BaseUserControl<ProfileUpdateControl>
    {
        string[] seperators = new string[] { "," };
        const string DOB_FORMAT = "MM-dd-yyyy";




        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            var currentUser = (this.Page as BasePage).CurrentUser;
            string[] awardItems = Request.Form.GetValues(ddlAwards.UniqueID);
         
            KeyValueEntity levelValue = null;
            KeyValueEntity roleValue = null;
            var teams = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Teams, string.Empty);
            List<KeyValueEntity> teamList = teams.Results.ToList();
            teamList.Insert(0, new KeyValueEntity() { Key = "", Value = "" });
            this.ddlTeams.DataSource = teamList;
            this.ddlTeams.DataTextField = "Key";
            this.ddlTeams.DataValueField = "Value";
            this.ddlTeams.DataBind();
            if (Page.IsPostBack == false)
            {
                var carriers = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Carrier, string.Empty);
                this.ddlCarrier.DataSource = carriers.Results.ToList();
                this.ddlCarrier.DataTextField = "Key";
                this.ddlCarrier.DataValueField = "Value";
                this.ddlCarrier.DataBind();
            }
            if (Page.IsPostBack)
            {
                //InitDropDowns(currentUser);
                UserDetailEntity detailEntity = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];

                if (detailEntity == null)
                    detailEntity = new UserDetailEntity();

                detailEntity.FirstName = txtFirstName.Value;
                detailEntity.LastName = txtLastName.Value;

                DateTime DOB;
                if (DateTime.TryParseExact(txtDOB.Value, DOB_FORMAT, null, System.Globalization.DateTimeStyles.None, out DOB))
                {
                    detailEntity.DOB = DOB;
                }

                detailEntity.GenderId = ddlGenders.SelectedIndex;

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

                detailEntity.Country = new KeyValueEntity() { Key = ddlCountries.Value, Value = ddlCountries.Value };  //GetKeyValueEntity(txtCountry);


                detailEntity.ZIP = txtZip.Value;
                detailEntity.Phone = txtPhone.Value;
                detailEntity.Summary = txtSummary.Value;

                levelValue = new KeyValueEntity() { Key = ddlLevels.Value, Value = ddlLevels.Value };  //GetKeyValueEntity(txtLevel);
                detailEntity.OtherLevel = levelValue == null ? string.Empty : levelValue.Value;

                roleValue = new KeyValueEntity() { Key = ddlRoles.Value, Value = ddlRoles.Value };  //GetKeyValueEntity(txtRole);
                detailEntity.OtherSportsTag = roleValue == null ? string.Empty : roleValue.Value;

                if (string.IsNullOrEmpty(txtCollage.Value) == false)
                    detailEntity.Collage = txtCollage.Value;

                if (string.IsNullOrEmpty(txtHighSchool.Value) == false)
                    detailEntity.HighSchool = txtHighSchool.Value;

                if (string.IsNullOrEmpty(txtMiddleSchool.Value) == false)
                    detailEntity.MiddleSchool = txtMiddleSchool.Value;


                if (string.IsNullOrEmpty(imageHidden.Value) == false)
                    detailEntity.ProfileFoto = imageHidden.Value;


                detailEntity.FavSports = new KeyValueEntity() { Key = ddlFavorites.Value, Value = ddlFavorites.Value };  //GetKeyValueEntity(txtFavorites);

                //if (string.IsNullOrEmpty(ddlTeams.Value) == false)
                {
                    detailEntity.Teams.Clear();
                    detailEntity.Teams.AddRange(GetKeyValueEntities(ddlTeams));
                }

                //if (string.IsNullOrEmpty(ddlGroups.Value) == false)
                {
                    detailEntity.Groups.Clear();
                    detailEntity.Groups.AddRange(GetKeyValueEntities(ddlGroups));
                }


                
                    detailEntity.Awards.Clear();
                    foreach (var award in hdAwards.Value.Trim(';').Split(';'))
                    {
                        detailEntity.Awards.Add(new AwardEntity() { AwardDetails = award });
                    }
               

                if (this.ddlCarrier.SelectedValue != "")
                {
                    if (ddlCountries.Value == "United States" || ddlCountries.Value == "Canada")
                    {
                        detailEntity.CarrierValue = Convert.ToInt32(this.ddlCarrier.SelectedValue);
                    }
                    else {
                        detailEntity.CarrierValue = null;
                    }
                }
                else
                {
                    detailEntity.CarrierValue = null;
                }
               

                string key = currentUser.UserKey.ToString();
                string profileData = Serializer.ToJson<UserDetailEntity>(detailEntity);

                try
                {
                    var data = SaveProfile(key, profileData);
                    if (Request.Cookies["__register"] != null)
                    {
                        Response.Cookies["__register"].Expires = DateTime.Now.AddDays(-1);
                        Response.Redirect("~/welcome.aspx?" + detailEntity.EmailId, true);
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(Request.Form["p"]) && Request.Form["p"] == "new")
                        {
                            Response.Redirect("~/teams.aspx", true);
                        }
                        else
                        {
                            Response.Redirect("~/myupdates.aspx", true);
                        }
                    }

                }
                catch (Exception ex)
                {

                }


            }



            #region show in form

            if (currentUser != null)
            {
                var userDetail = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];

                txtFirstName.Value = userDetail.FirstName;

                txtLastName.Value = userDetail.LastName;

                ddlGenders.SelectedIndex = userDetail.GenderId;

                if (userDetail.DOB.HasValue)
                    txtDOB.Value = userDetail.DOB.Value.ToString(DOB_FORMAT);

                if (userDetail.City != null)
                    txtCity.Value = userDetail.City.Value;

                if (userDetail.Country != null)
                    ddlCountries.Value = userDetail.Country.Value;

                txtZip.Value = userDetail.ZIP;

                txtPhone.Value = userDetail.Phone;

                txtSummary.Value = userDetail.Summary;

                if (userDetail.OtherLevel != null)
                    ddlLevels.Value = userDetail.OtherLevel.ToString();

                if (levelValue != null)
                    ddlLevels.Value = levelValue.Value;

                if (userDetail.OtherSportsTag != null)
                    ddlRoles.Value = userDetail.OtherSportsTag.ToString();

                if (roleValue != null)
                    ddlRoles.Value = roleValue.Value;

                txtCollage.Value = userDetail.Collage;
                txtMiddleSchool.Value = userDetail.MiddleSchool;
                if (userDetail.FavSports != null)
                    ddlFavorites.Value = userDetail.FavSports.Value;
                if (userDetail.CarrierValue != null)
                    this.ddlCarrier.Items.FindByValue(userDetail.CarrierValue.ToString()).Selected = true;
                if (userDetail.Awards != null && !IsPostBack)
                    userDetail.Awards.ForEach(rs => ddlAwards.Items.Add(new ListItem()
                    {
                        Text = rs.AwardDetails,
                        Value = rs.AwardId.ToString()
                        //,
                        //Selected = true
                    }));
                else if (awardItems != null)
                {
                    awardItems.ToList().ForEach(rs => ddlAwards.Items.Add(new ListItem() { Text = rs, Value = rs
                        //, Selected = true
                    }));
                }

                if (userDetail.Teams != null && userDetail.Teams.Count() > 0)
                {
                    //ddlTeams.Value= userDetail.Teams.Select(rs => rs.Value).Aggregate((i, j) => string.Format("{0}{2}{1}", i, j, seperators[0]));
                    foreach (KeyValueEntity entity in userDetail.Teams)
                    {
                        foreach (ListItem item in ddlTeams.Items)
                        {
                            if (item.Text == entity.Value)
                            {
                                item.Selected = true;
                                break;
                            }
                        }
                    }
                }

                if (userDetail.Groups != null && userDetail.Groups.Count() > 0)
                    ddlGroups.Value = userDetail.Groups.Select(rs => rs.Value).Aggregate((i, j) => string.Format("{0}{2}{1}", i, j, seperators[0]));

                imgProfile.Src = "~/" + userDetail.ProfileFoto;

                //                Page.ClientScript.RegisterStartupScript(this.GetType(), this.GetType().ToString(),
                //                    string.Format(
                //                        @"$(document).ready(function() {{
                //                            autoList('#{0}', GetCountries, 1,  true);
                //                            autoList('#{1}', GetCities, 1,  true);
                //                            autoList('#{2}', GetTeams, 5, true);
                //                            autoList('#{3}', GetLevels, 1, true);
                //                            autoList('#{4}', GetRoles, 1, true);
                //                            autoList('#{5}', GetSports, 1,true);
                //                            autoList('#{6}', GetGroups, 5,false);
                //                        }});", this.txtCountry.ClientID, this.txtCity.ClientID, this.ddlTeams.ClientID, this.txtLevel.ClientID, this.txtRole.ClientID, this.txtFavorites.ClientID, this.ddlGroups.ClientID), true);


            }
            #endregion
        }

        private void InitDropDowns(UserDetailEntity currentUser)
        {
            var sports = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Sports, string.Empty);
            var levels = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Levels, string.Empty);
            var roles = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Roles, string.Empty);
            var countries = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Countries, string.Empty);

            this.ddlFavorites.DataSource = sports.Results;
            this.ddlFavorites.DataTextField = "Key";
            this.ddlFavorites.DataValueField = "Value";
            this.ddlFavorites.DataBind();

            this.ddlRoles.DataSource = roles.Results;
            this.ddlRoles.DataTextField = "Key";
            this.ddlRoles.DataValueField = "Value";
            this.ddlRoles.DataBind();

            this.ddlCountries.DataSource = countries.Results;
            this.ddlCountries.DataTextField = "Key";
            this.ddlCountries.DataValueField = "Value";
            this.ddlCountries.DataBind();

            this.ddlLevels.DataSource = levels.Results;
            this.ddlLevels.DataTextField = "Key";
            this.ddlLevels.DataValueField = "Value";
            this.ddlLevels.DataBind();

        }

        private KeyValueEntity GetKeyValueEntity(HtmlInputText textBoxControl)
        {
            string controlText = Request.Form["as_values_" + textBoxControl.ClientID];
            if (string.IsNullOrEmpty(controlText) == false)
            {
                var items = controlText.Split(seperators, StringSplitOptions.RemoveEmptyEntries);
                if (items.Length > 0)
                    return new KeyValueEntity() { Key = "0", Value = items[0] };
                else
                    return null;
            }
            return null;
        }

        private IEnumerable<KeyValueEntity> GetKeyValueEntities(HtmlInputText textBoxControl)
        {
            string controlText = Request.Form["as_values_" + textBoxControl.ClientID];
            if (string.IsNullOrEmpty(controlText) == false)
            {
                var items = controlText.Split(seperators, StringSplitOptions.RemoveEmptyEntries);
                foreach (var item in items)
                    yield return new KeyValueEntity() { Key = "0", Value = item };
            }
        }

        private IEnumerable<KeyValueEntity> GetKeyValueEntities(HtmlSelect selectControl)
        {
            string controlText = Request.Form[selectControl.UniqueID];
            if (string.IsNullOrEmpty(controlText) == false)
            {
                var items = controlText.Split(seperators, StringSplitOptions.RemoveEmptyEntries);
                foreach (var item in items)
                {
                    yield return new KeyValueEntity() { Key = "0", Value = item };
                }
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }

        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> SaveProfile(string userKey, string profileData)
        {
            return ApiMethods.SaveProfile(userKey, profileData);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //   var text = this.OtherddlAwards.Value;
            //  this.ddlAwards.Items.Add(new ListItem() { Text = text, Value = text, Selected = true });
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();    
        }

    }
}