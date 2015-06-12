using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.Web.Common;
using Newtonsoft;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using System.Drawing;
using Sportzly.Framework;
using System.Drawing.Drawing2D;
using Sportzly.Framework.Attributes;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities;
using Newtonsoft.Json;
using Twitterizer;
using System.Configuration;
using ASPSnippets.TwitterAPI;
using System.Data;
namespace Sportzly.Web.Controls
{
    public partial class Facebook : BaseUserControl<Facebook>
    {
        string twitterConsumerKey = ConfigurationSettings.AppSettings["TwApiKey"].ToString();
        string twitterConsumerSecret = ConfigurationSettings.AppSettings["TwSecretKey"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["oauth_token"] != null && Request.QueryString["tw"] != null)
            {
                //For Valid User
                string Oauth_Token = HttpContext.Current.Request.QueryString["oauth_token"].ToString();
                string oauth_verifier = HttpContext.Current.Request.QueryString["oauth_verifier"].ToString();
                var accessToken = OAuthUtility.GetAccessToken(twitterConsumerKey, twitterConsumerSecret, Oauth_Token, oauth_verifier);

                var UserId = accessToken.UserId;
                var UserName = accessToken.ScreenName;

                HttpContext.Current.Session["Token"] = accessToken.Token;
                HttpContext.Current.Session["TokenVerifier"] = oauth_verifier;
                HttpContext.Current.Session["TokenSecret"] = accessToken.TokenSecret;

                var user = ApiMethods.CheckUserTwitter(UserId.ToString());
                if (user == null || user.Results.Count == 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tw", "StartTwitter('" + UserId + "','" + UserName + "');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tw", "signuptwitter('" + user.Results[0].EmailId + "','" + UserId + "','" + UserName + "');", true);
                }
            }
        }

        [UserControlScriptMethod]
        public static ActionResult<UserNewEntity> GetNewUsersDetails(string facebookId, string twitterId)
        {
            return ApiMethods.GetNewUsersDetails(facebookId, twitterId);
        }
        [UserControlScriptMethod]
        public static ActionResult<UserEntity> LoginWay(string email, string password)
        {
            return ApiMethods.LoginWay(email, password);
        }

        [UserControlScriptMethod]
        public static ActionResult<UserEntity> SignupTwitter(string email, string twitterId, string username, string token)
        {
            //var p = Utility.Decrypt("EfatjsUqKYSrqv18O1FlA3hcIHI=");
            var guid = Guid.NewGuid();
            var guidStr = guid.ToString().Substring(0, 8);

            var uEmail = ApiMethods.CheckViralSignup(email, twitterId, "");
            var update = false;


            if (uEmail.Results.Any())
            {
                update = true;
            }

            var user = ApiMethods.SignupTwitter(email, guidStr, username, twitterId, token);
            HttpContext.Current.Session["twitter"] = 1;
            return user;
        }

        [UserControlScriptMethod]
        public static ActionResult<UserEntity> SignupFB(string email, string facebookId, string username, string token)
        {
            //var p = Utility.Decrypt("EfatjsUqKYSrqv18O1FlA3hcIHI=");
            var guid = Guid.NewGuid();
            var guidStr = guid.ToString().Substring(0, 8);

            string newfilename = "";
            var uEmail = ApiMethods.CheckViralSignup(email, "", facebookId);
            var update = false;
            var fileName = "";

            if (uEmail.Results.Any())
            {
                update = true;
            }
            else
            {
                fileName = facebookId + ".jpg";
                string imagePath = Path.Combine(HttpContext.Current.Server.MapPath(@"~/Images/Profile"), fileName);
                string imageUrl = "https://graph.facebook.com/" + facebookId + "/picture?type=large";
                WebClient client = new WebClient();
                client.DownloadFile(imageUrl, imagePath);
                string folder = HttpContext.Current.Server.MapPath("~/" + Utility.PROFILE_FOTO_FOLDER);
                if (File.Exists(folder + fileName))
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(folder + fileName);
                    newfilename = Guid.NewGuid().ToString().Replace("-", "") + fileInfo.Extension;

                    System.Drawing.Image ImgPhoto = System.Drawing.Image.FromFile(folder + fileName);
                    int width = ImgPhoto.Width;
                    int height = ImgPhoto.Height;
                    BLL_Thumb objThumb = new BLL_Thumb();


                    var cropfilename = System.IO.Path.Combine(folder, System.IO.Path.GetFileNameWithoutExtension(newfilename) + "crop" + System.IO.Path.GetExtension(newfilename) + "");
                    if (width >= height)
                    {
                        using (Bitmap orignal = new Bitmap(folder + fileName))
                        {
                            using (Bitmap newimage = new Bitmap((int)(height), (int)(height)))
                            {
                                newimage.SetResolution(orignal.HorizontalResolution, orignal.VerticalResolution);
                                using (Graphics newgraphics = Graphics.FromImage(newimage))
                                {
                                    var crop = (width - height) / 2;
                                    newgraphics.SmoothingMode = SmoothingMode.AntiAlias;
                                    newgraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                                    newgraphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
                                    newgraphics.DrawImage(orignal, new Rectangle(0, 0, height, height), crop, 0, height, height, GraphicsUnit.Pixel);
                                    newimage.Save(cropfilename);
                                }
                            }
                        }
                        objThumb.UserThumbWidth235(folder, cropfilename, newfilename);
                    }
                    else if (height >= width)
                    {
                        using (Bitmap orignal = new Bitmap(folder + fileName))
                        {
                            using (Bitmap newimage = new Bitmap((int)(width), (int)(width)))
                            {
                                newimage.SetResolution(orignal.HorizontalResolution, orignal.VerticalResolution);
                                using (Graphics newgraphics = Graphics.FromImage(newimage))
                                {
                                    var crop = (height - width) / 2;
                                    newgraphics.SmoothingMode = SmoothingMode.AntiAlias;
                                    newgraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                                    newgraphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
                                    newgraphics.DrawImage(orignal, new Rectangle(0, 0, width, width), 0, crop, width, width, GraphicsUnit.Pixel);

                                    newimage.Save(cropfilename);

                                }

                            }
                        }
                        objThumb.UserThumbWidth235(folder, cropfilename, newfilename);
                    }
                    else
                    {
                        System.IO.File.Copy(System.IO.Path.Combine(folder, fileName), System.IO.Path.Combine(folder, newfilename), true);
                    }
                }



            }
            var user = ApiMethods.SignupFacebook(email, guidStr, username, facebookId, "images/profile/" + newfilename, token);
            HttpContext.Current.Session["facebook"] = 1;
            return user;
        }
    }
}