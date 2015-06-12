using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.ServiceModel.Channels;
using System.ServiceModel.Web;
using System.Net;
using Sportzly.Framework.ExceptionHandler;
using System.Xml.Linq;


namespace Sportzly.Framework.Exceptions
{
    [DataContract]
    public class SportzlyServiceFault
    {
        public SportzlyServiceFault()
        {
            ErrorType = UserExceptionType.Internal;
        }

        [DataMember(Order=1)]
        public string FaultMessage { get; set; }

        [DataMember(Order=0)]
        public UserExceptionType ErrorType { get; set; }

        public static TResult HandleResponse<TResult>(Func<TResult> callback)
        {
            try
            {
                return callback();
            }
            catch (Exception ex)
            {
                throw new WebFaultException<SportzlyServiceFault>(
                    new SportzlyServiceFault() { FaultMessage = ex.Message},
                    HttpStatusCode.InternalServerError);
            }

        }
        

    }
}
