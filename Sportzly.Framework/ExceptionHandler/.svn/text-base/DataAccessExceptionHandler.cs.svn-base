// -----------------------------------------------------------------------
// <copyright file="DataAccessExceptionHandler.cs" company="">
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
    public static class DataAccessExceptionHandler
    {
        public static bool HandleException(ref System.Exception ex)
        {
            bool rethrow = false;


            if (ex is DataAccessCustomException)
            {
                rethrow = ExceptionPolicy.HandleException(ex, EnumExceptionPolicy.DataAccessCustomPolicy.ToString());
                ex = new DataAccessCustomException(ex.Message);
            }

            else //if (ex is System.Exception)
            {
                rethrow = ExceptionPolicy.HandleException(ex, EnumExceptionPolicy.DataAccessPolicy.ToString());
                if (rethrow)
                {
                    throw ex;
                }
            }
            return rethrow;
        }
    }
}
