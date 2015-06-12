using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class NewTeamControl : BaseUserControl<NewTeamControl>
    {
        TeamEntity currentTeam = new TeamEntity();
        string userKey = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            userKey = this.CurrentUser.UserKey.ToString();

            if (!Page.IsPostBack)
                InitDropDowns();

            int teamId = 0;
            var query = Request.Url.Query;

            if (query != null)
                query = query.Replace("?", "");

            int.TryParse(query, out teamId);

            if (teamId > 0)
            {
                var result = ApiMethods.GetTeams(userKey, null, teamId);
                currentTeam = result.Results[0];
              
            }


            SetValues();
            if (teamId == 0)
            {
                if (Page.IsPostBack == false)
                {
                    var currentUser = (this.Page as BasePage).CurrentUser;
                    UserDetailEntity detailEntity = ApiMethods.GetUserDetails(currentUser.UserKey.ToString(), currentUser.EmailId).Results[0];
                    txtCity.Value = detailEntity.City.Value;
                    try { ddlCountry.Items.FindByValue(detailEntity.Country.Value).Selected = true; }
                    catch (Exception ex) { }
                    try { ddlLevel.Items.FindByValue(detailEntity.OtherLevel).Selected = true; }
                    catch (Exception ex) { }
                    try { ddlSports.Items.FindByValue(detailEntity.FavSports.Value).Selected = true; }
                    catch (Exception ex) { }
                }
            }

        }


        private void InitDropDowns()
        {
            var sports = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Sports, string.Empty);
            var levels = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Levels, string.Empty);
            //var cities = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Cities, string.Empty);
            var countries = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Countries, string.Empty);

            this.ddlSports.DataSource = sports.Results;
            this.ddlSports.DataTextField = "Key";
            this.ddlSports.DataValueField = "Value";
            this.ddlSports.DataBind();

            //this.ddlCity.DataSource = cities.Results;
            //this.ddlCity.DataTextField = "Key";
            //this.ddlCity.DataValueField = "Value";
            //this.ddlCity.DataBind();

            this.ddlCountry.DataSource = countries.Results;
            this.ddlCountry.DataTextField = "Key";
            this.ddlCountry.DataValueField = "Value";
            this.ddlCountry.DataBind();

            this.ddlLevel.DataSource = levels.Results;
            this.ddlLevel.DataTextField = "Key";
            this.ddlLevel.DataValueField = "Value";
            this.ddlLevel.DataBind();

        }

        private void SetValues()
        {
            if (Page.IsPostBack) return;
            this.txtDescription.Value = currentTeam.Description;
            this.txtFirstName.Value = currentTeam.TeamName;
            this.txtGround.Value = currentTeam.PracticeGround;
            this.txtSeason.Value = currentTeam.Season;
            // this.txtScorecardUrl.Value = currentTeam.ScoreCardUrl;
            if (this.ddlSports.Items.FindByText(currentTeam.SportsName) != null)
                this.ddlSports.Items.FindByText(currentTeam.SportsName).Selected = true;

            if (this.ddlLevel.Items.FindByText(currentTeam.TeamCategory) != null)
                this.ddlLevel.Items.FindByText(currentTeam.TeamCategory).Selected = true;

            //if (this.ddlCity.Items.FindByText(currentTeam.City) != null)
            //    this.ddlCity.Items.FindByText(currentTeam.City).Selected = true;

            txtCity.Value = currentTeam.City;

            if (this.ddlCountry.Items.FindByText(currentTeam.Country) != null)
                this.ddlCountry.Items.FindByText(currentTeam.Country).Selected = true;
            if (currentTeam.Photo == "" || currentTeam == null || currentTeam.Photo == null)
            {
                this.imageHidden.Value = "images/team/default.png";
                this.imgProfile.Src = "~/images/team/default.png";
            }
            else
            {
                this.imageHidden.Value = currentTeam.Photo;
                this.imgProfile.Src = "~/" + currentTeam.Photo;
            }

            ChPrivate.Checked = currentTeam.IsPrivate;

            if (currentTeam.TeamUrl != null && !IsPostBack)
                currentTeam.TeamUrl.ForEach(rs => ddlUrl.Items.Add(new ListItem()
                {
                    Text = rs.Url,
                    Value = rs.Url.ToString()
                    //,
                    //Selected = true
                }));
        }

        private void SaveTeam()
        {
            if (currentTeam == null)
                currentTeam = new TeamEntity();


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

            currentTeam.City = city;
            currentTeam.Country = ddlCountry.SelectedItem.Text;
            currentTeam.Description = txtDescription.InnerText;
            currentTeam.TeamCategory = ddlLevel.SelectedItem.Text;
            currentTeam.Photo = imageHidden.Value;
            currentTeam.PracticeGround = txtGround.Value;
            currentTeam.Season = txtSeason.Value;
            currentTeam.SportsName = ddlSports.SelectedItem.Text;
            currentTeam.TeamName = txtFirstName.Value;
            currentTeam.EmailId = CurrentUser.EmailId;
            currentTeam.ScoreCardUrl = hdUrl.Value.Trim(';');
            currentTeam.IsPrivate = ChPrivate.Checked;
            var result = ApiMethods.SaveTeam(CurrentUser.UserKey.ToString(), currentTeam);
            // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "invite", "invitePopUp(" + result.Results[0].Id + ");", true);
            if (result.ResultError != null)
            {
                //show error
            }
            else
            {
                if (currentTeam.Id > 0)
                {
                    Response.Redirect("~/Team.aspx?" + result.Results[0].Id);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "invite", "invitePopUp(" + result.Results[0].Id + ");", true);
                }
            }
        }


        protected void btnTeamSubmit_Click(object sender, EventArgs e)
        {

        }

        protected override void OnPreRender(EventArgs e)
        {
            if (Page.IsPostBack)
                SaveTeam();

            base.OnPreRender(e);


        }
    }
}