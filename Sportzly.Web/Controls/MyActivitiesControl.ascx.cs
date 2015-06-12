using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class MyActivitiesControl : BaseUserControl<MyActivitiesControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<ActivityEntity> GetActivities(string userKey, int pageNumber, string userEmail, int activityType, long teamId, long eventId)
        {
            return ApiMethods.GetActivities(userKey, pageNumber, null, userEmail, (ActivityType)activityType, teamId, eventId);
        }

        [UserControlScriptMethod]
        public static void DeleteActivity(string userKey, long activityId)
        {
            ApiMethods.DeleteActivity(userKey, activityId);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> CheckUser(string userKey, string email,long TeamId)
        {
            return ApiMethods.CheckUser(userKey, email,TeamId);
        }
    }
}