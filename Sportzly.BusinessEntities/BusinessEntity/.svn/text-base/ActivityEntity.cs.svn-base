// -----------------------------------------------------------------------
// <copyright file="ActivityEntity.cs" company="">
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
    public class ActivityEntity : BaseEntity
    {
        [DataMember]
        public UserEntity Owner { get; set; }

        [DataMember]
        public double Id { get; set; }

        [DataMember]
        public string Description { get; set; }

        [DataMember]
        public string MinutesAgo { get; set; }

        [DataMember]
        public double ParentId { get; set; }

        [DataMember]
        public CheersEntity Cheers { get; set; }

        [DataMember]
        public AlbumEntity Album { get; set; }

        [DataMember]
        public VideoEntity Video { get; set; }

        [DataMember]
        public DocumentEntity Doc { get; set; }

        [DataMember]
        public ActivityType ActivityType { get; set; }

    }

    [DataContract]
    public class FeedEntity : BaseEntity
    {
        [DataMember]
        public int FeedId { get; set; }

        [DataMember]
        public long ContentId { get; set; }

        [DataMember]
        public string Description { get; set; }

        [DataMember]
        public string Title { get; set; }

        [DataMember]
        public string Link { get; set; }

        [DataMember]
        public DateTime PublishedDate { get; set; }

        [DataMember]
        public string ImagePath { get; set; }

        [DataMember]
        public string VideoPath { get; set; }
    }

    [DataContract]
    public class FileEntity : BaseEntity
    {

        [DataMember]
        public string filename { get; set; }
        [DataMember]
        public string filepath { get; set; }


    }

    [DataContract]
    public class DocumentEntity : BaseEntity
    {

        [DataMember]
        public long Id { get; set; }

        [DataMember]
        public string title { get; set; }

        [DataMember]
        public string postdate { get; set; }

        [DataMember]
        public List<FileEntity> Files { get; set; }


    }
   
    [DataContract]
    public enum ActivityType
    {
        [EnumMember]
        All,
        [EnumMemberAttribute]
        Quotes,
        [EnumMemberAttribute]
        Videos,
        [EnumMemberAttribute]
        Photos,
        [EnumMemberAttribute]
        Docs
    }
}
