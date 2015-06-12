﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PollDetailControl.ascx.cs" Inherits="Sportzly.Web.Controls.PollDetailControl" %>
<script src="Scripts/SpeedPopup/speedo.popup.min.js"></script>
<div class="pollEntity">
    <h2 class="media" style="padding: 10px;"><span class="number-135" data-bind="text: PollQuestion()"></span></h2>
    <div data-bind="foreach: PollOptions, visible: PollOptions().length > 0" style="display: none">
        <div style="width: 200px; float: left;">
            <input type="radio" name="poll" data-bind="attr: { value: OptionId() }" />
            <span class="chicago" data-bind="text: OptionDetails()"></span>
        </div>
        <div style="width: 50px; float: left; display: none;" class="divPoll">
            <span class="chicago" data-bind="text: VoteCount()"></span>
            <br />
        </div>
        <br />

    </div>
    <input style="width: 100px; height: 20px; padding: 0px !important; float: left; margin: 5px;" type="button" class="login-submit-btn" value="Submit" data-bind="click: function () { SaveChoice($data); }" />
    <input style="width: 100px; height: 20px; padding: 0px !important; float: left; margin: 5px" type="button" class="login-submit-btn" value="Poll Result" onclick="PollResult()" data-bind="visible: IsTeamAdmin()" />
    <input style="width: 100px; height: 20px; padding: 0px !important; float: left; margin: 5px" type="button" class="login-submit-btn" value="Edit Poll" onclick="PollResult()" data-bind="    visible: IsTeamAdmin(), click: function () { EditPoll($data); }" />
</div>
