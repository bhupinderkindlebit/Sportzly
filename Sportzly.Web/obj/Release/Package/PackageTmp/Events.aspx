<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Sportzly.Web.Events" %>

<%@ Register Src="~/Controls/EventListControl.ascx" TagPrefix="uc1" TagName="EventList" %>
<%@ Register Src="Controls/MyProfileHeaderControl.ascx" TagName="MyProfileHeaderControl" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <uc2:MyProfileHeaderControl ID="MyProfileHeaderControl" runat="server" />
    <uc1:EventList runat="server" ID="EventList" />
</asp:Content>
