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
    public partial class PendingFriendsControl : BaseUserControl<PendingFriendsControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [UserControlScriptMethod]
        public static ActionResult<FriendUserEntity> GetPendingUserFriends(string userKey, string email, bool mutual)
        {
            return ApiMethods.GetPendingUserFriends(userKey, email, mutual);
        }
        [UserControlScriptMethod]
        public static ActionResult<FriendEntity> RespondFriendshipRequest(string userKey, long friendId, bool accept)
        {
            return ApiMethods.SendFriendshipAction(userKey, friendId, accept, FriendshipAction.AcceptOrDecline);
        }
    }
}