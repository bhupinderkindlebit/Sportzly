using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.Web.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Calendar
{

    public partial class GetList : System.Web.UI.Page
    {
        string timeZoneKey = "timezone";
        string showDateKey = "showdate";
        string viewTypeKey = "viewtype";
        string calendarTypeKey = "calendartype";
        string typeIdKey = "typeId";
        string userKeyKey = "userKey";

        protected void Page_Load(object sender, EventArgs e)
        {
            var showDate = DateTime.Parse(Request.Form.Get(showDateKey));
            var viewType = Request.Form.Get(viewTypeKey);
            var calendarType = Request.Form.Get(calendarTypeKey);
            var typeId = long.Parse(Request.Form.Get(typeIdKey));
            var userKey = Request.Form.Get(userKeyKey);

            DateTime startdate = showDate;
            DateTime enddate = new DateTime();

            switch (viewType)
            {
                case "month":
                    startdate = startdate.AddDays(-(int)startdate.Day + 1);
                    enddate = startdate.AddDays(DateTime.DaysInMonth(startdate.Year, startdate.Month)).Subtract(TimeSpan.FromSeconds(1));
                    break;
                case "week":
                    startdate = startdate.AddDays(-(int)startdate.DayOfWeek);
                    enddate = startdate.AddDays(7).Subtract(TimeSpan.FromSeconds(1));
                    break;
                case "day":
                default:
                    enddate = startdate;
                    break;
            }


            ActionResult<CalendarEntity> result = ApiMethods.GetCalendarList(userKey, startdate, enddate, viewType, calendarType, typeId);

            CalendarResultEntity calendarData = GetCalendarData(result, startdate, enddate, viewType);

            var stringData = Serializer.ToJson<CalendarResultEntity>(calendarData);

            Response.Write(stringData);

        }

        private CalendarResultEntity GetCalendarData(ActionResult<CalendarEntity> result, DateTime startDate, DateTime endDate, string viewType)
        {
            CalendarResultEntity ret = new CalendarResultEntity();
            
            List<Object[]> dataList = new List<object[]>();

            foreach (CalendarEntity calendar in result.Results)
            {
                object[] data = new object[11];

                data[0] = calendar.calendarId;
                data[1] = calendar.Subject;
                data[2] = calendar.StartTime.ToString();
                data[3] = calendar.EndTime.ToString();
                data[4] = calendar.IsAllDayEvent;
                data[5] = calendar.isMorethanOneDay;
                data[6] = calendar.IsRecurring;
                data[7] = calendar.Color;
                data[8] = calendar.IsEditable;
                data[9] = calendar.Location;
                data[10] = calendar.Description;
                dataList.Add(data);
            }

            ret.events = dataList.ToArray();
            ret.issort = true;
            ret.start = startDate.ToString();
            ret.end = endDate.ToString();
            ret.error = result.ResultError;

            return ret;
        }
    }
}