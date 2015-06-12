<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="ProfileSave.aspx.cs" Inherits="Sportzly.Web.ProfileSave" %>
<%@ Register Src="Controls/ProfileUpdateControl.ascx" TagName="ProfileUpdateControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/ErrorControl.ascx" TagName="ErrorControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <uc1:ErrorControl ID="ErrorControl1" runat="server" />
     <uc1:ProfileUpdateControl ID="ProfileUpdateControl1" runat="server" />
   
</asp:Content>
