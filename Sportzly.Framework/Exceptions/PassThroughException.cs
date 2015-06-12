// -----------------------------------------------------------------------
// <copyright file="PassThroughException.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Framework.Exceptions
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Runtime.Serialization;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class PassThroughException : BaseException, ISerializable
    {
        public PassThroughException()
            : base()
        {

        }

        public PassThroughException(string message)
            : base(message)
        {

        }

        public PassThroughException(string message, System.Exception inner)
            : base(message, inner)
        {

        }

        protected PassThroughException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {

        }
    }
}
