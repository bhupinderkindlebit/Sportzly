<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="TeamMembers.aspx.cs" Inherits="Sportzly.Web.Members" %>

<%@ Register Src="Controls/TeamMembersAdminControl.ascx" TagName="TeamMembersAdminControl" TagPrefix="uc2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <uc2:TeamMembersAdminControl ID="TeamMembersAdminControl1" runat="server" />
</asp:Content>
