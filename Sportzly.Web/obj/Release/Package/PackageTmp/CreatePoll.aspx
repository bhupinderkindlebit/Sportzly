<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="CreatePoll.aspx.cs" Inherits="Sportzly.Web.CreatePoll" %>

<%@ Register Src="Controls/CreatePoll.ascx" TagName="CreatePoll" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CreatePoll ID="CreatePoll1" runat="server" />
</asp:Content>
