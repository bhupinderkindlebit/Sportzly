using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class EventListMiniControl : BaseUserControl<EventListMiniControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> GetEvents(string userKey, string userEmail, int maxCount)
        {
            var data = ApiMethods.GetEvents(userKey, userEmail, DateTime.Now, 0 );

            data.Results = data.Results.Take(maxCount).ToList();

            return data;
        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> GetUserEventsNotification(string userKey, string userEmail, int maxCount)
        {
            var data = ApiMethods.GetUserEventsNotification(userKey, userEmail, DateTime.Now, 0);

            data.Results = data.Results.Take(maxCount).ToList();

            return data;
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> JoinEvent(string userKey, long eventId, bool response)
        {
            return ApiMethods.JoinEvent(userKey, eventId, response);
        }
    }
}