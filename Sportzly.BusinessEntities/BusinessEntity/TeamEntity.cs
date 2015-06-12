// -----------------------------------------------------------------------
// <copyright file="TeamEntity.cs" company="">
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
    public class TeamEntity : BaseEntity
    {
        public TeamEntity()
        {
            Members = new List<TeamMemberEntity>();
            Fans = new List<TeamMemberEntity>();
        }

        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string TeamName { get; set; }
        [DataMember]
        public int MemberCount { get; set; }
        [DataMember]
        public int FollowerCount { get; set; }

        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public string OwnerName { get; set; }
        [DataMember]
        public string PhotoPath { get; set; }

        [DataMember]
        public string EmailId { get; set; }

        [DataMember]
        public string EncryptEmailId { get; set; }

        [DataMember]
        public DateTime CreateDate { get; set; }
        [DataMember]
        public bool Joined { get; set; }
        [DataMember]
        public bool Followed { get; set; }

        [DataMember]
        public string SportsName { get; set; }
        [DataMember]
        public long SportsId { get; set; }
        [DataMember]
        public string TeamCategory { get; set; }
        [DataMember]
        public string Season { get; set; }
        [DataMember]
        public string PracticeGround { get; set; }
        [DataMember]
        public string City { get; set; }
        [DataMember]
        public string Country { get; set; }
        [DataMember]
        public string Photo { get; set; }
        [DataMember]
        public int Awards { get; set; }
        [DataMember]
        public string Website { get; set; }
        [DataMember]
        public List<TeamScheduleEntity> Schedules { get; set; }
        [DataMember]
        public IList<TeamMemberEntity> Members { get; set; }
        [DataMember]
        public IList<TeamMemberEntity> TeamAdmins { get; set; }
        [DataMember]
        public IList<TeamMemberEntity> Fans { get; set; }
        [DataMember]
        public bool MyTeam { get; set; }
        [DataMember]
        public long OwnerId { get; set; }
        [DataMember]
        public string ScoreCardUrl { get; set; }
        [DataMember]
        public List<UrlEntity> TeamUrl { get; set; }       
        [DataMember]
        public string FoundedDate { get; set; }
        [DataMember]
        public bool IsTeamAdmin { get; set; }
        [DataMember]
        public bool IsPrivate { get; set; }
        [DataMember]
        public bool IsAccess { get; set; }
    }

    [DataContract]
    public class TeamLogoEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }       
        [DataMember]
        public string TeamName { get; set; }  
        [DataMember]
        public string Photo { get; set; }        

    }

    [DataContract]
    public class TeamMemberEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public long TeamId { get; set; }
        [DataMember]
        public string TeamName { get; set; }
        [DataMember]
        public long OwnerId { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public string EmailId { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string EncryptEmailId { get; set; }
        [DataMember]
        public string Photo { get; set; }
        [DataMember]
        public bool Phone { get; set; }
        [DataMember]
        public bool IsApproved { get; set; }
        [DataMember]
        public DateTime? JoinDate { get; set; }
        [DataMember]
        public bool IsMyTeam { get; set; }
        [DataMember]
        public bool IsTeamAdmin { get; set; }
    }


    [DataContract]
    public class TeamScheduleEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public long TeamId { get; set; }
        [DataMember]
        public string Season { get; set; }
        [DataMember]
        public int Year { get; set; }
    }

    [DataContract]
    public class TokenEntity : BaseEntity
    {
        [DataMember]
        public string Token { get; set; }

        [DataMember]
        public string MailHTML { get; set; }
    }

    [DataContract]
    public class TeamNoticeEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public long TeamId { get; set; }
        [DataMember]
        public long OwnerId { get; set; }
        [DataMember]
        public string OwnerName { get; set; }
        [DataMember]
        public string PhotoPath { get; set; }
        [DataMember]
        public string EmailId { get; set; }
        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public string CreateDate { get; set; }
        [DataMember]
        public string PageText { get; set; }
        [DataMember]
        public string EncryptEmailId { get; set; }
        [DataMember]
        public bool MyTeam { get; set; }
    }

    [DataContract]
    public class CommunityEntity : BaseEntity
    {

        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string CommunityName { get; set; }
        [DataMember]
        public int MemberCount { get; set; }
        [DataMember]
        public int FollowerCount { get; set; }

        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public string OwnerName { get; set; }
        [DataMember]
        public string PhotoPath { get; set; }

        [DataMember]
        public string EmailId { get; set; }
        [DataMember]
        public DateTime CreateDate { get; set; }
        [DataMember]
        public bool Joined { get; set; }
        [DataMember]
        public bool Followed { get; set; }


    }
}
