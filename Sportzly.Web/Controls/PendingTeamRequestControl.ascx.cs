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
    public partial class PendingTeamRequestControl : BaseUserControl<PendingTeamRequestControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<TeamMemberEntity> GetTeamMembers(string userKey, string userEmail)
        {
            return ApiMethods.GetTeamMembers(userKey, userEmail);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> ApproveTeamMember(string userKey, long userId, long teamId, bool isApproved)
        {

            return ApiMethods.ApproveTeamMember(userKey, userId, teamId, isApproved);
        }
    }
}