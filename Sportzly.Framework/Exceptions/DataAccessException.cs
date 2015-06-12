// -----------------------------------------------------------------------
// <copyright file="DataAccessException.cs" company="">
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
    public class DataAccessException : BaseException, ISerializable
    {
        public DataAccessException()
            : base()
        {

        }

        public DataAccessException(string message)
            : base(message)
        {

        }

        public DataAccessException(string message, System.Exception inner)
            : base(message, inner)
        {

        }

        protected DataAccessException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {

        }

    }
}
