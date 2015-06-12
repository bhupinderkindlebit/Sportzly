using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using Sportzly.Framework;

namespace Sportzly.BusinessEntities.BusinessEntity
{

    [DataContract]
    public class KeyValueEntity: BaseEntity
    {
        public const string NOT_MENTIONED = "Not Mentioned";

        public KeyValueEntity() { }

        [DataMember]
        public string Key { get; set; }

        [DataMember]
        public string Value { get; set; }

        public static KeyValueEntity Empty { get { return new KeyValueEntity(); } }

        public string ToString()
        {
            if (this.Value == null) return NOT_MENTIONED;
            return Serializer.ToJson<KeyValueEntity>(this);
        }
    }
}
