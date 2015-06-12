using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Calendar
{
    public partial class QuickAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long calendarId = long.Parse(Request.Form.Get("calendarId") ?? "0");
            string subject = Request.Form.Get("Subject");
            byte color = byte.Parse(Request.Form.Get("Color") ?? "1");
            string starttime = Request.Form.Get("starttime");
            string endtime = Request.Form.Get("endtime");
            byte IsAlldayEvent = Byte.Parse(Request.Form.Get("IsAlldayEvent")??"1");
            string userKey = Request.Form.Get("userKey");
            string timezone = Request.Form.Get("timezone");

            string calendartype = Request.Form.Get("calendartype");
            long typeId = long.Parse(Request.Form.Get("typeId"));


            CalendarEntity calendarEntity = new CalendarEntity()
            {
                calendarId = calendarId,
                Subject = subject,
                StartTime = DateTime.Parse(starttime ),
                EndTime = DateTime.Parse(endtime ),
                Color = color,
                IsAllDayEvent = IsAlldayEvent,
            };

            CalendarUpdateResultEntity ret = new CalendarUpdateResultEntity();

            ActionResult<CalendarEntity> result = ApiMethods.UpdateCalendar(userKey, calendarEntity, calendartype, typeId);
            if (result.ResultError == null)
            {
                ret.IsSuccess = true;
                ret.Msg = "Saved Successfully";
                ret.Data = result.Results.First().calendarId;
            }
            else
            {
                ret.IsSuccess = false;
                ret.Msg = "Update Failed : " + result.ResultError.Message;
                ret.Data = 0;
            }

            string stringData = Serializer.ToJson<CalendarUpdateResultEntity>(ret);

            Response.Write(stringData);
        }
    }
}