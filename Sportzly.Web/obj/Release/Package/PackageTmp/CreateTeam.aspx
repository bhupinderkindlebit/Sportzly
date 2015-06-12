<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="CreateTeam.aspx.cs" Inherits="Sportzly.Web.CreateTeam" %>

<%@ Register Src="~/Controls/CreateTeamControl.ascx" TagName="CreateTeamControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
            <uc1:CreateTeamControl ID="CreateTeamControl" runat="server" />       
</asp:Content>
