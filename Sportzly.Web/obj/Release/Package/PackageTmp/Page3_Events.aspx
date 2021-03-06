﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page3_Events.aspx.cs" Inherits="Sportzly.Web.Page3_Events" %>

<!DOCTYPE html>
<html>
<head>
<title>Sportzly</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="Common/Styles/css/bootstrap.min.css">
<!-- Font Awesome -->
<link href="Common/Styles/css/font-awesome.min.css" rel="stylesheet">
<!-- Common CSS -->
<link type="text/css" href="Common/Styles/css/styles.css" rel="stylesheet" />
<!--<link type="text/css" href="css/responsive.css" rel="stylesheet" />-->
<link rel="stylesheet" href="Version1/Script/eventcalendar/dropkick.css">
<!-- fancybox Responsive CSS -->
<link rel="stylesheet" type="text/css" href="Version1/Script/fancybox/jquery.fancybox.css?v=2.1.5" media="screen" />
<!-- Event Calendar CSS -->   
<link rel="stylesheet" href="Version1/Script/eventcalendar/jquery-ui.css">
<link rel="stylesheet" href="Version1/Script/eventcalendar/jquery.ui.timepicker.css">
<link type="text/css" rel="stylesheet" href="Version1/css/easy-responsive-tabs.css" />
<link rel="stylesheet" href="Common/Styles/css/jquery.bxslider.css" type="text/css" />
<!-- Common jQuery -->
<script type="text/javascript" src="Scripts/jquery.js"></script>
<script type="text/javascript" src="Scripts/modernizr.custom.82896.js"></script>
<script type="text/javascript" src="Version1/Script/js/jquery.sticky-kit.js"></script>
<script type="text/javascript" src="Version1/Script/js/example.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="Scripts/bootstrap.min.js"></script>
<script>
    function toggleAndChangeText(a) {
        jQuery('.divToToggle').toggle();
        if (jQuery('.divToToggle').css('display') == 'none') {
            jQuery('#aTag').html('Show all 10 comments');
        }
        else {
            jQuery('#aTag').html('Less Messages');
        }

        jQuery(a).next().toggle();
        if (jQuery(a).next().css('display') == 'none') {
            jQuery(a).next().removeClass('active');
            jQuery(a).parent().removeClass('active');
        }
        else {

            jQuery(a).parent().addClass('active');
        }
    }


    var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));

    if (mobile) {

        jQuery('#inline4').css("width", "100% !important");
        jQuery('#inline4').addClass('mobile');
    }

