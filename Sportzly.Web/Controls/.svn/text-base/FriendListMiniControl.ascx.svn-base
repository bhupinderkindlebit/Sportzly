<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FriendListMiniControl.ascx.cs" Inherits="Sportzly.Web.Controls.FriendListMiniControl" %>
<div class="userFriends" data-bind="visible: ResultCount > 0" style="float:left;">
    <h2 class="media" style="margin-left:0px; margin-bottom:5px;">Friends <span>(<span class="number-135" id="spFriendCount" data-bind="text: ResultCount">0</span>)</span></h2>
    <div data-bind="foreach: Result" id="divFriends">       
        <div class="info-video info-video3">
            <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                <img data-bind="attr: { src: ProfileFoto, alt: DisplayName }" width="50" height="50" style="margin-left:0px;"></a>
        </div>
    </div>
    <a data-bind="    attr: { href: 'Friends.aspx?' + userEmail }"><img src="images/view_all_freinds.png" style="margin-left:30px;" /></a>
    <br />
    
    
</div>
