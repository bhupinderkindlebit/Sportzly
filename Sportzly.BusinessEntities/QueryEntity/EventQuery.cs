using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sportzly.BusinessEntities.QueryEntity
{
    public class EventQuery : BaseQuery
    {
        public EventQuery()
        {
            IsTeam = true;
        }

        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int EventType { get; set; }
        public string  EventTitle { get; set; }
        public int TeamId { get; set; }
        public int? OppTeamId { get; set; }
        public List<string> Attendees { get; set; }
        public int Frequency { get; set; }
        public List<int> Days { get; set; }
        public string Season { get; set; }
        public string AddressLine { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string Comments { get; set; }
        public string Owner { get; set; }
        public long EventId { get; set; }
        public bool Response { get; set; }
        public string HomeGame { get; set; }
        public string OppName { get; set; }
        public bool IsTeam { get; set; }
        public bool IsDelete { get; set; }
        public string EventDate { get; set; }
        public string TimeZone { get; set; }
    }
}
