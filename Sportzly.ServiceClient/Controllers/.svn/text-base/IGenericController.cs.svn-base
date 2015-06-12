using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.BusinessEntities;

namespace Sportzly.ServiceClient.Controllers
{
    internal interface IGenericController
    {
        ActionResult<TEntity> FetchEntity<TEntity, TQueryEntity>(TQueryEntity searchEntity, Guid userKey)
            where TEntity : BaseEntity
            where TQueryEntity : BaseQuery;

        ActionResult<TEntity> FetchEntity<TEntity, TQueryEntity>(TQueryEntity searchEntity)
            where TEntity : BaseEntity
            where TQueryEntity : BaseQuery;

    }
}
