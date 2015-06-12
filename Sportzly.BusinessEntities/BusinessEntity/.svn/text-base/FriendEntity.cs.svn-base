using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Sportzly.BusinessEntities.BusinessEntity
{
    [DataContract]
    public class FriendEntity: BaseEntity
    {
        [DataMember]
        public long UserId { get; set; }
        [DataMember]
        public long FriendId { get; set; }
        [DataMember]
        public bool? IsApproved { get; set; }
    }

    [DataContract]
    public class FriendUserEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string DisplayName { get; set; }

        [DataMember]
        public string EmailId { get; set; }

        [DataMember]
        public string EncryptEmailId { get; set; }

        [DataMember]
        public string ProfileFoto { get; set; }

        [DataMember]
        public FriendshipStatus Status { get; set; }
    }

    [DataContract]
    public class PlayerFriendEntity : BaseEntity
    {
        [DataMember]
        public decimal Id { get; set; }
        [DataMember]
        public string DisplayName { get; set; }
        [DataMember]
        public string EncryptEmailId { get; set; }
        [DataMember]
        public string EmailId { get; set; }

        [DataMember]
        public string Profilephoto { get; set; }      
    }

    [DataContract]
    public enum FriendshipAction
    {
        [EnumMemberAttribute]
        Request,
        [EnumMemberAttribute]
        CancelRequest,
        [EnumMemberAttribute]
        AcceptOrDecline,
        [EnumMemberAttribute]
        Terminate
    }
}
