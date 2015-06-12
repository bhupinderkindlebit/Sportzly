using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
namespace Sportzly.Web.Controls
{
    public partial class StreamProfileUpdate : BaseUserControl<StreamProfileUpdate>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> SaveStreamProfile(string userKey, string profileData)
        {
            return ApiMethods.SaveStreamProfile(userKey, profileData);
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            var currentUser = (this.Page as BasePage).CurrentUser;

            if (Page.IsPostBack == false)
            {
                var carriers = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Carrier, string.Empty);
                var countries = ApiMethods.GetKeyValueCollection(currentUser.UserKey.ToString(), KeyValueType.Countries, string.Empty);
                //countries.Results.Insert(0, new KeyValueEntity { Key = "Please Select Country", Value = "" });
                this.ddlCarrier.DataSource = carriers.Results.ToList();
                this.ddlCarrier.DataTextField = "Key";
                this.ddlCarrier.DataValueField = "Value";
                this.ddlCarrier.DataBind();
                this.ddlCountry.DataSource = countries.Results;
                this.ddlCountry.DataTextField = "Key";
                this.ddlCountry.DataValueField = "Value";
                this.ddlCountry.DataBind();


            }
            if (Page.IsPostBack)
            {
                //InitDropDowns(currentUser);
                UserDetailEntity detailEntity = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];

                if (detailEntity == null)
                    detailEntity = new UserDetailEntity();

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
                // detailEntity.Country = new KeyValueEntity() { Key = city.Substring(index + 1).Trim(), Value = city.Substring(index + 1).Trim() };

                //GetKeyValueEntity(txtCountry);

                if (divMobile.Visible)
                {
                    detailEntity.Phone = txtPhone.Value;
                }
                else
                {
                    detailEntity.Phone = null;
                }

                if (string.IsNullOrEmpty(imageHidden.Value) == false)
                    detailEntity.ProfileFoto = imageHidden.Value;

                if (this.ddlCarrier.SelectedValue != "")
                {
                    detailEntity.CarrierValue = Convert.ToInt32(this.ddlCarrier.SelectedValue);
                }
                else
                {
                    detailEntity.CarrierValue = null;
                }

                detailEntity.Country = new KeyValueEntity() { Key = ddlCountry.SelectedValue, Value = ddlCountry.SelectedValue };

                string key = currentUser.UserKey.ToString();
                string profileData = Serializer.ToJson<UserDetailEntity>(detailEntity);

                try
                {
                    var data = SaveStreamProfile(key, profileData);

                    Response.Redirect("~/myupdates.aspx", true);


                }
                catch (Exception ex)
                {

                }


            }



            #region show in form

            if (currentUser != null)
            {
                var userDetail = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];
                hlkProfile.NavigateUrl = "../ProfileUpdate.aspx";
                if ((userDetail.Phone != null && userDetail.Phone != "") && userDetail.ProfileFoto != "images/profile/default.png" && userDetail.City != null && (userDetail.Country.Key == "India" || userDetail.CarrierValue != null) && userDetail.Country.Key != null)
                {
                    pnlStream.Visible = false;
                }
                else
                {


                    if (userDetail.Phone == null && userDetail.CarrierValue == null)
                    {
                        ltrMessage.Text = "Enter your phone number and carrier to receive the text messages from team bulletin board";
                        div1.Visible = true;
                    }
                    else if (userDetail.Phone == null)
                    {
                        ltrMessage.Text = "Enter your phone number to receive the text messages from team bulletin board";
                        div1.Visible = true;
                    }
                    else if (userDetail.CarrierValue == null)
                    {
                        ltrMessage.Text = "Enter your carrier to receive the text messages from team bulletin board";
                        div1.Visible = true;
                    }
                    else
                    {
                        div1.Visible = false;
                    }


                    if (userDetail.Country.Key == null)
                    {
                        div2.Visible = true;
                        ltrMessage.Text = "Enter your phone number to receive the text messages from team bulletin board";
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
                            ltrMessage.Text = "Enter your phone number to receive the text messages from team bulletin board";
                        }
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


                    imgProfile.Src = "~/" + userDetail.ProfileFoto;

                    if (userDetail.ProfileFoto == "images/profile/default.png")
                    {
                        divPhoto.Visible = true;
                        divPhoto1.Visible = true;
                    }
                    else
                    {
                        divPhoto.Visible = false;
                        divPhoto1.Visible = false;
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

                    ltrName.Text = userDetail.FirstName + " " + userDetail.LastName;
                    pnlStream.Visible = true;
                }

            }
            #endregion
        }


    }
}