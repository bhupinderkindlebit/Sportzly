using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Sportzly.BusinessEntities.BusinessEntity
{
    [DataContract]
    public class UserEntity : BaseEntity
    {

        [DataMember]
        public long Id { get; set; }

        [DataMember]
        public string EncryptEmailId { get; set; }

        [DataMember]
        public string UserName { get; set; }

        [DataMember]
        public string DisplayName { get; set; }

        [DataMember]
        public string EmailId { get; set; }

        [DataMember]
        public Guid UserKey { get; set; }

        [DataMember]
        public string ProfileFoto { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public int GenderId { get; set; }

        [DataMember]
        public bool Verified { get; set; }

        [DataMember]
        public DateTime? LastActivity { get; set; }

        //[DataMember]
        //public string MaritalStatus { get; set; }

        //[DataMember]
        //public string DateOfBirth { get; set; }

        //[DataMember]
        //public string Gender { get; set; }


        //[DataMember]
        //public string Summary { get; set; }

        //[DataMember]
        //public string Phone { get; set; }

        //[DataMember]
        //public KeyValueEntity Country { get; set; }

        //[DataMember]
        //public KeyValueEntity City { get; set; }

        //[DataMember]
        //public string ZIP { get; set; }

        //[DataMember]
        //public Nullable<DateTime> DOB { get; set; }

        //[DataMember]
        //public int MaritalStatusId { get; set; }

        //[DataMember]
        //public int GenderId { get; set; }
        [DataMember]
        public List<KeyValueEntity> Teams { get; set; }
    }

    [DataContract]
    public class UserNewEntity : BaseEntity
    {
        [DataMember]
        public string Password { get; set; }
    }

    [DataContract]
    public class InviteEntity : BaseEntity
    {
        [DataMember]
        public string Email { get; set; }
    }

    [DataContract]
    public enum FriendshipStatus
    {
        [EnumMemberAttribute]
        Self,
        [EnumMemberAttribute]
        None,
        [EnumMemberAttribute]
        Requested,
        [EnumMemberAttribute]
        RequestRecieved,
        [EnumMemberAttribute]
        Approved,
        [EnumMemberAttribute]
        DeclineSent,
        [EnumMemberAttribute]
        DeclineRecieved,
        [EnumMemberAttribute]
        Blocked
    }


}
