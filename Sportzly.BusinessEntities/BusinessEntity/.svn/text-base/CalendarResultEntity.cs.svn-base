using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Sportzly.BusinessEntities.BusinessEntity
{
    
    [KnownTypeAttribute(typeof(CalendarEntity))]
    [KnownTypeAttribute(typeof(CalendarEntity[]))]
    public class CalendarResultEntity 
    {
        public object[] events { get; set; }
        public bool issort { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public ErrorEntity error { get; set; } 
    }

    public class CalendarUpdateResultEntity
    {
        public bool IsSuccess { get; set; }
        public string Msg { get; set; }
        public long Data { get; set; }
    }
}
