using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
/// <summary>
/// Summary description for BLL_Thumb
/// </summary>
public class BLL_Thumb
{
    public BLL_Thumb()
    {

        //
        // TODO: Add constructor logic here
        //

    }
    public void UserThumbWidth(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 140.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public void UserThumbWidth600(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 600.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage.Dispose();
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

            fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth600(string Destination, System.Drawing.Image fullSizeImg, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
       
        int imageWidth;
        int imageHeight;
        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {          

            float scale = 600.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = fullSizeImg;
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            //if (objImage != null)
            //{
            //    objImage.Dispose();
            //    objImage = null;
            //}


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

           // fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth400(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 400.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth204(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;

        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 204.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage.Dispose();
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

            fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth204(string Destination, System.Drawing.Image fullSizeImg, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage;
        int shtHeight;
     
        int imageWidth;

        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
           

            float scale = 204.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = fullSizeImg;
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            //if (objImage != null)
            //{
            //    objImage.Dispose();
            //    objImage = null;
            //}


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

            //fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth235(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;

        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 235.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage.Dispose();
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

            fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth1(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;
        Size newSize = new Size(0, 0);
        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 300.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }

            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void UserThumbHeight(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 71.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public void UserThumbLargeWidth(string Destination, string SourceFile, string FileName, string pageRequest)
    {

        string astrDestination = "";
        Size newSize = new Size(0, 0);
        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 100.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                if (pageRequest == "Speaks")
                {
                    newSize = new Size(140, 90);
                }
                else if (pageRequest == "Projects")
                {
                    newSize = new Size(45, 30);
                }
                else
                {
                    newSize = new Size(shtWidth, shtHeight);
                }
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void UserThumbLargeHeight(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 118.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void UserThumbWidth45(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 45.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void UserThumbHeight1(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 55.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbHeight600(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 600.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage.Dispose();
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

            fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbHeight600(string Destination, System.Drawing.Image fullSizeImg, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
      
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            

            float scale = 600.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = fullSizeImg;
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            //if (objImage != null)
            //{
            //    objImage.Dispose();
            //    objImage = null;
            //}


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }

            //fullSizeImg.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbHeight400(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 400.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbHeight235(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale =235.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbHeight279(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 279.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbHeight116(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 116.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void UserThumbWidth300(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 300.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    //----------------------------------------------------------------------------------------------
    public void CreateThumbnails(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 50.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //public void CreateThumbnailsHeight(string Destination, string SourceFile, string FileName)
    //{

    //    string astrDestination = "";

    //    System.Drawing.Image objImage, objThumbnail;
    //    int shtHeight;
    //    string source = SourceFile;
    //    int imageWidth;
    //    int imageHeight;
    //    int shtWidth;
    //    Double Ratio;

    //    Bitmap bp = null;
    //    Graphics g = null;

    //    Encoder encoderInstance = null;
    //    EncoderParameter encoderParameterInstance = null;
    //    EncoderParameters encoderParametersInstance = null;

    //    try
    //    {
    //        System.Drawing.Image fullSizeImg
    //       = System.Drawing.Image.FromFile(source);

    //        float scale = 71.0f / System.Math.Max(fullSizeImg.Width, fullSizeImg.Height);
    //        imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
    //        //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

    //        if (Directory.Exists(Destination) == false)
    //        {

    //            Directory.CreateDirectory(Destination);
    //            astrDestination = Destination + "/" + FileName;
    //        }
    //        else
    //        {
    //            astrDestination = Destination + "/" + FileName;

    //        }
    //        objImage = System.Drawing.Image.FromFile(SourceFile);
    //        if (objImage.Width != 0)
    //        {
    //            Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
    //            if (Ratio != 0)
    //                shtWidth = Convert.ToInt16(imageHeight / Ratio);
    //            else
    //                shtWidth = imageHeight;
    //              shtHeight = imageHeight;
    //            Size newSize = new Size(shtHeight,shtWidth);
    //            bp = new Bitmap(newSize.Height, newSize.Width);
    //            g = Graphics.FromImage(bp);

    //            g.SmoothingMode = SmoothingMode.HighQuality;
    //            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //            g.PixelOffsetMode = PixelOffsetMode.HighQuality;



    //            Rectangle rect = new Rectangle(0, 0, newSize.Height, newSize.Width);
    //            //Draw the old image on to the new image using the graphics object:
    //            g.DrawImage(objImage, rect, 0, 0, objImage.Height, objImage.Width, GraphicsUnit.Pixel);

    //            foreach (PropertyItem pItem in objImage.PropertyItems)
    //            {
    //                bp.SetPropertyItem(pItem);
    //            }

    //            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
    //            ImageCodecInfo codec = null;
    //            for (int i = 0; i < codecs.Length; i++)
    //            {
    //                if (codecs[i].MimeType.Equals("image/jpeg"))
    //                    codec = codecs[i];
    //            }

    //            //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
    //            //maintain a quality level of 80 percent of the original image (80 percent compression).
    //            //To achieve this, create an encoder parameter for quality and colour depth: 


    //            if (codec != null)
    //            {
    //                encoderInstance = Encoder.Quality;
    //                encoderParametersInstance = new EncoderParameters(2);
    //                encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
    //                encoderParametersInstance.Param[0] = encoderParameterInstance;
    //                encoderInstance = Encoder.ColorDepth;
    //                encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
    //                encoderParametersInstance.Param[1] = encoderParameterInstance;
    //            }

    //            //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

    //            bp.Save(astrDestination, codec, encoderParametersInstance);
    //        }
    //        if (objImage != null)
    //        {
    //            objImage = null;
    //        }


    //        if (bp != null)
    //        {
    //            bp = null;
    //        } if (g != null)
    //        {
    //            g = null;
    //        }
    //        if (g != null)
    //        {
    //            g = null;
    //        }
    //        if (encoderInstance != null)
    //        {
    //            encoderInstance = null;
    //        }
    //        if (encoderParameterInstance != null)
    //        {
    //            encoderParameterInstance = null;
    //        }
    //        if (encoderParametersInstance != null)
    //        {
    //            encoderParametersInstance = null;
    //        }


    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}


    public void CreateThumbnailHeight(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 109.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtHeight = imageHeight;
                int shtWidth = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateVehicles(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 75.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateThumbnails1(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 123.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void Createarticle(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 200.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    //---------------------------------------------------------------------------------
    public void Createarticle1(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 200.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    public void CreatearticleHeight(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        int shtWidth;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 200.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtWidth = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtWidth = imageHeight;
                shtHeight = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void Createarticle1W(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 200.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageWidth = Convert.ToInt32(fullSizeImg.Width * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Height != 0)
            {
                Ratio = Convert.ToDouble(objImage.Width) / Convert.ToDouble(objImage.Height);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageWidth / Ratio);
                else
                    shtHeight = imageWidth;
                int shtWidth = imageWidth;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    public void CreatearticleHeight1(string Destination, string SourceFile, string FileName)
    {

        string astrDestination = "";

        System.Drawing.Image objImage, objThumbnail;
        int shtHeight;
        string source = SourceFile;
        int imageWidth;
        int imageHeight;
        Double Ratio;

        Bitmap bp = null;
        Graphics g = null;

        Encoder encoderInstance = null;
        EncoderParameter encoderParameterInstance = null;
        EncoderParameters encoderParametersInstance = null;

        try
        {
            System.Drawing.Image fullSizeImg
           = System.Drawing.Image.FromFile(source);

            float scale = 200.0f / System.Math.Max(fullSizeImg.Height, fullSizeImg.Width);
            imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);
            //   imageHeight = Convert.ToInt32(fullSizeImg.Height * scale);

            if (Directory.Exists(Destination) == false)
            {

                Directory.CreateDirectory(Destination);
                astrDestination = Destination + "/" + FileName;
            }
            else
            {
                astrDestination = Destination + "/" + FileName;

            }
            objImage = System.Drawing.Image.FromFile(SourceFile);
            if (objImage.Width != 0)
            {
                Ratio = Convert.ToDouble(objImage.Height) / Convert.ToDouble(objImage.Width);
                if (Ratio != 0)
                    shtHeight = Convert.ToInt16(imageHeight / Ratio);
                else
                    shtHeight = imageHeight;
                int shtWidth = imageHeight;
                Size newSize = new Size(shtWidth, shtHeight);
                bp = new Bitmap(newSize.Width, newSize.Height);
                g = Graphics.FromImage(bp);

                g.SmoothingMode = SmoothingMode.HighQuality;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;



                Rectangle rect = new Rectangle(0, 0, newSize.Width, newSize.Height);
                //Draw the old image on to the new image using the graphics object:
                g.DrawImage(objImage, rect, 0, 0, objImage.Width, objImage.Height, GraphicsUnit.Pixel);

                foreach (PropertyItem pItem in objImage.PropertyItems)
                {
                    bp.SetPropertyItem(pItem);
                }

                ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo codec = null;
                for (int i = 0; i < codecs.Length; i++)
                {
                    if (codecs[i].MimeType.Equals("image/jpeg"))
                        codec = codecs[i];
                }

                //Ideally, you want to retain a colour depth of 24bits per pixel for the new image, and 
                //maintain a quality level of 80 percent of the original image (80 percent compression).
                //To achieve this, create an encoder parameter for quality and colour depth: 


                if (codec != null)
                {
                    encoderInstance = Encoder.Quality;
                    encoderParametersInstance = new EncoderParameters(2);
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 80L);
                    encoderParametersInstance.Param[0] = encoderParameterInstance;
                    encoderInstance = Encoder.ColorDepth;
                    encoderParameterInstance = new EncoderParameter(encoderInstance, 24L);
                    encoderParametersInstance.Param[1] = encoderParameterInstance;
                }

                //Save the new image to the file using the image codec for jpeg files and an array of EncoderParameters: 

                bp.Save(astrDestination, codec, encoderParametersInstance);
            }
            if (objImage != null)
            {
                objImage = null;
            }


            if (bp != null)
            {
                bp = null;
            } if (g != null)
            {
                g = null;
            }
            if (g != null)
            {
                g = null;
            }
            if (encoderInstance != null)
            {
                encoderInstance = null;
            }
            if (encoderParameterInstance != null)
            {
                encoderParameterInstance = null;
            }
            if (encoderParametersInstance != null)
            {
                encoderParametersInstance = null;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }

    }



    private bool ThumbnailCallback()
    {
        return false;
    }
    //public void GenerateThumbnail(string sFileName, string sSize, string sSuffix)
    //{
    //    try
    //    {
    //        string apppath = System.Web.HttpContext.Current.Request.PhysicalApplicationPath;
    //        System.Diagnostics.Process pCreateImage;
    //        pCreateImage.StartInfo.FileName = apppath + "img/Case/ffmpeg.exe";
    //        pCreateImage.StartInfo.Arguments = ((((" -i " + apppath + "/img/Case/" + Request.QueryString("CaseId") + "/") + sFileName + " -y -f image2 -t 0.001 -s ") + sSize+" ") + apppath +"img/Case/" + Request.QueryString("CaseId") +"/") + System.IO.Path.ChangeExtension(sFileName, "jpg").Replace(".", sSuffix);

    //        pCreateImage.StartInfo.UseShellExecute = False;
    //        pCreateImage.StartInfo.CreateNoWindow = False;
    //        pCreateImage.StartInfo.RedirectStandardOutput = False;
    //        pCreateImage.Start();
    //        pCreateImage.WaitForExit();
    //        pCreateImage.Close();
    //         string strfileName = System.Web.HttpContext.Current.Server.MapPath("/Sonoworld/img/Case/" & Request.QueryString("CaseId") & "/" & System.IO.Path.ChangeExtension(sFileName, "jpg").Replace(".", sSuffix));
    //         int iWidth;
    //         int iHeight;

    //         Bitmap bitMapImage = new Bitmap(strfileName);

    //          Graphics graphicImage = new  Graphics.f(bitMapImage);

    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}
    //    Public

    //Function GenerateThumbnail(ByVal sFileName As String, ByVal sSize As String, ByVal sSuffix As String) As String 

    //Try 


    //

    //
    //Dim bitMapImage As New System.Drawing.Bitmap(strfileName) 

    //Dim graphicImage As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(bitMapImage) 

    //Dim oSourceImage As System.Drawing.Image = System.Drawing.Image.FromFile(System.Web.HttpContext.Current.Server.MapPath("\Sonoworld\img\Case\" & Request.QueryString("CaseId") & "\" & System.IO.Path.ChangeExtension(sFileName, "jpg").Replace(".", sSuffix))) 
    //iWidth = oSourceImage.Width / 2

    //iHeight = oSourceImage.Height / 2

    //oSourceImage.Dispose()

    //graphicImage.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias


    //'System.Drawing.Rectangle rect = new System.Drawing.Rectangle(new System.Drawing.Point(iWidth - 8, iHeight - 8), new System.Drawing.Size(16, 16)); 

    //Dim rect As New System.Drawing.Rectangle(New System.Drawing.Point(iWidth - (((iWidth * 50) / 100) / 2), iHeight - (((iHeight * 50) / 100) / 2)), New System.Drawing.Size(((iWidth * 50) / 100), ((iWidth * 50) / 100))) 
    //graphicImage.DrawIcon(

    //New System.Drawing.Icon(System.Web.HttpContext.Current.Server.MapPath("/Sonoworld/img/Case/" & "/" & "play.ico")), rect) 
    //bitMapImage.Save(System.Web.HttpContext.Current.Server.MapPath("/Sonoworld/img/Case/" & Request.QueryString("CaseId") & "/" & System.IO.Path.ChangeExtension("T_" & sFileName, "jpg").Replace(".", sSuffix)), System.Drawing.Imaging.ImageFormat.Jpeg)

    //bitMapImage.Save(System.Web.HttpContext.Current.Server.MapPath("/Sonoworld/img/Case/" & Request.QueryString("CaseId") & "/" & System.IO.Path.ChangeExtension("C_" & sFileName, "jpg").Replace(".", sSuffix)), System.Drawing.Imaging.ImageFormat.Jpeg)


    //'bitMapImage.Save(System.Web.HttpContext.Current.Server.MapPath("/Sonoworld/img/Case/" & Request.QueryString("CaseId") & "/" & System.IO.Path.ChangeExtension("l_" & sFileName, "jpg").Replace(".", sSuffix)), System.Drawing.Imaging.ImageFormat.Jpeg) 

    //'bitMapImage.Save(System.Web.HttpContext.Current.Server.MapPath("/Sonoworld/img/Case/" & Request.QueryString("CaseId") & "/" & System.IO.Path.ChangeExtension("S_" & sFileName, "jpg").Replace(".", sSuffix)), System.Drawing.Imaging.ImageFormat.Jpeg) 


    //graphicImage.Dispose()

    //bitMapImage.Dispose()



    //Return strfileName 



    //Catch ex As Exception 
    //Response.Write(ex.Message.ToString)


    //End Try 

    //End Function 


}



