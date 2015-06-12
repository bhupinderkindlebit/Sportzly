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
    public partial class EventListControl : BaseUserControl<EventListControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (CurrentUser != null)
            //{
            //    myEvents.HRef = "/events.aspx?id=" + CurrentUser.EmailId;
               
            //}
            var email = Request.QueryString.Get("id");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "emId", string.Format(" var emId= '{0}';", email), true);
        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> GetEvents(string userKey, string userEmail, string startDateStr, string eventTypeStr)
        {
            DateTime startDate = DateTime.Now;
            int eventType = 0;
            
            DateTime.TryParseExact(startDateStr, "MM-dd-yyyy", null, System.Globalization.DateTimeStyles.None, out startDate);

            if (startDate == DateTime.MinValue)
                startDate = DateTime.Now.Date;
            
            int.TryParse(eventTypeStr, out eventType);

            return ApiMethods.GetEvents(userKey, userEmail, startDate, eventType, 0);
        }

        [UserControlScriptMethod]
        public static ActionResult<EventDateEntity> GetEventDates(string userKey, string userEmail, string startDateStr, string eventTypeStr)
        {
            DateTime startDate = DateTime.Now;
            int eventType = 0;

            DateTime.TryParseExact(startDateStr, "MM-dd-yyyy", null, System.Globalization.DateTimeStyles.None, out startDate);

            if (startDate == DateTime.MinValue)
                startDate = DateTime.Now.Date;

            int.TryParse(eventTypeStr, out eventType);

            return ApiMethods.GetEventDates(userKey, userEmail, startDate, eventType, 0);
        }

        [UserControlScriptMethod]
        public static ActionResult<NewEventEntity> GetEventDistinctDates(string userKey, string userEmail, string startDateStr, string eventTypeStr)
        {
            DateTime startDate = DateTime.Now;
            int eventType = 0;

            DateTime.TryParseExact(startDateStr, "MM-dd-yyyy", null, System.Globalization.DateTimeStyles.None, out startDate);

            if (startDate == DateTime.MinValue)
                startDate = DateTime.Now.Date;

            int.TryParse(eventTypeStr, out eventType);

            return ApiMethods.GetEventDistinctDates(userKey, userEmail, startDate, eventType, 0);
        }

        [UserControlScriptMethod]
        public static ActionResult<NewEventGameEntity> GetUserEventsByDateGame(string userKey, string userEmail, string startDateStr, string eventTypeStr)
        {
            DateTime startDate = DateTime.Now;
            int eventType = 0;

            DateTime.TryParseExact(startDateStr, "MM-dd-yyyy", null, System.Globalization.DateTimeStyles.None, out startDate);

            if (startDate == DateTime.MinValue)
                startDate = DateTime.Now.Date;

            int.TryParse(eventTypeStr, out eventType);

            return ApiMethods.GetUserEventsByDateGame(userKey, userEmail, startDate, eventType, 0);
        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> GetUserEventsByDate(string userKey, string userEmail, string startDateStr, string eventTypeStr)
        {
            DateTime startDate = DateTime.Now;
            int eventType = 0;          

            if (startDate == DateTime.MinValue)
                startDate = DateTime.Now.Date;

            int.TryParse(eventTypeStr, out eventType);

            return ApiMethods.GetUserEventsByDate(userKey, userEmail, startDateStr, eventType, 0);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> JoinEvent(string userKey, long eventId, bool response)
        {
            return ApiMethods.JoinEvent(userKey, eventId, response);
        }

        [UserControlScriptMethod]
        public static ActionResult<ResultEntity> SaveGameResult(string userKey, Int64 gameId, string result, string url, string file)
        {
            return ApiMethods.SaveGameResult(userKey, gameId, result, url, file);
        }

        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }
        [UserControlScriptMethod]
        public static ActionResult<EventEntity> CancelEvent(string userKey, long eventId)
        {
            return ApiMethods.CancelEvent(userKey, eventId);
        }

    }
}