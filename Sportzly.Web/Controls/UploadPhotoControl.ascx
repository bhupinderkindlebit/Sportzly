<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadPhotoControl.ascx.cs" Inherits="Sportzly.Web.Controls.UploadPhotoControl" %>
<link rel="stylesheet" type="text/css" href="scripts/imageareaselect/imgareaselect-default.css" />
<script src="Scripts/jquery.imgareaselect.pack.js" type="text/javascript"></script>
<div style="float: left;" runat="server" id="cropDiv">
    Crop Image:<br />
    <asp:Image ID="Image1" runat="server" Height="235px" />
</div>
<div style="float: right;" runat="server" id="previewDiv">
    Preview:<br />
    <div style="height: 140px; width: 140px; overflow: hidden">
        <asp:Image ID="Image2" runat="server" Height="235px" />
    </div>
</div>

<div style="clear: both">
    <input type="hidden" id="y1" value="0" runat="server" />
    <input type="hidden" id="h" value="0" runat="server" />
    <input type="hidden" id="x1" value="0" runat="server" />
    <input type="hidden" id="w" value="0" runat="server" />
    <input type="hidden" id="orgH" value="0" runat="server" />
    <input type="hidden" id="orgW" value="0" runat="server" />

    <asp:FileUpload ID="FileUpload1" runat="server" Width="438px" />
    &nbsp;<asp:Button ID="Button2" runat="server" Text="Upload An Image" OnClick="Button2_Click" Style="display: none;" />
    &nbsp;   
    <asp:Button ID="Button1" runat="server" Text="Done" OnClick="Button1_Click" Visible="false" />
    <br />
    Please upload image of ratio 1:1.
</div>

<script type="text/ecmascript">
    $(document).ready(function () {
        var imgWidth = $('#<%=this.Image1.ClientID%>').width();
        var imgHeight = $('#<%=this.Image1.ClientID%>').height();
        
        $('#<%=this.Image1.ClientID%>').imgAreaSelect({ aspectRatio: '1:1', handles: true, onSelectChange: preview, x1: 0, y1: 0, x2: imgWidth, y2: imgHeight });
               
        $('#<%=this.Image2.ClientID%>').css({
            width: Math.round(140),
            height: Math.round(140),
            marginLeft: -Math.round(0),
            marginTop: -Math.round(0)
        });

        $('#<%=this.x1.ClientID%>').val(0);
        $('#<%=this.y1.ClientID%>').val(0);
        $('#<%=this.w.ClientID%>').val(imgWidth);
        $('#<%=this.h.ClientID%>').val(imgHeight);
        $('#<%=this.orgW.ClientID%>').val(imgWidth);
        $('#<%=this.orgH.ClientID%>').val(imgHeight);


        $('#<%=this.FileUpload1.ClientID%>').on('change', function (evt) {
            var file = evt.target.files[0];
            if (file)
                $('#<%=this.Button2.ClientID%>').show();
            else
                $('#<%=this.Button2.ClientID%>').hide();
        });
    });

    function preview(img, selection) {
        if (!selection.width || !selection.height)
            return;

        var imgWidth = $('#<%=this.Image1.ClientID%>').width();
        var imgHeight = $('#<%=this.Image1.ClientID%>').height();
                
        var scaleW = 140 / selection.width;
        var scaleH = 140 / selection.height;

        $('#<%=this.Image2.ClientID%>').css({
            width: Math.round(scaleW * imgWidth),
            height: Math.round(scaleH * imgHeight),
            marginLeft: -Math.round(scaleW * selection.x1),
            marginTop: -Math.round(scaleH * selection.y1)
        });

        $('#<%=this.x1.ClientID%>').val((selection.x1));
        $('#<%=this.y1.ClientID%>').val((selection.y1));
        $('#<%=this.w.ClientID%>').val(selection.width);
        $('#<%=this.h.ClientID%>').val(selection.height); 
        $('#<%=this.orgW.ClientID%>').val(imgWidth);
        $('#<%=this.orgH.ClientID%>').val(imgHeight);

    }
</script>


