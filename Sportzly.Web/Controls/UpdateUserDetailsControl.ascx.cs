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
    public partial class UpdateUserDetailsControl : BaseUserControl<UpdateUserDetailsControl>
    {
        protected static string userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            var currentUser = (this.Page as BasePage).CurrentUser;

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

                if (div3.Visible == false || div1.Visible == false || divMobile.Visible == false || divcity.Visible == false || div2.Visible == false)
                    mainDiv.Visible = false;
                else
                    mainDiv.Visible = true;
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
    }
}