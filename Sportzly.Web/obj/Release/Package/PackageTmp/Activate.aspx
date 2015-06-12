<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Activate.aspx.cs" Inherits="Sportzly.Web.Activate" %>

<%@ Register Src="Controls/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <br />
    <div style="background-color: #fff">
    <br />    <center><h1>
            <label id="confirmBox" runat="server" visible="false"></label>
        </h1>
            </center>
        <uc1:LoginControl ID="LoginControl1" runat="server" />
    </div>

</asp:Content>
