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

namespace Sportzly.Web.Controls
{
    public partial class EventDetailControl : BaseUserControl<EventDetailControl>

    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> GetEvents(string userKey, string email, long eventId)
        {
            return ApiMethods.GetEvents(userKey, email, new DateTime(2001, 1, 1), 0,  eventId);
        }
        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> JoinEvent(string userKey, long eventId, bool response)
        {
            return ApiMethods.JoinEvent(userKey, eventId, response);
        }
        [UserControlScriptMethod]
        public static ActionResult<EventEntity> CancelEvent(string userKey, long eventId)
        {
            return ApiMethods.CancelEvent(userKey, eventId);
        }


    }
}