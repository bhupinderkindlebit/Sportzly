// -----------------------------------------------------------------------
// <copyright file="BusinessLogicExceptionHandler.cs" company="">
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
    public static class BusinessLogicExceptionHandler
    {
        public static bool HandleException(ref System.Exception ex)
        {
            bool rethrow = false;
            if ((ex is DataAccessException) || (ex is DataAccessCustomException))
            {
                rethrow = ExceptionPolicy.HandleException(ex, EnumExceptionPolicy.PassThroughPolicy.ToString());
                ex = new PassThroughException(ex.Message);
            }
            else if (ex is BusinessLogicCustomException)
            {
                rethrow = ExceptionPolicy.HandleException(ex, EnumExceptionPolicy.BusinessLogicCustomPolicy.ToString());
            }
            else
            {
                rethrow = ExceptionPolicy.HandleException(ex, EnumExceptionPolicy.BusinessLogicPolicy.ToString());
            }
            if (rethrow)
            {
                throw ex;
            }
            return rethrow;
        }

    }
}
