<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="AlbumPhotos.aspx.cs" Inherits="Sportzly.Web.Photos" %>
<%@ Register src="Controls/ProfileHeaderControl.ascx" tagname="ProfileHeaderControl" tagprefix="uc1" %>
<%@ Register Src="~/Controls/NewAlbumPhotosListControl.ascx" TagPrefix="uc1" TagName="AlbumPhotosListControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <section id="wrapper">
             
                <uc1:ProfileHeaderControl ID="ProfileHeaderControl1" runat="server" />
                <uc1:AlbumPhotosListControl runat="server" id="AlbumPhotosListControl" />
        </section>
</asp:Content>
