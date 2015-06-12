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
    public partial class SportzlyTeamDetailControl : BaseUserControl<SportzlyTeamDetailControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> GetTeams(string userKey, string email, long teamId)
        {
            return ApiMethods.GetTeams(userKey, email, teamId);
        }

        [UserControlScriptMethod]
        public static ActionResult<TokenEntity> GetInviteTokenTwitter(string userKey, long teamId)
        {
            return ApiMethods.GetInviteTokenTwitter(userKey, teamId);
        }
    }
}