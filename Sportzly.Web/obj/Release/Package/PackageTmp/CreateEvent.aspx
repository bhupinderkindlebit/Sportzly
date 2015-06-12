<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="Sportzly.Web.CreateEvent" %>

<%@ Register Src="~/Controls/CreateEventControl.ascx" TagPrefix="uc1" TagName="CreateEventControl" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CreateEventControl runat="server" id="CreateEventControl" />
</asp:Content>
