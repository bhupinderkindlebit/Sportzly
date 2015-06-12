<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunityFilterControl.ascx.cs" Inherits="Sportzly.Web.Controls.CommunityFilterControl" %>
<section class="top-side-bar">
    <h2 class="title-community">Browse Community</h2>
    <ul>
        <li><a href="Community.aspx?popular">Popular Communities</a></li>
        <li><a href="Community.aspx">All Communities</a></li>
        <li><a href="Community.aspx?new">New Community</a></li>
    </ul>
    <div class="start">
        <a href="newteam.aspx">Start a New Community</a>
    </div>
    <!--End-start-->
    <h2 class="title-community">Search Teams</h2>
    <input class="search teamSearch" type="text" value="Enter name or interests" name="" onblur="bindBlur(event)" onfocus="bindFocus(event)" />
    <div class="clear"></div>
</section>
<!--End--top-side-bar-->
