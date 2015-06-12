using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.BusinessEntities.QueryEntity;

namespace Sportzly.Web.Controls
{
    public partial class UserDetailsControl : BaseUserControl<UserDetailsControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [UserControlScriptMethod]
        public static ActionResult<UserDetailEntity> GetUserDetail(string userKey, string email)
        {
            return ApiMethods.GetUserDetails(userKey, email);
        }

        [UserControlScriptMethod]
        public static ActionResult<FriendEntity> SendFriendshipRequest(string userKey, long friendId)
        {
            return ApiMethods.SendFriendshipAction(userKey, friendId, null, FriendshipAction.Request);
        }

       

        [UserControlScriptMethod]
        public static ActionResult<FriendEntity> CancelFriendshipRequest(string userKey, long friendId)
        {
            return ApiMethods.SendFriendshipAction(userKey, friendId, null, FriendshipAction.CancelRequest);
        }

        [UserControlScriptMethod]
        public static ActionResult<FriendEntity> RespondFriendshipRequest(string userKey, long friendId, bool accept)
        {
            return ApiMethods.SendFriendshipAction(userKey, friendId, accept, FriendshipAction.AcceptOrDecline);
        }

        [UserControlScriptMethod]
        public static ActionResult<FriendEntity> EndFriendship(string userKey, long friendId)
        {
            return ApiMethods.SendFriendshipAction(userKey, friendId, null, FriendshipAction.Terminate);
        }


    }
}