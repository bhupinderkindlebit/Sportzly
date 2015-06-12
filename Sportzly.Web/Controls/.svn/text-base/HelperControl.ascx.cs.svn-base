using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class HelperControl : BaseUserControl<HelperControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetCountries(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString)) return null;
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Countries, searchString);
        }

        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetCities(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString)) return null;
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Cities, searchString);
        }
        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetTeams(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString)) return null;
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Teams, searchString);
        }
        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetLevels(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString.Trim())) searchString = " ";
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Levels, searchString);
        }
        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetRoles(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString.Trim())) searchString = " ";
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Roles, searchString);
        }
        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetSports(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString)) return null;
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Sports, searchString);
        }
        [UserControlScriptMethod]
        public static ActionResult<KeyValueEntity> GetGroups(string userKey, string searchString)
        {
            if (string.IsNullOrEmpty(searchString)) return null;
            return ApiMethods.GetKeyValueCollection(userKey, KeyValueType.Groups, searchString);
        }
    }
}