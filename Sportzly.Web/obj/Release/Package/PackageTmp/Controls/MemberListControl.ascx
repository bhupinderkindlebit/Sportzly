<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberListControl.ascx.cs" Inherits="Sportzly.Web.Controls.MemberListControl" %>

<%@ Register Src="~/Controls/PendingInvitesTeamListMiniControl.ascx" TagPrefix="uc1" TagName="PendingInvitesTeamListMiniControl" %>
<%@ Register Src="~/Controls/InviteControl.ascx" TagPrefix="uc1" TagName="InviteControl" %>

<div class="resp-tabs-container noborder-bottom membersList">
    <div class="tab1 col-xs-12">

        <div class="col-xs-7 col-sm-7 col-md-7">
            <div class="members-list">
                <div class="section-title rosterfont">
                    <h2>Roster <strong>(<span class="number-fans" data-bind="text:ResultCount"></span>)</strong></h2>
                </div>
                <div class="search-sec">
                    <input type="text" value="" name="" placeholder="Search for roster" class="input search-fans">
                    <a href="#"><i class="fa fa-fw"></i></a>
                </div>
                <div class="listin-row">
                    <ul class="members" data-bind="foreach: Result()">
                        <li><span class="user-img">
                            <img data-bind="attr:{src:Photo(), alt:Name()}"></span> <span class="user-namerow"><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }, text: Name()"></a>
                            </span></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-xs-5 col-sm-5 col-md-5 eat-nopadding2">
            <div class="pending-members">
                <div data-bind="stopBindings: true">
                    <uc1:PendingInvitesTeamListMiniControl runat="server" ID="PendingInvitesTeamListMiniControl" />
                </div>
                <uc1:InviteControl runat="server" ID="InviteControl" />                
            </div>
        </div>

    </div>
</div>
