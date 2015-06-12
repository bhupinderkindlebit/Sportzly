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
    public partial class LightBoxControl : BaseUserControl<LightBoxControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<AlbumEntity> GetAlbumPhotos(string userKey, long albumId, long photoId)
        {
            return ApiMethods.GetAlbumPhotos(userKey, albumId, photoId);
        }
         [UserControlScriptMethod]
        public static string SetTeamSession(long TeamId)
        {
            HttpContext.Current.Session["TeamId"] = TeamId;
            return "1";
        }
        
    }
}