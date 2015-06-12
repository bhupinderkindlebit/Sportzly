using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.ServiceModel.Activation;
using Sportzly.Service.Implementation;

namespace Sportzly.Service.HostApp
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoute(typeof(UserService));
            RegisterRoute(typeof(ActivityService));
            RegisterRoute(typeof(CommonService));
        }
        
        private void RegisterRoute(Type serviceType)
        {
            RouteTable.Routes.Add(new ServiceRoute(serviceType.Name, new WebServiceHostFactory(),serviceType));
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}