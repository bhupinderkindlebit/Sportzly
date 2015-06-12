// -----------------------------------------------------------------------
// <copyright file="UserException.cs" company="">
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
    using Sportzly.Framework.ExceptionHandler;
    using System.Xml.Linq;
    

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    [DataContract]
    public class UserException : System.Exception, ISerializable
    {
        private UserException()
            : base()
        {

        }

        private UserException(string message)
            : base(message)
        {

        }

        private UserException(string message, System.Exception inner)
            : base(message, inner)
        {

        }

        protected UserException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {

        }

        private UserException(UserExceptionType errorType, KeyValuePair<int, string> message)
            : base(message.Value)
        {
            MessageIdentity = message;
            ErrorType = errorType;
        }

        public UserExceptionType ErrorType { get; set; }
        public KeyValuePair<int, string> MessageIdentity { get; set; }

        public static void CreateAndThrowIf(bool condition, string content)
        {
            if (condition)
            {
                throw Create(content);
            }
        }
        public static UserException Create(string content)
        {
            var nodes = XDocument.Parse(content).Descendants().ToList();
            string message = nodes[2].Value;
            string errorTypeString = nodes[1].Value;

            UserExceptionType errorType;
            Enum.TryParse<UserExceptionType>(errorTypeString, out errorType);
            var key = new KeyValuePair<int, string>(9999, message);
            return Create(errorType, key);
        }

        public static void ThrowIf(bool condition, KeyValuePair<int, string> message)
        {
            if (condition)
            {
                throw Create(UserExceptionType.Error, message);
            }
        }

        public static UserException Create(UserExceptionType userExceptionType, KeyValuePair<int, string> message)
        {
            return new UserException(userExceptionType, message);
        }
    }
}
