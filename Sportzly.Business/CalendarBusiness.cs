using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sportzly.Business
{
    public class CalendarBusiness
    {
        public ActionResult<CalendarEntity> GetCalendarList(CalendarQuery calendarQueryEntity)
        {
            ActionResult<CalendarEntity> result = new ActionResult<CalendarEntity>();

            result.Results = new CalendarRepository().GetCalendarList(calendarQueryEntity);

            return result;
        }

        public ActionResult<ResultEntity> SaveGameResult(ResultQuery resultQueryEntity)
        {
            ActionResult<ResultEntity> result = new ActionResult<ResultEntity>();

            result.Results = new CalendarRepository().SaveGameResult(resultQueryEntity);

            return result;
        }

        public ActionResult<CalendarEntity> SaveCalendar(CalendarQuery calendarQueryEntity)
        {
            ActionResult<CalendarEntity> result = new ActionResult<CalendarEntity>();

            result.Results = new CalendarRepository().SaveCalendar(calendarQueryEntity);

            return result;
        }

        public ActionResult<EventEntity> SaveEvent(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();          

            long EventId = new CalendarRepository().SaveEvent(eventQueryEntity);

            EventEntity objEE = new EventEntity();
            objEE.EventId = EventId;

            result.Results.Add(objEE);

            return result;
        }

        public ActionResult<EventEntity> CancelEvent(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();

            result.Results = new CalendarRepository().CancelEvent(eventQueryEntity);

            return result;
        }

        public ActionResult<EventEntity> GetEvents(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();

            result.Results = new CalendarRepository().GetUserEvents(eventQueryEntity);
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results.ToList().ForEach(rs => rs.IsJoining = new CalendarRepository().GetJoinStatus(rs.EventId, eventQueryEntity.SessionUserId.Value));
            result.Results.ToList().ForEach(rs => rs.IsTeamMember = new CalendarRepository().IsTeamMember(rs.EventId, eventQueryEntity.SessionUserId.Value, rs.TeamId));
            result.Results.ToList().ForEach(rs => rs.IsMy = EntityExtensions.CheckTeamAdminNew(Convert.ToInt64(eventQueryEntity.SessionUserId), rs.TeamId, context));
            return result;
        }

        public ActionResult<EventEntity> GetUserEventsNotification(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();

            result.Results = new CalendarRepository().GetUserEventsNotification(eventQueryEntity);
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results.ToList().ForEach(rs => rs.IsJoining = new CalendarRepository().GetJoinStatus(rs.EventId, eventQueryEntity.SessionUserId.Value));
            result.Results.ToList().ForEach(rs => rs.IsTeamMember = new CalendarRepository().IsTeamMember(rs.EventId, eventQueryEntity.SessionUserId.Value, rs.TeamId));
            result.Results.ToList().ForEach(rs => rs.IsMy = EntityExtensions.CheckTeamAdminNew(Convert.ToInt64(eventQueryEntity.SessionUserId), rs.TeamId, context));
            return result;
        }

        public ActionResult<EventEntity> GetUserEventsByDate(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();

            result.Results = new CalendarRepository().GetUserEventsByDate(eventQueryEntity);

            result.Results.ToList().ForEach(rs => rs.IsJoining = new CalendarRepository().GetJoinStatus(rs.EventId, eventQueryEntity.SessionUserId.Value));

            return result;
        }
        public ActionResult<NewEventEntity> GetEventDistinctDates(EventQuery eventQueryEntity)
        {
            ActionResult<NewEventEntity> result = new ActionResult<NewEventEntity>();

            result.Results = new CalendarRepository().GetEventDistinctDates(eventQueryEntity);
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsJoining = new CalendarRepository().GetJoinStatus(ev.EventId, eventQueryEntity.SessionUserId.Value)));
            result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsTeamMember = new CalendarRepository().IsTeamMember(ev.EventId, eventQueryEntity.SessionUserId.Value,ev.TeamId)));
            result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsMy = EntityExtensions.CheckTeamAdminNew(Convert.ToInt64(eventQueryEntity.SessionUserId), ev.TeamId, context)));
            return result;
        }
        public ActionResult<NewEventGameEntity> GetUserEventsByDateGame(EventQuery eventQueryEntity)
        {
            ActionResult<NewEventGameEntity> result = new ActionResult<NewEventGameEntity>();
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            result.Results = new CalendarRepository().GetEventDistinctDatesGames(eventQueryEntity);
            result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsJoining = new CalendarRepository().GetJoinStatus(ev.EventId, eventQueryEntity.SessionUserId.Value)));
            result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsTeamMember = new CalendarRepository().IsTeamMember(ev.EventId, eventQueryEntity.SessionUserId.Value, ev.TeamId)));
            result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsMy = EntityExtensions.CheckTeamAdminNew(Convert.ToInt64(eventQueryEntity.SessionUserId), ev.TeamId, context)));
            return result;
        }
        public ActionResult<EventDateEntity> GetEventDates(EventQuery eventQueryEntity)
        {
            ActionResult<EventDateEntity> result = new ActionResult<EventDateEntity>();

            result.Results = new CalendarRepository().GetEventDates(eventQueryEntity);

            return result;
        }

        public ActionResult<BaseEntity> JoinEvent(EventQuery eventQueryEntity)
        {
            ActionResult<BaseEntity> result = new ActionResult<BaseEntity>();

            new CalendarRepository().JoinEvent(eventQueryEntity);

            return result;


        }

        public ActionResult<EventEntity> GetForthComingEvents(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();

            result.Results = new CalendarRepository().GetForthComingEvents(eventQueryEntity);

            result.Results.ToList().ForEach(rs => rs.IsJoining = new CalendarRepository().GetJoinStatus(rs.EventId, eventQueryEntity.SessionUserId.Value));

            return result;

        }

        public ActionResult<EventEntity> GetICalEvents(EventQuery eventQueryEntity)
        {
            ActionResult<EventEntity> result = new ActionResult<EventEntity>();

            result.Results = new CalendarRepository().GetICalEvents(eventQueryEntity);           

            return result;

        }

        public ActionResult<PollEntity> SavePoll(PollQuery pollQueryEntity)
        {
            ActionResult<PollEntity> result = new ActionResult<PollEntity>();

            long PollId = new CalendarRepository().SavePoll(pollQueryEntity);

            PollEntity objPE = new PollEntity();
            objPE.PollId = PollId;
           
            objPE.PollExpiry = pollQueryEntity.ExpiryDate;
            

            result.Results.Add(objPE);

            return result;
        }
    }
}
