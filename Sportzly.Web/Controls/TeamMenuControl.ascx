<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TeamMenuControl.ascx.cs" Inherits="Sportzly.Web.Controls.TeamMenuControl" %>
<%@ Register Src="~/Controls/PhotoListMiniWallControl.ascx" TagPrefix="uc1" TagName="PhotoListMiniWallControl" %>
<%@ Register Src="~/Controls/SportzlyPhotoListMiniWallControl.ascx" TagPrefix="uc1" TagName="SportzlyPhotoListMiniWallControl" %>



<article class="tab-link" style="display: none;">

    <a href="#">PUBLIC WALL</a>

    <a href="#">LOCKER ROOM</a>

    <a href="#">TEAM PROFILE</a>

    <a href="#">TEAM ROSTER</a>

    <a href="#">STANDINGS</a>

</article>
<!--end-tab-link-->

<article class="tab-img-link">
    <%--<uc1:PhotoListMiniWallControl runat="server" ID="PhotoListMiniControl" HideHeader="false" />--%>
    <uc1:SportzlyPhotoListMiniWallControl runat="server" id="SportzlyPhotoListMiniWallControl" />
    <div class="clear"></div>
</article>
<!--end-tab-img-link-->
