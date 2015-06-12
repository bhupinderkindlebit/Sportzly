using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class ScorecardControl : BaseUserControl<ScorecardControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [UserControlScriptMethod]
        public static ActionResult<ResultEntity> SaveGameResult(string userKey, Int64 gameId, string result, string url, string file)
        {
            return ApiMethods.SaveGameResult(userKey, gameId, result, url, file);
        }
    }
}