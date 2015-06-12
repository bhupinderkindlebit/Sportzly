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
    public partial class AlbumPhotosListControl : BaseUserControl<AlbumPhotosListControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<ImageThumbnailEntity> GetUserPhotosByAlbum(string userKey, string email, long teamId, long albumId)
        {
            return ApiMethods.GetUserPhotosByAlbum(userKey, email, teamId, albumId);
        }

        [UserControlScriptMethod]
        public static ActionResult<ImageEntity> GetAlbumCount(string userKey, string email, long teamId)
        {
            return ApiMethods.GetAlbumCount(userKey, email, teamId);
        }

        [UserControlScriptMethod]
        public static ActionResult<PhotoEntity> GetPhotoDetail(string userKey, long photoId, long teamId,long albumId)
        {
            return ApiMethods.GetPhotoDetail(userKey, photoId, teamId, albumId);
        }

        [UserControlScriptMethod]
        public static ActionResult<ActivityEntity> SaveComment(string userKey, string statusMessage, long photoId, long teamId)
        {
            return ApiMethods.SavePhotoComment(userKey, photoId, statusMessage, teamId);
        }

        [UserControlScriptMethod]
        public static ActionResult<ActivityEntity> GetPhotoComments(string userKey, int pageNumber, long photoId, long teamId)
        {
            return ApiMethods.GetPhotoComments(userKey, pageNumber, photoId, null, teamId);
        }

        [UserControlScriptMethod]
        public static void DeletePhoto(string userKey, long photoId)
        {
            ApiMethods.DeletePhoto(userKey, photoId);
        }

    }
}