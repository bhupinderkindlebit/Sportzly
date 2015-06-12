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
    public partial class FeedControl : BaseUserControl<FeedControl>
    {
        [UserControlScriptMethod]
        public static ActionResult<FeedEntity> GetFeedData(string userKey, int id)
        {
            return ApiMethods.GetFeeds(userKey,id);
        }

        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> GetTeams(string userKey, string email, long teamId)
        {
            return ApiMethods.GetTeams(userKey, email, teamId);
        }

        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }
    }
}