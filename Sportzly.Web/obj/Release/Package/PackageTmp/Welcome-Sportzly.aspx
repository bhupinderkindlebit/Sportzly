<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="Welcome-Sportzly.aspx.cs" Inherits="Sportzly.Web.Welcome_Sportzly" %>

<%@ Register Src="~/Controls/WelcomeSportzlyControl.ascx" TagPrefix="uc1" TagName="WelcomeSportzlyControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:WelcomeSportzlyControl runat="server" id="WelcomeSportzlyControl" /> 
</asp:Content>
