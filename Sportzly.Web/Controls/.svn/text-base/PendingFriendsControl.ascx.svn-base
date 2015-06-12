<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingFriendsControl.ascx.cs" Inherits="Sportzly.Web.Controls.PendingFriendsControl" %>

<style type="text/css">
    .request1 {
        background: none repeat scroll 0 0 #1275BC;
        border-radius: 20px;
        color: #FFFFFF !important;
        display: inline-block;
        font-family: 'proxima_nova_rgbold';
        font-size: 11px;
        font-weight: bold;
        height: 23px;
        line-height: 23px;
        margin-left: 0px !important;
        margin-top: 10px;
        text-align: center;
        text-transform: uppercase;
        width: 80px !important;
        font-weight:bold;
    }
    .text-marcus span {
        line-height:20px;
        font-size:13px;
    }
</style>


<div class="userFriendsPending" data-bind="visible: PendingResultCount > 0" style="margin: auto;display:none;">
    <div data-bind="foreach: PendingResult">

        <div class="schedule-list" style="padding-top:0px;">
            <div class="center-schedule-list" style="padding: 10px 10px;float:none;width:294px;">
                <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                    <img data-bind="attr: { src: ProfileFoto, alt: DisplayName }" width="30" height="30"></a>

                <span data-bind="text: DisplayName()"></span>&nbsp;<span>added you as a friend.</span>
                 <div id="respond" style=" margin-left: 62px;clear:both;">
                          <a data-bind="attr: { href: 'javascript:' }, click: function () { respondRequest($data, true); }" class="request1">Accept</a>

                <a data-bind="attr: { href: 'javascript:' }, click: function () { respondRequest($data, false); }" class="request1">Decline</a>
                 </div>
           
            </div>
        </div>
    </div>
</div>
<%--        <a data-bind="attr: {href: 'Friends.aspx?' + EmailId() +'&m' }">See Mutual</a>

        <a data-bind="attr: {href: 'Friends.aspx?' + EmailId() }">Friends</a>--%>