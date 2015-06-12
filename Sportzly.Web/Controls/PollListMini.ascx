<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PollListMini.ascx.cs" Inherits="Sportzly.Web.Controls.PollListMini" %>

<link href="Content/speedo.popup.fx.css" rel="stylesheet" />
<link href="Scripts/SpeedPopup/dark/dark.css" rel="stylesheet" />
<script src="Scripts/SpeedPopup/speedo.popup.min.js"></script>
<link href="Scripts/SpeedPopup/lightbox/lightbox.css" rel="stylesheet" />

<div class="pendingPolls team-admin" data-bind="visible: ResultCount() > 0">
    <h3>Polls (<span class="number-135" id="spPollCount" data-bind="text: ResultCount">0</span>)</h3>
    <div data-bind="foreach: Result()" id="divPolls" style="padding: 6px 0px;">
        <div style="clear: both; padding-bottom: 10px;">
            <span class="soccer-text" data-bind="text: PollQuestion()" style="color: #646464;"></span><a data-bind="attr: { href: 'javascript:' }, click: function () { OpenPoll($data); }" title="Vote Now">
                <img src="../images/vote.png" style="float: right; margin-left: 5px; width: 24px; border-radius: 0px;" /></a>
        </div>
    </div>
</div>
