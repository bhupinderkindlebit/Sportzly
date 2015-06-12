<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileHeaderControl.ascx.cs" Inherits="Sportzly.Web.Controls.ProfileHeaderControl" %>
<section id="header" class="top-infomation-profile">
    <div class="user">
        <img class="user-img" alt="" data-bind="attr: { src: Results()[0].ProfileFoto() }" style="width:40px;height:40px;" />
        <a data-bind="attr: { href: 'profile.aspx?' + Results()[0].UserName() }" style="background: none; color: #282828; float: none;">
            <h3 class="username" data-bind="text: Results()[0].DisplayName"></h3>
        </a>

        <div class="status">

            <%--    <span class="fans" data-bind="text: Results()[0].OtherLevel()"></span>
            <span data-bind="text: Results()[0].OtherSportsTag" class="fans"></span>
            --%>
            <span data-bind="text: Results()[0].FavSports.Value()" class="fans"></span>


        </div>
        <!--End-pro-->
    </div>
    <!--End-user-->
    <div class="user-menu">
        <nav>
            <ul>
                <li class="menu-active"><a data-bind="attr: { href: 'profile.aspx?' + Results()[0].EmailId() }">Profile</a></li>
                <li><a data-bind="attr: { href: 'teams.aspx?' + Results()[0].EmailId() }">My Teams</a></li>
                <li><a data-bind="attr: { href: 'albums.aspx?' + Results()[0].EmailId() }">Albums</a></li>
                <li><a data-bind="attr: { href: 'events.aspx?id=' + Results()[0].EmailId() }">My Events</a></li>
                <%--<li><a href="#">Chat</a></li>
                <li><a href="#">Stats</a></li>--%>
            </ul>
        </nav>
    </div>
    <!--End-user-menu-->
    <div class="jewelbuttons">
        <ul>
            <li class="active"><a href="#">
                <img alt="" src="../images/groop.png" /></a></li>
            <li><a href="#">
                <img alt="" src="../images/massage.png" /></a></li>
            <li><a href="#">
                <img alt="" src="../images/bong.png" /></a></li>
            <li class="calculatol"><a href="#">
                <img alt="" src="../images/maytinh.png" /></a></li>
        </ul>
    </div>
    <!--End-massage-->
</section>

