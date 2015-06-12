using Sportzly.BusinessEntities;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class PollDetailControl : BaseUserControl<PollDetailControl>
    {
        [UserControlScriptMethod]
        public static ActionResult<PollEntity> GetPollData(string userKey, long id)
        {
            return ApiMethods.GetPollData(id, userKey);
        }

        [UserControlScriptMethod]
        public static ActionResult<BaseEntity> SaveOption(string userKey, long id,long OptionId)
        {
            return ApiMethods.SaveOption(userKey,id,OptionId);
        }
    }
}