// -----------------------------------------------------------------------
// <copyright file="Utility.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Framework
{
    using System;
    using System.Collections.Generic;
    using System.Drawing;
    using System.IO;
    using System.Linq;
    using System.Text;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class Utility
    {
        public const string IMAGE_HEADER = "data:image";
        public const string uploadFolder = "Upload/Photos/{0}/";
        public const string PROFILE_FOTO_FOLDER = "images/profile/";
        public const string DOCS_FOLDER = "upload/docs/";
        public const string GAMES_FOLDER = "upload/games/";
        public const string VIDEO_FOLDER = "upload/video/";
        public const string TEAM_FOTO_FOLDER = "images/team/";
        public const string teamFolder = "images/team/{0}";
        public const string uploadFolderPath = "Upload/Photos/{0}/{1}";
        public const string thumbnailFolder = "Upload/Photos/{0}/Thumbnail/{1}";
        public const string bigthumbnailFolder = "Upload/Photos/{0}/BigThumbnail/{1}";
      

        public static string DEFAULT_PROFILE_IMAGE = string.Format("{0}default.png", PROFILE_FOTO_FOLDER);


        public static string GetTimespanString(this DateTime dateTime)
        {
            double minutes = (DateTime.Now - dateTime).TotalMinutes;
            if (minutes > 24 * 60 * 365)
                return string.Format("{0} year(s) ago", Convert.ToInt32(minutes / (60 * 24 * 365)));

            if (minutes > 24 * 60 * 30)
                return string.Format("{0} month(s) ago", Convert.ToInt32(minutes / (60 * 24 * 30)));

            if (minutes > 24 * 60 * 7)
                return string.Format("{0} week(s) ago", Convert.ToInt32(minutes / (60 * 24 * 7)));

            if (minutes > 24 * 60)
                return string.Format("{0} days(s) ago", Convert.ToInt32(minutes / (60 * 24)));

            if (minutes > 60)
                return string.Format("{0} hour(s) ago", Convert.ToInt32(minutes / 60));

            return string.Format("{0} minute(s) ago", Convert.ToInt32(minutes));
        }
        public static string Encrypt(string sourceString)
        {
            if (string.IsNullOrEmpty(sourceString)) return null;
            var data = System.Text.Encoding.Default.GetBytes(sourceString);
            var encBytes = System.Security.Cryptography.SHA1CryptoServiceProvider.Create().ComputeHash(data);
            return Convert.ToBase64String(encBytes);
        }

        public static string Decrypt(string sourceString)
        {
            if (string.IsNullOrEmpty(sourceString)) return null;
            var decodedBytes = Convert.FromBase64String(sourceString);
            var data = System.Security.Cryptography.SHA1CryptoServiceProvider.Create().ComputeHash(decodedBytes);
            string decodedText = Encoding.Default.GetString(data);
            return decodedText;
        }

        public static void CreatePath(string uploadFolder)
        {
            Directory.CreateDirectory(uploadFolder);
        }
        public static string GetUploadImagePath(decimal userId, bool absolute)
        {
            if (absolute)
                return "~/" + string.Format(uploadFolder, userId);
            else
                return string.Format(uploadFolder, userId);
        }

        public static string GetTeamImagePath(string photo)
        {
            return string.Format(teamFolder, photo);
        }

        public static string GetUploadImagePath(decimal userId, bool absolute, string filename)
        {
            if (absolute)
                return "~/" + string.Format(uploadFolderPath, userId, filename);
            else
                return string.Format(uploadFolderPath, userId, filename);
        }

        public static string GetNoImagePath()
        {
            return "upload/no-image.jpg";
        }

        public static string GetUploadThumbnailImagePath(decimal userId, bool absolute, string filename)
        {
            if (absolute)
            {
                return "~/" + string.Format(thumbnailFolder, userId, filename);
            }
            else
            {
                return string.Format(thumbnailFolder, userId, filename);
            }

        }
        public static string GetUploadBigThumbnailImagePath(decimal userId, bool absolute, string filename)
        {
            if (absolute)
            {
                return "~/" + string.Format(bigthumbnailFolder, userId, filename);
            }
            else
            {
                return string.Format(bigthumbnailFolder, userId, filename);
            }

        }
        public static string GetNoImagePath(bool absolute)
        {
            if (absolute)
                return "~/upload/no-image.jpg";
            else
                return "upload/no-image.jpg";
        }
        public static Image ByteArrayToImage(byte[] imageBytes)
        {
            MemoryStream ms = new MemoryStream(imageBytes);
            Image image = Image.FromStream(ms);
            return image;
        }
        public static Image CropImage(Image image, Rectangle cropArea, double scale)
        {
            int scaleHeight =Convert.ToInt32((double)image.Height * scale);
            int scaleWidth = Convert.ToInt32((double)image.Width * scale);

            Image thumbNailImage = image.GetThumbnailImage(scaleWidth, scaleHeight, null, IntPtr.Zero);
            Bitmap bmpImage = new Bitmap(thumbNailImage);
            
            Bitmap bmpCrop = bmpImage.Clone(cropArea, bmpImage.PixelFormat);
            return (Image)(bmpCrop);
        }

        public static string GetImageHeader(string fileExtension)
        {
            return string.Format(IMAGE_HEADER + "/{0};base64,", fileExtension);
        }
    }
}
