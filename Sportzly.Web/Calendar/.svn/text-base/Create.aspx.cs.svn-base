using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Calendar
{
    public partial class Create : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            long calendarId = long.Parse(Request.Form.Get("calendarId")??"0");
            string subject = Request.Form.Get("Subject");
            byte color = byte.Parse(Request.Form.Get("Color")??"1");
            string stpartdate = Request.Form.Get("stpartdate");
            string stparttime = Request.Form.Get("stparttime");
            string etpartdate = Request.Form.Get("etpartdate");
            string etparttime = Request.Form.Get("etparttime");
            string location = Request.Form.Get("Location");
            string description = Request.Form.Get("Description");
            string timezone = Request.Form.Get("timezone");

            string cType = Request.Form.Get("ctype");
            long typeId = long.Parse(Request.Form.Get("typeId"));


            CalendarEntity calendarEntity = new CalendarEntity()
            {
                calendarId = calendarId,
                Subject = subject,
                StartTime = DateTime.Parse(stpartdate + ' ' + stparttime),
                EndTime = DateTime.Parse(etpartdate + ' ' + etparttime),
                Color = color,
                Location = location,
                Description = description,
            };

            CalendarUpdateResultEntity ret = new CalendarUpdateResultEntity();

            ActionResult<CalendarEntity> result = ApiMethods.UpdateCalendar("", calendarEntity, cType, typeId);
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