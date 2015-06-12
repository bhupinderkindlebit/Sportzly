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
/// Summary description for processor
/// </summary>
public class processor
{
    public processor()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Generate the UI Contacts List 
    /// </summary>
    /// <param name="listCD"></param>
    /// <returns></returns>
    #region GENERATE UI
    public string generateUI(List<ContactDetails> listCD)
    {
        string strContacts = "<div class=\"fl break minH grabberWrapper\"><table class=\"panWid\">";
        strContacts += "<tr class=\"headFrame\"><td class=\"selectTd\">Select</td><td>Name</td><td>Email</td></tr>";
        int flag = 0;
        int count = 0;
        string defaultSelection = "";
        if (ConfigurationSettings.AppSettings["DefaultSelection"].ToString() == "true")
            defaultSelection = "checked=\"checked\"";
        for (int i = 0; i < listCD.Count; i++)
        {
            if (listCD[i].email.Trim().Length < 50)
            {
                if (listCD[i].email.Trim() != "")
                {
                    flag = 1;
                    string rowcolor = "";

                    if ((count % 2) != 0)
                        rowcolor = "style=\"background-color:#F5F5F5\"";

                    string email = listCD[i].email.Trim();
                    string name = listCD[i].name.Trim();
                    if (name.Length > 40)
                        name = name.Substring(0, 39) + "...";

                    name = HttpUtility.HtmlDecode(name);

                    strContacts += "<tr " + rowcolor + "><td><input onclick=\"contactGrabber.selectContacts();\" type=\"checkbox\" " + defaultSelection + " value=\"" + email + "\" /></td>";
                    if (listCD[i].name.Trim() == "")
                        name = email;

                    strContacts += "<td align=\"left\">" + name + "</td>";
                    strContacts += "<td align=\"left\">" + email + "</td></tr>";
                    count++;
                }
            }
        }
        if (flag != 1)
            strContacts += "<tr><td colspan=\"3\"><i>No Contacts Found!</i></td></tr>";

        strContacts += "</table></div>";

        strContacts += "<div class=\"fr break contactsFooter\">";
        strContacts += "<div class=\"fl pad padTopsmall\">Total: " + listCD.Count.ToString() + " contact(s) found!</div>";
        strContacts += "<div class=\"button fr\" id=\"divUnselect\">UnSelect All</div>";
        strContacts += "<div class=\"button fr\" id=\"divSelect\">Select All</div>";
        strContacts += "<div class=\"button fr\" id=\"divDone\">Done</div>";
        strContacts += "</div>";
        return strContacts;
    }
    #endregion

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
        string url = ConfigurationSettings.AppSettings["APIUrl"].ToString();
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
        string url = ConfigurationSettings.AppSettings["APIUrl"].ToString();
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
    public authdetails serializeOauthResponse(string response)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        authdetails obj_ad = serializer.Deserialize<authdetails>(response);
        return obj_ad;
    }
    #endregion

    /// <summary>
    /// Format the contacts string to Object
    /// </summary>
    /// <param name="contactsString"></param>
    /// <returns></returns>
    #region SERIALIZE TO OBJECT
    public List<ContactDetails> serializeToObject(string contactsString)
    {
        List<ContactDetails> list_CD = new List<ContactDetails>();
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        deserializer obj_ad = serializer.Deserialize<deserializer>("{\"contacts\":" + contactsString + "}");
        int len = ((object[])(obj_ad.contacts)).Length;
        if (len > 0)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            for (int i = 0; i < len; i++)
            {
                string email = "", name = "";
                dic = ((System.Collections.Generic.Dictionary<string, object>)((object[])(obj_ad.contacts))[i]);
                foreach (KeyValuePair<string, object> kvp in dic)
                {
                    if (kvp.Key == "email")
                        email = kvp.Value.ToString();
                    else if (kvp.Key == "name")
                        name = kvp.Value.ToString();
                }
                ContactDetails cd = new ContactDetails();
                cd.name = name;
                cd.email = email;
                list_CD.Add(cd);
            }
        }
        return list_CD;
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
    public string doOAuthProcessing(string ServiceName, string token, string tokenSecret, string tokenVerifier, string consumerKey, string consumerSecret, string callbackUrl)
    {
        string getParameters = "ServiceName=" + encodeMe(ServiceName) + "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret);
        getParameters += "&type=accesstoken&ReturnUrl=" + encodeMe(callbackUrl) + "&Token=" + encodeMe(token) + "&TokenSecret=" + encodeMe(tokenSecret) + "&TokenVerifier=" + encodeMe(tokenVerifier);
        string response_ = makeApiRequestGet(getParameters);
        return response_;
    }
    public string doOAuthProcessing(string ServiceName, string consumerKey, string consumerSecret, string callbackUrl, string policyUrl)
    {
        string getParameters = "ServiceName=" + encodeMe(ServiceName) + "&ConsumerKey=" + encodeMe(consumerKey) + "&ConsumerSecret=" + encodeMe(consumerSecret);
        getParameters += "&type=authenticationurl&ReturnUrl=" + encodeMe(callbackUrl) + "&PolicyUrl=" + encodeMe(policyUrl);
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
    public string doProcessing(string serviceName, string userName, string password, string signatureKey, string format)
    {
        string postParameters = "type=contacts&servicename=" + serviceName + "&signature=" + signatureKey + "&username=" + userName + "&password=" + password + "&format=" + format;
        if (serviceName.ToLower() == "outlook")
            postParameters = "type=contacts&servicename=" + serviceName + "&signature=" + signatureKey + "&filename=" + userName + "&CSVType=" + password + "&format=" + format;
        string response_ = makeApiRequestGet(postParameters);
        return response_;
    }
    public string doProcessing(string serviceName, string token, string tokenSecret, string tokenVerifier, string UID, string consumerKey, string consumerSecret, string signatureKey, string format)
    {
        token = encodeMe(token);
        tokenSecret = encodeMe(tokenSecret);
        UID = encodeMe(UID);
        tokenVerifier = encodeMe(tokenVerifier);
        consumerKey = encodeMe(consumerKey);
        consumerSecret = encodeMe(consumerSecret);
        string postParameters = "type=contacts&ServiceName=" + serviceName + "&Token=" + token + "&TokenSecret=" + tokenSecret + "&TokenVerifier=" + tokenVerifier;
        postParameters += "&Uid=" + UID + "&Signature=" + signatureKey + "&ConsumerKey=" + consumerKey + "&ConsumerSecret=" + consumerSecret + "&format=" + format;
        string response_ = makeApiRequestGet(postParameters);
        return response_;
    }
    #endregion

    /// <summary>
    /// Serialize API Response
    /// </summary>
    /// <param name="response"></param>
    /// <returns></returns>
    #region SERIALIZE API RESPONSE
    public List<ContactDetails> serializeResponse(string response)
    {
        List<ContactDetails> listCD = new List<ContactDetails>();
        response = "{\"contacts\":" + response + "}";
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        deserializer ys = serializer.Deserialize<deserializer>(response);
        Dictionary<string, object> dic = new Dictionary<string, object>();
        for (int i = 0; i < ((object[])(ys.contacts)).Length; i++)
        {
            string name = "", email = "";
            dic = ((System.Collections.Generic.Dictionary<string, object>)((object[])(ys.contacts))[i]);
            foreach (KeyValuePair<string, object> dic_cg in dic)
            {
                if (dic_cg.Key == "name")
                    name = dic_cg.Value.ToString();
                else if (dic_cg.Key == "email")
                    email = dic_cg.Value.ToString();
            }
            ContactDetails jsoncd = new ContactDetails();
            jsoncd.email = email;
            jsoncd.name = name;
            listCD.Add(jsoncd);
        }
        return listCD;
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
public class ContactDetails
{
    public string email;
    public string name;
}
public class deserializer
{
    public object contacts;
}
public class detailsClass
{
    public string token;
    public string tokenSecret;
    public string authUrl;
    public string userID;
}
public class authdetails
{

    public detailsClass details;
    public string error;
    public string service;

}
#endregion