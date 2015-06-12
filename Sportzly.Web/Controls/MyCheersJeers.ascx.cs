using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;

namespace Sportzly.Web.Controls
{
    public partial class MyCheersJeers : BaseUserControl<MyCheersJeers>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<CheersEntity> LikeDislike(string userKey, long messageId, bool isCheers)
        {
            return ApiMethods.Cheers(userKey, messageId, isCheers);
        }
    }
}