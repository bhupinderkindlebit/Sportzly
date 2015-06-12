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
    public partial class PlayerListControl : BaseUserControl<PlayerListControl>

    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<FriendEntity> SendFriendshipRequest(string userKey, long friendId)
        {
            return ApiMethods.SendFriendshipActionPlayer(userKey, friendId, null, FriendshipAction.Request);
        }

        [UserControlScriptMethod]
        public static ActionResult<PlayerDetailEntity> GetPlayers(string userKey)
        {

            return ApiMethods.GetPlayers(userKey);
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