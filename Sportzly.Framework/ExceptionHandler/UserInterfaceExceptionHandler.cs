// -----------------------------------------------------------------------
// <copyright file="UserExceptionHandler.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Framework.ExceptionHandler
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
    using Sportzly.Framework.Exceptions;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class UserExceptionHandler
    {

        /* Dummy variables required to copy respective dll */
        private static Microsoft.Practices.EnterpriseLibrary.Logging.LogEntry le = null;
        private static Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging.LoggingExceptionHandler leh = null;
        private static Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF.ExceptionShielding es = null;

        private static void DummyVariables()
        {
            string str1 = le.ToString();
            string str2 = leh.ToString();
            string str3 = es.ToString();
        }


        public static bool HandleException(ref System.Exception ex)
        {
            bool rethrow = false;
            try
            {
                if (ex is BaseException)
                {
                    // do nothing as Data Access or Business Logic exception has already been logged / handled
                }
                else
                {
                    rethrow = ExceptionPolicy.HandleException(ex, EnumExceptionPolicy.UserInterfacePolicy.ToString());
                }
            }
            catch (Exception exp)
            {
                ex = exp;
            }
            return rethrow;
        }
    }
}
