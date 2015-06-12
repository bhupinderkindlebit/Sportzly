using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Sportzly.BusinessEntities.BusinessEntity
{
    [DataContract]
    public class CalendarEntity : BaseEntity
    {
        [DataMember(Order = 0)]
        public long calendarId { get; set; }
        [DataMember(Order = 1)]
        public string Subject { get; set; }
        [DataMember(Order = 10)]
        public string Description { get; set; }
        [DataMember(Order = 2)]
        public DateTime StartTime { get; set; }
        [DataMember(Order = 3)]
        public DateTime EndTime { get; set; }
        [DataMember(Order = 4)]
        public byte IsAllDayEvent { get; set; }
        [DataMember(Order = 5)]
        public int isMorethanOneDay { get; set; }
        [DataMember(Order = 6)]
        public byte IsRecurring { get; set; }
        [DataMember(Order = 7)]
        public byte Color { get; set; }
        [DataMember(Order = 8)]
        public byte IsEditable { get; set; }
        [DataMember(Order = 9)]
        public string Location { get; set; }
    }

    [DataContract]
    public class ResultEntity : BaseEntity
    {
        [DataMember]
        public string Result { get; set; }
        [DataMember]
        public string ResultUrl { get; set; }
        [DataMember]
        public string ResultFile { get; set; }
    }
    [DataContract]
    public class EventDateEntity : BaseEntity
    {
        [DataMember]
        public string StartDate { get; set; }
    }
    [DataContract]
    public class NewEventEntity : BaseEntity
    {
        [DataMember]
        public string StartDate { get; set; }
        [DataMember]
        public string FormatStartDate { get; set; }
        [DataMember]
        public IList<EventEntity> Events { get; set; }
    }
    [DataContract]
    public class NewEventGameEntity : BaseEntity
    {
        [DataMember]
        public string StartDate { get; set; }
        [DataMember]
        public string FormatStartDate { get; set; }
        [DataMember]
        public IList<EventEntity> Events { get; set; }
    }

    [DataContract]
    public class PollEntity : BaseEntity
    {
        [DataMember]
        public long PollId { get; set; }

        [DataMember]
        public long TeamId { get; set; }

        [DataMember]
        public string PollQuestion { get; set; }

        [DataMember]
        public bool PollActive { get; set; }

        [DataMember]
        public DateTime PollExpiry { get; set; }

        [DataMember]
        public List<OptoinEntity> PollOptions { get; set; }

        [DataMember]
        public bool IsTeamAdmin { get; set; }
    }
    [DataContract]
    public class EventEntity : BaseEntity
    {
        public EventEntity()
        {
            Attendees = new List<UserEntity>();
            Pending = new List<UserEntity>();
            NotAttending = new List<UserEntity>();
            
        }

        [DataMember]
        public bool IsMy { get; set; }
        [DataMember]
        public string OwnerEmail { get; set; }
        [DataMember]
        public string TimeZone { get; set; }
        [DataMember]
        public string Season { get; set; }
        [DataMember]
        public bool IsPast { get; set; }
        [DataMember]
        public bool IsTeamMember { get; set; }
        [DataMember]
        public long EventId { get; set; }
        [DataMember]
        public JoinStatus IsJoining { get; set; }
        [DataMember]
        public string StartDate { get; set; }
        [DataMember]
        public string StartTime { get; set; }
        [DataMember]
        public string EndDate { get; set; }
        [DataMember]
        public string EndTime { get; set; }
        [DataMember]
        public string FormatStartDate { get; set; }
        [DataMember]
        public long TeamId { get; set; }
        [DataMember]
        public string TeamLogoUrl { get; set; }
        [DataMember]
        public string TeamName { get; set; }
        [DataMember]
        public string TeamSports { get; set; }

        [DataMember]
        public long? OppTeamId { get; set; }
        [DataMember]
        public string OppTeamLogoUrl { get; set; }
        [DataMember]
        public string OppTeamName { get; set; }

        [DataMember]
        public string Location { get; set; }

        [DataMember]
        public string Address { get; set; }

        [DataMember]
        public string City { get; set; }

        [DataMember]
        public string State { get; set; }

        [DataMember]
        public string Country { get; set; }

        [DataMember]
        public string Comments { get; set; }
        [DataMember]
        public IList<UserEntity> Attendees { get; set; }
        [DataMember]
        public IList<UserEntity> Pending { get; set; }
        [DataMember]
        public IList<UserEntity> NotAttending { get; set; }
        [DataMember]
        public string EventType { get; set; }
        [DataMember]
        public string EventName { get; set; }
        [DataMember]
        public int AttendeeCount { get { return Attendees.Count(); } set { } }
        [DataMember]
        public IList<ResultEntity> ResultsGames { get; set; }
        [DataMember]
        public string EventTypeName { get { return GetEventTypeName(); } set { } }
        [DataMember]
        public string StartDateF { get; set; }
        [DataMember]
        public string EndDateF { get; set; }
        public string GetEventTypeName()
        {
            switch (EventType)
            {
                case "2":
                    return "Game";
                    break;
                case "3":
                    return "Practice";
                    break;
                default:
                    return "Event";
                    break;
            }
            return "Event";
        }
        
        public bool HasResponse { get { return this.IsJoining != JoinStatus.NoInfo; } }
        [DataMember]
        public string HomeGame { get; set; }
        [DataMember]
        public string OppName { get; set; }
        [DataMember]
        public bool IsTeam { get; set; }
        [DataMember]
        public bool AddResult { get; set; }
        [DataMember]
        public string MyStatus
        {
            get
            {
                return this.IsJoining == JoinStatus.Joining ? "YES" : this.IsJoining == JoinStatus.NotJoining ? "NO" : "Unknown";
            }
            set { }
        }


    }

    public enum JoinStatus
    {
        NoInfo,
        Joining,
        NotJoining

    }
}
