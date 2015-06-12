using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Framework;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class UploadPhotoControl : BaseUserControl<UploadPhotoControl>
    {
        string _fileExtension = "png";
        const string _FileEx = "FileEx";
        string type = string.Empty;
        string prevImage = string.Empty;
        string id = string.Empty;

        private string FileExtension
        {
            get
            {
                if (ViewState[_FileEx] == null)
                    ViewState[_FileEx] = _fileExtension;
                return ViewState[_FileEx] as string;
            }
            set
            {
                ViewState[_FileEx] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            type = Request.QueryString.Get("type");
            prevImage = Request.QueryString.Get("img");
            id = Request.QueryString.Get("id");
            id = string.IsNullOrEmpty(id) ? "0" : id;

            if (Page.IsPostBack == false)
                SetImage();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SetImage();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string imageUrl = this.Image1.ImageUrl;

            string filePath = GetPhotoPath();

            if (imageUrl.StartsWith(Utility.IMAGE_HEADER))
                SaveImageFromBinaryString(filePath);
            else
                SaveImageFromUrl();



            Response.Write("<script> parent.closePhotoUpload('" + filePath + "?" + Guid.NewGuid() + "'); </script>");
        }

        private string GetPhotoPath()
        {

            string fileName = string.Empty;

            switch (type)
            {
                default:
                    fileName = string.Format("{2}{0}.{1}", CurrentUser.Id, FileExtension, Utility.PROFILE_FOTO_FOLDER.Replace("\\", "\\\\"));
                    break;
                case "team":
                    fileName = string.Format("{2}{0}.{1}", Guid.NewGuid(), FileExtension, Utility.TEAM_FOTO_FOLDER.Replace("\\", "\\\\"));
                    break;
            }
            return fileName;
        }

        private string GetImage()
        {
            if (FileUpload1.HasFile)
            {
                byte[] fileData = this.FileUpload1.FileBytes;
                string fileName = this.FileUpload1.FileName;
                FileExtension = fileName.Substring(fileName.LastIndexOf('.') + 1);
                this.Button1.Visible = true;
                return Utility.GetImageHeader(FileExtension) + Convert.ToBase64String(fileData);
            }

            if (string.IsNullOrEmpty(prevImage))
            {
                return "~/" + CurrentUser.ProfileFoto + "?" + DateTime.Now.Ticks;
            }
            else
            {
                return "~/" + prevImage + "?" + DateTime.Now.Ticks;
            }
        }

        private void SetImage()
        {
            string imageUrl = GetImage();
            this.Image1.ImageUrl = imageUrl;
            this.Image2.ImageUrl = imageUrl;
        }

        private void SaveImageFromUrl() { }

        private void SaveImageFromBinaryString(string saveLocation)
        {
            try
            {
                string imageUrl = this.Image1.ImageUrl;
                string imageData = string.Empty;

                imageData = imageUrl.Replace(Utility.GetImageHeader(FileExtension), string.Empty);
                byte[] imageBytes = Convert.FromBase64String(imageData);

                System.Drawing.Image image = Utility.ByteArrayToImage(imageBytes);

                Rectangle cropArea = GetCropArea();

                int scaleHeight = (int)(double.Parse(this.orgH.Value));
                int scaleWidth = (int)(double.Parse(this.orgW.Value));
                Bitmap bmpImage = new Bitmap(image, scaleWidth, scaleHeight);

                Graphics g = Graphics.FromImage(bmpImage);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBilinear;
                g.DrawImage(image, 0, 0, bmpImage.Width, bmpImage.Height);


                Bitmap bmpCrop = bmpImage.Clone(cropArea, bmpImage.PixelFormat);
                image = (System.Drawing.Image)(bmpCrop);

                image.Save(Server.MapPath(saveLocation));
            }
            catch { }
        }

        private Rectangle GetCropArea()
        {
            int x = (int)(double.Parse(this.x1.Value));
            int y = (int)(double.Parse(this.y1.Value));
            int w = 0;
            int h = 0;

            if (!int.TryParse(this.w.Value, out w) || w <= 0)
            {
                w = (int)this.Image1.Height.Value;
            }

            if (!int.TryParse(this.h.Value, out h) || h <= 0)
            {
                h = (int)this.Image1.Height.Value;
            }

            Rectangle cropArea = new Rectangle(x, y, w, h);
            return cropArea;
        }


    }
}