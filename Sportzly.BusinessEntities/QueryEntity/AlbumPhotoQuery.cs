using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.Framework;

namespace Sportzly.BusinessEntities.QueryEntity
{
    public class AlbumPhotoQuery : BaseQuery
    {       
        public string EmailId { get; set; }
        public long TeamId { get; set; }
        public long AlbumId { get; set; }
    }
}
