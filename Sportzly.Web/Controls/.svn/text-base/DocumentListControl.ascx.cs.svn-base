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
    public partial class DocumentListControl : BaseUserControl<DocumentListControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string teamStr = Request.Url.Query;

            if (!string.IsNullOrEmpty(teamStr))
            {
                int teamId;
                int.TryParse(teamStr.Replace("?", ""), out teamId);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "teamId",
    string.Format(" var teamId = {0};", teamId), true);
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<DocumentEntity> GetAllDocuments(string userKey, long teamId)
        {
            return ApiMethods.GetAllDocuments(userKey, teamId);
        }


    }
}