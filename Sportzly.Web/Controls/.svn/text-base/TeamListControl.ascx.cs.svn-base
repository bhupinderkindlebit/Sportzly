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
    public partial class TeamListControl : BaseUserControl<TeamListControl>

    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<TeamEntity> GetTeams(string userKey, string email, string criteria )
        {
           
            return ApiMethods.GetTeams(userKey, email, criteria);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> JoinTeam(string userKey, long teamId, bool join)
        {
            
            return ApiMethods.JoinTeam(userKey, teamId, join);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> FollowTeam(string userKey, long teamId, bool join)
        {
            
            return ApiMethods.FollowTeam(userKey, teamId, join);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> DeleteTeam(string userKey, long teamId)
        {

            return ApiMethods.DeleteTeam(userKey, teamId);
        }
        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> CheckTeamMember(string userKey, long teamId)
        {

            return ApiMethods.CheckTeamMember(userKey, teamId);
        }
    }
}