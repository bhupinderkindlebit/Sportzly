<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="Invite.aspx.cs" Inherits="Sportzly.Web.Invite" %>

<%@ Register Src="Controls/MyInviteControl.ascx" TagName="MyInviteControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="invite-section invite-section-box invitearticle">
        <div class="col-xs-12 col-sm-12 col-md-12 eat-nopadding2">
            <uc1:MyInviteControl ID="InviteControl1" runat="server" />
        </div>
    </div>
</asp:Content>
