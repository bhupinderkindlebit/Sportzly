<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyPendingTeamRequestControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyPendingTeamRequestControl" %>
<div class="teamRequests" data-bind="visible: PendingResultCount() > 0" style="margin: auto; display: none;">
    <div data-bind="foreach: PendingResult">
        <!-- ko if: !IsApproved() -->
         <a class="user-img2" data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
            <img data-bind="attr: { src: Photo, alt: Name }" width="37" height="37"></a>
        <p class="fontadded">
            <b><span data-bind="text: Name()"></span></b><span> wants to join </span><span data-bind="text: TeamName()"></span></p>
        <a class="linksUnderline" data-bind="attr: { href: 'javascript:' }, click: function () { approveMember($data, true); }, visible: !IsApproved() && IsMyTeam()">Approve</a> <a class="linksUnderline" data-bind="attr: { href: 'javascript:' }, click: function () { approveMember($data, false); }, visible: !IsApproved() && IsMyTeam()">Reject</a> <a data-bind="attr: { href: 'javascript:' }, click: function () { approveMember($data, false); }, visible: IsApproved() && IsMyTeam()">Discontinue</a>
        <!-- /ko -->
    </div>
</div>
