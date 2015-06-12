<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YouTubeUpload.aspx.cs" Inherits="Sportzly.Web.YouTubeUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <style type="text/css">
        .uploadlogo {
            border-radius: 0px !important;
            margin-bottom: 5px !important;
        }
    </style>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-45569497-1', 'sportzly.com');
        ga('send', 'pageview');

</script>
</head>
<body>
    <div>
        <form id="form1" method="post" enctype="multipart/form-data" runat="server">
            <fieldset id="UploadForm1">
                <legend>Upload New Video</legend>
                <table>
                    <tr>
                        <td>Title:</td>
                        <td>
                            <asp:TextBox ID="Title" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:TextBox ID="Description" runat="server" Columns="50"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Keywords:</td>
                        <td>
                            <asp:TextBox ID="Keyword" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:DropDownList ID="Category" runat="server">
                                <asp:ListItem Value="Autos">Autos &amp; Vehicles</asp:ListItem>
                                <asp:ListItem Value="Music">Music</asp:ListItem>
                                <asp:ListItem Value="Animals">Pets &amp; Animals</asp:ListItem>
                                <asp:ListItem Value="Sports">Sports</asp:ListItem>
                                <asp:ListItem Value="Travel">Travel &amp; Events</asp:ListItem>
                                <asp:ListItem Value="Games">Gadgets &amp; Games</asp:ListItem>
                                <asp:ListItem Value="Comedy">Comedy</asp:ListItem>
                                <asp:ListItem Value="People">People &amp; Blogs</asp:ListItem>
                                <asp:ListItem Value="News">News &amp; Politics</asp:ListItem>
                                <asp:ListItem Value="Entertainment">Entertainment</asp:ListItem>
                                <asp:ListItem Value="Education">Education</asp:ListItem>
                                <asp:ListItem Value="Howto">Howto &amp; Style</asp:ListItem>
                                <asp:ListItem Value="Nonprofit">Nonprofit &amp; Activism</asp:ListItem>
                                <asp:ListItem Value="Tech">Science &amp; Technology</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <div id="uploadVideoBoxFive"></div>
                            <div id="uploadVideoBox" style="display: none;"></div>
                            <input id="hdFileName" runat="server" type="hidden" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:red; font-weight:bold;">
                            Note: Please be patient while Youtube verifies the video and post it on your stream. Please do not hit play until video thumbnail is displayed.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input id="SubmitVideo" type="submit" value="Upload" runat="server" onserverclick="SubmitVideo_ServerClick" style="display: none;" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMsg" runat="server" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>


        <% PrintForm(); %>
    </div>
</body>
</html>
<script src="uploadify/jquery.uploadifive.js"></script>
<link href="uploadify/uploadifive.css" rel="stylesheet" />
<script type="text/javascript">
    $(document).ready(function () {

        $("#uploadVideoBoxFive").uploadifive({
            'height': 30,
            'buttonClass': 'uploadlogo',
            'formData': { 'uid': getUser().UserKey },
            'uploadScript': 'uploadify/uploadifyVideo.aspx',
            'width': 120,
            'fileSizeLimit': 0,
            'multi': false,
            'fileType': 'video',
            'onUploadComplete': function (file, data) {
                if (data.indexOf("Failed") == 0) return;

                $("#hdFileName").val(data);
                $("#SubmitVideo").show();


            },
            'onFallback': function () {
                $("#uploadVideoBox").uploadify({
                    height: 30,
                    swf: 'uploadify/uploadify.swf',
                    'formData': { 'uid': getUser().UserKey },
                    uploader: 'uploadify/uploadifyVideo.aspx',
                    width: 120,
                    'onUploadSuccess': function (file, data, response) {
                        if (data.indexOf("Failed") == 0) return;

                        $("#hdFileName").val(data);
                        $("#SubmitVideo").show();
                    }
                });

            },
            'onError': function (errorType) {
                alert('The error was: ' + errorType);
            }
        });

    });



</script>
