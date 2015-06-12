<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Sportzly.Master" AutoEventWireup="true" CodeBehind="t.aspx.cs" Inherits="Sportzly.Web.t" %>

<%@ Register Src="~/Controls/SportzlyTeamDetailControl.ascx" TagPrefix="uc1" TagName="SportzlyTeamDetail" %>
<%@ Register Src="~/Controls/SportzlyBulletinBoardControl.ascx" TagPrefix="uc1" TagName="SportzlyBulletinBoardControl" %>
<%@ Register Src="~/Controls/TeamMenuControl.ascx" TagPrefix="uc1" TagName="TeamMenuControl" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <section id="content">
        <div class="container">
            <div class="inner-content-new rightsticky" data-sticky_parent>
                <section id="sidebar" class="col-xs-3 col-sm-3 col-md-3">
                    <div class="left-sec">
                        <section class="left-infomation-profile">
                            <div class="user">
                                <span class="user-img">
                                    <img src="Version1/Images/profile-leftbar-img.jpg" alt="user">
                                </span>
                                <div class="user-details" style="margin-bottom: 0px;">
                                    <a data-bind="attr: { href: 'profile.aspx?' + Results()[0].UserName() }" style="background: none; color: #282828; float: none;" href="profile.aspx?ali716_99@yahoo.com">
                                        <h3 class="username">Johnny Radford</h3>
                                    </a>
                                </div>
                                <div class="tabbox-new">
                                    <div id="horizontalTab">
                                        <ul class="resp-tabs-list sidebartab">
                                            <li><a href="#"><span class="MEMBERS"></span><span class="post-box">1</span></a> </li>
                                            <li><a href="#"><span class="gamesicon"></span><span class="post-box">1</span></a></li>
                                        </ul>
                                        <div class="resp-tabs-container boxtleftside">
                                            <div class="tab1">
                                                <span class="user-img2">
                                                    <img src="Version1/Images/useimg1.jpg" alt="user"></span>
                                                <p class="fontadded"><b>Marcus Schwartz</b> added you as a friend.</p>
                                                <a href="#">Accept</a> <a href="#">Not Now</a> <a href="#">See Mutual</a> <a href="#">Friends</a>
                                            </div>
                                            <div class="tab1">
                                                <span class="user-img2">
                                                    <img src="Version1/Images/useimg2.jpg" alt="user"></span>
                                                <p class="fontadded"><b>Marcus Schwartz</b> added you as a friend.</p>
                                                <a href="#">Accept</a> <a href="#">Not Now</a> <a href="#">See Mutual</a> <a href="#">Friends</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </section>
                        <uc1:SportzlyTeamDetail runat="server" id="SportzlyTeamDetail" />
                    </div>
                </section>
                <section id="containerbar" class="col-xs-7 col-sm-7 col-md-7" data-sticky_column>
                    <ul class="resp-tabs-list">
                        <li class="resp-tab-active"><a href="dashboard.html"><span class="STREAM"></span>DASHBOARD</a></li>
                        <li><a href="#"><span class="MEMBERS"></span>MEMBERS</a></li>
                        <li><a href="#"><span class="EVENTS"></span>EVENTS
                            <!--<span class="post-box">2</span>-->
                        </a></li>
                        <li><a href="#"><span class="PHOTOS"></span>Photos / Videos </a></li>
                        <li class="last "><a href="#"><span class="DOCS"></span>DOCUMENTS</a></li>
                    </ul>
                    <div class="resp-tabs-container noborder-bottom">
                        <div class="tab1 col-xs-12">
                            <uc1:SportzlyBulletinBoardControl runat="server" ID="SportzlyBulletinBoardControl" />
                            <uc1:TeamMenuControl runat="server" ID="TeamMenuControl" />
                            <div class="schedule">
                                <div class="section-title">
                                    <a href="#" class="view-all">View Full Schedule <i class="fa fa-fw"></i></a>
                                    <h2>Event</h2>
                                </div>
                                <div class="eventpost">
                                    <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding">
                                        <img src="Version1/Images/profile-right-img1.jpg" alt="post"></span>
                                    <div class="col-xs-10 col-sm-10 col-md-10 post-data eat-nopadding">
                                        <h3 class="post-title">Johnny Radford</h3>
                                        <p>
                                            <strong>Event</strong> - Food Booth
                                            <br>
                                            <strong>Team</strong> - Holy Rosary 7th Grade Girls Volleyball Fall 2013
                                            <br>
                                            <strong>Location</strong>: Hanapepe stadium
                                            <br>
                                            <strong>Sport</strong>: Baseball <strong class="type-row">Type</strong>: Event
                                        </p>
                                    </div>
                                </div>
                                <div class="create-eventbtn"><a href="#inline3" class="button-gra right fancybox">
                                    <img src="Version1/Images/create-event-icon.png" alt="create event">
                                    Create Event</a> </div>
                            </div>
                            <div class="share-links">
                                <div id="commentBox111" class="search-member search-streams">
                                    <input type="text" value="" placeholder="Whats up?" id="txtbxStatus" class="search-info-member search-info-streams">
                                    <input type="button" id="btnUpdateStatus" data-bind="click: shareUpdate" class="submit-member">
                                </div>
                                <div class="link-member"><a href="#" class="button-gra-small">
                                    <img src="Version1/Images/links-icon.png" alt="Add Link">
                                    Add Link</a> <a href="#" class="button-gra-small">
                                        <img src="Version1/Images/photo-icon.png" alt="Add Photo">
                                        Add Photo</a> <a href="#" class="button-gra-small">
                                            <img src="Version1/Images/video-icon.png" alt="Add Video">
                                            Add Video</a> </div>
                            </div>

                            <!--Start Post Section-->
                            <div class="post-wrapper">
                                <!--single post-->
                                <div class="post">
                                    <span class="post-img col-xs-2 col-sm-2 col-md-2">
                                        <img src="Version1/Images/user-06.jpg" alt="post"></span>
                                    <div class="col-xs-6 col-sm-6 col-md-6 post-data">
                                        <h3 class="post-title">Johnny Radford</h3>
                                        <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                                        <div class="comment-links"><a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a></div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4">
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                                    </div>
                                </div>

                                <!--single post-->
                                <div class="post">
                                    <span class="post-img col-xs-2 col-sm-2 col-md-2">
                                        <img src="Version1/Images/user-02.jpg"></span>
                                    <div class="col-xs-6 col-sm-12 col-sm-6 col-md-6 post-data">
                                        <h3 class="post-title">Joe Wolfe</h3>
                                        <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                                        <div class="videoyoutube">
                                            <iframe width="100%" height="315" src="http://www.youtube.com/embed/J-mO0wZSGtQ" frameborder="0" allowfullscreen></iframe>
                                        </div>
                                        <div class="comment-links"><a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a></div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4">
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                                    </div>
                                </div>

                                <!--single post-->
                                <div class="post">
                                    <span class="post-img col-xs-2 col-sm-2 col-md-2">
                                        <img src="Version1/Images/user-01.jpg"></span>
                                    <div class="col-xs-6 col-sm-6 col-md-6 post-data">
                                        <h3 class="post-title">Cynthia Baker</h3>
                                        <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                                        <div class="comment-links"><a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a></div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4">
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                                    </div>
                                </div>

                                <!--single post-->
                                <div class="post lastpost">
                                    <span class="post-img col-xs-2 col-sm-2 col-md-2">
                                        <img src="Version1/Images/user-01.jpg"></span>
                                    <div class="col-xs-6 col-sm-6 post-data">
                                        <h3 class="post-title">Cynthia Baker</h3>
                                        <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                                        <img src="Version1/Images/post-img2.png">
                                        <div class="comment-links"><a href="#" class="min-ago">5 minutes ago</a> <a href="#" class="btn-comment"></a></div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4">
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue">CHEERS</a> </div>
                                        <div class="post-count col-xs-6 col-sm-6"><span class="count">3</span> <span class="points">points</span> <a href="#" class="btn-count blue black">JEERS</a> </div>
                                    </div>
                                    <div class="comment-box">
                                        <div class="col-sm-2">&nbsp;</div>
                                        <div class="col-sm-10 comment">
                                            <div class="row-comment text-center"><a id="aTag" href="javascript:toggleAndChangeText();" class="show-all-comment">Show all 10 comments</a> </div>
                                            <div class="row-comment">
                                                <span class="img col-sm-2">
                                                    <img src="Version1/Images/user-02.jpg"></span>
                                                <div class="col-sm-10 post-data">
                                                    <h3 class="post-title">Cynthia Baker</h3>
                                                    <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                                                    <div class="comment-links"><a class="min-ago" href="#">5 minutes ago</a> <a class="cheers" href="#">5</a> <a class="jeers" href="#">6</a> <a class="btn-deals" href="#"></a></div>
                                                </div>
                                            </div>
                                            <div class="row-comment divToToggle" style="display: none;">
                                                <span class="img col-sm-2">
                                                    <img src="Version1/Images/user-02.jpg"></span>
                                                <div class="col-sm-10 post-data">
                                                    <h3 class="post-title">Cynthia Baker</h3>
                                                    <p>Hey Guys! If you haven't seen Lionel Messi playing last year, I guess you’re completely on the wrong track! LOL!</p>
                                                    <div class="comment-links"><a class="min-ago" href="#">5 minutes ago</a> <a class="cheers" href="#">5</a> <a class="jeers" href="#">6</a> </div>
                                                </div>
                                            </div>
                                            <div class="row-comment">
                                                <span class="replay-icon col-sm-1"></span>
                                                <div class="col-lg-11 eat-right">
                                                    <input type="text" placeholder="Say something..." class="say-something" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--End Post Section-->
                        </div>
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
                                    <div class="rightsidebarimg">
                                        <img alt="post" src="Version1/Images/right-baradd-img1.jpg">
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                                </li>
                                <li>
                                    <h2>Sale 40% off</h2>
                                    <p class="insideinnerlinks"><a href="#">ibuidapp.com</a></p>
                                    <div class="rightsidebarimg">
                                        <img alt="post" src="Version1/Images/right-baradd-img2.jpg">
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                                </li>
                                <li>
                                    <h2>The South's Main Course</h2>
                                    <p class="insideinnerlinks"><a href="#">sandersonfarmschampoinship.com</a></p>
                                    <div class="rightsidebarimg">
                                        <img alt="post" src="Version1/Images/right-baradd-img3.jpg">
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                                </li>


                            </ul>
                        </div>
                    </div>
                </section>
            </div>
            <div class="clearfix"></div>
    </section>
</asp:Content>
