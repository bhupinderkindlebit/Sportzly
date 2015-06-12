using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.DataAccess;
using Sportzly.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Sportzly.Repository
{
    public class CalendarRepository
    {
        public IList<CalendarEntity> GetCalendarList(CalendarQuery calendarQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable().Where(i => i.IsDelete == false);

                var members = context.TeamMembers.Where(i => i.UserId == calendarQueryEntity.SessionUserId.Value && i.IsApproved == true).AsQueryable();
                //  result = result.Where(rs => rs.TeamId == calendarQueryEntity.TypeId);

                if (calendarQueryEntity.TypeId != 0)
                    result = result.Where(rs => rs.CalendarType == calendarQueryEntity.TypeId.ToString());

                result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= calendarQueryEntity.StartDate);

                if (calendarQueryEntity.EndDate != DateTime.MinValue)
                    result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= calendarQueryEntity.EndDate);


                result = result.Where(rs => rs.userId == calendarQueryEntity.SessionUserId.Value || members.Any(i => i.TeamId == rs.TeamId));


                return EntityMapper.MapList<Calendar, CalendarEntity>(result.ToList()); ;
            }
        }

        public IList<CalendarEntity> SaveCalendar(CalendarQuery calendarQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable();

                var calendar = result.FirstOrDefault(rs => rs.calendarId == calendarQueryEntity.Entity.calendarId);

                if (calendar == null)
                {
                    calendar = new Calendar();
                    context.Calendars.AddObject(calendar);
                }

                calendar.CalendarType = calendarQueryEntity.CalendarType;
                calendar.Color = calendarQueryEntity.Entity.Color;
                calendar.Description = calendarQueryEntity.Entity.Description;
                calendar.EndTime = calendarQueryEntity.Entity.EndTime;
                calendar.IsAllDayEvent = calendarQueryEntity.Entity.IsAllDayEvent;
                calendar.IsEditable = calendarQueryEntity.Entity.IsEditable;

                calendar.IsRecurring = calendarQueryEntity.Entity.IsRecurring;
                calendar.Location = calendarQueryEntity.Entity.Location;
                calendar.StartTime = calendarQueryEntity.Entity.StartTime;
                calendar.Subject = calendarQueryEntity.Entity.Subject;
                calendar.TeamId = calendarQueryEntity.TypeId;

                context.SaveChanges();



                return EntityMapper.MapList<Calendar, CalendarEntity>(calendar);
            }
        }

        public IList<ResultEntity> SaveGameResult(ResultQuery resultQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Results.AsQueryable();

                var GameResult = result.FirstOrDefault(rs => rs.GameId == resultQueryEntity.GameId);

                if (GameResult == null)
                {
                    GameResult = new Result();
                    GameResult.GameId = resultQueryEntity.GameId;
                    GameResult.Result1 = resultQueryEntity.Result;
                    GameResult.ResultFile = resultQueryEntity.ResultFile;
                    GameResult.ResultUrl = resultQueryEntity.ResultUrl;
                    context.Results.AddObject(GameResult);
                }

                if (resultQueryEntity.Result != "")
                    GameResult.Result1 = resultQueryEntity.Result;

                if (resultQueryEntity.ResultFile != "")
                    GameResult.ResultFile = resultQueryEntity.ResultFile;

                if (resultQueryEntity.ResultUrl != "")
                    GameResult.ResultUrl = resultQueryEntity.ResultUrl;

                context.SaveChanges();

                return EntityMapper.MapList<Result, ResultEntity>(GameResult);
            }
        }

        public long SavePoll(PollQuery pollQueryEntity)
        {
            long result = 0;

            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.First(rs => rs.Id == pollQueryEntity.SessionUserId);
                long PollId;
                bool isMinimalUpdate = false;
                Poll poll = null;
                poll = context.Polls.FirstOrDefault(rs => rs.ID == pollQueryEntity.PollId);

                if (poll == null)
                {
                    poll = new Poll();
                    poll.PollExpiry = pollQueryEntity.ExpiryDate;
                    poll.PollQuestion = pollQueryEntity.Question;
                    poll.TeamId = pollQueryEntity.TeamId;
                    poll.UserId = pollQueryEntity.SessionUserId;
                    poll.EndPoll = pollQueryEntity.Active;
                    context.Polls.AddObject(poll);
                    context.SaveChanges();
                    PollId = poll.ID;
                }
                else
                {
                    poll.PollExpiry = pollQueryEntity.ExpiryDate;
                    poll.PollQuestion = pollQueryEntity.Question;
                    poll.TeamId = pollQueryEntity.TeamId;
                    poll.UserId = pollQueryEntity.SessionUserId;
                    poll.EndPoll = pollQueryEntity.Active;
                    context.SaveChanges();
                    PollId = pollQueryEntity.PollId;
                    isMinimalUpdate = true;
                }

                List<string> emailaddress = new List<string>();
                emailaddress.Add(user.Email);

                if (pollQueryEntity.TeamId > 0)
                {
                    var teamMembers = context.TeamMembers.Where(rs => rs.TeamId == pollQueryEntity.TeamId).Select(rs => rs.User.Email);
                    teamMembers.ToList().ForEach(rs => emailaddress.Add(rs));
                    var team = context.Teams.Where(i => i.Id == pollQueryEntity.TeamId).FirstOrDefault();
                    var u = context.Users.First(rs => rs.Id == team.OwnerId);
                    emailaddress.Add(u.Email);
                }




                var polloptions = context.PollOptions.Where(rs => rs.PollId == pollQueryEntity.PollId).ToList();

                foreach (var o in polloptions)
                {
                    context.DeleteObject(o);
                    context.SaveChanges();
                }

                foreach (string ans in pollQueryEntity.Answers)
                {
                    var opt = new PollOption()
                    {
                        PollId = PollId,
                        OptionPoll = ans
                    };
                    context.PollOptions.AddObject(opt);
                }

                context.SaveChanges();
                //emailaddress.Add("itssaiinfo@gmail.com");
                if (isMinimalUpdate)
                {
                    MailUtils.SendPollInvitesUpdate(emailaddress, user.Email, user.GetProfileName(), pollQueryEntity.Question, "team.aspx?" + pollQueryEntity.TeamId.ToString(), user.GetProfilePhoto());
                }
                else
                {
                    MailUtils.SendPollInvites(emailaddress, user.Email, user.GetProfileName(), pollQueryEntity.Question, "team.aspx?" + pollQueryEntity.TeamId.ToString(), user.GetProfilePhoto());
                }

                result = PollId;
            }


            return result;
        }

        public long SaveEvent(EventQuery eventQueryEntity)
        {
            long resultId = 0;
            long? lastUpdateId = null;
            using (var context = new SportzlyDataContext())
            {

                var user = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId);


                List<EventQuery> events = GetEvents(eventQueryEntity);
                var days = (eventQueryEntity.StartDate - DateTime.Now).Days;

                bool isMinimalUpdate = false;

                foreach (EventQuery eventObj in events)
                {
                    Calendar calendar = null;


                    calendar = context.Calendars.FirstOrDefault(rs => rs.calendarId == eventQueryEntity.EventId);

                    if (calendar == null)
                    {
                        calendar = new Calendar();
                        context.Calendars.AddObject(calendar);
                    }
                    else if (calendar.AddressLine == eventObj.AddressLine && calendar.StartTime == eventObj.StartDate)
                    {
                        isMinimalUpdate = true;
                    }
                    calendar.CalendarType = eventObj.EventType.ToString();
                    calendar.Description = eventObj.Comments;
                    calendar.AddressLine = eventObj.AddressLine;
                    calendar.EndTime = eventObj.EndDate;
                    calendar.IsAllDayEvent = 0;
                    calendar.TimeZone = eventObj.TimeZone;
                    calendar.HomeGame = eventObj.HomeGame;
                    calendar.IsTeam = eventObj.IsTeam;
                    calendar.OppName = eventObj.OppName;
                    calendar.IsDelete = eventObj.IsDelete;
                    calendar.parentId = lastUpdateId;
                    calendar.Season = eventObj.Season;
                    calendar.StartTime = eventObj.StartDate;

                    if (eventObj.OppTeamId.HasValue && eventObj.OppTeamId.Value > 0)
                    {
                        calendar.opponentTeamId = eventObj.OppTeamId;
                    }

                    calendar.Subject = eventObj.EventTitle;
                    calendar.TeamId = eventObj.TeamId;
                    calendar.userId = eventQueryEntity.SessionUserId.Value;

                    if (days < 7)
                    {
                        // eventObj.Attendees.Add(user.Email);
                        if (eventObj.TeamId > 0)
                        {
                            var teamMembers = context.TeamMembers.Where(rs => rs.TeamId == eventObj.TeamId).Select(rs => rs.User.Email);
                            teamMembers.ToList().ForEach(rs => eventObj.Attendees.Add(rs));
                            var team = context.Teams.Where(i => i.Id == eventObj.TeamId).FirstOrDefault();
                            var u = context.Users.First(rs => rs.Id == team.OwnerId);
                            eventObj.Attendees.Add(u.Email);
                        }
                    }

                    //eventObj.Attendees.Add("itssaiinfo@gmail.com");

                    context.SaveChanges();

                    lastUpdateId = calendar.calendarId;
                    if (days < 7)
                    {
                        foreach (string attendee in eventObj.Attendees)
                        {
                            if (string.IsNullOrWhiteSpace(attendee)) continue;
                            var calendarAttendee = context.CalendarAttendees.FirstOrDefault(rs => rs.attendeesEmail == attendee && rs.calendarId == lastUpdateId);
                            if (calendarAttendee == null)
                            {
                                calendarAttendee = new CalendarAttendee()
                                {
                                    attendeesEmail = attendee,
                                    lastUpdated = DateTime.Now,
                                    response = attendee.Equals(user.Email) ? "YES" : null,
                                    Calendar = calendar
                                };
                                context.CalendarAttendees.AddObject(calendarAttendee);
                            }
                        }
                    }

                    context.SaveChanges();
                }


                if (days < 7)
                {
                    if (isMinimalUpdate)
                    {
                        MailUtils.SendEventUpdate(eventQueryEntity.Attendees.ToList(), user.Email, user.GetProfileName(), eventQueryEntity.EventType == 2 ? (EntityExtensions.GetSourceName(eventQueryEntity.TeamId, user) + " (" + (eventQueryEntity.HomeGame == "Home Game" ? "Home" : "Away") + ")" + " vs " + eventQueryEntity.OppName + " (" + (eventQueryEntity.HomeGame == "Home Game" ? "Away" : "Home") + ")") : eventQueryEntity.EventTitle, "event.aspx?" + lastUpdateId.ToString(), eventQueryEntity.StartDate.ToString("dddd, MMM dd"), eventQueryEntity.StartDate.ToString("hh:mm tt"), eventQueryEntity.EndDate.ToString("dddd, MMM dd"), eventQueryEntity.EndDate.ToString("hh:mm tt"), eventQueryEntity.TimeZone, eventQueryEntity.AddressLine, eventQueryEntity.Comments, user.GetProfilePhoto());
                    }
                    else
                    {
                        MailUtils.SendEventInvites(eventQueryEntity.Attendees.ToList(), user.Email, user.GetProfileName(), eventQueryEntity.EventType == 2 ? (EntityExtensions.GetSourceName(eventQueryEntity.TeamId, user) + " (" + (eventQueryEntity.HomeGame == "Home Game" ? "Home" : "Away") + ")" + " vs " + eventQueryEntity.OppName + " (" + (eventQueryEntity.HomeGame == "Home Game" ? "Away" : "Home") + ")") : eventQueryEntity.EventTitle, "event.aspx?" + lastUpdateId.ToString(), eventQueryEntity.StartDate.ToString("dddd, MMM dd"), eventQueryEntity.StartDate.ToString("hh:mm tt"), eventQueryEntity.EndDate.ToString("dddd, MMM dd"), eventQueryEntity.EndDate.ToString("hh:mm tt"), eventQueryEntity.TimeZone, eventQueryEntity.AddressLine, eventQueryEntity.Comments, user.GetProfilePhoto());
                    }
                }
            }

            resultId = (long)lastUpdateId;

            return resultId;
        }

        public IList<EventEntity> CancelEvent(EventQuery eventQueryEntity)
        {

            using (var context = new SportzlyDataContext())
            {

                var user = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId);
                eventQueryEntity.Frequency = 1;
                List<EventQuery> events = GetEvents(eventQueryEntity);

                foreach (EventQuery eventObj in events)
                {
                    Calendar calendar = null;
                    calendar = context.Calendars.FirstOrDefault(rs => rs.calendarId == eventQueryEntity.EventId);
                    calendar.IsDelete = true;
                    List<string> mailids = new List<string>();
                    if (calendar.TeamId > 0)
                    {
                        var teamMembers = context.TeamMembers.Where(rs => rs.TeamId == calendar.TeamId).Select(rs => rs.User.Email);
                        teamMembers.ToList().ForEach(rs => mailids.Add(rs));
                        var team = context.Teams.Where(i => i.Id == calendar.TeamId).FirstOrDefault();
                        var u = context.Users.First(rs => rs.Id == team.OwnerId);
                        mailids.Add(u.Email);
                    }

                    // mailids.Add("itssaiinfo@gmail.com");
                    context.SaveChanges();
                    eventQueryEntity.EventType = Convert.ToInt32(calendar.CalendarType);

                    MailUtils.SendEventDelete(mailids, user.Email, user.GetProfileName(), eventQueryEntity.EventType == 2 ? (EntityExtensions.GetSourceName(calendar.TeamId, user) + " (" + (calendar.HomeGame == "Home Game" ? "Home" : "Away") + ")" + " vs " + calendar.OppName + " (" + (eventQueryEntity.HomeGame == "Home Game" ? "Away" : "Home") + ")") : calendar.Subject, calendar.StartTime.Value.ToString("dddd, MMM dd"), calendar.StartTime.Value.ToString("hh:mm tt"), calendar.EndTime.Value.ToString("dddd, MMM dd"), calendar.EndTime.Value.ToString("hh:mm tt"), calendar.TimeZone, calendar.AddressLine, calendar.Description, user.GetProfilePhoto());
                }



            }
            return null;
        }

        private List<EventQuery> GetEvents(EventQuery eventQueryEntity)
        {
            List<EventQuery> list = new List<EventQuery>();
            switch (eventQueryEntity.Frequency)
            {
                case 1:
                    list.Add(eventQueryEntity);
                    break;
                case 2:
                    for (DateTime st = eventQueryEntity.StartDate; st <= eventQueryEntity.EndDate; st = st.AddDays(1))
                    {

                        EventQuery ev = GetChildEventQuery(eventQueryEntity, st);

                        list.Add(ev);
                    }
                    break;
                case 3:
                    for (DateTime st = eventQueryEntity.StartDate; st <= eventQueryEntity.EndDate; st = st.AddDays(1))
                    {
                        if (eventQueryEntity.Days.Contains((int)st.DayOfWeek))
                        {
                            EventQuery ev = GetChildEventQuery(eventQueryEntity, st);
                            list.Add(ev);
                        }
                    }

                    break;
                case 4:
                    for (DateTime st = eventQueryEntity.StartDate; st <= eventQueryEntity.EndDate; st = st.AddMonths(1))
                    {
                        EventQuery ev = GetChildEventQuery(eventQueryEntity, st);
                        list.Add(ev);
                    }

                    break;
            }
            return list;
        }

        private static EventQuery GetChildEventQuery(EventQuery eventQueryEntity, DateTime st)
        {
            EventQuery ev = new EventQuery();

            ev.AddressLine = eventQueryEntity.AddressLine;
            ev.Attendees = eventQueryEntity.Attendees;
            ev.City = eventQueryEntity.City;
            ev.Comments = eventQueryEntity.Comments;
            ev.Country = eventQueryEntity.Country;

            var span = eventQueryEntity.EndDate.TimeOfDay - eventQueryEntity.StartDate.TimeOfDay;
            ev.EndDate = st.AddMinutes(span.TotalMinutes);
            ev.State = eventQueryEntity.State;
            ev.TeamId = eventQueryEntity.TeamId;
            ev.EventTitle = eventQueryEntity.EventTitle;
            ev.EventType = eventQueryEntity.EventType;
            ev.Frequency = eventQueryEntity.Frequency;

            ev.Season = eventQueryEntity.Season;


            ev.HomeGame = eventQueryEntity.HomeGame;
            ev.IsTeam = eventQueryEntity.IsTeam;
            ev.OppName = eventQueryEntity.OppName;

            ev.OppTeamId = eventQueryEntity.OppTeamId;
            ev.SessionUserId = eventQueryEntity.SessionUserId;
            ev.StartDate = st;
            return ev;
        }

        public IList<EventEntity> GetUserEvents(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable().Where(i => i.IsDelete == false);
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;

                if (eventQueryEntity.EventId > 0)
                {
                    result = result.Where(rs => rs.calendarId == eventQueryEntity.EventId);
                }
                else
                {

                    if (string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                    {
                        result = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == callerEmail && (rs1.response == null || rs1.response == "YES")));
                    }
                    else
                    {
                        result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value);
                    }

                    if (eventQueryEntity.EventType != 0)
                    {
                        var eventTypeStr = eventQueryEntity.EventType.ToString();
                        result = result.Where(rs => rs.CalendarType == eventTypeStr);
                    }

                    result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= eventQueryEntity.StartDate);

                    if (eventQueryEntity.EndDate != DateTime.MinValue)
                        result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= eventQueryEntity.EndDate);
                }

                result = result.OrderBy(rs => rs.StartTime);

                return EntityMapper.MapList<Calendar, EventEntity>(result.ToList());
            }
        }

        public IList<EventEntity> GetUserEventsByDate(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false);
               // var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false && !CheckPrivateTeam(i.TeamId,eventQueryEntity.SessionUserId.Value));
                result = result.Where(i => i.StartTime.Value.ToString("MM-dd-yyyy") == eventQueryEntity.EventDate);
                var members = context.TeamMembers.Where(i => i.UserId == eventQueryEntity.SessionUserId.Value && i.IsApproved == true).ToList();
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;

                if (eventQueryEntity.EventId > 0)
                {
                    result = result.Where(rs => rs.calendarId == eventQueryEntity.EventId);
                }
                else
                {

                    //if (string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                    //{
                    //    result = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == callerEmail && (rs1.response == null || rs1.response == "YES")));
                    //}
                    //else
                    //{
                    //    result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value);
                    //}
                    if (!string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                    {
                        result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value || members.Any(i => i.TeamId == rs.TeamId));
                    }
                    if (eventQueryEntity.EventType != 0)
                    {
                        var eventTypeStr = eventQueryEntity.EventType.ToString();
                        result = result.Where(rs => rs.CalendarType == eventTypeStr);
                    }


                    if (eventQueryEntity.EndDate != DateTime.MinValue)
                        result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= eventQueryEntity.EndDate);
                }

                result = result.OrderBy(rs => rs.StartTime);

                return EntityMapper.MapList<Calendar, EventEntity>(result.ToList());
            }
        }

        public IList<EventEntity> GetUserEventsByDateGame(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false);
                result = result.Where(i => i.StartTime.Value.ToString("MM-dd-yyyy") == eventQueryEntity.EventDate);
                var members = context.TeamMembers.Where(i => i.UserId == eventQueryEntity.SessionUserId.Value && i.IsApproved == true).ToList();
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;


                if (!string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                {
                    result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value || members.Any(i => i.TeamId == rs.TeamId));
                }

                var eventTypeStr = eventQueryEntity.EventType.ToString();
                result = result.Where(rs => rs.CalendarType == eventTypeStr);


                if (eventQueryEntity.EndDate != DateTime.MinValue)
                    result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= eventQueryEntity.EndDate);


                result = result.OrderBy(rs => rs.StartTime);

                return EntityMapper.MapList<Calendar, EventEntity>(result.ToList());
            }
        }

        public IList<EventDateEntity> GetEventDates(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable().Where(i => i.IsDelete == false);
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;

                if (eventQueryEntity.EventId > 0)
                {
                    result = result.Where(rs => rs.calendarId == eventQueryEntity.EventId);
                }
                else
                {

                    if (string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                    {
                        result = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == callerEmail && (rs1.response == null || rs1.response == "YES")));
                    }
                    else
                    {
                        result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value);
                    }

                    if (eventQueryEntity.EventType != 0)
                    {
                        var eventTypeStr = eventQueryEntity.EventType.ToString();
                        result = result.Where(rs => rs.CalendarType == eventTypeStr);
                    }

                    result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= eventQueryEntity.StartDate);

                    if (eventQueryEntity.EndDate != DateTime.MinValue)
                        result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= eventQueryEntity.EndDate);

                }

                result = result.OrderBy(rs => rs.StartTime);

                IList<EventDateEntity> r = EntityMapper.MapList<Calendar, EventDateEntity>(result.ToList());
                r = r.GroupBy(i => i.StartDate).Select(j => j.First()).ToList();
                return r;
            }
        }

        public bool CheckPrivateTeam(long TeamId, long sessionId)
        {
            using (var context = new SportzlyDataContext())
            {
                var team = context.Teams.Where(i => i.Id == TeamId).FirstOrDefault();
                if (team != null)
                {
                    if (team.IsPrivate.HasValue)
                    {
                        if (team.IsPrivate.Value)
                        {
                            // return true;
                            TeamQuery teamQueryEntity = new TeamQuery();
                            teamQueryEntity.Id = TeamId;
                            teamQueryEntity.SessionUserId = sessionId;
                            var teams = new TeamRepository().GetTeams(teamQueryEntity);
                            if (teams.Any(rs => rs.OwnerId == teamQueryEntity.SessionUserId
                                || rs.Members.Any(rs1 => rs1.Id == teamQueryEntity.SessionUserId)))
                            {
                                return false;
                            }
                            else
                            {
                                if (teams.Any(rs => rs.IsPrivate == true))
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }

            }
        }

        public IList<NewEventEntity> GetEventDistinctDates(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                System.Web.HttpContext.Current.Session["E"] = eventQueryEntity;
               // var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false && !CheckPrivateTeam(i.TeamId, eventQueryEntity.SessionUserId.Value));
                var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false);
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;
                var members = context.TeamMembers.Where(i => i.UserId == eventQueryEntity.SessionUserId.Value && i.IsApproved == true).ToList();
                if (eventQueryEntity.EventId > 0)
                {
                    result = result.Where(rs => rs.calendarId == eventQueryEntity.EventId);
                }
                else
                {
                    if (!string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                    {
                        result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value || members.Any(i => i.TeamId == rs.TeamId));
                    }


                    //if (string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                    //{
                    //    result = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == callerEmail && (rs1.response == null || rs1.response == "YES")));
                    //}
                    //else
                    //{
                    //    result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value);
                    //}

                    if (eventQueryEntity.EventType != 0)
                    {
                        var eventTypeStr = eventQueryEntity.EventType.ToString();
                        result = result.Where(rs => rs.CalendarType == eventTypeStr);
                    }

                    result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= eventQueryEntity.StartDate);

                    if (eventQueryEntity.EndDate != DateTime.MinValue)
                        result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= eventQueryEntity.EndDate);

                }

                result = result.OrderBy(rs => rs.StartTime);

                IList<EventDateEntity> r = EntityMapper.MapList<Calendar, EventDateEntity>(result.ToList());
                r = r.GroupBy(i => i.StartDate).Select(j => j.First()).ToList();
                IList<Calendar> f = r.Select(i => new Calendar { StartTime = Convert.ToDateTime(i.StartDate) }).ToList();
                return EntityMapper.MapList<Calendar, NewEventEntity>(f);
            }
        }

        public IList<NewEventGameEntity> GetEventDistinctDatesGames(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                System.Web.HttpContext.Current.Session["E"] = eventQueryEntity;
               // var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false && !CheckPrivateTeam(i.TeamId,eventQueryEntity.SessionUserId.Value));
                var result = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false);
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;
                var members = context.TeamMembers.Where(i => i.UserId == eventQueryEntity.SessionUserId.Value && i.IsApproved == true).ToList();

                if (!string.IsNullOrWhiteSpace(eventQueryEntity.Owner))
                {
                    result = result.Where(rs => rs.userId == eventQueryEntity.SessionUserId.Value || members.Any(i => i.TeamId == rs.TeamId));
                }


                var eventTypeStr = eventQueryEntity.EventType.ToString();
                result = result.Where(rs => rs.CalendarType == eventTypeStr);


                result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value <= DateTime.Now && rs.StartTime >= DateTime.Now.AddMonths(-1));


                result = result.OrderByDescending(rs => rs.StartTime);

                IList<EventDateEntity> r = EntityMapper.MapList<Calendar, EventDateEntity>(result.ToList());
                r = r.GroupBy(i => i.StartDate).Select(j => j.First()).ToList();
                IList<Calendar> f = r.Select(i => new Calendar { StartTime = Convert.ToDateTime(i.StartDate) }).ToList();
                return EntityMapper.MapList<Calendar, NewEventGameEntity>(f);
            }
        }

        public JoinStatus GetJoinStatus(long eventId, long userId)
        {
            using (var context = new SportzlyDataContext())
            {
                var callerEmail = context.Users.First(rs => rs.Id == userId).Email;

                if (!string.IsNullOrWhiteSpace(callerEmail))
                {
                    var result = context.CalendarAttendees.AsQueryable();
                    result = result.Where(rs => rs.attendeesEmail == callerEmail && rs.calendarId == eventId);

                    if (result.Any())
                    {
                        return (JoinStatus)(result.First().response == null ? 0 : (result.First().response == "YES" ? 1 : 2));
                    }
                }

            }

            return JoinStatus.NoInfo;
        }

        public bool IsTeamMember(long eventId, long userId, long teamId)
        {
            using (var context = new SportzlyDataContext())
            {
                var members = context.TeamMembers.Where(i => i.UserId == userId && i.IsApproved == true && i.TeamId == teamId).ToList();
                var eventlst = context.Calendars.AsEnumerable().Where(i => i.IsDelete == false);
                eventlst = eventlst.Where(i => i.calendarId == eventId && members.Any(j => j.TeamId == i.TeamId));
                if (eventlst.ToList().Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }

        }

        public void JoinEvent(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;
                var result = context.CalendarAttendees.FirstOrDefault(rs => rs.calendarId == eventQueryEntity.EventId
                    && rs.attendeesEmail == callerEmail);

                if (result != null)
                {
                    result.response = eventQueryEntity.Response ? "YES" : "NO";
                    context.SaveChanges();
                }
                else
                {
                    result = new CalendarAttendee();
                    result.calendarId = eventQueryEntity.EventId;
                    result.attendeesEmail = callerEmail;
                    result.response = eventQueryEntity.Response ? "YES" : "NO";
                    result.lastUpdated = DateTime.Now;
                    context.CalendarAttendees.AddObject(result);
                    context.SaveChanges();
                }

                var Events = context.Calendars.Where(i => i.calendarId == eventQueryEntity.EventId).FirstOrDefault();
                var EventTitle = Events.CalendarType == "2" ? (EntityExtensions.GetSourceName(Events.TeamId, Events.User) + " (" + (Events.HomeGame == "Home Game" ? "Home" : "Away") + ")" + " vs " + Events.OppName + " (" + (Events.HomeGame == "Home Game" ? "Away" : "Home") + ")") : Events.Subject;
                var Name = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).FirstName + " " + context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).LastName;
                var OwnerEmail = context.Users.First(rs => rs.Id == Events.userId).Email;
                var user = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId);
                MailUtils.SendEventResponse(EventTitle, OwnerEmail, Name, eventQueryEntity.Response ? "accepted" : "declined", user.GetProfilePhoto());
            }
        }

        public IList<EventEntity> GetForthComingEvents(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable().Where(i => i.IsDelete == false);

                var user = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId);

                if (eventQueryEntity.TeamId > 0)
                {
                    result = result.Where(rs => rs.TeamId == eventQueryEntity.TeamId);
                }
                else
                {
                    result = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == user.Email && rs1.response == "YES"));
                }

                DateTime currentDate = DateTime.Now.Date;
                DateTime currentPlusSevenDate = currentDate.AddDays(7);

                result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= currentDate);

                result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value <= currentPlusSevenDate);
                result = result.OrderBy(rs => rs.StartTime);

                return EntityMapper.MapList<Calendar, EventEntity>(result.ToList());
            }
        }

        public IList<EventEntity> GetICalEvents(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable().Where(i => i.IsDelete == false);

                if (eventQueryEntity.TeamId > 0)
                {
                    result = result.Where(rs => rs.TeamId == eventQueryEntity.TeamId);
                }
                else
                {
                    result = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == eventQueryEntity.Owner && rs1.response == "YES"));
                }

                DateTime currentDate = DateTime.Now.Date;


                result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= currentDate);


                result = result.OrderBy(rs => rs.StartTime);

                return EntityMapper.MapList<Calendar, EventEntity>(result.ToList());
            }
        }

        public IList<EventEntity> GetUserEventsNotification(EventQuery eventQueryEntity)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.Calendars.AsQueryable().Where(i => i.IsDelete == false);
                var callerEmail = context.Users.First(rs => rs.Id == eventQueryEntity.SessionUserId.Value).Email;
                var members = context.TeamMembers.Where(i => i.UserId == eventQueryEntity.SessionUserId.Value && i.IsApproved == true).AsQueryable();
                if (eventQueryEntity.EventId > 0)
                {
                    result = result.Where(rs => rs.calendarId == eventQueryEntity.EventId);
                }
                else
                {

                    result = result.Where(rs => members.Any(i => i.TeamId == rs.TeamId));


                    var CalenderResult = result.Where(rs => rs.CalendarAttendees.Any(rs1 => rs1.attendeesEmail == callerEmail && (rs1.response == "NO" || rs1.response == "YES")));

                    result = result.Except(CalenderResult);

                    result = result.Where(rs => rs.StartTime.HasValue && rs.StartTime.Value >= eventQueryEntity.StartDate && rs.CalendarAttendees.Count > 0);

                    if (eventQueryEntity.EndDate != DateTime.MinValue)
                        result = result.Where(rs => rs.EndTime.HasValue && rs.EndTime.Value <= eventQueryEntity.EndDate);
                }

                result = result.OrderBy(rs => rs.StartTime);

                return EntityMapper.MapList<Calendar, EventEntity>(result.ToList());
            }
        }
    }
}
