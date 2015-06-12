<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="Sportzly.Web.Friends" %>
<%@ Register src="Controls/ProfileHeaderControl.ascx" tagname="ProfileHeaderControl" tagprefix="uc1" %>
<%@ Register Src="~/Controls/FriendListControl.ascx" TagPrefix="uc1" TagName="FriendListControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<section id="wrapper">
             
                <uc1:ProfileHeaderControl ID="ProfileHeaderControl1" runat="server" />
                <uc1:FriendListControl runat="server" id="FriendListControl" />
                
             </section><!--End-wrapper-->
</asp:Content>
