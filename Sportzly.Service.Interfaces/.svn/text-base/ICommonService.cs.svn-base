using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Web;
using System.Text;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Framework.Exceptions;

namespace Sportzly.Service.Interfaces
{
    [ServiceContract]
    public interface ICommonService
    {
        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetKeyValue, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetKeyValue(KeyValueQuery keyValueQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.Upload, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message Upload(UploadQuery uploadQuery);

        [OperationContract]
        [WebInvoke(UriTemplate = QueryConfig.GetAlbumPhotos, Method = "POST")]
        [FaultContract(typeof(SportzlyServiceFault))]
        Message GetAlbumPhotos(AlbumQuery albumQuery);
    }
}
