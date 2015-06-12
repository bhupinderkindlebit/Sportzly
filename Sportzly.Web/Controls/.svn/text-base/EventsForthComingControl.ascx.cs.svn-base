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
    public partial class EventsForthComingControl : BaseUserControl<EventsForthComingControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser != null)
            {
                myEvents.HRef = "/events.aspx?id=" + CurrentUser.EmailId;
                A1.HRef = "/Calender.aspx?id=" + CurrentUser.EmailId;
                A3.HRef = "webcal://www.sportzly.com/Calender.aspx?id=" + CurrentUser.EmailId;
                A4.HRef = "/Calender.aspx?id=" + CurrentUser.EmailId;
                A2.HRef = "webcal://www.sportzly.com/Calender.aspx?id=" + CurrentUser.EmailId;
            }

            if (!Request.Url.ToString().ToLower().Contains("myupdates.aspx"))
            {
                A1.Visible = false;
                A2.Visible = false;
                A3.Visible = false;
                A4.Visible = false;
                spnEvent.Visible = false;
            }

        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> GetForthComingEvents(string userKey, int teamId)
        {
            return ApiMethods.GetForthComingEvents(userKey, teamId);
        }

        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }
    }
}