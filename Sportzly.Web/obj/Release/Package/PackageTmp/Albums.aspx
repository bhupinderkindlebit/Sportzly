<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Albums.aspx.cs" Inherits="Sportzly.Web.Albums" %>

<%@ Register Src="Controls/MyProfileHeaderControl.ascx" TagName="MyProfileHeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/AlbumsListControl.ascx" TagName="AlbumsListControl" TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <uc1:MyProfileHeaderControl ID="MyProfileHeaderControl" runat="server" />
    <uc2:AlbumsListControl ID="AlbumsListControl1" runat="server" />
</asp:Content>
