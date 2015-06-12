using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using Sportzly.Framework.Attributes;
using System.Text;
using System.Web.UI;
using System.IO;
using Sportzly.BusinessEntities.BusinessEntity;

namespace Sportzly.Web.Common
{
    public class BaseUserControl<T>: System.Web.UI.UserControl
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            RegisterControlScript();
            RegisterUserControlWebMethods();
        }

        public UserDetailEntity CurrentUser
        {
            get { return (this.Page as BasePage).CurrentUser; }
        }
        
        private void RegisterControlScript()
        {
            string scriptPath = string.Format("Common/Styles/ApiScripts/{0}.js", typeof(T).Name);
            if (File.Exists(Server.MapPath(scriptPath)))
            {
                LiteralControl control = new LiteralControl(string.Format("<script language=javascript  src='{0}'></script>", scriptPath));
                this.Controls.Add( control);
                //   this.Page.Header.Controls.Add( control);
            }
        }

        private void RegisterUserControlWebMethods()
        {
            foreach (MethodInfo method in 
                this.GetType().GetMethods(BindingFlags.Static | BindingFlags.Public | BindingFlags.InvokeMethod))
                if (method.GetCustomAttributes(typeof(UserControlScriptMethodAttribute), true).Length > 0)
                    RegisterUserControlWebMethod(method);

            Type baseType = this.GetType().BaseType;
            if (baseType != null && (baseType.Namespace == null || !baseType.Namespace.StartsWith("System")))
                foreach (MethodInfo method in 
                    baseType.GetMethods(BindingFlags.Static | BindingFlags.Public | BindingFlags.InvokeMethod))
                    if (method.GetCustomAttributes(typeof(UserControlScriptMethodAttribute), true).Length > 0)
                        RegisterUserControlWebMethod(method);
        }

        private void RegisterUserControlWebMethod(MethodInfo method)
        {
            string blockName = string.Concat(method.Name, "_webMethod_uc");

            StringBuilder funcBuilder = new StringBuilder();
            funcBuilder.Append(Environment.NewLine + "function ");
            funcBuilder.Append(method.Name);
            funcBuilder.Append("(successCallback,failureCallback");
            foreach (var par in method.GetParameters())
                funcBuilder.AppendFormat(",{0}", par.Name);
            funcBuilder.Append("){if(PageMethods.PageServiceRequest){try{var parms=[];");
            funcBuilder.Append("for(var i=2;i<arguments.length;i++){parms.push(arguments[i]);}");
            funcBuilder.Append("PageMethods.PageServiceRequest(");
            funcBuilder.AppendFormat("'{0}','{1}'", method.DeclaringType.AssemblyQualifiedName, method.Name);
            funcBuilder.Append(",parms, successCallback,failureCallback);}catch(e){alert(e.toString());}}}");

            ScriptManager.RegisterClientScriptBlock(this, GetType(), blockName, funcBuilder.ToString(), true);
        }
    }
}