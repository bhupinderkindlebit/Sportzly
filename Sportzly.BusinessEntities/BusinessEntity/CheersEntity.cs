// -----------------------------------------------------------------------
// <copyright file="EmptyEntity.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.BusinessEntities.BusinessEntity
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Runtime.Serialization;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    [DataContract]
    public class CheersEntity : BaseEntity
    {
        [DataMember]
        public int Cheers { get; set; }
        [DataMember]
        public int Jeers { get; set; }
    }
}
