using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Channels;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
using Sportzly.Business;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework;
using Sportzly.Framework.Exceptions;
using Sportzly.Service.Interfaces;

namespace Sportzly.Service.Implementation
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    [ExceptionShielding("WCFServicePolicy")]
    public class CommonService : ICommonService
    {

        public Message GetKeyValue(KeyValueQuery keyValueQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CommonBusiness().GetKeyValue(keyValueQuery);
                return Serializer.ToMessage<KeyValueEntity>(results);
            });
        }

        public Message Upload(UploadQuery uploadQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                switch (uploadQuery.UploadType)
                {
                    case UploadTypes.Image:
                        var resultPhoto = new CommonBusiness().UploadImage(uploadQuery);
                        return Serializer.ToMessage<ImageEntity>(resultPhoto);
                        break;
                    case UploadTypes.Video:
                        var resultVideo = new CommonBusiness().UploadVideo(uploadQuery);
                        return Serializer.ToMessage<ActivityEntity>(resultVideo);
                        return null;
                }

                return null;

            });
        }

        public Message GetAlbumPhotos(AlbumQuery albumQuery)
        {
            return SportzlyServiceFault.HandleResponse<Message>(() =>
            {
                var results = new CommonBusiness().GetAlbumPhotos(albumQuery);
                return Serializer.ToMessage<AlbumEntity>(results);
            });
        }

    }
}
