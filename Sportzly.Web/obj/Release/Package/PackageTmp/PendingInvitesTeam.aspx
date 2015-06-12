<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="PendingInvitesTeam.aspx.cs" Inherits="Sportzly.Web.PendingInvitesTeam" %>
<%@ Register src="Controls/ProfileHeaderControl.ascx" tagname="ProfileHeaderControl" tagprefix="uc1" %>


<%@ Register src="Controls/PendingInvitesTeamListFullControl.ascx" tagname="PendingInvitesTeamListFullControl" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <section id="wrapper">
             
                <uc1:ProfileHeaderControl ID="ProfileHeaderControl1" runat="server" />
            <uc3:PendingInvitesTeamListFullControl ID="PendingInvitesTeamListFullControl1" runat="server" />
                
             </section><!--End-wrapper-->
</asp:Content>
