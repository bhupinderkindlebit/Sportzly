using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using Sportzly.Framework;

namespace Sportzly.Framework
{
    public class AppSettingsEntity
    {
        #region config constants

        const string userServiceUrl = "UserServiceUrl";
        const string teamServiceUrl = "TeamServiceUrl";
        const string calendarServiceUrl = "CalendarServiceUrl";
        const string activityServiceUrl = "ActivityServiceUrl";
        const string smtpUrl = "smtpUrl";
        const string smtpPort = "smtpPort";
        const string smtpUser = "smtpUser";
        const string smtpPwd = "smtpPwd";
        const string activationUrl = "activationUrl";
        const string commonServiceUrl = "CommonServiceUrl";
        const string youTubeApplicationName = "YouTubeApplicationName";
        const string youTubeDeveloperKey = "YouTubeDeveloperKey";
        const string youTubeUserName = "YouTubeUserName";
        const string youTubePassword = "YouTubePassword"; 

        #endregion

        public static string YouTubeApplicationName
        {
            get
            {
                return ConfigurationManager.AppSettings[youTubeApplicationName];
            }
        }

        public static string YouTubeDeveloperKey
        {
            get
            {
                return ConfigurationManager.AppSettings[youTubeDeveloperKey];
            }
        }

        public static string YouTubeUserName
        {
            get
            {
                return ConfigurationManager.AppSettings[youTubeUserName];
            }
        }
        
        public static string YouTubePassword
        {
            get
            {
                return ConfigurationManager.AppSettings[youTubePassword];
            }
        }

        public static string UserServiceUrl
        {
            get
            {
                return ConfigurationManager.AppSettings[userServiceUrl];
            }
        }
        public static string TeamServiceUrl
        {
            get
            {
                return ConfigurationManager.AppSettings[userServiceUrl];
            }
        }

        public static string CalendarServiceUrl
        {
            get
            {
                return ConfigurationManager.AppSettings[userServiceUrl];
            }
        }

        public static string ActivityServiceUrl
        {
            get
            {
                return ConfigurationManager.AppSettings[activityServiceUrl];
            }
        }

        public static string CommonServiceUrl
        {
            get
            {
                return ConfigurationManager.AppSettings[commonServiceUrl];
            }
        }

        public static string SMTPUrl
        {
            get { return ConfigurationManager.AppSettings[smtpUrl]; }
        }

        public static int SMTPPort
        {
            get { return Convert.ToInt32(ConfigurationManager.AppSettings[smtpPort]); }
        }
        
        public static string SMTPUser
        {
            get { return ConfigurationManager.AppSettings[smtpUser]; }
        }
        
        public static string SMTPPassword
        {
            get { return ConfigurationManager.AppSettings[smtpPwd]; }
        }
        
        public static string ActivationUrl
        {
            get { return ConfigurationManager.AppSettings[activationUrl]; }
        }

    }
}
