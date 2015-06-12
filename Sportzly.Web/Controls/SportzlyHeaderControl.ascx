<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SportzlyHeaderControl.ascx.cs" Inherits="Sportzly.Web.Controls.SportzlyHeaderControl" %>
<script src="Scripts/Search.js"></script>
<link href="Common/Styles/css/Search.css" rel="stylesheet" />
<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-5 col-sm-5 col-md-5">
                <ul class="nav navbar-collapse">
                    <li><a href="myupdates.aspx">STREAM</a></li>
                    <li><a href="teams.aspx">TEAMS</a></li>
                    <li><a href="http://www.sportzlystore.com/" target="_blank">SHOP</a></li>
                </ul>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 logo-sec">
                <h1 class="logo"><a href="default.aspx">
                    <img src="Version1/Images/logo.png" alt="Sportzly" /></a></h1>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 pull-right search-box">
                <div class="header-right">
                    <div class="search-bar">
                        <input type="text" autocomplete="off" class="search" placeholder="Search for people or teams" id="txtSportzlySearch" />
                        <a href="javascript:;" class="icon-search"><i class="fa fa-search"></i></a>
                        <div id="divResult">
                        </div>
                    </div>
                    <!-- Split button -->
                    <div class="btn-group user-btn">
                        <button type="button" class="btn btn-default user">
                            <img data-bind="attr: { src: ProfileFoto }" alt="profile" width="25" height="25">
                            <span data-bind="text: (DisplayName ? DisplayName : 'unknown')"></span></button>
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span><span class="sr-only">Toggle Dropdown</span> </button>
                        <ul class="dropdown-menu" role="menu">                          
                            <li><a  href="forgotpassword.aspx">Change Password</a></li>
                            <li class="divider"></li>
                            <li><a runat="server" id="logoutLink">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
