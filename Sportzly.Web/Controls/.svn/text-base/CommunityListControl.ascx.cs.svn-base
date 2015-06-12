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
    public partial class CommunityListControl : BaseUserControl<CommunityListControl>

    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<CommunityEntity> GetTeams(string userKey, string email, string criteria )
        {
            return ApiMethods.GetCommunities(userKey, email, criteria);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> JoinTeam(string userKey, long teamId, bool join)
        {
            return ApiMethods.JoinCommunity(userKey, teamId, join);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> FollowTeam(string userKey, long teamId, bool join)
        {
            return ApiMethods.FollowCommunity(userKey, teamId, join);
        }

    }
}