using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sportzly.BusinessEntities.QueryEntity
{
    public class UploadQuery : BaseQuery
    {
        public string FileName { get; set; }
        public UploadTypes UploadType { get; set; }
        public string Description { get; set; }
        public long TeamId { get; set; }
    }

    public class AlbumQuery : BaseQuery
    {
        public long AlbumId { get; set; }
    }

   
    public class PhotoQuery : BaseQuery
    {
        public long PhotoId { get; set; }
        public long TeamId { get; set; }
        public long AlbumId { get; set; }
    }

    public enum UploadTypes
    {
        Image,
        Video
    }
}