</script>
<link rel="stylesheet" href="Version1/css/example.css" />
<script type="text/javascript" src="Version1/Script/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="Version1/Script/fancybox/jquery.fancybox.js?v=2.1.5"></script>
<script type="text/javascript" src="Version1/Script/eventcalendar/jquery.ui.timepicker.js"></script>
<script type="text/javascript" src="Version1/Script/js/jquery.bxslider.js"></script>
<script src="Version1/Script/js/easyResponsiveTabs.js" type="text/javascript"></script>
<!-- Common jQuery -->
<script type="text/javascript" src="Version1/Script/js/general.js"></script>
<script src="Version1/Script/eventcalendar/dropkick.min.js"></script>
<script src="Version1/Script/eventcalendar/dropkick.jquery.js"></script>
<style>
@media only screen and (min-width: 320px) and (max-width:480px) {
#inline1 {
	max-width: 100% !important;
}
#inline2 {
	max-width: 100% !important;
}
#inline3 {
	max-width: 100% !important;
}
#inline4 {
	max-width: 100% !important;
}
#inline5 {
	max-width: 100% !important;
}
}
 @media only screen and (min-width: 481px) and (max-width: 2000px) {
#inline1 {
	max-width: 730px;
}
#inline2 {
	max-width: 320px;
}
#inline3 {
	max-width: 730px;
}
#inline4 {
	max-width: 730px;
}
#inline5 {
	max-width: 730px;
}
}
</style>
</head>
<body class="after-login">
<div id="wrapper">
  <header>
    <div class="container">
      <div class="row">
        <div class="col-xs-5 col-sm-5 col-md-5"> 
          <!--<div class="nav-button">
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">Main Menu<i class="fa fa-bars"></i></button>
          </div>-->
          <ul class="nav navbar-collapse">
            <li><a href="#">STREAM</a></li>
            <!-- <li><a href="#">SOCIAL</a></li>-->
            <li><a href="#">TEAMS</a></li>
            <li><a href="#">SHOP</a></li>
            <!--<li><a href="#">MARKET</a></li>-->
          </ul>
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 logo-sec">
          <h1 class="logo"><a href="#"><img src="images/logo.png"  alt="Sportzly"/></a></h1>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4 pull-right search-box">
          <div class="header-right">
            <div class="search-bar">
              <input type="text" class="search" placeholder="Search for people or teams" />
              <a href="#"><i class="fa fa-search"></i></a></div>
            <!-- Split button -->
            <div class="btn-group user-btn">
              <button type="button" class="btn btn-default user"><img src="images/profile-img.jpg" alt="profile"> <span>Johnny R.</span></button>
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span> </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Ali Syed</a></li>
                <li><a href="#">Change Password</a></li>
                <li class="divider"></li>
                <li><a href="#">Logout</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <section id="content">
    <div class="container">
    <div class="inner-content-new rightsticky" data-sticky_parent>
      <section id="sidebar" class="col-xs-3 col-sm-3 col-md-3">
        <div class="left-sec">
          <section class="left-infomation-profile">
            <div class="user">
            <span class="user-img"><img src="images/profile-leftbar-img.jpg" alt="user"> </span>
            <div class="user-details" style="margin-bottom:0px;"> <a data-bind="attr: { href: 'profile.aspx?' + Results()[0].UserName() }" style="background: none; color: #282828; float: none;" href="profile.aspx?ali716_99@yahoo.com">
              <h3 class="username">Johnny Radford</h3>
              </a> </div>
            <div class="tabbox-new">
              <div id="horizontalTab">
                <ul class="resp-tabs-list sidebartab">
                  <li><a href="#"><span class="MEMBERS"></span><span class="post-box">1</span></a> </li>
                  <li><a href="#"><span class="gamesicon"></span><span class="post-box">1</span></a></li>
                </ul>
                <div class="resp-tabs-container boxtleftside">
                  <div class="tab1"> <span class="user-img2"><img src="images/useimg1.jpg" alt="user"></span>
                    <p class="fontadded"> <b> Marcus Schwartz</b> added you as a friend.</p>
                    <a href="#">Accept</a> <a href="#">Not Now</a> <a href="#">See Mutual</a> <a href="#">Friends</a></div>
                  <div class="tab1"> <span class="user-img2"><img src="images/useimg2.jpg" alt="user"></span>
                    <p class="fontadded"><b> Marcus Schwartz</b> added you as a friend.</p>
                    <a href="#">Accept</a> <a href="#">Not Now</a> <a href="#">See Mutual</a> <a href="#">Friends</a></div>
                </div>
              </div>
            </div>
          </section>
          <div class="profile-pic">
            <div class="dropdown"> <a class="btn nopaddingbtn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"> <span class="drop-box"><span class="caret"></span></span>Germantown Cricket Club</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" class="dropactive">Germantown Cricket Club </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Germantown Wrestling Team</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Grizz</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Basketjunkies</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">University of Memphis Rugby</a></li>
              </ul>
            </div>
            <div class="team_secbottom-text"><img src="images/team-img.jpg" alt="team">
              <div class="edit_team-box"><a href="#">Edit Team</a></div>
            </div>
          </div>
          <div class="about-sports">
            <div class="detail-row"> <span class="label">SPORTS</span> <span class="label-name">Cricket</span> </div>
            <div class="detail-row"> <span class="label">SEASON</span> <span class="label-name">2013</span> </div>
            <div class="detail-row"> <span class="label">LEVEL</span> <span class="label-name">Competitive</span> </div>
            <div class="detail-row"> <span class="label">CITY</span> <span class="label-name">Germantown</span> </div>
            <div class="detail-row"> <span class="label">COUNTRY</span> <span class="label-name">United States</span> </div>
            <!-- <ul class="team-status">
              <li><strong>152</strong> Played</li>
              <li><strong>103</strong> Wins</li>
              <li><strong>9</strong> Awards</li>
              <li><strong>386</strong></li>
            </ul>--> 
          </div>
          <div class="about">
            <h2>ABOUT</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor fringilla dui, ut aliquet justo hendrerit non. Aliquam risus orci, vehicula quis cursus vel, pellentesque a turpis. Sed non interdum magna. Aenean ut enim ac urna consectetur vulputate quis eget nulla. Aliquam sed nulla risus, quis rutrum orci mauris congue dui at.</p>
          </div>
          <div class="team-members">
            <h3>Members</h3>
            <ul class="gallery">
              <li><a href="#"><img src="images/user-001.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-02.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-03.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-04.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-05.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-06.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-07.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-08.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-09.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-10.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-11.jpg" alt="img"> <span class="icon-phone"></span></a></li>
              <li><a href="#"><img src="images/user-12.jpg" alt="img"> <span class="icon-phone"></span></a></li>
            </ul>
            <button type="button" class="btn btn-primary blue">VIEW ALL MEMBERS</button>
          </div>
          <div class="fans">
            <h3>fans</h3>
            <ul class="gallery">
              <li><a href="#"><img src="images/user-05.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-06.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-07.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-08.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-09.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-10.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-11.jpg" alt="img"></a></li>
            </ul>
            <button type="button" class="btn btn-primary blue">SEE ALL 386 FANS</button>
          </div>
          <div class="team-admin">
            <h3>team aDMIN</h3>
            <ul class="gallery nopadding">
              <li><a href="#"><img src="images/user-001.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-02.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-03.jpg" alt="img"></a></li>
              <li><a href="#"><img src="images/user-04.jpg" alt="img"></a></li>
            </ul>
          </div>
          <div class="team-admin">
            <h3>External Team URL</h3>
            <a href="#"> http://www.arktenncricketleague.com </a> <a href="#">http://www.cricinfo.com</a> </div>
          <div class="team-docs">
            <h3>team docs</h3>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <div class="detail-row"> <span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
            <button type="button" class="btn btn-primary blue mrg-t10">VIEW ALL DOCS</button>
          </div>
        </div>
      </section>
      <section id="containerbar" class="col-xs-7 col-sm-7 col-md-7">
         <ul class="resp-tabs-list">
            <li><a href="dashboard.html"><span class="STREAM"></span>DASHBOARD</a></li>
            <li><a href="members.html"><span class="MEMBERS"></span>MEMBERS</a></li>
            <li class="resp-tab-active"><a href="events.html"><span class="EVENTS"></span>EVENTS <!--<span class="post-box">2</span>--></a></li>
            <li><a href="videos.html"><span class="PHOTOS"></span>Photos / Videos  </a></li>
            <li class="last"><a href="documents.html"><span class="DOCS"></span>DOCUMENTS</a></li>
          </ul>
       <div class="resp-tabs-container noborder-bottom">
            <div class="tab1 col-xs-12">
              
              
              <div class="eventObjsList">
                <ul>
                  <li class="dropdown"> <a class="btn btn-default dropdown-toggle" type="button" id="A1" data-toggle="dropdown"> <span class="caret right"></span> All Events &nbsp; </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      <i class="fa fa-fw ul-arrow1"></i>
                      <li role="presentation"> <a role="menuitem" tabindex="-1" href="#">My Events</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="btn btn-default dropdown-toggle" type="button" id="A2" data-toggle="dropdown"> <span class="caret right"></span> Date &nbsp;</a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      <i class="fa fa-fw ul-arrow2"></i>
                      <li role="presentation">
                        <input name="" type="text" class="datepicker" value="" id="">
                      </li>
                    </ul>
                  </li>
                  <li><a href="#">Calender View</a></li>
                  <li><a href="#">Scorecards</a></li>
                  <li class="dropdown"> <a class="btn btn-default dropdown-toggle" type="button" id="A3" data-toggle="dropdown"> <span class="caret right"></span> Type Of Events &nbsp; </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      <i class="fa fa-fw ul-arrow3"></i>
                      <li role="presentation"> <a role="menuitem" tabindex="-1" href="#">Event</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Game</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Practice</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="schedule schedule-sec2">
                <div class="section-title section-title2">
                  <h2>Events</h2>
                  <a class="view-all right fancybox" href="#inline1"><i class="fa fa-fw"></i> Create Event</a> </div>
                <div id="inline1" style="max-width:730px;display: none;">
                  <div class="form-row">
                    <h3>New Event</h3>
                    <ul>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Create a new</label>
                        </div>
                        <div class="right-lable"><span class="rd">
                          <input name="radio" type="radio" value="">
                          <label>Event</label>
                          </span><span class="rd">
                          <input name="radio" type="radio" value="">
                          <label>Game</label>
                          </span><span class="rd">
                          <input name="radio" type="radio" value="">
                          <label>Practice</label>
                          </span></div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Title*</label>
                        </div>
                        <div class="right-lable">
                          <input name="" type="text" class="input" value="" placeholder="Untitled Event">
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">From*</label>
                        </div>
                        <div class="right-lable">
                          <div class="from"><span class="input-row input">
                            <input name="" type="text" class="datepicker" value="" id="Text1">
                            <i class="fa fa-fw"></i></span><span class="input-row input nomargin-r">
                            <input name="" type="text" class="timepicker " value="">
                            <i class="fa fa-fw"></i></span></div>
                          <div class="to-row">
                            <label class="lable2">To*</label>
                            <span class="input-row input ">
                            <input name="" type="text" class="datepicker" value="" id="Text2">
                            <i class="fa fa-fw"></i></span><span class="input-row input nomargin-r">
                            <input name="" type="text" class="timepicker" value="">
                            <i class="fa fa-fw"></i></span></div>
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Time Zone</label>
                        </div>
                        <div class="right-lable">
                          <select name="" class="search_select search-select">
                            <option disabled selected class="hidden-option">Basket junkies</option>
                            <option value="1">Basket junkies 1</option>
                            <option value="2">Basket junkies 2</option>
                            <option value="3">Basket junkies 3</option>
                            <option value="4">Basket junkies 4</option>
                          </select>
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Time Zone</label>
                        </div>
                        <div class="right-lable">
                          <select name="" class="search_select search-select">
                            <option disabled selected class="hidden-option">Basket junkies</option>
                            <option value="1">Basket junkies 1</option>
                            <option value="2">Basket junkies 2</option>
                            <option value="3">Basket junkies 3</option>
                            <option value="4">Basket junkies 4</option>
                          </select>
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Location</label>
                        </div>
                        <div class="right-lable">
                          <input name="" type="text" class="input" value="Enter Location">
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Description/<br>
                            Comments</label>
                        </div>
                        <div class="right-lable">
                          <textarea class="input"></textarea>
                        </div>
                      </li>
                      <li>
                        <label class="required">*Required</label>
                      </li>
                      <li>
                        <div class="button-row">
                          <input name="Add Event" type="button" value="Add Event" class="buttonblue">
                          <input name="Add Event" type="button" value="Never mind" class="buttonblack fancyboxclose" id="Button1">
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="eventpost"> <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding"><img alt="post" src="images/profile-right-img1.jpg">
                  <h3 class="post-title">Johnny Radford</h3>
                  </span>
                  <div class="col-xs-6 col-sm-6 col-md-6 post-data eat-nopadding">
                    <p><strong>Event</strong> - Food Booth <br>
                      <strong>Team</strong> - Holy Rosary 7th Grade Girls Volleyball Fall 2013 <br>
                      <strong>Location</strong>: Hanapepe stadium <br>
                      <strong>Sport</strong>: Baseball <strong class="type-row">Type</strong>: Event</p>
                  </div>
                  <div class="col-xs-2 col-sm-2 col-md-2 post-data eat-nopadding date-text"> Wednesday, Aug 20
                    3:50 PM </div>
                  <div class=" col-xs-10 col-sm-10 col-md-10 post-data eat-nopadding">
                    <div class="section-title eventpost eventpostpadding">
                      <div class="col-xs-6 col-sm-6 col-md-6 post-data eat-nopadding"> 
                      <span class="col-sm-6 col-md-6 attending">
                        <h2>Attending <strong>(2)</strong></h2>
                        </span> <span class="post-nobimg photos-col col-sm-6 col-md-6"><img src="images/user-02.jpg"> <img src="images/user-03.jpg"></span> </div>
                      <div class="col-xs-6 col-sm-6 col-md-6 post-data btnright">
                        <button type="button" class="btn btn-primary blue">View Event</button>
                        <span class="resbtn"><i class="fa fa-fw"></i></span> <span class="greenbtn"><i class="fa fa-fw"></i></span> </div>
                    </div>
                  </div>
                </div>
                <div class="eventpost eventpostgra"> <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding"><img alt="post" src="images/profile-right-img1.jpg">
                  <h3 class="post-title">Johnny Radford</h3>
                  </span>
                  <div class="col-sm-7 col-md-7 post-data eat-nopadding">
                    <p><strong>Event</strong> - Food Booth <br>
                      <strong>Team</strong> - Germantown Cricket Club <br>
                      <strong>Location</strong>: Hanapepe stadium <br>
                      <strong>Sport</strong>: Baseball <strong class="type-row">Type</strong>: Event</p>
                  </div>
                  <div class="col-sm-2 col-md-2 post-data eat-nopadding date-text"> Wednesday, Aug 20
                    3:50 PM </div>
                  <div class=" col-sm-10 col-md-10 post-data eat-nopadding">
                    <div class="section-title eventpost eventpostpadding">
                      <div class="col-sm-6 col-md-6 post-data eat-nopadding"> <span class="col-sm-6 col-md-6 attending">
                        <h2>Attending <strong>(5)</strong></h2>
                        </span> <span class="post-nobimg photos-col col-sm-6 col-md-6"><img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"> </span> </div>
                      <div class="col-sm-6 col-md-6 post-data btnright">
                        <button type="button" class="btn btn-primary blue">View Event</button>
                        <span class="resbtn"><i class="fa fa-fw"></i></span> <span class="greenbtn"><i class="fa fa-fw"></i></span> </div>
                    </div>
                  </div>
                </div>
                <div class="eventpost"> <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding"><img alt="post" src="images/profile-right-img1.jpg">
                  <h3 class="post-title">Johnny Radford</h3>
                  </span>
                  <div class="col-sm-7 col-md-7 post-data eat-nopadding">
                    <p><strong>Event</strong> - Food Booth <br>
                      <strong>Team</strong> - Holy Rosary Alumni League <br>
                      <strong>Location</strong>: Hanapepe stadium <br>
                      <strong>Sport</strong>: Baseball <strong class="type-row">Type</strong>: Event</p>
                  </div>
                  <div class="col-sm-2 col-md-2 post-data eat-nopadding date-text"> Wednesday, Aug 20
                    3:50 PM </div>
                  <div class=" col-sm-10 col-md-10 post-data eat-nopadding">
                    <div class="section-title eventpost eventpostpadding">
                      <div class="col-xs-6 col-sm-6 col-md-6 post-data eat-nopadding"> <span class="col-sm-6 col-md-6 attending">
                        <h2>Attending <strong>(7)</strong></h2>
                        </span> <span class="post-nobimg photos-col col-sm-6 col-md-6"><img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"></span> </div>
                      <div class="col-xs-6 col-sm-6 col-md-6 post-data btnright">
                        <button type="button" class="btn btn-primary blue">View Event</button>
                        <span class="resbtn"><i class="fa fa-fw"></i></span> <span class="greenbtn"><i class="fa fa-fw"></i></span> </div>
                    </div>
                  </div>
                </div>
                <div class="eventpost eventpostgra"> <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding"><img alt="post" src="images/profile-right-img1.jpg">
                  <h3 class="post-title">Johnny Radford</h3>
                  </span>
                  <div class="col-sm-7 col-md-7 post-data eat-nopadding">
                    <p><strong>Event</strong> - Food Booth <br>
                      <strong>Team</strong> - grizz<br>
                      <strong>Location</strong>: Hanapepe stadium <br>
                      <strong>Sport</strong>: Baseball <strong class="type-row">Type</strong>: Event</p>
                  </div>
                  <div class="col-sm-2 col-md-2 post-data eat-nopadding date-text"> Wednesday, Aug 20
                    3:50 PM </div>
                  <div class=" col-sm-10 col-md-10 post-data eat-nopadding">
                    <div class="section-title eventpost eventpostpadding">
                      <div class="col-sm-6 col-md-6 post-data eat-nopadding"> <span class="col-sm-6 col-md-6 attending">
                        <h2>Attending <strong>(5)</strong></h2>
                        </span> <span class="post-nobimg photos-col col-sm-6 col-md-6"><img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"> <img src="images/user-03.jpg"> <img src="images/user-02.jpg"> </span> </div>
                      <div class="col-sm-6 col-md-6 post-data btnright">
                        <button type="button" class="btn btn-primary blue">View Event</button>
                        <span class="resbtn"><i class="fa fa-fw"></i></span> <span class="greenbtn"><i class="fa fa-fw"></i></span> </div>
                    </div>
                  </div>
                </div>
              </div>
          
              
              
          </div>
          </div>
      </section>
      <section class="col-xs-3 col-sm-3 col-md-3">
        <div class="sidebar" data-sticky_column>
          <div class="insideinner">
            <ul>
              <li>
                <h2>New 100% Waterpoof ipad</h2>
                <p class="insideinnerlinks"><a href="#">underwateraudio.com</a></p>
                <div class="rightsidebarimg"> <img alt="post" src="images/right-baradd-img1.jpg"> </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
              </li>
              <li>
                <h2>Sale 40% off</h2>
                <p class="insideinnerlinks"><a href="#">ibuidapp.com</a></p>
                <div class="rightsidebarimg"> <img alt="post" src="images/right-baradd-img2.jpg"> </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
              </li>
              <li>
                <h2>The South's Main Course</h2>
                <p class="insideinnerlinks"><a href="#">sandersonfarmschampoinship.com</a></p>
                <div class="rightsidebarimg"> <img alt="post" src="images/right-baradd-img3.jpg"> </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
              </li>
              
              
            </ul>
          </div>
        </div>
      </section>
    </div>
    <div class="clearfix"></div>
  </section>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-xs-6 col-sm-6 footer-logo"><img src="images/footer-logo.png" alt="Sportzly"/></div>
        <div class="col-xs-6 col-sm-6 copyright">
          <ul class="footer-nav">
            <li><a href="#">News</a></li>
            <li><a href="#">Testimonials</a></li>
            <li><a href="#">Security</a></li>
            <li><a href="#">Legal</a></li>
            <li><a href="#"> Store</a></li>
            <li><a href="#">Locator</a></li>
            <li><a href="#">Jobs</a></li>
            <li><a href="#">Help Center</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('.carousel').carousel();
    });
</script>
</body>
</html>