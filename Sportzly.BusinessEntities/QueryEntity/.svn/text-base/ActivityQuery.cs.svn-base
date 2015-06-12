
// -----------------------------------------------------------------------
// <copyright file="ActivityQuery.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.BusinessEntities.QueryEntity
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class ActivityQuery : BaseQuery
    {
        public string Description { get; set; }
        public string UserEmail { get; set; }
        public Nullable<long> ParentActivity { get; set; }
        public int ActivityCount { get; set; }
        public long[] ImageIds { get; set; }
        public string AlbumName { get; set; }
        public ActivityType ActivityType { get; set; }
        public long TeamId { get; set; }
        public long AlbumId { get; set; }
        public long EventId { get; set; }
        public long AlbumPhotoId { get; set; }
    }

    public class DocumentQuery : BaseQuery
    {
        public string Description { get; set; }
        public string Files { get; set; }     
        public string Title { get; set; }      
        public long TeamId { get; set; }
        public string Names { get; set; }
    }

    public class FeedQuery : BaseQuery
    {
        public int SportId { get; set; }
    }

    public class CheersQuery : BaseQuery
    {
        public bool IsCheers { get; set; }
        public long ActivityId { get; set; }

    }
}
