<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="PendingInvites.aspx.cs" Inherits="Sportzly.Web.PendingInvites" %>
<%@ Register src="Controls/ProfileHeaderControl.ascx" tagname="ProfileHeaderControl" tagprefix="uc1" %>








<%@ Register src="Controls/PendingInvitesListFullControl.ascx" tagname="PendingInvitesListFullControl" tagprefix="uc2" %>








<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<section id="wrapper">
                
             
                <uc1:ProfileHeaderControl ID="ProfileHeaderControl1" runat="server" />
            
                <uc2:PendingInvitesListFullControl ID="PendingInvitesListFullControl1" runat="server" />
             </section><!--End-wrapper-->
</asp:Content>
