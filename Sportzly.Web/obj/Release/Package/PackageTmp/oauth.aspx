<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="oauth.aspx.cs" Inherits="Sportzly.Web.oauth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function closepopup(a) {        
         
            if (a == "twitter") {
                window.opener.hideframe_startprocessing(a);
                window.close();
            }
            else {
                window.opener.startGrabbingOauth(a);
                window.self.close();
            }
         
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
