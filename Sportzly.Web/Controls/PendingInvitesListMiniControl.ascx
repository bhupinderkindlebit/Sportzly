<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingInvitesListMiniControl.ascx.cs" Inherits="Sportzly.Web.Controls.PendingInvitesListMiniControl" %>

<style type="text/css">
    .requestP {
        background: none repeat scroll 0 0 #1275BC;
        border-radius: 20px;
        color: #FFFFFF !important;
       display: inline-block;
        font-family: 'proxima_nova_rgbold';
        font-size: 11px;
        font-weight: bold;
        height: 23px;
        line-height: 23px;
        margin-left: 22px;
        margin-top: 10px;
        text-align: center;
        text-transform: uppercase;
        width: 150px;
    }
   
</style>

<div class="pendingInvites" data-bind="visible: ResultCount() > 0" style="float: left;display:none;">
    <h2 class="media" style="margin-left: 0px; margin-bottom: 5px;">Pending Invites <span>(<span class="number-135" id="spInviteCount" data-bind="text: ResultCount">0</span>)</span></h2>
    <div data-bind="foreach: Result()" id="divInvites">
        <div class="info-video info-video3">
            <span class="soccer-text"  data-bind="text: Email()" style="color:#404040;font-size:14px;word-wrap:break-word;width:80%;float:left;"></span>  <a data-bind="    attr: { href: 'javascript:' }, click: function () { sendInvite($data); }" title="RESEND INVITATION" ><img src="../images/invitation3.png" style="float:right; margin-left:5px;"/></a>
        </div>      

    </div>
    <div style="float:left;text-align:center;"> <a data-bind="    attr: { href: 'PendingInvites.aspx' }">
        <img src="images/view_all_invites.png" style="margin-left:30px;" /></a> </div>
</div>
