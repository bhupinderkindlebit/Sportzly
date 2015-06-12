<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="Sportzly.Web.Members" %>

<%@ Register Src="Controls/MyProfileHeaderControl.ascx" TagName="MyProfileHeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/MemberListControl.ascx" TagPrefix="uc1" TagName="MemberListControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <uc1:MyProfileHeaderControl ID="MyProfileHeaderControl" runat="server" />
    <uc1:MemberListControl runat="server" ID="MemberListControl" />
</asp:Content>
