using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.IO;


namespace Sportzly.Framework
{
    public class MailUtils
    {

        const string SignUpMailContent = @"<P>Thank you {0} for registering with Sportzly. Please click on url below to activate your account <a href=""{1}"">{1}</a>.</P> - Sportzly Team";
        const string TeamMembershipRequest = @"<P><a href='{3}/profile.aspx?{2}'>{1}</a> has showed interest in joining your Team {0}.";


        const string TeamMembershipResponse = @"<P>Thank you {0} for showing interest in Team {1}. Your request status has been updated as {2} - {3}";
        const string TeamInvitationMessage = @"<p> Dear user,<p> You have been invited by {0} to join his/her team on Sportzly.</p> Sportzly is a sports eco-system which connects athletes, players, fans to coaches, teams, leagues, clubs and viceversa. You can create, be a Fan, follow, cheer, jeer, join, search and manage your favorite teams, athletes, players and communities. You can have your own personalized sports world and see how many people are following you. You can also upload pictures, videos, score cards, schedule matches, practice sessions, league schedules etc... etc. <p> Never miss a practice session or a match. Bulletin board lets you stay connected on the fly so you never miss any changes and updates. You don't have to search for score cards anymore, scores come to you. Please join sportzly to be amazed with much more features. We offer features and not fees.</p> Click here to join the team or sportzly <a href=""{1}/?{2}"">{1}</a></p>";

        const string FreindshipInvitationMessage = @"<p> Dear user,<p> You have been invited by {0} to join Sportzly.</p> Sportzly is a sports eco-system which connects athletes, players, fans to coaches, teams, leagues, clubs and viceversa. You can create, be a Fan, follow, cheer, jeer, join, search and manage your favorite teams, athletes, players and communities. You can have your own personalized sports world and see how many people are following you. You can also upload pictures, videos, score cards, schedule matches, practice sessions, league schedules etc... etc. <p> Never miss a practice session or a match. Bulletin board lets you stay connected on the fly so you never miss any changes and updates. You don't have to search for score cards anymore, scores come to you. Please join sportzly to be amazed with much more features. We offer features and not fees.</p>Click here to join sportzly <a href=""{1}/?{2}"">{1}</a> </p>";

        const string NoticeUpdateMessage = @"<p> Dear user,<br/> A new notice has been posted for team {0}.</p><p><a href=""{1}/team.aspx?{2}"">Click here</a>";
        const string ForgotPasswordEmail = @"<p>Dear {1}</p><p>Your temperory password is {0}</p>";
        const string PasswordChangedMessage = @"Dear {0}, your password has been changed successfully";
        const string ExceptionMessage = @"{0}";
        const string NoticeUpdateTextMessage = @"{1}";
        const string FinalNoticeUpdateTextMessage = @"Notice has been sent to all team members.";

