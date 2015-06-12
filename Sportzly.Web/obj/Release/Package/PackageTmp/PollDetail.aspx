<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="PollDetail.aspx.cs" Inherits="Sportzly.Web.PollDetail" %>
<%@ Register src="Controls/PollDetailControl.ascx" tagname="PollDetailControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:PollDetailControl ID="PollDetailControl1" runat="server" />
</asp:Content>
