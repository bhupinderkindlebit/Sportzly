// -----------------------------------------------------------------------
// <copyright file="ActionResult.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.BusinessEntities
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Sportzly.BusinessEntities.BusinessEntity;
using System.Runtime.Serialization;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    [DataContract]
    public class ActionResult<T>
    {
        public ActionResult()
        {
            Results = new List<T>();
        }

        [DataMember]
        public ErrorEntity ResultError { get; set; }

        [DataMember]
        public IList<T> Results { get; set; }

        [DataMember]
        public int RemainingResult { get; set; }

        [DataMember]
        public int PageSize { get; set; }

        [DataMember]
        public int PageFrom { get; set; }
    }
}
