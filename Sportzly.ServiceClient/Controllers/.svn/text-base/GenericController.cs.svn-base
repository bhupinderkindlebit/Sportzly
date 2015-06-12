using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Microsoft.Http;
using Sportzly.Framework;
using System.Xml.Linq;
using Sportzly.Framework.Exceptions;
using Sportzly.BusinessEntities;

namespace Sportzly.ServiceClient.Controllers
{
    internal class GenericController : IGenericController
    {
        //private static GenericController instance;

        private GenericController() { }

        public static GenericController Instance()
        {
            //if (instance == null)
            //    instance = new GenericController();
            //return instance;
            return new GenericController();
        }

        public ActionResult<TEntity> FetchEntity<TEntity, TQueryEntity>(TQueryEntity queryEntity)
            where TEntity : BaseEntity
            where TQueryEntity : BaseQuery
        {
            return FetchEntity<TEntity, TQueryEntity>(queryEntity, Guid.Empty);
        }

        public ActionResult<TEntity> FetchEntity<TEntity, TQueryEntity>(TQueryEntity queryEntity, Guid userKey)
            where TEntity : BaseEntity
            where TQueryEntity : BaseQuery
        {

            new SecurityManager().Authenticate(queryEntity, userKey);

            string content = string.Empty;

            ActionResult<TEntity> result = new ActionResult<TEntity>();
            try
            {
            using (HttpClient client = new HttpClient(queryEntity.ServiceUrl))
            {
               
                using (HttpResponseMessage response = client.Post(queryEntity.QueryPath, HttpContentExtensions.CreateDataContract(queryEntity)))
                {
                    content = response.Content.ReadAsString();
                    UserException.CreateAndThrowIf(content.Contains(QueryConfig.Fault), content);
                }
            }

           
                result = Serializer.ToActionResult<TEntity>(content);
            }
            catch { }

            return result;
        }


    }
}
