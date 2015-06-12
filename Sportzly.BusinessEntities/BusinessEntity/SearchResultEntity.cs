using Sportzly.BusinessEntities.QueryEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sportzly.BusinessEntities.BusinessEntity
{
    public class SearchResultEntity : BaseEntity
    {
        public SearchTypes SearchType { get; set; }
        public UserDetailEntity UserResult { get; set; }
        public TeamEntity TeamResult { get; set; }
    }
}
