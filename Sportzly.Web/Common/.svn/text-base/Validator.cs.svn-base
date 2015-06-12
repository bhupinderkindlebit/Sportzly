using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sportzly.Framework.Exceptions;
using Sportzly.ServiceClient;
using System.Text.RegularExpressions;

namespace Sportzly.Web.Common
{
    public static class Validator
    {

        internal static void ValidateEmail(string email)
        {
            UserException.ThrowIf(string.IsNullOrEmpty(email), UserMessages.EmailRequired);
        }

        internal static void ValidatePassword(string password)
        {
            UserException.ThrowIf(string.IsNullOrEmpty(password), UserMessages.PasswordRequired);
        }

        internal static Guid ValidateUser(string userKey)
        {
            UserException.ThrowIf(string.IsNullOrEmpty(userKey), UserMessages.NotLoggedIn);
            return Guid.Parse(userKey);
        }

        internal static void ValidateMessage(string statusMessage)
        {
            UserException.ThrowIf(string.IsNullOrEmpty(statusMessage), UserMessages.ServerError);
        }

        internal static void ValidateUserName(string userName)
        {
            UserException.ThrowIf(string.IsNullOrEmpty(userName), UserMessages.NameRequired);
        }

        internal static void ValidateEmailAddress(string email)
        {
            //string expression = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" + @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" + @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
            string expression = @"^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$";
            Match match = Regex.Match(email, expression, RegexOptions.IgnoreCase);
            var valid = false;
            if (match.Success)
                valid = true;
            else
                valid = false;

            UserException.ThrowIf(!valid, UserMessages.ValidEmailRequired);
        }

        internal static void ValidateCode(string code)
        {
            var valid = false;
            if (HttpContext.Current.Session["CaptchaCode"].ToString().ToLower() == code.ToLower())
                valid = true;
            else
                valid = false;

            UserException.ThrowIf(!valid, UserMessages.InvalidCapatcha);
        }

        internal static void DOB(DateTime dt)
        {
            var valid = false;
            var years13 = Convert.ToDateTime(DateTime.Now.AddYears(-13).ToShortDateString());
            if (dt <= years13)
                valid = true;
            else
                valid = false;

            UserException.ThrowIf(!valid, UserMessages.InvalidDOB);
        }

    }
}
