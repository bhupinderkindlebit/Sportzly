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
    public partial class PlayerHomeControl : BaseUserControl<PlayerHomeControl>

    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }       

        [UserControlScriptMethod]
        public static ActionResult<PlayerDetailEntity> GetPlayersHome()        {

            return ApiMethods.GetPlayersHome();
        }       

    }
}