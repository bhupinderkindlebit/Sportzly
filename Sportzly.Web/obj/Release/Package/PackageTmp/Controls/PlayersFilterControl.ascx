﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlayersFilterControl.ascx.cs" Inherits="Sportzly.Web.Controls.PlayersFilterControl" %>
<article class="top-content-fans find-teams">

    <div id="teamFilterPanel" style="display: none;">
        <h3 class="text-find-teams">Find Players to Connect or Join your team.</h3>

        <form class="fans fans2" onsubmit="searchTeams(); return false;">

            <input class="search-fans search-teams" tabindex="1" value="Search players" onblur="bindBlur(event)" onfocus="bindFocus(event)" type="text" id="searchTeamsText">

            <input class="submit-fans submit-teams" type="button" value="Search" onclick="searchTeams()" />

        </form>

        <select class="select-boxx ddlSports" runat="server" id="ddlSports">
        </select>

        <select class="select-boxx ddlLevel" runat="server" id="ddlLevel">
        </select>

        <select class="select-boxx ddlLocation" runat="server" id="ddlLocation">
        </select>

    </div>
    <div class="clear"></div>

</article>
<!--End-top-content-fans-->
