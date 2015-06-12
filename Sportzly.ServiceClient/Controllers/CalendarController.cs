using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sportzly.ServiceClient.Controllers
{
    public static class CalendarController
    {
        public static ActionResult<CalendarEntity> GetCalendarList(Guid userKey, DateTime startDate, DateTime endDate, string viewType, string calendarType, long typeId)
        {
            CalendarQuery calendarQuery = new CalendarQuery()
            {
                StartDate = startDate,
                EndDate = endDate,
                ViewType = viewType,
                CalendarType = calendarType,
                TypeId = typeId,
                QueryPath = QueryConfig.GetCalendarList,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            return GenericController.Instance().FetchEntity<CalendarEntity, CalendarQuery>(calendarQuery, userKey);
        }

        public static ActionResult<CalendarEntity> UpdateCalendar(Guid userKey, CalendarEntity calendarEntity, string calendarType, long typeId)
        {
            CalendarQuery calendarQuery = new CalendarQuery()
            {
                Entity = calendarEntity,
                CalendarType = calendarType,
                TypeId = typeId,
                QueryPath = QueryConfig.SaveCalendar,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,
                AuthenticationRequired = false,
            };

            return GenericController.Instance().FetchEntity<CalendarEntity, CalendarQuery>(calendarQuery, userKey);
        }

        public static ActionResult<EventEntity> SaveEvent(Guid userKey, EventQuery eventQuery)
        {
            eventQuery.QueryPath = QueryConfig.SaveEvent;
            eventQuery.ServiceUrl = AppSettingsEntity.CalendarServiceUrl;

            return GenericController.Instance().FetchEntity<EventEntity, EventQuery>(eventQuery, userKey);
        }

        public static ActionResult<EventEntity> CancelEvent(Guid userKey, long eventId)
        {
            EventQuery resultQuery = new EventQuery()
            {
                QueryPath = QueryConfig.CancelEvent,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,
                EventId=eventId,
                Frequency=1

            };


            return GenericController.Instance().FetchEntity<EventEntity, EventQuery>(resultQuery, userKey);
        }

        public static ActionResult<ResultEntity> SaveGameResult(Guid userKey, Int64 gameId, string result, string url, string file)
        {
            ResultQuery resultQuery = new ResultQuery()
            {
                GameId = gameId,
                Result = result,
                ResultUrl = url,
                ResultFile = file,
                QueryPath = QueryConfig.SaveGameResult,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };           

            return GenericController.Instance().FetchEntity<ResultEntity, ResultQuery>(resultQuery, userKey);
        }

        public static ActionResult<EventEntity> GetEvents(Guid userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventType = eventTypeId,
                EventId = eventId,
                StartDate = fromDate,
                Owner = userEmail,
                QueryPath = QueryConfig.GetEvents,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<EventEntity, EventQuery>(calendarQuery, userKey);

           // result.Results.ToList().ForEach(rs => rs.IsMy = SecurityManager.Authenticate(userKey).EmailId == rs.OwnerEmail);

            return result;
        }

        public static ActionResult<EventEntity> GetUserEventsNotification(Guid userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventType = eventTypeId,
                EventId = eventId,
                StartDate = fromDate,
                Owner = userEmail,
                QueryPath = QueryConfig.GetUserEventsNotification,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<EventEntity, EventQuery>(calendarQuery, userKey);

           // result.Results.ToList().ForEach(rs => rs.IsMy = SecurityManager.Authenticate(userKey).EmailId == rs.OwnerEmail);

            return result;
        }

        public static ActionResult<EventEntity> GetUserEventsByDate(Guid userKey, string userEmail, string fromDate, int eventTypeId, long eventId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventType = eventTypeId,
                EventId = eventId,
                EventDate = fromDate,
                Owner = userEmail,
                QueryPath = QueryConfig.GetUserEventsByDate,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<EventEntity, EventQuery>(calendarQuery, userKey);

            //result.Results.ToList().ForEach(rs => rs.IsMy = SecurityManager.Authenticate(userKey).EmailId == rs.OwnerEmail);

            return result;
        }

        public static ActionResult<EventDateEntity> GetEventDates(Guid userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventType = eventTypeId,
                EventId = eventId,
                StartDate = fromDate,
                Owner = userEmail,
                QueryPath = QueryConfig.GetEventDates,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<EventDateEntity, EventQuery>(calendarQuery, userKey);
            return result;
        }

        public static ActionResult<NewEventEntity> GetEventDistinctDates(Guid userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventType = eventTypeId,
                EventId = eventId,
                StartDate = fromDate,
                Owner = userEmail,
                QueryPath = QueryConfig.GetEventDistinctDates,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<NewEventEntity, EventQuery>(calendarQuery, userKey);
           // result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsMy = SecurityManager.Authenticate(userKey).EmailId == ev.OwnerEmail));
            return result;
        }

        public static ActionResult<NewEventGameEntity> GetUserEventsByDateGame(Guid userKey, string userEmail, DateTime fromDate, int eventTypeId, long eventId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventType = eventTypeId,
                EventId = eventId,
                StartDate = fromDate,
                Owner = userEmail,
                QueryPath = QueryConfig.GetUserEventsByDateGame,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<NewEventGameEntity, EventQuery>(calendarQuery, userKey);
         //   result.Results.ToList().ForEach(rs => rs.Events.ToList().ForEach(ev => ev.IsMy = SecurityManager.Authenticate(userKey).EmailId == ev.OwnerEmail));
            return result;
        }

        public static ActionResult<BaseEntity> JoinEvent(Guid userKey, long eventId, bool response)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                EventId = eventId,
                Response = response,
                QueryPath = QueryConfig.JoinEvent,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            return GenericController.Instance().FetchEntity<BaseEntity, EventQuery>(calendarQuery, userKey);
        }

        public static ActionResult<EventEntity> GetForthComingEvents(Guid userKey, int teamId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                TeamId = teamId,
                QueryPath = QueryConfig.GetForthComingEvents,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,

            };

            var result = GenericController.Instance().FetchEntity<EventEntity, EventQuery>(calendarQuery, userKey);

          //  result.Results.ToList().ForEach(rs => rs.IsMy = SecurityManager.Authenticate(userKey).EmailId == rs.OwnerEmail);

            return result;
        }

        public static ActionResult<EventEntity> GetICalEvents(string owner, int teamId)
        {
            EventQuery calendarQuery = new EventQuery()
            {
                TeamId = teamId,
                Owner=owner,
                QueryPath = QueryConfig.GetICalEvents,
                ServiceUrl = AppSettingsEntity.CalendarServiceUrl,
                AuthenticationRequired = false
            };

            var result = GenericController.Instance().FetchEntity<EventEntity, EventQuery>(calendarQuery);        

            return result;
        }
        public static ActionResult<PollEntity> SavePoll(Guid userKey, PollQuery pollQuery)
        {
            pollQuery.QueryPath = QueryConfig.SavePoll;
            pollQuery.ServiceUrl = AppSettingsEntity.CalendarServiceUrl;

            return GenericController.Instance().FetchEntity<PollEntity, PollQuery>(pollQuery, userKey);
        }
    }
}
