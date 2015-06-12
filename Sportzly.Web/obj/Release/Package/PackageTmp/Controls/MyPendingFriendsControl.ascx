<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyPendingFriendsControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyPendingFriendsControl" %>
<div class="userFriendsPending" data-bind="visible: PendingResultCount > 0" style="margin: auto; display: none;">
    <div data-bind="foreach: PendingResult">        
        <a class="user-img2" data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
            <img data-bind="attr: { src: ProfileFoto, alt: DisplayName }" width="37" height="37"></a>
        <p class="fontadded" id="respond">
            <b><span data-bind="text: DisplayName()"></span></b> added you as a friend.</p>
        <a class="linksUnderline" data-bind="attr: { href: 'javascript:' }, click: function () { respondRequest($data, true); }">Accept</a> <a class="linksUnderline" data-bind="attr: { href: 'javascript:' }, click: function () { respondRequest($data, false); }">Reject</a> <a data-bind="attr: {href: 'Friends.aspx?' + EmailId() +'&m' }">See Mutual</a> <a data-bind="attr: {href: 'Friends.aspx?' + EmailId() }">
            Friends</a>
    </div>
</div>
