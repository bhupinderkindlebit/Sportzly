﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TeamDetailControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.TeamDetailControl" %>
<%@ Register Src="DocumentListMiniControl.ascx" TagName="DocumentListMiniControl"
    TagPrefix="uc1" %>
<%@ Register Src="PollListMini.ascx" TagPrefix="uc1" TagName="PollListMini" %>

<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
<div class="teamEntity">
    <!-- ko if: this.teamId !== 0 -->
    <div class="team_secbottom-text">
        <img data-bind="attr: { src: Photo() }" alt="">
        <div class="edit_team-box">
            <a data-bind="attr: { href: 'newteam.aspx?' + Id(), logo: teamModel.isMyTeam(), visible: teamModel.isMyTeam() }">Edit Team</a>
        </div>
    </div>
    <div class="about-sports">
        <div class="detail-row">
            <span class="label">SPORTS</span> <span class="label-name" data-bind="text: SportsName()"></span>
        </div>
        <div class="detail-row">
            <span class="label">SEASON</span> <span class="label-name" data-bind="text: Season()"></span>
        </div>
        <div class="detail-row">
            <span class="label">LEVEL</span> <span class="label-name" data-bind="text: TeamCategory()"></span>
        </div>
        <div class="detail-row">
            <span class="label">CITY</span> <span class="label-name" data-bind="text: City()"></span>
        </div>
        <div class="detail-row">
            <span class="label">COUNTRY</span> <span class="label-name" data-bind="text: Country()"></span>
        </div>
        <!-- <ul class="team-status">
              <li><strong>152</strong> Played</li>
              <li><strong>103</strong> Wins</li>
              <li><strong>9</strong> Awards</li>
              <li><strong>386</strong></li>
            </ul>-->
    </div>
    <div class="about">
        <h2>ABOUT</h2>
        <p data-bind="text: Description()">
        </p>
    </div>
    <div class="team-members">
        <h3>Members</h3>
        <ul class="gallery" data-bind="foreach: Members()">
            <li><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                <img data-bind="attr: { src: Photo() }" alt="">
                <span class="icon-phone" data-bind="visible: Phone()"></span></a></li>
        </ul>
        <a class="btn btn-primary blue" data-bind="attr: { href: 'members.aspx?' + Id() }">VIEW
            ALL MEMBERS</a>
    </div>
    <div class="fans">
        <h3>fans</h3>
        <ul class="gallery" data-bind="foreach: Fans()">
            <li><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                <img data-bind="attr: { src: Photo() }"></a></li>
        </ul>
        <button type="button" class="btn btn-primary blue">
            SEE ALL 386 FANS</button>
    </div>
    <div class="team-admin">
        <h3>TEAM ADMIN</h3>
        <ul class="gallery nopadding" data-bind="foreach: TeamAdmins()">
            <li><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                <img data-bind="attr: { src: Photo() }"></a></li>
        </ul>
    </div>
    <div class="team-admin">
        <h3>EXTERNAL TEAM URL</h3>
        <div data-bind="foreach: TeamUrl()" style="padding: 6px 0px;">
            <a data-bind="attr: { href: Url() }" target="_blank">
                <span data-bind="text: Url()"></span>
            </a>
            <br />
        </div>
    </div>
    <uc1:PollListMini runat="server" ID="PollListMini" />
    <uc1:DocumentListMiniControl ID="DocumentListMiniControl1" runat="server" />
    <!-- /ko -->
</div>
