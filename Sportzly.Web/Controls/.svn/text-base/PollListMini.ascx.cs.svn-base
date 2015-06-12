using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class PollListMini : BaseUserControl<PollListMini>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [UserControlScriptMethod]
        public static ActionResult<PollEntity> GetPolls(string userKey, long teamId)
        {
            return ApiMethods.GetPolls(teamId, userKey);
        }
    }
}