<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="ProfileUpdate.aspx.cs" Inherits="Sportzly.Web.ProfileUpdate" %>

<%@ Register Src="Controls/ProfileUpdateControl.ascx" TagName="ProfileUpdateControl" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:ProfileUpdateControl ID="ProfileUpdateControl1" runat="server" />
</asp:Content>
