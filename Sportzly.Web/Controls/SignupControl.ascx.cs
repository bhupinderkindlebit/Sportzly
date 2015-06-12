using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class SignupControl : BaseUserControl<SignupControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [UserControlScriptMethod]
        public static ActionResult<UserEntity> Signup(string email, string pwd, string userName, string token,string code)
        {
            //return ApiMethods.Signup(email, pwd, userName, token,Convert.ToDateTime(Convert.ToDateTime(dt).ToShortDateString()),code);
            return ApiMethods.Signup(email, pwd, userName, token, code);
        }

        [UserControlScriptMethod]
        public static ActionResult<UserEntity> Login(string email, string password, string token)
        {
            return ApiMethods.Login(email, password, token);
        }
    }
}