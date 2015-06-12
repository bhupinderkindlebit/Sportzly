<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="Document.aspx.cs" Inherits="Sportzly.Web.Document" %>
<%@ Register src="Controls/FormControl.ascx" tagname="FormControl" tagprefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:FormControl ID="FormControl1" runat="server" />
</asp:Content>
