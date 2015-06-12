using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;

namespace Sportzly.BusinessEntities.QueryEntity
{
    public class FriendQuery: BaseQuery
    {
        public bool Mutual { get; set; }
        public string EmailId { get; set; }
        public long FriendId { get; set; }
        public FriendshipAction FriendshipAction { get; set; }
        public bool? Accept { get; set; }
        public string ServiceName { get; set; }
    }

    public class MailQuery : BaseQuery
    {

        public string userName { get; set; }
        public string count { get; set; }      
        public string InviteType { get; set; }
        public string TeamName { get; set; }
        public string Mode { get; set; }
        public int TeamId { get; set; }
    }
}
