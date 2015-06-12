using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Sportzly.BusinessEntities.BusinessEntity
{
    [DataContract]
    public class UserDetailEntity : BaseEntity
    {
        public UserDetailEntity()
        {
            this.Teams = new List<KeyValueEntity>();
            this.ActiveTeams = new List<KeyValueEntity>();
            this.Groups = new List<KeyValueEntity>();
            this.Awards = new List<AwardEntity>();
        }

        [DataMember]
        public string EncryptEmailId { get; set; }

        [DataMember]
        public long Id { get; set; }

        [DataMember]
        public string UserName { get; set; }

        [DataMember]
        public string DisplayName { get; set; }

        [DataMember]
        public string EmailId { get; set; }

        [DataMember]
        public Guid UserKey { get; set; }

        [DataMember]
        public string MaritalStatus { get; set; }

        [DataMember]
        public string DateOfBirth { get; set; }

        [DataMember]
        public string Gender { get; set; }

        [DataMember]
        public string ProfileFoto { get; set; }

        [DataMember]
        public DateTime? LastActivity { get; set; }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public List<KeyValueEntity> Teams { get; set; }

        [DataMember]
        public List<KeyValueEntity> ActiveTeams { get; set; }

        [DataMember]
        public List<TeamLogoEntity> ActiveTeamsLogos { get; set; }

        [DataMember]
        public List<KeyValueEntity> Groups { get; set; }

        [DataMember]
        public List<AwardEntity> Awards { get; set; }

        [DataMember]
        public KeyValueEntity FavSports { get; set; }

        [DataMember]
        public int? SportsTag { get; set; }

        [DataMember]
        public string OtherSportsTag { get; set; }

        [DataMember]
        public int? Level{ get; set; }

        [DataMember]
        public string OtherLevel { get; set; }

        [DataMember]
        public string Summary { get; set; }

        [DataMember]
        public string Phone { get; set; }

        [DataMember]
        public KeyValueEntity Country { get; set; }

        [DataMember]
        public KeyValueEntity City { get; set; }

        [DataMember]
        public string ZIP { get; set; }

        [DataMember]
        public Nullable<DateTime> DOB { get; set; }

        [DataMember]
        public int MaritalStatusId { get; set; }

        [DataMember]
        public int GenderId { get; set; }

        [DataMember]
        public string Collage { get; set; }

        [DataMember]
        public string HighSchool { get; set; }

        [DataMember]
        public string MiddleSchool { get; set; }

        [DataMember]
        public FriendshipStatus FriendshipStatus { get; set; }

        [DataMember]
        public int? CarrierValue { get; set; }

        [DataMember]
        public int TeamCount { get; set; } 

    }

    [DataContract]
    public class PlayerDetailEntity : BaseEntity
    {       

        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string EncryptEmailId { get; set; }
        [DataMember]
        public string DisplayName { get; set; }

        [DataMember]
        public string EmailId { get; set; }
        [DataMember]
        public bool MyFriend { get; set; }
     
        [DataMember]
        public string ProfilePhoto { get; set; }

        [DataMember]
        public long FriendCount { get; set; }      

        [DataMember]
        public List<PlayerFriendEntity> Friends { get; set; }
        [DataMember]
        public List<PlayerFriendEntity> Friends1 { get; set; }

        [DataMember]
        public string FavSports { get; set; }
       
        [DataMember]
        public string Level { get; set; }

        [DataMember]
        public string Role { get; set; }
      

        [DataMember]
        public string Summary { get; set; }       

        [DataMember]
        public string Country { get; set; }
        [DataMember]
        public FriendshipStatus Status { get; set; }
        [DataMember]
        public string City { get; set; }
    
    }
}
