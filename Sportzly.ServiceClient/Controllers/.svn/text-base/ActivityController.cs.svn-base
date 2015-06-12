// -----------------------------------------------------------------------
// <copyright file="ActivityController.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.ServiceClient.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Sportzly.BusinessEntities.BusinessEntity;
    using Sportzly.BusinessEntities;
    using Sportzly.BusinessEntities.QueryEntity;
    using Sportzly.Framework;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class ActivityController
    {
        public static ActionResult<ActivityEntity> UpdateStatus(Guid userKey, string statusMessage, Nullable<long> parentId, long teamId, long eventId)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                EventId = eventId,
                TeamId = teamId,
                Description = statusMessage,
                ParentActivity = parentId,
                QueryPath = QueryConfig.UpdateStatus,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,

            };

            return GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userKey);
        }

        public static ActionResult<ActivityEntity> GetActivities(Guid userKey, int pageNumber, Nullable<long> parentActivity, string userEmail, ActivityType activityType, long teamId, long eventId)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                ActivityCount = pageNumber,
                TeamId = teamId,
                EventId = eventId,
                UserEmail = userEmail,
                ActivityType = activityType,
                QueryPath = QueryConfig.GetActivities,
                ParentActivity = parentActivity,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,
            };

            return GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userKey);

        }

        public static ActionResult<CheersEntity> SetCheers(Guid userKey, long messageId, bool isCheers)
        {
            CheersQuery cheersQuery = new CheersQuery()
            {
                ActivityId = messageId,
                IsCheers = isCheers,
                QueryPath = QueryConfig.SetCheers,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,
            };

            return GenericController.Instance().FetchEntity<CheersEntity, CheersQuery>(cheersQuery, userKey);
        }

        public static ActionResult<ActivityEntity> MoveImagesToAlbum(string albumName, long[] imageIds, string statusMessage, long teamId, Guid userKey, long albumId)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                Description = statusMessage,
                ImageIds = imageIds,
                AlbumName = albumName,
                TeamId = teamId,
                QueryPath = QueryConfig.AlbumMessage,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,
                AlbumId = albumId
            };

            return GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userKey);
        }

        public static ActionResult<DocumentEntity> DocumentSave(string title, string files, string statusMessage, long teamId, Guid userKey,string names)
        {
            DocumentQuery documentQuery = new DocumentQuery()
            {
                Description = statusMessage,
                Files = files,
                Title = title,
                TeamId = teamId,
                QueryPath = QueryConfig.DocumentSave,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl ,
                Names=names
                
            };

            return GenericController.Instance().FetchEntity<DocumentEntity, DocumentQuery>(documentQuery, userKey);
        }

        public static ActionResult<DocumentEntity> GetDocuments(long teamId, Guid userKey)
        {
            DocumentQuery documentQuery = new DocumentQuery()
            {              
                TeamId = teamId,
                QueryPath = QueryConfig.GetDocuments,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl                

            };

            return GenericController.Instance().FetchEntity<DocumentEntity, DocumentQuery>(documentQuery, userKey);
        }


        public static ActionResult<DocumentEntity> GetAllDocuments(long teamId, Guid userKey)
        {
            DocumentQuery documentQuery = new DocumentQuery()
            {
                TeamId = teamId,
                QueryPath = QueryConfig.GetAllDocuments,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl

            };

            return GenericController.Instance().FetchEntity<DocumentEntity, DocumentQuery>(documentQuery, userKey);
        }
        public static void DeleteActivity(Guid userGuid, long activityId)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                ParentActivity = activityId,
                QueryPath = QueryConfig.DeleteActivity,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,

            };

            GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userGuid);
        }

        public static void DeletePhoto(Guid userGuid, long photoId)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                AlbumPhotoId = photoId,
                QueryPath = QueryConfig.DeletePhoto,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,

            };

            GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userGuid);
        }

        public static ActionResult<ActivityEntity> SavePhotoComment(long imageIds, string statusMessage, long teamId, Guid userKey)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                Description = statusMessage,
                AlbumPhotoId = imageIds,
                TeamId = teamId,
                QueryPath = QueryConfig.SavePhotoComment,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl

            };

            return GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userKey);
        }

        public static ActionResult<ActivityEntity> GetPhotoComments(Guid userKey, int pageNumber, long photoId, string userEmail, long teamId)
        {
            ActivityQuery activityQuery = new ActivityQuery()
            {
                ActivityCount = pageNumber,
                TeamId = teamId,
                UserEmail = userEmail,
                QueryPath = QueryConfig.GetPhotoComments,
                AlbumPhotoId = photoId,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,
            };

            return GenericController.Instance().FetchEntity<ActivityEntity, ActivityQuery>(activityQuery, userKey);

        }

        public static ActionResult<FeedEntity> GetFeeds(Guid userKey, int sportId)
        {
            FeedQuery feedQuery = new FeedQuery()
            {
                SportId = sportId,
                QueryPath = QueryConfig.GetFeeds,
                ServiceUrl = AppSettingsEntity.ActivityServiceUrl,

            };

            return GenericController.Instance().FetchEntity<FeedEntity, FeedQuery>(feedQuery, userKey);
        }
    }
}
