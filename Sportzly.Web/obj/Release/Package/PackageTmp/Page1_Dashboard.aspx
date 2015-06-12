<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page1_Dashboard.aspx.cs" Inherits="Sportzly.Web.Page1_Dashboard" %>

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
      <section id="containerbar" class="col-xs-7 col-sm-7 col-md-7" data-sticky_column>
        <ul class="resp-tabs-list">
            <li class="resp-tab-active"><a href="dashboard.html"><span class="STREAM"></span>DASHBOARD</a></li>
            <li><a href="members.html"><span class="MEMBERS"></span>MEMBERS</a></li>
            <li><a href="events.html"><span class="EVENTS"></span>EVENTS <!--<span class="post-box">2</span>--></a></li>
            <li><a href="videos.html"><span class="PHOTOS"></span>Photos / Videos  </a></li>
            <li class="last"><a href="documents.html"><span class="DOCS"></span>DOCUMENTS</a></li>
          </ul>
        <div class="resp-tabs-container noborder-bottom">
          <div class="tab1 col-xs-12">
            <article class="university-football">
              <div class="called">
                <h3 class="">Team Actions</h3>
                <a href="#inline1" class="btn btn-primary bluenew btnright fancybox">Text to Team</a>
                <div id="inline1" style=" max-width:; display: none;">
                  <div class="form-row poll">
                    <h3>Text to Team</h3>
                    <ul>
                      <li>
                        <div class="left-lable">
                          <label class="lable"> Notice:</label>
                        </div>
                        <div class="right-lable">
                          <textarea class="input" style="height:250px;" placeholder="Only 140 Characters will be displayed as text, remaining can be seen in the email"></textarea>
                        </div>
                      </li>
                      <li>
                        <label class="required">*Required</label>
                      </li>
                      <li>
                        <div class="button-row">
                          <input name="Add Event" type="button" value="Create" class="buttonblue">
                          <input name="Add Event" type="button" value="Never mind" class="buttonblack fancyboxclose" id="">
                          <span class="character-text">Character Count: 0</span> </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <a href="#inline2" class="btn btn-primary bluenew btnright fancybox"><i class="fa fa-fw"></i> Poll</a>
                <div id="inline2" style=" max-width:; display: none;">
                  <div class="form-row poll">
                    <h3>Poll</h3>
                    <ul>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Question:*</label>
                        </div>
                        <div class="right-lable">
                          <input name="" type="text" class="input" value="" placeholder="Question">
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Date Expiry:*</label>
                        </div>
                        <div class="right-lable">
                          <input name="" type="text" class="input" value="" placeholder="Date Expiry">
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Active:*</label>
                        </div>
                        <div class="right-lable">
                          <input name="" type="checkbox" value="" class="checkbox-new">
                        </div>
                      </li>
                      <li>
                        <div class="right-lable right-lable-new">
                          <input name="" type="text" class="input" value="" placeholder="">
                        </div>
                        <span class="pollicon addicon"><a href="#"><i class="fa fa-fw"></i></a></span> <span class="pollicon addicon"><a href="#"><i class="fa fa-fw"></i></a></span> <span class="pollicon deleteicon"><a href="#"><i class="fa fa-fw"></i></a></span> </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Options</label>
                        </div>
                        <div class="right-lable">
                          <textarea class="input textarea"></textarea>
                        </div>
                      </li>
                      <li>
                        <label class="required">*Required</label>
                      </li>
                      <li>
                        <div class="button-row">
                          <input name="Add Event" type="button" value="Create" class="buttonblue">
                          <input name="Add Event" type="button" value="Never mind" class="buttonblack fancyboxclose" id="Button1">
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <a href="#inline3" class="btn btn-primary bluenew btnright fancybox"><i class="fa fa-fw"></i> Event</a>
                <div id="inline3" style="max-width:730px;display: none;">
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
                          <input name="" type="text" class="input" value="" placeholder="Enter Event Name">
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
                          <label class="lable">Team</label>
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
                            <option disabled selected class="hidden-option">Eastern Standard Time</option>
                            <option value="1">Eastern Standard Time 1</option>
                            <option value="2">Eastern Standard Time 2</option>
                            <option value="3">Eastern Standard Time 3</option>
                            <option value="4">Eastern Standard Time 4</option>
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
                          <input name="Add Event" type="button" value="Never mind" class="buttonblack fancyboxclose" id="Button2">
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <a href="#" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Admin</a> <a href="#" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Invite</a> <a href="#inline4" class="btn btn-primary bluenew btnright fancybox"><i class="fa fa-fw"></i> Photo</a>
                <div id="inline4" style="max-width:;display: none;">
                  <div class="form-row">
                    <h3>ADD PHOTO</h3>
                    <ul>
                      <li>
                        <div class="left-lable">
                          <label class="lable">File Name</label>
                        </div>
                        <div class="right-lable">
                          <input name="" type="text" class="input" value="My Angels">
                        </div>
                      </li>
                      <li>
                        <div class="left-lable">
                          <label class="lable">Album</label>
                        </div>
                        <div class="right-lable photoadd-row">
                          <select name="" class="search_select search-select">
                            <option disabled selected class="hidden-option">Album Name 1</option>
                            <option value="1">Album Name 2</option>
                            <option value="3">Album Name 3</option>
                            <option value="4">Album Name 4</option>
                          </select>
                          <div class="fileupload-row">
                            <button class="btn btn-primary blue fontphoto" type="file">Select File</button>
                            <input class="fileupload" type="file">
                            </input>
                          </div>
                        </div>
                        <div class="photoadd-row2 "><a href="#"><img alt="img" src="images/add-photo1.jpg"></a></div>
                      </li>
                      <li>
                        <div class="button-row">
                          <input name="Add Event" type="button" value="Add" class="buttonblue add10">
                          <input name="Add Event" type="button" value="Never mind" class="buttonblack fancyboxclose">
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <a href="#" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Documents</a> <a href="#" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Videos</a> </div>
              <h3>Bulletin Board</h3>
              <article class="in-university-football">
                <div class="board-member"> <span class="col-xs-2 col-sm-2 "><img src="images/user-02.jpg" alt="memebr"></span>
                  <div class="col-sm-10">
                    <h4>MEETING AT 2:00PM - OKLAHOMA UNIVERSITY SOCCER FIELD</h4>
                    <span class="posted-by col-sm-8 eat-left">Posted by: <a href="#">Johnny Radford</a></span> <span class="col-sm-4 pull-right text-right">1 hour ago</span> </div>
                </div>
                <div class="board-member"> <span class="col-xs-2 col-sm-2"><img src="images/user-02.jpg" alt="memebr"></span>
                  <div class="col-sm-10">
                    <h4>MEETING AT 2:00PM - OKLAHOMA UNIVERSITY SOCCER FIELD</h4>
                    <span class="posted-by col-sm-8 eat-left">Posted by: <a href="#">Johnny Radford</a></span> <span class="col-sm-4 pull-right text-right">1 hour ago</span> </div>
                </div>
                <!--<p class="msg text-center">A text message will be sent to all team members</p>-->
                <div class="page-nav">
                  <div id="Div1" style="max-width:;display: none;">
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
                              <input name="" type="text" class="datepicker" value="" id="Text3">
                              <i class="fa fa-fw"></i></span><span class="input-row input nomargin-r">
                              <input name="" type="text" class="timepicker " value="">
                              <i class="fa fa-fw"></i></span></div>
                            <div class="to-row">
                              <label class="lable2">To*</label>
                              <span class="input-row input ">
                              <input name="" type="text" class="datepicker" value="" id="Text4">
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
                              <option disabled selected class="hidden-option">Eastern Standard Time</option>
                              <option value="1">Eastern Standard Time</option>
                              <option value="2">Eastern Standard Time 2</option>
                              <option value="3">Eastern Standard Time 3</option>
                              <option value="4">Eastern Standard Time 4</option>
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
                            <input name="Add Event" type="button" value="Never mind" class="buttonblack fancyboxclose" id="Button3">
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <a href="#inline1" class="btn btn-primary blue fancybox">Text to Team</a>
                  <section class="join-a-team join-a-team-next-page2 pull-right"> <span data-bind="text: pageText" class="page-team">1-3 of 86</span>
                    <button type="button" class="btn btn-primary blue"><span class="prev"></span> PREVIOUS </button>
                    <button type="button" class="btn btn-primary blue">NEXT <span class="next"></span></button>
                  </section>
                </div>
                <div class="clearfix"></div>
              </article>
              <!--End-in-university-football-->
              <div class="clear"></div>
            </article>
            <div class="invite-section invite-section-box">
              <div class="col-xs-12 col-sm-12 col-md-12 eat-nopadding2">
                <div class="col-xs-6 col-sm-6 col-md-6">
                  <div class="invite-team-member">
                    <h3>Invite Team Members</h3>
                    <textarea cols="2" rows="3" placeholder="Copy and Paste multiple email addresses from any place you have 
