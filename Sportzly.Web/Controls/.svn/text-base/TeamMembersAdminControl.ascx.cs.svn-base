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
    public partial class TeamMembersAdminControl : BaseUserControl<TeamMembersAdminControl>
    {
        TeamMemberEntity teamObj = null;
        string userKey = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            userKey = this.CurrentUser.UserKey.ToString();

            string teamStr = Request.Url.Query;

            if (!string.IsNullOrEmpty(teamStr))
            {
                int teamId;
                int.TryParse(teamStr.Replace("?", ""), out teamId);

                var result = ApiMethods.GetTeamAdmins(userKey, teamId);
                teamObj = result.Results.FirstOrDefault();
                if (teamObj == null)
                {
                    saveBtn.Disabled = false;
                }
                else
                {
                    if (teamObj.IsMyTeam)
                    {
                        saveBtn.Disabled = false;
                    }
                    else
                    {
                        saveBtn.Disabled = true;
                        saveBtn.Attributes["class"] = "save button buttonblue1";
                    }
                }
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<TeamMemberEntity> GetTeamMembersApproved(string userKey, long teamId)
        {

            return ApiMethods.GetTeamMembersApproved(userKey, teamId);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> ApprovedTeamAdmin(string userKey, string members, long teamId)
        {
            return ApiMethods.ApprovedTeamAdmin(userKey, members.Trim(','), teamId);
        }
    }
}