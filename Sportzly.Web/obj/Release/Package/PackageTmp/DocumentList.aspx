<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="Sportzly.Web.DocumentList" %>

<%@ Register Src="Controls/MyProfileHeaderControl.ascx" TagName="MyProfileHeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/DocumentListControl.ascx" TagPrefix="uc1" TagName="DocumentListControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <uc1:MyProfileHeaderControl ID="MyProfileHeaderControl" runat="server" />
    <uc1:DocumentListControl runat="server" ID="DocumentListControl" />
</asp:Content>
