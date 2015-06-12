// -----------------------------------------------------------------------
// <copyright file="GroupEntity.cs" company="">
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
    public class ImageEntity: BaseEntity
    {
        [DataMember]
        public long Id { get; set; }

        [DataMember]
        public string FilePath { get; set; }

        [DataMember]
        public string AlbumName { get; set; }

        [DataMember]
        public decimal OwnerId { get; set; }

        [DataMember]
        public int AlbumCount { get; set; }

        [DataMember]
        public long AlbumId { get; set; }
    }

    [DataContract]
    public class ImageThumbnailEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }

        [DataMember]
        public string FilePath { get; set; }

        [DataMember]
        public string AlbumName { get; set; }

        [DataMember]
        public decimal OwnerId { get; set; }

        [DataMember]
        public int AlbumCount { get; set; }

        [DataMember]
        public long AlbumId { get; set; }
    }

    [DataContract]
    public class AlbumEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public List<ImageEntity> Photos { get; set; }
    }

    [DataContract]
    public class AlbumListEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public int PhotosCount { get; set; }
        [DataMember]
        public int TotalPhotosCount { get; set; }
        [DataMember]
        public string CoverPath { get; set; }

    }

    [DataContract]
    public class PhotoEntity : BaseEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string ImagePath { get; set; }
        [DataMember]
        public bool IsOwner { get; set; }

    }
}