them, dont worry about format we will work it out"></textarea>
                    <button class="btn btn-primary blue" type="button">SEND INVITE</button>
                  </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 eat-nopadding2">
                  <div class="invite-member">
                    <h3>Invite Members</h3>
                    <ul class="icon-social">
                      <li><a href="#"><img src="images/facebook-icon.png" alt="facebook"></a></li>
                      <li><a href="#"><img src="images/twitter-icon.png" alt="facebook"></a></li>
                      <li><a href="#"><img src="images/google-icon.png" alt="facebook"></a></li>
                      <li><a href="#"><img src="images/yahoo-icon.png" alt="facebook"></a></li>
                      <li><a href="#"><img src="images/email-icon.png" alt="facebook"></a></li>
                    </ul>
                    <a href="#" class="btn-facebook-share"></a> <a href="#" class="btn-twitter-share"></a> </div>
                </div>
              </div>
            </div>
            <div class="photos-section">
              <div class="section-title">
                <h2>PHOTOS <strong>(17)</strong></h2>
                <a href="#" class="view-all">View All <i class="fa fa-fw"></i></a> </div>
              <ul class="photo-gallery">
                <li><a href="#"><img src="images/photos1.jpg" alt="photos1"></a></li>
                <li><a href="#"><img src="images/photos2.jpg" alt="photos2"></a></li>
                <li><a href="#"><img src="images/photos3.jpg" alt="photos3"></a></li>
                <!-- <li><a href="#"><img src="images/photos4.jpg" alt="photos4"></a></li>-->
              </ul>
            </div>
            <div class="schedule">
              <div class="section-title"> <a href="#" class="view-all">View Full Schedule <i class="fa fa-fw"></i></a>
                <h2>Event</h2>
              </div>
              <div class="eventpost"> <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding"><img src="images/profile-right-img1.jpg" alt="post"></span>
                <div class="col-xs-10 col-sm-10 col-md-10 post-data eat-nopadding">
                  <h3 class="post-title">Johnny Radford</h3>
                  <p> <strong>Event</strong> - Food Booth <br>
                    <strong>Team</strong> - Holy Rosary 7th Grade Girls Volleyball Fall 2013 <br>
                    <strong>Location</strong>: Hanapepe stadium <br>
                    <strong>Sport</strong>: Baseball <strong class="type-row">Type</strong>: Event</p>
                </div>
              </div>
              <div class="create-eventbtn"> <a href="#inline3" class="button-gra right fancybox"><img src="images/create-event-icon.png" alt="create event"> Create Event</a> </div>
            </div>
            <div class="share-links">
              <div id="commentBox111" class="search-member search-streams">
                <input type="text" value="" placeholder="Whats up?" id="txtbxStatus" class="search-info-member search-info-streams">
                <input type="button" id="btnUpdateStatus" data-bind="click: shareUpdate" class="submit-member">
              </div>
              <div class="link-member"> <a href="#" class="button-gra-small"><img src="images/links-icon.png" alt="Add Link"> Add Link</a> <a href="#" class="button-gra-small"><img src="images/photo-icon.png" alt="Add Photo"> Add Photo</a> <a href="#" class="button-gra-small"><img src="images/video-icon.png" alt="Add Video"> Add Video</a> </div>
            </div>
            
            <!--Start Post Section-->
            <div class="post-wrapper"> 
              <!--single post-->
              <div class="post"> <span class="post-img col-xs-2 col-sm-2 col-md-2"><img src="images/user-06.jpg" alt="post"></span>
                <div class="col-xs-6 col-sm-6 col-md-6 post-data">
                  <h3 class="post-title">Johnny Radford</h3>
                  <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                  <div class="comment-links"> <a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a> </div>
                </div>
                <div class="col-xs-4 col-sm-4">
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                </div>
              </div>
              
              <!--single post-->
              <div class="post"> <span class="post-img col-xs-2 col-sm-2 col-md-2"><img src="images/user-02.jpg"></span>
                <div class="col-xs-6 col-sm-12 col-sm-6 col-md-6 post-data">
                  <h3 class="post-title">Joe Wolfe</h3>
                  <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                  <div class="videoyoutube">
                    <iframe width="100%" height="315" src="http://www.youtube.com/embed/J-mO0wZSGtQ" frameborder="0" allowfullscreen></iframe>
                  </div>
                  <div class="comment-links"> <a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a> </div>
                </div>
                <div class="col-xs-4 col-sm-4">
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                </div>
              </div>
              
              <!--single post-->
              <div class="post"> <span class="post-img col-xs-2 col-sm-2 col-md-2"><img src="images/user-01.jpg"></span>
                <div class="col-xs-6 col-sm-6 col-md-6 post-data">
                  <h3 class="post-title">Cynthia Baker</h3>
                  <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                  <div class="comment-links"> <a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a> </div>
                </div>
                <div class="col-xs-4 col-sm-4">
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                </div>
              </div>
              
              <!--single post-->
              <div class="post lastpost"> <span class="post-img col-xs-2 col-sm-2 col-md-2"><img src="images/user-01.jpg"></span>
                <div class="col-xs-6 col-sm-6 post-data">
                  <h3 class="post-title">Cynthia Baker</h3>
                  <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                  <img src="images/post-img2.png">
                  <div class="comment-links"> <a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a> </div>
                </div>
                <div class="col-xs-4 col-sm-4">
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                  <div class="post-count col-xs-6 col-sm-6"> <span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                </div>
                <div class="comment-box">
                  <div class="col-sm-2">&nbsp;</div>
                  <div class="col-sm-10 comment">
                    <div class="row-comment text-center"> <a id="aTag" href="javascript:toggleAndChangeText();" class="show-all-comment">Show all 10 comments</a> </div>
                    <div class="row-comment"> <span class="img col-sm-2"><img src="images/user-02.jpg"></span>
                      <div class="col-sm-10 post-data">
                        <h3 class="post-title">Cynthia Baker</h3>
                        <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                        <div class="comment-links"> <a class="min-ago" href="#">5 minutes ago</a> <a class="cheers" href="#">5</a> <a class="jeers" href="#">6</a> <a class="btn-deals" href="#"></a> </div>
                      </div>
                    </div>
                    <div class="row-comment divToToggle" style="display:none;"> <span class="img col-sm-2"><img src="images/user-02.jpg"></span>
                      <div class="col-sm-10 post-data">
                        <h3 class="post-title">Cynthia Baker</h3>
                        <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                        <div class="comment-links"> <a class="min-ago" href="#">5 minutes ago</a> <a class="cheers" href="#">5</a> <a class="jeers" href="#">6</a> </div>
                      </div>
                    </div>
                    <div class="row-comment"> <span class="replay-icon col-sm-1"></span>
                      <div class="col-lg-11 eat-right">
                        <input type="text" placeholder="Say something..." class="say-something" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!--End Post Section--> </div>
        </div>
        <div class="showmorebtnbottom"><a href="#">SHOW MORE POSTS &nbsp;&nbsp; <i class="fa fa-fw"></i></a></div>
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