using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class SportzlyHeaderControl : BaseUserControl<SportzlyHeaderControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser != null)
            {
                logoutLink.Attributes.Add("href", string.Format("~/default.aspx?q={0}", CurrentUser.UserKey));
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "userId",
    string.Format(" var userId = {0};", CurrentUser.Id), true);
            }
        }
    }
}