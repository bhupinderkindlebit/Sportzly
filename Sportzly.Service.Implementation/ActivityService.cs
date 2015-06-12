// -----------------------------------------------------------------------
// <copyright file="ActivityService.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Service.Implementation
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.ServiceModel.Activation;
    using System.ServiceModel;
    using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
    using Sportzly.Service.Interfaces;
using System.ServiceModel.Channels;
using Sportzly.BusinessEntities.QueryEntity;
    using Sportzly.Business;
    using Sportzly.BusinessEntities.BusinessEntity;
    using Sportzly.Framework;
    using Sportzly.Framework.Exceptions;


    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    [ExceptionShielding("WCFServicePolicy")]
    public class ActivityService : IActivityService
    {

        public Message UpdateStatus(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().UpdateStatus(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }
        public Message DeleteActivity(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().DeleteActivity(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }
        public Message AlbumMessage(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().AlbumMessage(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }


        public Message DocumentSave(DocumentQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().DocumentSave(activityQuery);
                return Serializer.ToMessage<DocumentEntity>(results);
            });
        }

        public Message GetDocuments(DocumentQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().GetDocuments(activityQuery);
                return Serializer.ToMessage<DocumentEntity>(results);
            });
        }

        public Message GetAllDocuments(DocumentQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().GetAllDocuments(activityQuery);
                return Serializer.ToMessage<DocumentEntity>(results);
            });
        }

        public Message GetActivities(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().GetActivities(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }

        public Message SetCheers(CheersQuery cheersQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().SetCheers(cheersQuery);
                return Serializer.ToMessage<CheersEntity>(results);
            });
        }

        public Message DeletePhoto(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().DeletePhoto(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }

        public Message SavePhotoComment(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().SavePhotoComment(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }

        public Message GetPhotoComments(ActivityQuery activityQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().GetPhotoComments(activityQuery);
                return Serializer.ToMessage<ActivityEntity>(results);
            });
        }

        public Message GetFeeds(FeedQuery feedQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new ActivityBusiness().GetFeeds(feedQuery);
                return Serializer.ToMessage<FeedEntity>(results);
            });
        }

    }
}
