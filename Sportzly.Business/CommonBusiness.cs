using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Repository;

namespace Sportzly.Business
{
    public class CommonBusiness
    {
        public ActionResult<KeyValueEntity> GetKeyValue(KeyValueQuery keyValueQuery)
        {
            var result = new ActionResult<KeyValueEntity>();

            IList<KeyValueEntity> results = new CommonRepository().GetKeyValue(keyValueQuery.SourceType, keyValueQuery.SearchString);

            result.Results = results;

            return result;
        }

        public ActionResult<ImageEntity> UploadImage(UploadQuery uploadQuery)
        {
            var result = new ActionResult<ImageEntity>();

            IList<ImageEntity> results = new CommonRepository().UploadImage(uploadQuery.FileName, uploadQuery.SessionUserId, "Default", uploadQuery.TeamId);

            result.Results = results;

            return result;
        }

        public ActionResult<AlbumEntity> GetAlbumPhotos(AlbumQuery albumQuery)
        {
            var result = new ActionResult<AlbumEntity>();

            IList<AlbumEntity> results = new CommonRepository().GetAlbumPhotos(albumQuery.AlbumId);

            result.Results = results;

            return result;
        }

        public ActionResult<ActivityEntity> UploadVideo(UploadQuery uploadQuery)
        {
            var result = new ActionResult<ActivityEntity>();

            IList<ActivityEntity> results = new CommonRepository().UploadVideo(uploadQuery.FileName, uploadQuery.Description, uploadQuery.SessionUserId,uploadQuery.TeamId);

            result.Results = results;

            return result;
        }
    }
}
