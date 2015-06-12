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
    public partial class PendingInvitesListMiniControl : BaseUserControl<PendingInvitesListMiniControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<InviteEntity> GetPendingInvitesUser(string userKey)
        {
            return ApiMethods.GetPendingInvitesUser(userKey);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> ReInviteFriends(string userKey, string friends)
        {
            return ApiMethods.InviteFriends(userKey, friends.Trim(';'),"Pending Invites");
        }
    }
}