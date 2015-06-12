<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunityListControl.ascx.cs" Inherits="Sportzly.Web.Controls.CommunityListControl" %>

<section class="left-communities teamsList">

    <h2 class="popular">Teams</h2>
    <div data-bind="foreach: Result()">
        <article class="list-communities">
            <div class="in-list-communities">
                <img class="xd" alt="" src="images/xadap.png" />
                <span class="cool" data-bind="text:CommunityName()"></span>
                <span class="member"><span data-bind="text:MemberCount()"></span> Members</span><br />
                <p data-bind="text:Description()">
                    No description provided
                </p>
                <div class="link">
                    <a href="#"><span data-bind="text:MemberCount()"></span> Members</a>
                    <a href="#"><span data-bind="text:FollowerCount()"></span> Followers</a>
                    <a data-bind="attr: {href : 'javascript:'}, click: function() { joinTeam($data, true);}, visible: !Joined()">Join</a>
                    <a data-bind="attr: {href : 'javascript:'}, click: function() { joinTeam($data, false);}, visible: Joined()">Leave</a>
                    <a data-bind="attr: {href : 'javascript:'}, click: function() { followTeam($data, true);}, visible: !Followed()">Follow</a>
                    <a data-bind="attr: {href : 'javascript:'}, click: function() { followTeam($data, false);}, visible: Followed()">Unfollow</a>
                </div>
                <!--End-link-->
            </div>
            <!--End-in-list-communities-->
            <div class="view">
                <img class="img-dd" alt="" data-bind="attr:{ src:PhotoPath(), alt:OwnerName()}" height="35" width="35" />
                <span class="FOUNDER">FOUNDER</span>
                <span class="name" data-bind="text:OwnerName()"></span>
                <p>Founded:<span data-bind="date:CreateDate(),prop:'text'"></span></p>
                <a data-bind="attr: {href : 'team.aspx?' + Id()}">
                    <img class="buttom" alt="" src="images/viewcomunity.png" /></a>
            </div>
            <!--End-view-->
        </article>
    </div>
    <!--End-list-communities-->
</section>
