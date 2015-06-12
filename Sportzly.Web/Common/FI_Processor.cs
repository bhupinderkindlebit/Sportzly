using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Net;
using System.Collections;
using System.Collections.ObjectModel;
using System.IO;
using System.Net.Mail;
using System.Data;
using System.Web.Script.Serialization;
/// <summary>
/// Summary description for FI_Processor
/// </summary>
public class FI_Processor
{
    public FI_Processor()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    /// <summary>
    /// Check for error message
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    #region CHECK ERROR MESSAGE
    public string checkError(string data)
    {
        if ((data.Contains("Signature Key must be formatted")) || (data.Contains("Invalid username & password")) || (data.Contains("Missing Input - UserName")) || (data.Contains("Missing Input - Password")) || (data.Contains("Missing Input - UserName Password")) || (data.Contains("Invalid domain")) || (data.Contains("Invalid Signature")) || (data.Contains("Invalid key")) || (data.Contains("Please try again")) || (data.Contains("This service not available on your plan")))
            return data;
        else
            return "";
    }
    #endregion

    /// <summary>
    /// Make POST API call
    /// </summary>
    /// <param name="postParameters"></param>
    /// <returns></returns>
    #region MAKE API REQUEST POST
    public string makeapirequest(string postParameters)
    {
        string url = ConfigurationSettings.AppSettings["APIFUrl"].ToString();
        string useragent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.3)";
        useragent += "Gecko/20070309 Firefox/2.0.0.3";
        HttpWebRequest reqLogin = (HttpWebRequest)WebRequest.Create(url);
        reqLogin.KeepAlive = true;
        reqLogin.Method = "POST";
        reqLogin.UserAgent = useragent;
        reqLogin.UseDefaultCredentials = true;
        reqLogin.ContentType = "application/x-www-form-urlencoded";
        reqLogin.ContentLength = postParameters.Length;
        StreamWriter sw2 = new StreamWriter(reqLogin.GetRequestStream());
        sw2.Write(postParameters);
        sw2.Close();
        HttpWebResponse resLogin = (HttpWebResponse)reqLogin.GetResponse();
        StreamReader sr2 = new StreamReader(resLogin.GetResponseStream());
        String returnstring = sr2.ReadToEnd();
        sr2.Close();
        resLogin.Close();
        reqLogin.Abort();
        return returnstring;
    }
    #endregion

    /// <summary>
    /// Make GET API call
    /// </summary>
    /// <param name="getParameters"></param>
    /// <returns></returns>
    #region MAKE API REQUEST GET
    public string makeApiRequestGet(string getParameters)
    {
        string url = ConfigurationSettings.AppSettings["APIFUrl"].ToString();
        string useragent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.3)";
        useragent += "Gecko/20070309 Firefox/2.0.0.3";
        HttpWebRequest reqFirstPage = (HttpWebRequest)WebRequest.Create(url + "?" + getParameters);
        reqFirstPage.Method = "Get";
        reqFirstPage.UserAgent = useragent;
        HttpWebResponse resFirstPage = (HttpWebResponse)reqFirstPage.GetResponse();
        StreamReader sr1 = new StreamReader(resFirstPage.GetResponseStream());
        String response = sr1.ReadToEnd();
        sr1.Close();
        resFirstPage.Close();
        reqFirstPage.Abort();
        return response;
    }
    #endregion

    /// <summary>
    /// Serialize OAuth response
    /// </summary>
    /// <param name="response"></param>
    /// <returns></returns>
    #region SERIALIZE OAUTH RESPONSE
    public authdetailsFI serializeOauthResponse(string response)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        authdetailsFI obj_ad = serializer.Deserialize<authdetailsFI>(response);
        return obj_ad;
    }
    #endregion


    /// <summary>
    /// Do Oauth Processing
    /// </summary>
    /// <param name="ServiceName"></param>
    /// <param name="token"></param>
    /// <param name="tokenSecret"></param>
    /// <param name="tokenVerifier"></param>
    /// <param name="consumerKey"></param>
    /// <param name="consumerSecret"></param>
    /// <param name="callbackUrl"></param>
    /// <returns></returns>
    #region DO OAUTH PROCESSING
    public string doOAuthProcessing(string ServiceName, string token, string tokenSecret, string tokenVerifier, string consumerKey, string consumerSecret, string callbackUrl, string signature)
    {
        string getParameters = "Type=accesstoken&ServiceName=" + encodeMe(ServiceName) + "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret);
        getParameters += "&CallbackUrl=" + encodeMe(callbackUrl) + "&Token=" + encodeMe(token) + "&TokenSecret=" + encodeMe(tokenSecret) + "&TokenVerifier=" + encodeMe(tokenVerifier) + "&Signature=" + encodeMe(signature);
        string response_ = makeApiRequestGet(getParameters);
        return response_;
    }
    public string doOAuthProcessing(string ServiceName, string userName, string password, string consumerKey, string consumerSecret, string callbackUrl, string signature)
    {
        string getParameters = "Type=accesstoken&ServiceName=" + encodeMe(ServiceName) + "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret);
        getParameters += "&UserName=" + encodeMe(userName) + "&Password=" + encodeMe(password) + "&Signature=" + encodeMe(signature);
        string response_ = makeApiRequestGet(getParameters);
        return response_;
    }
    public string doOAuthProcessing(string ServiceName, string consumerKey, string consumerSecret, string callbackUrl, string Signature)
    {
        string getParameters = "Type=authenticationurl&ServiceName=" + encodeMe(ServiceName) + "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret);
        getParameters += "&CallbackUrl=" + encodeMe(callbackUrl) + "&Signature=" + encodeMe(Signature);
        string response_ = makeApiRequestGet(getParameters);
        return response_;
    }
    #endregion

    /// <summary>
    /// Do Direct Processing
    /// </summary>
    /// <param name="serviceName"></param>
    /// <param name="userName"></param>
    /// <param name="password"></param>
    /// <param name="signatureKey"></param>
    /// <param name="format"></param>
    /// <returns></returns>
    #region DO PROCESSING
    public string doProcessing(string serviceName, string token, string tokenSecret, string tokenVerifier, string consumerKey, string consumerSecret, string signatureKey)
    {
        token = encodeMe(token);
        tokenSecret = encodeMe(tokenSecret);
        tokenVerifier = encodeMe(tokenVerifier);
        consumerKey = encodeMe(consumerKey);
        consumerSecret = encodeMe(consumerSecret);
        string postParameters = "Type=friends&ServiceName=" + serviceName + "&Token=" + encodeMe(token) + "&TokenSecret=" + encodeMe(tokenSecret) + "&TokenVerifier=" + encodeMe(tokenVerifier);
        postParameters += "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret) + "&Signature=" + encodeMe(signatureKey);
        string response_ = makeapirequest(postParameters);
        return response_;
    }
    public string doProcessing(string serviceName, string token, string tokenSecret, string tokenVerifier, string friendsIDs, string subject, string message, string consumerKey, string consumerSecret, string signatureKey)
    {
        token = encodeMe(token);
        tokenSecret = encodeMe(tokenSecret);
        tokenVerifier = encodeMe(tokenVerifier);
        consumerKey = encodeMe(consumerKey);
        consumerSecret = encodeMe(consumerSecret);
        string postParameters = "Type=message&ServiceName=" + serviceName + "&Token=" + encodeMe(token) + "&TokenSecret=" + encodeMe(tokenSecret) + "&TokenVerifier=" + encodeMe(tokenVerifier);
        postParameters += "&FriendsIds=" + encodeMe(friendsIDs) + "&Subject=" + encodeMe(subject) + "&Message=" + encodeMe(message);
        postParameters += "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret) + "&Signature=" + encodeMe(signatureKey);
        string response_ = makeapirequest(postParameters);
        return response_;
    }
    #endregion


    /// <summary>
    /// Encode
    /// </summary>
    /// <param name="encstr"></param>
    /// <returns></returns>
    #region ENCODE ME
    public string encodeMe(string encstr)
    {
        encstr = HttpUtility.UrlEncode(encstr);
        return encstr;
    }
    #endregion

    /// <summary>
    /// Send Invitation
    /// </summary>
    /// <param name="bodytext"></param>
    /// <param name="toaddr"></param>
    /// <param name="subject"></param>
    /// <param name="fromaddr"></param>
    /// <returns></returns>
    #region FIRE MAIl
    public int firemail(string bodytext, string toaddr, string subject, string fromaddr)
    {
        int status = 0;
        try
        {

            System.Net.Mail.MailMessage objMailMessage = new System.Net.Mail.MailMessage();
            objMailMessage.IsBodyHtml = true;
            objMailMessage.From = new MailAddress(fromaddr);
            objMailMessage.To.Add(toaddr);
            objMailMessage.Subject = subject;
            objMailMessage.Body = bodytext;
            System.Net.Mail.SmtpClient objSMTPClient = new System.Net.Mail.SmtpClient(System.Configuration.ConfigurationSettings.AppSettings["smtpServer"].ToString(), 25);
            objSMTPClient.UseDefaultCredentials = true;
            objSMTPClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            objSMTPClient.Send(objMailMessage);
            status = 1;
        }
        catch (Exception et)
        {
            status = 0;
            string str_et = et.ToString();
        }
        return status;
    }
    #endregion
}
#region SUPPORTIVE CLASS

//public class deserializer
//{
//    public object data;
//}

public class detailsClassFI
{
    public string token;
    public string tokenSecret;
    public string tokenVerifier;
    public string authUrl;

}
public class authdetailsFI
{
    public detailsClassFI details;
    public string error;
    public string service;

}
#endregion