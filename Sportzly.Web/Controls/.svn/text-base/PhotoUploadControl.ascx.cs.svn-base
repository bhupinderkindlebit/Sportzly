using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities;
using Sportzly.Framework.Attributes;

namespace Sportzly.Web.Controls
{
    public partial class PhotoUploadControl : BaseUserControl<PhotoUploadControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [UserControlScriptMethod]
        public static ActionResult<ActivityEntity> MoveImagesToAlbum(string userKey, string albumName, string imageIds, string statusMessage, long teamId, string albumId)
        {
            List<long> ids = new List<long>();
            imageIds.Split(new String[] { "|" }, StringSplitOptions.RemoveEmptyEntries).ToList().ForEach(rs => ids.Add(long.Parse(rs)));
            return ApiMethods.MoveImagesToAlbum(userKey, albumName, ids.ToArray(), statusMessage, teamId, Convert.ToInt64(albumId));
        }

        [UserControlScriptMethod]
        public static ActionResult<AlbumEntity> GetAlbumsByUser(string userKey)
        {
            return ApiMethods.GetAlbumsByUser(userKey);
        }
        
    }
}