using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sportzly.BusinessEntities.QueryEntity
{
    public abstract class BaseQuery
    {
        public BaseQuery()
        {
            this.AuthenticationRequired = true;
        }

        public long? SessionUserId { get; set; }
        public string QueryPath { get; set; }
        public string ServiceUrl { get; set; }
        public bool AuthenticationRequired { get; set; }
    }
}
