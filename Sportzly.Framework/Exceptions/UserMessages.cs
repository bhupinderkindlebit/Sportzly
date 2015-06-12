// -----------------------------------------------------------------------
// <copyright file="UserMessages.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Framework.Exceptions
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class UserMessages
    {
        public static readonly KeyValuePair<int, string> ServerError = new KeyValuePair<int, string>(1000, "Internal Server Error");
        public static readonly KeyValuePair<int, string> LoginFailed = new KeyValuePair<int, string>(2001, "Email / Password did not match or no such user");
        public static readonly KeyValuePair<int, string> UsernameRequired = new KeyValuePair<int, string>(1002, "Username is required");
        public static readonly KeyValuePair<int, string> PasswordRequired = new KeyValuePair<int, string>(1003, "Password is required");
        public static readonly KeyValuePair<int, string> UserExist = new KeyValuePair<int, string>(1004, "User already exist for given email");
        public static readonly KeyValuePair<int, string> SignupEmail = new KeyValuePair<int, string>(1005, "User created successfully, please validate your mail id by clicking link in the mail.");
        public static readonly KeyValuePair<int, string> UserLoggedOut = new KeyValuePair<int, string>(2002, "You have logged out. Please login again.");
        public static readonly KeyValuePair<int, string> NotLoggedIn = new KeyValuePair<int, string>(2002, "You are not logged in. You need to login to view the page");
        public static readonly KeyValuePair<int, string> AlreadyLoggedIn = new KeyValuePair<int, string>(2002, "You are already logged in to the system");
        public static readonly KeyValuePair<int, string> NameRequired = new KeyValuePair<int, string>(1006, "Name is required");
        public static readonly KeyValuePair<int, string> EmailRequired = new KeyValuePair<int, string>(1007, "Email Address is required");
        public static readonly KeyValuePair<int, string> ValidEmailRequired = new KeyValuePair<int, string>(1008, "Please enter a valid email address");
        public static readonly KeyValuePair<int, string> InvalidCapatcha = new KeyValuePair<int, string>(10082, "You entered wrong code. Please try again.");
        public static readonly KeyValuePair<int, string> InvalidDOB = new KeyValuePair<int, string>(10083, "You must be at least 13 years of age.");
        public static readonly KeyValuePair<int, string> NoMoreMessages = new KeyValuePair<int, string>(3001, "No more messages");
        public static readonly KeyValuePair<int, string> Success = new KeyValuePair<int, string>(3002, "1");
        public static readonly KeyValuePair<int, string> Fail = new KeyValuePair<int, string>(3003, "0");
        public static readonly KeyValuePair<int, string> Activate = new KeyValuePair<int, string>(2003, "Please validate your email address before you login");
        public static readonly KeyValuePair<int, string> FanError = new KeyValuePair<int, string>(1000, " This team is a private team, you must request to join as a member or you can be a fan");
        public static readonly KeyValuePair<int, string> PrivateTeamError = new KeyValuePair<int, string>(1099, " This team is a private team, you must request to join as a member");
        public static string TEAM_JOINED_PENDING_APPROVAL = "You have joined {0}, but approval is pending from team admin. Till then you can not do any activity";
        public static string FRIEND_REQUEST = "Friendship request sent successfully. Till then you can not do any activity";
        public static string TEAM_NOT_MEMBER = "You are not member of team {0}";
        public static string TEAM_ALREADY_MEMBER = "You are already member of team {0}";
        public static string TEAM_MEMBER_BLOCKED = "You are blocked by team {0}'s admin";
        public static string TEAM_MEMBER_PENDING_APPROAVAL = "Your previous request to join team {0} is pending";
        public static string TEAM_NOT_EXISTS = "Team not exist any more";
        public static string TEAM_MEMBER_OWNER = "You cannot join or leave your own team {0}";
        public static string TEAM_FOLLOWER_OWNER = "You cannot follow or unfollow your own team {0}";
        public static string TEAM_ALREADY_FOLLOWING = "You are already following team {0}";
        public static string TEAM_NOT_FOLLOWING = "You are not following team {0}";

        public static string GROUP_JOINED_PENDING_APPROVAL = "You have joined {0}, but approval is pending from community admin. Till then you can not do any activity";
        public static string GROUP_NOT_MEMBER = "You are not member of community {0}";
        public static string GROUP_ALREADY_MEMBER = "You are already member of community {0}";
        public static string GROUP_MEMBER_BLOCKED = "You are blocked by community {0}'s admin";
        public static string GROUP_MEMBER_PENDING_APPROAVAL = "Your previous request to join community {0} is pending";
        public static string GROUP_NOT_EXISTS = "Team not exist any more";
        public static string GROUP_MEMBER_OWNER = "You cannot join or leave your own community {0}";
        public static string GROUP_FOLLOWER_OWNER = "You cannot follow or unfollow your own community {0}";
        public static string GROUP_ALREADY_FOLLOWING = "You are already following community {0}";
        public static string GROUP_NOT_FOLLOWING = "You are not following community {0}";

    }
}
