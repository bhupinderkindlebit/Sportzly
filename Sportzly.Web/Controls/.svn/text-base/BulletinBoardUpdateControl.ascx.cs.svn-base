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
    public partial class BulletinBoardUpdateControl : BaseUserControl<BulletinBoardUpdateControl>
    {
        string strMsgId = string.Empty;
        string strTeamId = string.Empty;
        long msgId, teamId;

        protected void Page_Load(object sender, EventArgs e)
        {
            strMsgId = Request.QueryString.Get("msgId");
            strTeamId = Request.QueryString.Get("teamId");

            long.TryParse(strMsgId, out msgId);
            long.TryParse(strTeamId, out teamId);

            if (msgId == 0)
                msgId = -1;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "teamId",
    string.Format(" var teamId = {0}; var msgId = {1}", teamId, msgId), true);

        }

        [UserControlScriptMethod]
        public static ActionResult<TeamNoticeEntity> GetTeamNotices(string userKey, long teamId, long parentId, int pageNumber, int recordCount)
        {
            return ApiMethods.GetTeamNotices(userKey, teamId, parentId, pageNumber, recordCount);
        }

        [UserControlScriptMethod]
        public static ActionResult<TeamNoticeEntity> UpdateNotice(string userKey, string message, long teamId, long parentId)
        {
            return ApiMethods.UpdateNotice(userKey, message, teamId, parentId);
        }
    }
}