using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;

namespace Sportzly.Web.Controls
{
    public partial class CommentsControl : BaseUserControl<CommentsControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<ActivityEntity> GetComments(string userKey, int pageNumber, long parentId, long teamId, long eventId)
        {
            return ApiMethods.GetActivities(userKey, pageNumber, parentId, null, ActivityType.All, teamId, eventId);
        }

        [UserControlScriptMethod]
        public static ActionResult<ActivityEntity> ShareComment(string userKey, string statusMessage, long parentId, long teamId, long eventId)
        {
            return ApiMethods.UpdateStatus(userKey, statusMessage, parentId, teamId, eventId);
        }

    }
}