        public static void SendTeamInvitation(string userName, string[] emailIds, string token, string teamname, string Mode, string photo)
        {
            //string mailBody = string.Format(TeamInvitationMessage, userName, AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            StringBuilder objEmail = new StringBuilder();
            string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "TeamInvitationMessage.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@TEAMNAME@@", teamname);
            objEmail.Replace("@@LINK@@", activationLink);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);

            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + userName + " has invited you to join the Team " + teamname + "";
                EncryptDecryptQueryString obj = new EncryptDecryptQueryString();
                objEmail.Replace("@@DATA@@", HttpUtility.UrlEncode(obj.Encrypt(rs, "99841286")));
                SendMail(objEmail.ToString(), mailMessage);
            });

            SendInviteAdminMail(userName, emailIds.Count().ToString(), teamname, Mode, "Team Invite");

        }
       
        public static void SendInviteAdminMail(string userName, string count, string teamname, string Mode, string inviteType)
        {
            StringBuilder objEmailAdmin = new StringBuilder();
            string oFilePathAdmin = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmailAdmin.Append(ReadFile(oFilePathAdmin, "InviteAdminCopy.html"));
            objEmailAdmin.Replace("@@URL@@", "http://www.sportzly.com");
            objEmailAdmin.Replace("@@COUNT@@", count);
            objEmailAdmin.Replace("@@TYPE@@", inviteType);
            objEmailAdmin.Replace("@@TEAMNAME@@", teamname);
            objEmailAdmin.Replace("@@SENT@@", userName);
            objEmailAdmin.Replace("@@MODE@@", Mode);

            MailMessage mailMessageAdmin = new MailMessage();

            mailMessageAdmin.To.Add(new MailAddress("jason19d2000@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("jagvar2020@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("chuckgault@hotmail.com"));
            mailMessageAdmin.To.Add(new MailAddress("ali716_99@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("qadeemkhan@yahoo.com"));

            mailMessageAdmin.Bcc.Add(new MailAddress("itssaiinfo@gmail.com"));
            mailMessageAdmin.From = new MailAddress("noreply@sportzly.com");
            mailMessageAdmin.Subject = "Invites Notification";

            SendMail(objEmailAdmin.ToString(), mailMessageAdmin);
        }

        public static void SendEventResponse(string eventtitle, string emailIds, string user, string status, string photo)
        {
            //string mailBody = string.Format(TeamInvitationMessage, userName, AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            StringBuilder objEmail = new StringBuilder();

            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "EventResponse.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@EVENT@@", eventtitle);
            objEmail.Replace("@@USER@@", user);
            objEmail.Replace("@@STATUS@@", status);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            emailIds.Split(new string[] { ";", " ", "," }, StringSplitOptions.RemoveEmptyEntries).ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = user + " has responded to Event";

                SendMail(objEmail.ToString(), mailMessage);
            });

        }
        public static string SendTeamInvitationHTML(string userName, string token)
        {
            //string mailBody = string.Format(TeamInvitationMessage, userName, AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            StringBuilder objEmail = new StringBuilder();
            string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "TeamInvitationMessageHTML.html"));
            //objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@LINK@@", activationLink);
            return objEmail.ToString();

        }


        public static string SendUserInvitationHTML(string userName, string token)
        {
            //string mailBody = string.Format(TeamInvitationMessage, userName, AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            StringBuilder objEmail = new StringBuilder();
            string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "UserInvitationMessageHTML.html"));
            //objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@LINK@@", activationLink);
            return objEmail.ToString();

        }
        public static void SendSignUpMail(string userName, string emailId)
        {
            //string activationLink = string.Format("{0}/activate.aspx?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(Utility.Encrypt(emailId)));
            // string mailBody = string.Format(SignUpMailContent, userName, activationLink);

            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "NewSignUp.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            // objEmail.Replace("@@LINK@@", activationLink);

            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(emailId));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = "Welcome to Sportzly";

            SendMail(objEmail.ToString(), mailMessage);

            StringBuilder objEmailAdmin = new StringBuilder();
            string oFilePathAdmin = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmailAdmin.Append(ReadFile(oFilePathAdmin, "SignupAdminCopy.html"));
            objEmailAdmin.Replace("@@URL@@", "http://www.sportzly.com");
            objEmailAdmin.Replace("@@NAME@@", userName);
            objEmailAdmin.Replace("@@EMAIL@@", emailId);


            MailMessage mailMessageAdmin = new MailMessage();
            //mailMessageAdmin.To.Add(new MailAddress("abdul.qadeem@sportzly.com"));
            //mailMessageAdmin.To.Add(new MailAddress("ali.syed@sportzly.com"));
            //mailMessageAdmin.To.Add(new MailAddress("ravi.raparla@sportzly.com"));
            //mailMessageAdmin.To.Add(new MailAddress("chuck.gault@sportzly.com"));
            //mailMessageAdmin.To.Add(new MailAddress("admin@sportzly.com"));
            mailMessageAdmin.To.Add(new MailAddress("jason19d2000@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("jagvar2020@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("chuckgault@hotmail.com"));
            mailMessageAdmin.To.Add(new MailAddress("ali716_99@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("qadeemkhan@yahoo.com"));

            mailMessageAdmin.Bcc.Add(new MailAddress("itssaiinfo@gmail.com"));
            mailMessageAdmin.From = new MailAddress("noreply@sportzly.com");
            mailMessageAdmin.Subject = "New User Registration";

            SendMail(objEmailAdmin.ToString(), mailMessageAdmin);
        }

        public static void SendTeamSignUpMail(string TeamName, string Logo, string OwnerName)
        {

            StringBuilder objEmailAdmin = new StringBuilder();
            string oFilePathAdmin = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmailAdmin.Append(ReadFile(oFilePathAdmin, "TeamAdminCopy.html"));
            objEmailAdmin.Replace("@@URL@@", "http://www.sportzly.com");
            objEmailAdmin.Replace("@@NAME@@", TeamName);
            objEmailAdmin.Replace("@@OWNER@@", OwnerName);
            objEmailAdmin.Replace("@@LOGO@@", Logo);

            MailMessage mailMessageAdmin = new MailMessage();

            mailMessageAdmin.To.Add(new MailAddress("jason19d2000@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("jagvar2020@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("chuckgault@hotmail.com"));
            mailMessageAdmin.To.Add(new MailAddress("ali716_99@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("qadeemkhan@yahoo.com"));

            mailMessageAdmin.Bcc.Add(new MailAddress("itssaiinfo@gmail.com"));
            mailMessageAdmin.From = new MailAddress("noreply@sportzly.com");
            mailMessageAdmin.Subject = "New Team Registration";

            SendMail(objEmailAdmin.ToString(), mailMessageAdmin);
        }

        public static void SendSignUpMailViral(string userName, string emailId, string social, string password)
        {
            //string activationLink = string.Format("{0}/activate.aspx?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(Utility.Encrypt(emailId)));
            // string mailBody = string.Format(SignUpMailContent, userName, activationLink);

            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "NewSignUpViral.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@SOCIAL@@", social);
            objEmail.Replace("@@PASSWORD@@", password);
            // objEmail.Replace("@@LINK@@", activationLink);

            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(emailId));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = "Welcome to Sportzly";

            SendMail(objEmail.ToString(), mailMessage);

            StringBuilder objEmailAdmin = new StringBuilder();
            string oFilePathAdmin = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmailAdmin.Append(ReadFile(oFilePathAdmin, "SignupAdminCopy.html"));
            objEmailAdmin.Replace("@@URL@@", "http://www.sportzly.com");
            objEmailAdmin.Replace("@@NAME@@", userName);
            objEmailAdmin.Replace("@@EMAIL@@", emailId);


            MailMessage mailMessageAdmin = new MailMessage();
            mailMessageAdmin.To.Add(new MailAddress("jason19d2000@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("jagvar2020@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("chuckgault@hotmail.com"));
            mailMessageAdmin.To.Add(new MailAddress("ali716_99@yahoo.com"));
            mailMessageAdmin.To.Add(new MailAddress("qadeemkhan@yahoo.com"));

            mailMessageAdmin.Bcc.Add(new MailAddress("itssaiinfo@gmail.com"));
            mailMessageAdmin.From = new MailAddress("noreply@sportzly.com");
            mailMessageAdmin.Subject = "New User Registration";

            SendMail(objEmailAdmin.ToString(), mailMessageAdmin);
        }

        
        public static void SendTeamMembershipRequest(string teamName, string ownerEmail, string userName, string emailId, string photo)
        {
            //string mailBody = string.Format(TeamMembershipRequest, teamName, userName, emailId, AppSettingsEntity.ActivationUrl);
            StringBuilder objEmail = new StringBuilder();
            string activationLink = string.Format("{0}/profile.aspx?{1}", AppSettingsEntity.ActivationUrl, emailId);
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "TeamMembershipRequest.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@TEAM@@", teamName);
            objEmail.Replace("@@LINK@@", activationLink);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(ownerEmail));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = userName + " has requested to Join Team";

            SendMail(objEmail.ToString(), mailMessage);

        }

        public static void SendTeamMembershipResponse(string userName, string teamName, bool status, string ownerName, string emailId, string photo)
        {
            string strStatus = status ? "approved" : "rejected";
            //string mailBody = string.Format(TeamMembershipResponse, userName, teamName, strStatus, ownerName);
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "TeamMemberShipResponse.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@TEAM@@", teamName);
            objEmail.Replace("@@STATUS@@", strStatus);
            objEmail.Replace("@@OWNER@@", ownerName);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(emailId));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = string.Format("{0} has {1} your Request to join team {2}", ownerName, strStatus, teamName);

            SendMail(objEmail.ToString(), mailMessage);

        }

        private static void SendMail(string mailBody, MailMessage mailMessage)
        {

            mailMessage.IsBodyHtml = true;
            mailMessage.Body = mailBody;

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = AppSettingsEntity.SMTPUrl;
            smtpClient.Port = AppSettingsEntity.SMTPPort;
            smtpClient.Credentials = new NetworkCredential(AppSettingsEntity.SMTPUser, AppSettingsEntity.SMTPPassword);
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            try
            {
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                //HttpContext.Current.Response.Redirect("http://www.google.com");
                //ErrorLog(HttpContext.Current.Server.MapPath("../upload/text.txt"), ex.ToString());
              //  SendExceptionMessage(ex.ToString());
            }
        }

        public static void ErrorLog(string sPathName, string sErrMsg)
        {
            StreamWriter sw = new StreamWriter(sPathName, true);
            sw.WriteLine(sErrMsg);
            sw.Flush();
            sw.Close();
        }

        public static void SendFriendshipInvitation(string userName, string[] emailIds, string token, string Mode, string photo)
        {
            //string mailBody = string.Format(FreindshipInvitationMessage, userName, AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            StringBuilder objEmail = new StringBuilder();
            string activationLink = string.Format("{0}/?{1}", AppSettingsEntity.ActivationUrl, HttpUtility.UrlEncode(token));
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "FriendShipInvitation.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@LINK@@", activationLink);
            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + userName + " has invited you to join Sportzly";
                EncryptDecryptQueryString obj = new EncryptDecryptQueryString();
                objEmail.Replace("@@DATA@@", HttpUtility.UrlEncode(obj.Encrypt(rs, "99841286")));
                SendMail(objEmail.ToString(), mailMessage);
            });

            SendInviteAdminMail(userName, emailIds.Count().ToString(), "None", Mode, "Friend Invite");
        }

        public static void SendNoticeUpdate(List<string> emailIds, string ownerEmail, string teamName, long teamId, string message, string name, string photo)
        {
            string mailBody = string.Format(NoticeUpdateMessage, teamName, AppSettingsEntity.ActivationUrl, teamId);
            StringBuilder objEmail = new StringBuilder();
            string activationLink = string.Format("{0}/team.aspx?{1}", AppSettingsEntity.ActivationUrl, teamId);
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "NoticeUpdate.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@TEAM@@", teamName);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@LINK@@", activationLink);
            objEmail.Replace("@@MESSAGE@@", message);
            emailIds.Add(ownerEmail);

            emailIds.ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + name + " has posted a Bulletin Board message";

                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendNoticeUpdateText(List<string> emailIds, string ownerEmail, string teamName, string message, string email, string name)
        {
            string mailBody = string.Format(NoticeUpdateTextMessage, "", message);
            string mailFinalBody = string.Format(FinalNoticeUpdateTextMessage);
            if (ownerEmail != "")
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(ownerEmail));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "";
                SendMail(mailBody, mailMessage);

            }

            emailIds.ForEach(rs =>
            {
                try
                {
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.To.Add(new MailAddress(rs));
                    mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                    mailMessage.Subject = "";
                    SendMail(mailBody, mailMessage);
                }
                catch (Exception ex)
                {
                    SendExceptionMessage(ex.ToString());
                }
            });



            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "FinalUpdate.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@MESSAGE@@", message);

            MailMessage mailFinalMailMessage = new MailMessage();
            mailFinalMailMessage.To.Add(new MailAddress(email));
            mailFinalMailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailFinalMailMessage.Subject = "Team Notice Sent";
            SendMail(objEmail.ToString(), mailFinalMailMessage);
            if (ownerEmail != "")
            {
                MailMessage mailFinalMessage = new MailMessage();
                mailFinalMessage.To.Add(new MailAddress(ownerEmail));
                mailFinalMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailFinalMessage.Subject = "";
                SendMail(mailFinalBody, mailFinalMessage);
            }

        }

        public static void SendNoticeUpdateIndia(List<string> emailIds, string ownerEmail, string teamName, string message, string email, string name)
        {
            string mailBody = string.Format(NoticeUpdateTextMessage, "", message);
            string mailFinalBody = string.Format(FinalNoticeUpdateTextMessage);

            emailIds.ForEach(rs =>
            {
                try
                {
                    HttpWebRequest authRequest = (HttpWebRequest)WebRequest.Create("https://site2sms.p.mashape.com/index.php?msg=" + mailBody + "&phone=" + rs + "&pwd=5406985&uid=9866893180");
                    authRequest.Headers.Add("X-Mashape-Key", "qpz4q18tSGmshcDSNDwGnx1F4pqMp11FbPKjsn3MEkFf9SH3XD");
                    authRequest.Method = "GET"; 
                    HttpWebResponse response = (HttpWebResponse)authRequest.GetResponse();
                    string responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();                 
                }
                catch (WebException ex)
                {
                    SendExceptionMessage(ex.ToString());
                }
                catch (Exception ex)
                {
                    SendExceptionMessage(ex.ToString());
                }
            });

        }

        public static void SendForgotPassword(string email, string userName, string password)
        {
            //string mailBody = string.Format(ForgotPasswordEmail, password, userName);
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "ForgotPassword.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);
            objEmail.Replace("@@PASSWORD@@", password);
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(email));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = "Forgot Password";

            SendMail(objEmail.ToString(), mailMessage);

        }

        public static void SendPasswordChanged(string email, string userName)
        {
            //string mailBody = string.Format(PasswordChangedMessage, userName);
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PasswordChanged.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@NAME@@", userName);

            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(email));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = "Password Changed";

            SendMail(objEmail.ToString(), mailMessage);

        }

        public static void SendExceptionMessage(string message)
        {
            string mailBody = string.Format(ExceptionMessage, message);

            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress("itssaiinfo@gmail.com"));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = "Error";

            SendMail(mailBody, mailMessage);

        }

        public static void SendPostNotification(List<string> emailIds, string teamname, string postuser, string type, string link, string ownerEmail, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostTeamNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@TEAM@@", teamname);
            objEmail.Replace("@@POSTUSER@@", postuser);
            objEmail.Replace("@@TYPE@@", type);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            emailIds.Add(ownerEmail);
            emailIds.ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + postuser + " has posted a " + type + " on the " + teamname + " team wall";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendPostNotificationMessage(List<string> emailIds, string teamname, string postuser, string type, string link, string ownerEmail, string message, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostTeamNotificationMessage.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@TEAM@@", teamname);
            objEmail.Replace("@@POSTUSER@@", postuser);
            objEmail.Replace("@@TYPE@@", type);
            objEmail.Replace("@@MESSAGE@@", message);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            emailIds.Add(ownerEmail);
            emailIds.ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + postuser + " has posted a " + type + " on the " + teamname + " team wall";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendFriendPostNotification(List<string> emailIds, string postuser, string type, string link, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostFriendNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@POSTUSER@@", postuser);
            objEmail.Replace("@@TYPE@@", type);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            emailIds.ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + postuser + " has posted a " + type + " on the wall";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendFriendPostNotificationMessage(List<string> emailIds, string postuser, string type, string link, string message, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostFriendNotificationMessage.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@POSTUSER@@", postuser);
            objEmail.Replace("@@TYPE@@", type);
            objEmail.Replace("@@MESSAGE@@", message);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            emailIds.ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = "" + postuser + " has posted a " + type + " on the wall";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendPostComment(string email, string username, string postuser, string album, string comments, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostComment.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@USER@@", username);
            objEmail.Replace("@@POSTUSER@@", postuser);
            objEmail.Replace("@@ALBUM@@", album);
            objEmail.Replace("@@COMMENT@@", comments);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);

            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new MailAddress(email));
            mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
            mailMessage.Subject = username + " has commented on photo";
            SendMail(objEmail.ToString(), mailMessage);

        }

        public static string ReadFile(string sPATH, string sFILENAME)
        {
            string functionReturnValue = null;
            string FileName = sPATH + sFILENAME;
            StreamReader sr = new StreamReader(FileName);
            functionReturnValue = sr.ReadToEnd();
            sr.Close();
            sr.Dispose();
            return functionReturnValue;
        }

        public static void SendEventInvites(List<string> emailIds, string ownerEmail, string displayName, string eventName, string link, string startdate, string starttime, string enddate, string endtime, string timezone, string location, string description, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostEventNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@EVENT@@", eventName);
            objEmail.Replace("@@POSTUSER@@", displayName);
            objEmail.Replace("@@STARTDATE@@", startdate);
            objEmail.Replace("@@STARTTIME@@", starttime);
            objEmail.Replace("@@ENDDATE@@", enddate);
            objEmail.Replace("@@ENDTIME@@", endtime);
            objEmail.Replace("@@TIMEZONE@@", timezone);
            objEmail.Replace("@@LOCATION@@", location);
            objEmail.Replace("@@DESCRIPTION@@", description);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            //emailIds.Add(ownerEmail);
            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = displayName + " has created a event. Please respond.";
                SendMail(objEmail.ToString(), mailMessage);

            });
        }

        public static void SendEventUpdate(List<string> emailIds, string ownerEmail, string displayName, string eventName, string link, string startdate, string starttime, string enddate, string endtime, string timezone, string location, string description, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "EventUpdateNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@EVENT@@", eventName);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@POSTUSER@@", displayName);
            objEmail.Replace("@@STARTDATE@@", startdate);
            objEmail.Replace("@@STARTTIME@@", starttime);
            objEmail.Replace("@@ENDDATE@@", enddate);
            objEmail.Replace("@@ENDTIME@@", endtime);
            objEmail.Replace("@@TIMEZONE@@", timezone);
            objEmail.Replace("@@LOCATION@@", location);
            objEmail.Replace("@@DESCRIPTION@@", description);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            // emailIds.Add(ownerEmail);
            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = displayName + " has updated a event. Please check.";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendEventDelete(List<string> emailIds, string ownerEmail, string displayName, string eventName, string startdate, string starttime, string enddate, string endtime, string timezone, string location, string description, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "EventDeleteNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@EVENT@@", eventName);
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@POSTUSER@@", displayName);
            objEmail.Replace("@@STARTDATE@@", startdate);
            objEmail.Replace("@@STARTTIME@@", starttime);
            objEmail.Replace("@@ENDDATE@@", enddate);
            objEmail.Replace("@@ENDTIME@@", endtime);
            objEmail.Replace("@@TIMEZONE@@", timezone);
            objEmail.Replace("@@LOCATION@@", location);
            objEmail.Replace("@@DESCRIPTION@@", description);

            // emailIds.Add(ownerEmail);
            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = displayName + " has cancel a event. Please check.";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendPollInvites(List<string> emailIds, string ownerEmail, string displayName, string pollName, string link, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostPollNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@POLL@@", pollName);
            objEmail.Replace("@@POSTUSER@@", displayName);           
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            //emailIds.Add(ownerEmail);
            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = displayName + " has created a poll. Please respond.";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

        public static void SendPollInvitesUpdate(List<string> emailIds, string ownerEmail, string displayName, string pollName, string link, string photo)
        {
            StringBuilder objEmail = new StringBuilder();
            string oFilePath = HttpContext.Current.Server.MapPath("~/emailtemplates/");
            objEmail.Append(ReadFile(oFilePath, "PostUpdatePollNotification.html"));
            objEmail.Replace("@@URL@@", "http://www.sportzly.com");
            objEmail.Replace("@@PIC@@", "http://www.sportzly.com/" + photo);
            objEmail.Replace("@@POLL@@", pollName);
            objEmail.Replace("@@POSTUSER@@", displayName);
            objEmail.Replace("@@LINK@@", AppSettingsEntity.ActivationUrl + "/" + link);
            //emailIds.Add(ownerEmail);
            emailIds.ToList().ForEach(rs =>
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(rs));
                mailMessage.From = new MailAddress("noreply@sportzly.com", "Sportzly");
                mailMessage.Subject = displayName + " has updated a poll. Please respond.";
                SendMail(objEmail.ToString(), mailMessage);
            });
        }

    }
}
