// -----------------------------------------------------------------------
// <copyright file="IActivityService.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Service.Interfaces
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.ServiceModel;
    using Sportzly.Framework;
    using System.ServiceModel.Channels;
    using Sportzly.BusinessEntities.QueryEntity;
    using System.ServiceModel.Web;
    using Sportzly.Framework.Exceptions;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    
    [ServiceContract]
    public interface IActivityService
    {

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.UpdateStatus, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message UpdateStatus(ActivityQuery activityQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.DeleteActivity, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message DeleteActivity(ActivityQuery activityQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.AlbumMessage, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message AlbumMessage(ActivityQuery activityQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.DocumentSave, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message DocumentSave(DocumentQuery documentQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetActivities, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetActivities(ActivityQuery activityQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SetCheers, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SetCheers(CheersQuery cheersQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.DeletePhoto, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message DeletePhoto(ActivityQuery activityQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.SavePhotoComment, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message SavePhotoComment(ActivityQuery activityQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetPhotoComments, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetPhotoComments(ActivityQuery activityQuery);


        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetDocuments, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetDocuments(DocumentQuery documentQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetAllDocuments, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetAllDocuments(DocumentQuery documentQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetFeeds, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetFeeds(FeedQuery feedQuery);
    }
}
