// -----------------------------------------------------------------------
// <copyright file="ActivityBusiness.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Business
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Sportzly.BusinessEntities.QueryEntity;
    using Sportzly.BusinessEntities.BusinessEntity;
    using Sportzly.BusinessEntities;
    using Sportzly.Repository;
    using Sportzly.Framework.Exceptions;
    using Sportzly.DataAccess;
    using Sportzly.Framework;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class ActivityBusiness
    {
        public ActionResult<ActivityEntity> UpdateStatus(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();
            var context = new Sportzly.DataAccess.SportzlyDataContext();
            var exception = false;
            if (activityQuery.TeamId > 0)
            {
                var team = context.Teams.Where(rs => rs.OwnerId == activityQuery.SessionUserId.Value ||
                    rs.TeamMembers.Any(rs1 => rs1.UserId.Value == activityQuery.SessionUserId.Value && rs1.IsApproved.HasValue && rs1.IsApproved.Value));

                team = team.Where(rs => rs.Id == activityQuery.TeamId);

                if (!team.Any())
                {
                    exception = true;
                }
                //  throw new Exception("You are not member of this team yet. Please join to post messages to this team");
            }

            if (!exception)
            {
                var activity = new ActivityRepository().UpdateStatus(
                                                                    activityQuery.SessionUserId.Value,
                                                                    activityQuery.Description,
                                                                    activityQuery.ParentActivity,
                                                                    true, activityQuery.TeamId, activityQuery.EventId);

                if (activity == null)
                {
                    result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
                }

                result.Results = activity;
            }
            else
            {
                result.ResultError = new ErrorEntity(UserExceptionType.Error, 0, "You are not member of this team yet. Please join to post messages to this team");
            }
            return result;
        }

        public ActionResult<ActivityEntity> GetActivities(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();

            int totalResult = 0;

            var activities = new ActivityRepository().GetActivities(activityQuery.ActivityCount, activityQuery.ParentActivity, activityQuery.UserEmail, activityQuery.ActivityType, activityQuery.TeamId, activityQuery.EventId, activityQuery.SessionUserId.Value, out totalResult);

            if (!activities.Any())
            {
                //    result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.NoMoreMessages);
            }

            result.RemainingResult = totalResult - activityQuery.ActivityCount - 15;
            result.PageSize = 15;
            result.PageFrom = activityQuery.ActivityCount;

            result.Results = activities;

            return result;
        }

        public ActionResult<CheersEntity> SetCheers(CheersQuery cheersQuery)
        {
            ActionResult<CheersEntity> result = new ActionResult<CheersEntity>();

            if (cheersQuery.SessionUserId.HasValue)
            {
                var activity = new ActivityRepository().SetCheers(cheersQuery.SessionUserId.Value, cheersQuery.ActivityId, cheersQuery.IsCheers);
                result.Results = activity;
            }
            else
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.NotLoggedIn);
            }

            return result;
        }

        public ActionResult<ActivityEntity> AlbumMessage(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();

            var activity = new ActivityRepository().SaveAlbumMessage(
                                                                activityQuery.SessionUserId.Value,
                                                                activityQuery.Description,
                                                                activityQuery.ImageIds,
                                                                activityQuery.AlbumName,
                                                                true, activityQuery.TeamId, activityQuery.AlbumId);

            if (activity == null)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
            }

            result.Results = activity;

            return result;
        }


        public ActionResult<DocumentEntity> DocumentSave(DocumentQuery documentQuery)
        {
            ActionResult<DocumentEntity> result = new ActionResult<DocumentEntity>();
            var activity = new ActivityRepository().SaveDocuments(documentQuery.SessionUserId.Value,
                                                              documentQuery.Description,
                                                              documentQuery.Files,
                                                              documentQuery.Title,
                                                              true, documentQuery.TeamId,
                                                              documentQuery.Names);
            if (activity == null)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
            }

            result.Results = activity;

            return result;
        }

        public ActionResult<DocumentEntity> GetDocuments(DocumentQuery documentQuery)
        {
            ActionResult<DocumentEntity> result = new ActionResult<DocumentEntity>();
            var activity = new ActivityRepository().GetDocuments(documentQuery.TeamId);
            if (activity == null)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
            }

            result.Results = activity;

            return result;
        }

        public ActionResult<DocumentEntity> GetAllDocuments(DocumentQuery documentQuery)
        {
            ActionResult<DocumentEntity> result = new ActionResult<DocumentEntity>();
            var activity = new ActivityRepository().GetAllDocuments(documentQuery.TeamId);
            if (activity == null)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
            }

            result.Results = activity;

            return result;
        }
        public ActionResult<ActivityEntity> DeleteActivity(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();

            new ActivityRepository().DeleteActivity(activityQuery.ParentActivity);

            return result;
        }

        public ActionResult<ActivityEntity> GetPhotoComments(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();

            int totalResult = 0;

            var activities = new ActivityRepository().GetPhotoComments(activityQuery.ActivityCount, activityQuery.TeamId, activityQuery.SessionUserId.Value, activityQuery.AlbumPhotoId, out totalResult);

            if (!activities.Any())
            {
                //    result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.NoMoreMessages);
            }

            result.RemainingResult = totalResult - activityQuery.ActivityCount - 15;
            result.PageSize = 15;
            result.PageFrom = activityQuery.ActivityCount;

            result.Results = activities;

            return result;
        }

        public ActionResult<ActivityEntity> SavePhotoComment(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();

            var activity = new ActivityRepository().SavePhotoComment(
                                                                activityQuery.SessionUserId.Value,
                                                                activityQuery.Description,
                                                                activityQuery.AlbumPhotoId,
                                                                true, activityQuery.TeamId
                                                                );

            if (activity == null)
            {
                result.ResultError = ErrorEntity.Create(UserExceptionType.Error, UserMessages.ServerError);
            }

            result.Results = activity;



            return result;
        }

        public ActionResult<ActivityEntity> DeletePhoto(ActivityQuery activityQuery)
        {
            ActionResult<ActivityEntity> result = new ActionResult<ActivityEntity>();

            new ActivityRepository().DeletePhoto(activityQuery.AlbumPhotoId);

            return result;
        }

        public ActionResult<FeedEntity> GetFeeds(FeedQuery feedQuery)
        {
            ActionResult<FeedEntity> result = new ActionResult<FeedEntity>();
            var feed = new ActivityRepository().GetFeed(feedQuery.SportId);
            result.Results = feed;
            return result;
        }
    }
}
