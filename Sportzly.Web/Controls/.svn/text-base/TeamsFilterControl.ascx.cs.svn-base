using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities;

namespace Sportzly.Web.Controls
{
    public partial class TeamsFilterControl : BaseUserControl<TeamsFilterControl>
    {
        string userKey = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            userKey = this.CurrentUser.UserKey.ToString();

            if (!Page.IsPostBack)
                BindDropDowns();
        }

        private void BindDropDowns()
        {
            var sports = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Sports, string.Empty).Results.ToList();
            var levels = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Levels, string.Empty).Results.ToList();
            var cities = ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Cities, string.Empty).Results.ToList();


            sports.Insert(0, new BusinessEntities.BusinessEntity.KeyValueEntity() { Key = " -- Select Sports -- " });
            levels.Insert(0, new BusinessEntities.BusinessEntity.KeyValueEntity() { Key = " -- Select Level -- " });
            cities.Insert(0, new BusinessEntities.BusinessEntity.KeyValueEntity() { Key = " -- Select Location -- " });


            this.ddlSports.DataSource = sports;
            this.ddlSports.DataTextField = "Key";
            this.ddlSports.DataValueField = "Value";
            this.ddlSports.DataBind();

            this.ddlLocation.DataSource = cities;
            this.ddlLocation.DataTextField = "Key";
            this.ddlLocation.DataValueField = "Value";
            this.ddlLocation.DataBind();

            this.ddlLevel.DataSource = levels;
            this.ddlLevel.DataTextField = "Key";
            this.ddlLevel.DataValueField = "Value";
            this.ddlLevel.DataBind();

        }

        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> SearchTeams(string userKey, string email, string keyWord, string sports, string level, string location)
        {
            return ApiMethods.SearchTeams(userKey, email, keyWord, sports, level, location);
        }
    }
}