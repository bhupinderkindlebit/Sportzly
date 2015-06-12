<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Sportzly.Web.Welcome" %>
<%@ Register src="Controls/WelcomeControl.ascx" tagname="WelcomeControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:WelcomeControl ID="WelcomeControl1" runat="server" />
</asp:Content>
