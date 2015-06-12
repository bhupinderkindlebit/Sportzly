<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="Sportzly.Web.Event" %>

<%@ Register Src="~/Controls/BulletinBoardControl.ascx" TagPrefix="uc1" TagName="BulletinBoardControl" %>
<%@ Register Src="~/Controls/EventDetailControl.ascx" TagPrefix="uc1" TagName="EventDetailControl" %>
<%@ Register Src="Controls/ProfileHeaderControl.ascx" TagName="ProfileHeaderControl" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
     <section id="wrapper" >       
    <uc2:ProfileHeaderControl ID="profileHeader" runat="server" />  
    <uc1:EventDetailControl runat="server" id="EventDetailControl" />
    </section>
    <script type="text/javascript">
        $(document).ready(function () {
            var ellipsestext = "...";
            var moretext = "See More";
            var lesstext = "See Less";

            $("body").delegate(".morelinkb", "click", function (event) {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });

            $("body").delegate(".morelinka", "click", function (event) {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });

        });
</script>
</asp:Content>
