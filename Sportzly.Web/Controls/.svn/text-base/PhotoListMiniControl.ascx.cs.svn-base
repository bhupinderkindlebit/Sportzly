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
    public partial class PhotoListMiniControl : BaseUserControl<PhotoListMiniControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HideHeader)
                this.headder.Visible = false;
        }

        public bool HideHeader
        {
            get;
            set;
        }

        [UserControlScriptMethod]
        public static ActionResult<ImageEntity> GetUserPhotos(string userKey, string email, long teamId)
        {
            return ApiMethods.GetUserPhotos(userKey, email, teamId);
        }
        [UserControlScriptMethod]
        public static ActionResult<ImageThumbnailEntity> GetUserPhotosNew(string userKey, string email, long teamId)
        {
            return ApiMethods.GetUserPhotosNew(userKey, email, teamId);
        }
    }
}