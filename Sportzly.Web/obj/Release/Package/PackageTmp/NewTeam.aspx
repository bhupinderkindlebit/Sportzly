<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="NewTeam.aspx.cs" Inherits="Sportzly.Web.NewTeam" %>

<%@ Register Src="~/Controls/NewTeamControl.ascx" TagPrefix="uc1" TagName="NewTeamControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <uc1:NewTeamControl runat="server" id="NewTeamControl" />
</asp:Content>
