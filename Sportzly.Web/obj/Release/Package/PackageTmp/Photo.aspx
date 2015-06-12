<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="Photo.aspx.cs" Inherits="Sportzly.Web.Photo" %>

<%@ Register Src="~/Controls/PhotoUploadControl.ascx" TagPrefix="uc1" TagName="PhotoUploadControl" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:PhotoUploadControl runat="server" id="PhotoUploadControl" />
</asp:Content>
