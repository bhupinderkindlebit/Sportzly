<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bulletin.aspx.cs" MasterPageFile="~/MasterPages/BlankMaster.Master" Inherits="Sportzly.Web.Bulletin" %>

<%@ Register Src="~/Controls/BulletinBoardUpdateControl.ascx" TagPrefix="uc1" TagName="BulletinBoardUpdateControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:BulletinBoardUpdateControl runat="server" ID="BulletinBoardUpdateControl" />
</asp:Content>
