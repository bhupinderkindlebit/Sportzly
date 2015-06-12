using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel.Channels;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using Sportzly.BusinessEntities;
using System.ServiceModel.Web;
using System.Web;

namespace Sportzly.Framework
{


    public static class Serializer
    {
        public static string ToJson<T>(IList<T> data)
        {
            string output = string.Empty;
            //using (var memory = new MemoryStream())
            //{
            //    ProtoBuf.Serializer.Serialize(memory, data);
            //    output = Encoding.Default.GetString(memory.ToArray());
            //}
            using (var memory = new MemoryStream())
            {
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(IList<T>));
                serializer.WriteObject(memory, data);
                output = Encoding.Default.GetString(memory.ToArray());
            }
            return output;
        }

        public static string ToJson<T>(ActionResult<T> data)
        {
            string output = string.Empty;
            try
            {
                using (var memory = new MemoryStream())
                {
                    DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(ActionResult<T>));
                    serializer.WriteObject(memory, data);
                    output = Encoding.Default.GetString(memory.ToArray());
                }
            }
            catch (Exception ex)
            {

            }
            return output.Replace("'", "\'");
        }

        public static string ToJson<T>(T data)
        {
            string output = string.Empty;
            try
            {
                using (var memory = new MemoryStream())
                {
                    DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(T));
                    serializer.WriteObject(memory, data);
                    output = Encoding.Default.GetString(memory.ToArray());
                }
            }
            catch (Exception ex)
            {

            }
            return output.Replace("'", "\'");
        }

        public static ActionResult<T> ToActionResult<T>(string jsonString)
        {
            using (var memory = new MemoryStream(Encoding.UTF8.GetBytes(jsonString)))
            {
                //return ProtoBuf.Serializer.Deserialize<T>(memory);
               // MailUtils.ErrorLog(HttpContext.Current.Server.MapPath("upload/text.txt"),jsonString );
              // MailUtils.ErrorLog(HttpContext.Current.Server.MapPath("upload/text.txt"),memory.Length.ToString());
             
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(ActionResult<T>));
                var obj = (ActionResult<T>)serializer.ReadObject(memory);
                memory.Flush();
                return obj;
            }
        }

        public static T ToEntity<T>(string jsonString)
        {
            using (var memory = new MemoryStream(Encoding.UTF8.GetBytes(jsonString)))
            {
                //return ProtoBuf.Serializer.Deserialize<T>(memory);
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(T));
                return (T)serializer.ReadObject(memory);
            }
        }

        public static Message ToMessage<T>(ActionResult<T> data)
        {
            string output = ToJson<T>(data);
            return WebOperationContext.Current.CreateTextResponse(output, "application/json", Encoding.Default);
        }
    }
}
