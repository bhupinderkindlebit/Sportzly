// -----------------------------------------------------------------------
// <copyright file="ExceptionPolicy.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Framework.ExceptionHandler
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public enum EnumExceptionPolicy
    {
        DataAccessPolicy,           /* Log & Wrap (DataAccessException) */
        DataAccessCustomPolicy,     /* Replace (DataAccessCustomException) */
        PassThroughPolicy,          /* Replace (PassThroughException) */
        BusinessLogicPolicy,        /* Log & Wrap (BusinessLogicException) */
        BusinessLogicCustomPolicy,  /* Replace (BusinessLogicCustomException) */
        UserInterfacePolicy,        /* Log & Replace (UserException) */
        WCFServicePolicy            /* Fault Contract - Hardcoded in RestWcfServiceImp */
    }

   
}
