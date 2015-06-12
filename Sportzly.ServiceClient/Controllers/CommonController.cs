using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;

namespace Sportzly.ServiceClient.Controllers
{
    public static class CommonController
    {
        public static ActionResult<KeyValueEntity> GetKeyValueCollection(KeyValueType keyValueType, string searchString, Guid userKey)
        {
            KeyValueQuery keyValueQuery = new KeyValueQuery()
                        {
                            SourceType = keyValueType,
                            QueryPath = QueryConfig.GetKeyValue,
                            SearchString = searchString,
                            ServiceUrl = AppSettingsEntity.CommonServiceUrl
                        };

            return GenericController.Instance().FetchEntity<KeyValueEntity, KeyValueQuery>(keyValueQuery, userKey);
        }

        public static ActionResult<ImageEntity> AddImageToDefault(string imageName, Guid userKey,long teamId)
        {
            UploadQuery uploadQuery = new UploadQuery()
                                        {
                                            FileName = imageName,
                                            UploadType = UploadTypes.Image,
                                            QueryPath = QueryConfig.Upload,
                                            ServiceUrl = AppSettingsEntity.CommonServiceUrl,
                                            TeamId=teamId 
                                        };
            return GenericController.Instance().FetchEntity<ImageEntity, UploadQuery>(uploadQuery, userKey);
        }

        public static ActionResult<AlbumEntity> GetAlbumPhotos(long albumId, long photoId, Guid userKey)
        {
            AlbumQuery albumQuery = new AlbumQuery()
                                    {
                                        AlbumId = albumId,
                                        QueryPath = QueryConfig.GetAlbumPhotos,
                                        ServiceUrl = AppSettingsEntity.CommonServiceUrl
                                    };

            return GenericController.Instance().FetchEntity<AlbumEntity, AlbumQuery>(albumQuery, userKey);

        }

        public static ActionResult<ActivityEntity> AddYouTubeVideo(string videoId, string description, Guid userGuid, long TeamId)
        {
            UploadQuery uploadQuery = new UploadQuery()
            {
                FileName = videoId,
                Description = description,
                UploadType = UploadTypes.Video,
                QueryPath = QueryConfig.Upload,
                ServiceUrl = AppSettingsEntity.CommonServiceUrl,
                TeamId=TeamId
            };

            return GenericController.Instance().FetchEntity<ActivityEntity, UploadQuery>(uploadQuery, userGuid);
        }
    }
}
