<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master"
    AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="Sportzly.Web.Team" %>

<%@ Register Src="~/Controls/MyProfileHeaderControl.ascx" TagPrefix="uc1" TagName="MyProfileHeaderControl" %>
<%@ Register Src="~/Controls/BulletinBoardControl.ascx" TagPrefix="uc1" TagName="BulletinBoardControl" %>
<%@ Register Src="~/Controls/SportzlyPhotoListMiniWallControl.ascx" TagPrefix="uc1" TagName="SportzlyPhotoListMiniWallControl" %>
<%--<%@ Register Src="~/Controls/MyEventsForthComingControl.ascx" TagPrefix="uc1" TagName="MyEventsForthComingControl" %>--%>
<%@ Register Src="~/Controls/MyShareStatusControl.ascx" TagPrefix="uc1" TagName="MyShareStatusControl" %>
<%@ Register Src="~/Controls/MyActivitiesControl.ascx" TagPrefix="uc1" TagName="MyActivitiesControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
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
        <uc1:MyProfileHeaderControl runat="server" ID="MyProfileHeaderControl" />
        <div class="resp-tabs-container noborder-bottom">
          <div class="tab1 col-xs-12">
            <uc1:BulletinBoardControl runat="server" ID="bulletinBoardControl" />
           <%-- <uc1:MyEventsForthComingControl runat="server" id="MyEventsForthComingControl" />  --%>
            <uc1:SportzlyPhotoListMiniWallControl runat="server" id="SportzlyPhotoListMiniWallControl" />
            <uc1:MyShareStatusControl runat="server" ID="MyShareStatusControl" />
            <uc1:MyActivitiesControl runat="server" ID="MyActivitiesControl" />
            </div>
        </div>
        <div class="showmorebtnbottom showmore" ><a href="javascript:void(0);moreActivities();">SHOW MORE POSTS &nbsp;&nbsp; <i class="fa fa-fw"></i></a></div>
</asp:Content>
