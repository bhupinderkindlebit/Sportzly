<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="Sportzly.Web.Photos" %>
<%@ Register src="Controls/ProfileHeaderControl.ascx" tagname="ProfileHeaderControl" tagprefix="uc1" %>
<%@ Register Src="~/Controls/PhotosListControl.ascx" TagPrefix="uc1" TagName="PhotosListControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <section id="wrapper">
             
                <uc1:ProfileHeaderControl ID="ProfileHeaderControl1" runat="server" />
                <uc1:PhotosListControl runat="server" id="PhotosListControl" />
        </section>
</asp:Content>
