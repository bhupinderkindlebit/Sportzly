<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingTeamRequestControl.ascx.cs" Inherits="Sportzly.Web.Controls.PendingTeamRequestControl" %>
<style type="text/css">
    .request {
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
        width: 80px !important;
        font-weight: bold;
    }

    .text-marcus span {
        line-height: 20px;
    }
</style>
<div class="teamRequests" data-bind="visible: PendingResultCount() > 0" style="margin: auto;display:none;">
    <div data-bind="foreach: PendingResult">
        <!-- ko if: !IsApproved() -->
        <div class="schedule-list" style="padding-top: 0px;">
            <div class="center-schedule-list" style="padding: 10px 10px; float: none;width:294px;">
                <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                    <img data-bind="attr: { src: Photo, alt: Name }" width="30" height="30" /></a>

                <span data-bind="text: Name()"></span>&nbsp;<span>wants to join </span><span data-bind="    text: TeamName()"></span>
                <div id="respond" style="margin-left: 62px; clear: both;">

                    <a data-bind="attr: { href: 'javascript:' }, click: function () { approveMember($data, true); }, visible: !IsApproved() && IsMyTeam()" class="request1">Approve</a>
                    <a data-bind="attr: { href: 'javascript:' }, click: function () { approveMember($data, false); }, visible: !IsApproved() && IsMyTeam()" class="request1">Reject</a>
                    <a data-bind="attr: { href: 'javascript:' }, click: function () { approveMember($data, false); }, visible: IsApproved() && IsMyTeam()" class="request1">Discontinue</a>
                </div>
            </div>
        </div>
        <!-- /ko -->
    </div>
</div>
