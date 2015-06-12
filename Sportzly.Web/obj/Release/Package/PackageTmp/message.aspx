<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="Sportzly.Web.message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Common/Styles/css/all.css" rel="stylesheet" />
    <link href="Common/Styles/css/style.MyUpdates.css" rel="stylesheet" />
    <style type="text/css">
        .left-comment-text {
            color: #007400;
            font-family: 'proxima_nova_rgbold';
            font-size: 15px;
            font-weight: bold;
        }

        ul {
            list-style: disc;
            line-height: 30px;
            font-size: 13px;
        }

        .left-comment {
            margin: 10px 20px;
            float: left;
        }
        body {
           background: none repeat scroll 0 0 #F6F6F6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="left-comment">

        <div style="float: left; width: 350px; text-align:center;" class="left-comment-text">Your Sports stream is empty </div>
        <ul>
            <li>Please invite your Sports buddies or Friends to join you.</li>
            <li>Click Teams on Menu to Join a existing team.</li>
            <li>Create your own team and invite your team members. </li>
        </ul>
    
        
    
</asp:Content>
