<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingInvitesTeamListMiniControl.ascx.cs" Inherits="Sportzly.Web.Controls.PendingInvitesTeamListMiniControl" %>

<div class="pendingInvites" data-bind="visible: ResultCount() > 0">
    <div class="section-title memberstitle">
        <h2>Pending Members <strong>(<span class="number-135" id="Span1" data-bind="text: ResultCount"></span>)</strong></h2>
    </div>
    <ul data-bind="foreach: Result()">
        <li><a href="#"><i class="fa fa-fw"></i><span data-bind="text: Email()"></span></a>
            <a data-bind="attr: { href: 'javascript:' }, click: function () { sendInvite($data); }" class="btn btn-primary blue" style="color: #ffffff;"><span class="prev"></span>Resend </a>
        </li>
    </ul>
</div>
