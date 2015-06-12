// -----------------------------------------------------------------------
// <copyright file="ErrorEntity.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.BusinessEntities.BusinessEntity
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Runtime.Serialization;
    using System.Xml.Linq;
    using Sportzly.Framework;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    [DataContract]
    public class ErrorEntity
    {
        public ErrorEntity(UserExceptionType errorType, int code, string message)
        {
            Message = message;
            ErrorType = errorType;
            Code = code;
        }

        [DataMember]
        public UserExceptionType ErrorType { get; set; }

        [DataMember]
        public int Code { get; set; }

        [DataMember]
        public string Message { get; set; }

        public static ErrorEntity Create(string content)
        {
            var nodes = XDocument.Parse(content).Descendants().ToList();
            string message = nodes[2].Value;
            string errorTypeString = nodes[1].Value;

            UserExceptionType errorType;
            Enum.TryParse<UserExceptionType>(errorTypeString, out errorType);

            var messageObj = new KeyValuePair<int, string>( 9999, message);
            return Create(errorType, messageObj);
        }

        public static ErrorEntity Create(UserExceptionType userExceptionType, KeyValuePair<int, string> message)
        {
            return new ErrorEntity(userExceptionType, message.Key, message.Value);
        }
    }
}
