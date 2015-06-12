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
    public partial class PendingInvitesTeamListMiniControl : BaseUserControl<PendingInvitesTeamListMiniControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<InviteEntity> GetPendingInvitesTeam(string userKey, long teamId)
        {
            return ApiMethods.GetPendingInvitesTeam(teamId,userKey);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> ReInviteTeam(string userKey, string friends,long teamId)
        {
            return ApiMethods.InviteToTeam(userKey, friends.Trim(';'), teamId,"Pending Invites");
        }
    }
}