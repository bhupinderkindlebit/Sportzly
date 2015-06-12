using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
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
    public partial class CreateEventControl : BaseUserControl<CreateEventControl>
    {
        EventQuery eventQuery = new EventQuery();
        EventEntity eventObj = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var result = ApiMethods.GetMyTeams(CurrentUser.UserKey.ToString(), CurrentUser.Id);

            this.teamList.Items.Add(new ListItem() { Text = "Choose Team", Value = "" });

          
            
            result.Results.ToList().ForEach(rs => this.teamList.Items.Add(new ListItem() { Text = rs.Value, Value = rs.Key }));

            var result1 = ApiMethods.GetTeams(CurrentUser.UserKey.ToString(), string.Empty, string.Empty);
            result1.Results.ToList().ForEach(rs => this.oppTeam.Items.Add(new ListItem() { Text = rs.TeamName, Value = rs.Id.ToString() }));

            var eventIdStr = Request.QueryString.Get("id");
            long eventId;

            long.TryParse(eventIdStr, out eventId);

          //  Response.Write(string.Format("<script>var eventId = {0};</script>", eventId));
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "event",
                      string.Format(" var eventId = '{0}';", eventId), true);
            if (Page.IsPostBack)
            {
                SaveEvent(eventId);
            }
            else
            {
                if (eventId > 0)
                {

                }
                else
                {
                    dateFrom.Value = DateTime.Now.ToString("MM-dd-yyyy");
                    dateTo.Value = DateTime.Now.ToString("MM-dd-yyyy");
                    int h = DateTime.Now.Hour;
                    int min = DateTime.Now.Minute;
                    if (h > 12)
                    {
                        if (min > 30)
                        {
                            timefromt.Value = h - 12+1 + ":00 PM";
                            timetot.Value = h-12+2 + ":00 PM";
                        }
                        else
                        {
                            timefromt.Value = h - 12+1 + ":30 PM";
                            timetot.Value = h - 12 + 2 + ":30 PM";
                        }
                    }
                    else if (h < 12)
                    {
                        if (min > 30)
                        {
                            timefromt.Value = h +1+ ":00 PM";
                            timetot.Value = h + 2 + ":00 PM";
                        }
                        else
                        {
                            timefromt.Value = h +1+ ":30 PM";
                            timetot.Value = h + 2 + ":30 PM";
                        }
                    }
                    else if (h == 12)
                    {
                        if (min > 30)
                        {
                            timefromt.Value = "1:00 PM";
                            timetot.Value = "2:00 PM";
                        }
                        else
                        {
                            timefromt.Value = "12:30 PM";
                            timetot.Value = "1:30 PM";
                        }
                    }
                }
                LoadEvent(eventId);
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<EventEntity> CancelEvent(string userKey, long eventId)
        {

            return ApiMethods.CancelEvent(userKey, eventId);
        }

        private void LoadEvent(long eventId)
        {

            ddlTimeZone.DataSource = TimeZoneInfo.GetSystemTimeZones();
            ddlTimeZone.DataTextField = "StandardName";
            ddlTimeZone.DataValueField = "Id";
            ddlTimeZone.DataBind();
            if (eventId == 0)
            {
                ddlTimeZone.Items.FindByValue("Eastern Standard Time").Selected = true;
            }

            if (eventId > 0)
            {
                var result = ApiMethods.GetEvents(CurrentUser.UserKey.ToString(), null, DateTime.Now, 0, eventId);

                eventObj = result.Results.FirstOrDefault();

                if (eventObj != null)
                {
                    eventQuery.EventId = eventObj.EventId;

                    //ListItem li = this.eventType.Items.FindByValue(eventObj.EventType);
                    //if (li != null)
                    //    li.Selected = true;

                    if (eventObj.EventType == "1")
                    {
                        rdEvent.Checked = true;
                    }
                    else if (eventObj.EventType == "2")
                    {
                        rdGame.Checked = true;
                    }
                    else if (eventObj.EventType == "3")
                    {
                        rdPratice.Checked = true;
                    }


                    ListItem li1 = this.teamList.Items.FindByValue(eventObj.TeamId.ToString());
                    if (li1 != null)
                        li1.Selected = true;

                    if (eventObj.OppTeamId.HasValue)
                    {
                        ListItem li2 = this.oppTeam.Items.FindByValue(eventObj.OppTeamId.Value.ToString());
                        if (li2 != null)
                            li2.Selected = true;
                    }

                    //ListItem li2 = this.frequencyItems.FindByText(eventObj.EventType);
                    //li.Selected = true;

                    this.oppName.Value = eventObj.OppName;
                    this.IsHomeGame.Checked = eventObj.HomeGame == "Home Game";
                    this.gameType2.Checked = !eventObj.IsTeam;
                    this.addressLine.Value = eventObj.Address;
                    this.eventTitle.Value = eventObj.EventName;
                    var all = eventObj.Pending.Union(eventObj.NotAttending);
                    all = all.Union(eventObj.Attendees);
                    try
                    {
                        this.ddlTimeZone.Items.FindByValue(eventObj.TimeZone).Selected = true;
                    }
                    catch (Exception ex) { }
                    this.addInvitees.Value = String.Join(",", all.Select(rs => rs.EmailId).ToArray());
                    this.season.Value = eventObj.Season;
                    this.dateFrom.Value = eventObj.StartDate;
                    this.dateTo.Value = eventObj.EndDate;
                    this.timefromt.Value = eventObj.StartTime;
                    this.timetot.Value = eventObj.EndTime;


                    this.Comments.Value = eventObj.Comments;

                    saveEvent.Value = "Update";
                }
            }
        }

        public int GetEventType()
        {
            if (rdEvent.Checked)
            {
                return 1;
            }
            else if (rdGame.Checked)
            {
                return 2;
            }
            else
            {
                return 3;
            }
        }

        public void SaveEvent(long eventId)
        {

            //int eventTypeId = int.Parse(this.eventType.Value);
            int eventTypeId = GetEventType();
            string eventTitleStr = this.eventTitle.Value;
            int teamId = int.Parse(this.teamList.Value);
            int? opponentId = null;
            if (eventTypeId == 2)
            {
                opponentId = int.Parse(this.oppTeam.Value);
            }
            string[] attendees = this.addInvitees.Value.Split(new string[] { ",", " ", ";" }, StringSplitOptions.RemoveEmptyEntries);
            int frequencyId = int.Parse(this.frequency.Value);
            List<int> days = new List<int>();
            if (frequencyId == 3)
            {
                if (this.day1.Checked) days.Add(1);
                if (this.day2.Checked) days.Add(2);
                if (this.day3.Checked) days.Add(3);
                if (this.day4.Checked) days.Add(4);
                if (this.day5.Checked) days.Add(5);
                if (this.day6.Checked) days.Add(6);
                if (this.day7.Checked) days.Add(7);
            }

            string seasonStr = this.season.Value;
            DateTime startDate = DateTime.Parse(this.dateFrom.Value + " " + this.timefromt.Value);
            DateTime endDate = DateTime.Parse(this.dateTo.Value + " " + this.timetot.Value);

            if (startDate < DateTime.Now)
            {
                successPanel.InnerText = string.Empty;
                errorPanel.InnerText = "You cannot create event in the past";
                return;
            }

            if (endDate < startDate)
            {
                successPanel.InnerText = string.Empty;
                errorPanel.InnerText = "End date must be greater than start date";
                return;
            }
            string addLineStr = this.addressLine.Value;
            string commentsStr = this.Comments.Value;


            eventQuery.HomeGame = this.IsHomeGame.Checked ? "Home Game" : string.Empty;
            eventQuery.IsTeam = this.gameType1.Checked;
            eventQuery.OppName = this.oppName.Value;
            
            eventQuery.AddressLine = addLineStr;
            eventQuery.Attendees = attendees.ToList();

            eventQuery.Comments = commentsStr;
            eventQuery.TimeZone = ddlTimeZone.SelectedValue;
            eventQuery.Days = days;
            eventQuery.EndDate = endDate;
            eventQuery.EventTitle = eventTitleStr;
            eventQuery.EventType = eventTypeId;
            eventQuery.Frequency = frequencyId;

            eventQuery.Season = seasonStr;
            eventQuery.StartDate = startDate;

            eventQuery.TeamId = teamId;
            eventQuery.OppTeamId = opponentId;
            eventQuery.EventId = eventId;
            eventQuery.IsDelete = false;
            HttpCookie cookie = Request.Cookies.Get("__sportzly");

            try
            {
                var result = ApiMethods.SaveEvent(CurrentUser.UserKey.ToString(), eventQuery);
                eventObj = result.Results.FirstOrDefault();
                //if (eventObj.EventId != 0)
                //{
                    successPanel.InnerText = "Event is successfully created";
                    errorPanel.InnerText = string.Empty;
                //}
            }
            catch (Exception ex)
            {
                successPanel.InnerText = string.Empty;
                errorPanel.InnerText = ex.Message;
                return;
            }           
        }
    }
}