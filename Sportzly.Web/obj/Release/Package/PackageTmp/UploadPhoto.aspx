<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="UploadPhoto.aspx.cs" Inherits="Sportzly.Web.UploadPhoto" %>

<%@ Register Src="~/Controls/UploadPhotoControl.ascx" TagPrefix="uc1" TagName="UploadPhotoControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UploadPhotoControl runat="server" id="UploadPhotoControl" />
</asp:Content>
