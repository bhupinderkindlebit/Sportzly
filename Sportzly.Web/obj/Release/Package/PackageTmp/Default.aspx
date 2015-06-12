<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sportzly.Web.Default" %>

<%@ Register Src="Controls/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/SignupControl.ascx" TagName="SignupControl" TagPrefix="uc2" %>
<%@ Register Src="Controls/ErrorControl.ascx" TagName="ErrorControl" TagPrefix="uc3" %>
<%@ Register Src="Controls/Facebook.ascx" TagName="Facebook" TagPrefix="uc4" %>
<%@ Register Src="Controls/PlayerHomeControl.ascx" TagName="Players" TagPrefix="uc5" %>
<%@ Register Src="Controls/TeamHomeControl.ascx" TagName="Teams" TagPrefix="uc6" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <title>Welcome to Sportzly- 100% free Sports Ecosystem</title>
    <meta name="description" content="Sportzly helps you create your personalized sports experience. We understand that your sports life is different from your personal or professional life. Sports is where you can be YOU. We have created a platform that will enhance your sports life to the maximum potential." />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="Scripts/jquery.js"></script>
    <script src="Scripts/modernizr.custom.82896.js"></script>
    <%--   <script language="javascript" src="Scripts/knockout-2.2.1.js"></script>
    <script language="javascript" src="Scripts/html5shiv.js"></script>--%>
    <script src="http://connect.facebook.net/en_US/all.js" type="text/javascript"></script>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="Scripts/ie.css" media="screen"/><![endif]-->
    <link href="Common/Styles/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Common/Styles/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Common/Styles/css/styles.css" rel="stylesheet" />
    <link href="Common/Styles/css/responsive.css" rel="stylesheet" />
    
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/general.js"></script>

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-45569497-1', 'sportzly.com');
        ga('send', 'pageview');

    </script>
    <style type="text/css">
        .External_Popup {
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            z-index: 333;
            opacity: .5;
            display: none;
            position: fixed;
            background: gray;
        }

        .Internal_Popup {
            width: 0px auto;
            height: auto;
            top: 20%;
            left: 30%;
            z-index: 666;
            display: none;
            position: fixed;
            border: 1px solid black;
            min-width: 37%;
            -webkit-box-shadow: 0px 1px 23px 1px #000;
            -moz-box-shadow: 0px 1px 23px 1px #000;
            box-shadow: 0px 1px 23px 1px #000;
        }

        .PopupHeader {
            height: 30px;
            width: 99%;
            background-color: #13680C;
            font-size: 18px;
            color: white;
            font-weight: bold;
            line-height: 16px;
            padding: 0.5%;
        }

        .PopupContentDiv {
            height: auto;
            background-color: White;
            font-size: 14px;
            color: black;
            font-weight: normal;
            padding: 5%;
        }

        .PopupHeader p {
            width: auto;
            font-size: 18px;
            color: white;
            font-weight: bold;
            line-height: 16px;
            padding: 1% 0 0 1%;
        }

        #my_video_1 {
            /*border-radius: 25px 25px 0 0;*/ border-radius: 0 0;
        }

        .vjs-default-skin .vjs-big-play-button:before {
            line-height: 1.6em !important;
        }

        .vjs-default-skin .vjs-big-play-button {
            height: 1.6em !important;
        }

        .vjs-default-skin .vjs-big-play-button {
            left: 37% !important;
            top: 37% !important;
        }

        .vimeovideowrap, .content, .youtubevideowrap, #disqus_thread, .videocontent {
            margin: 0 auto;
            max-width: 640px;
        }

        .wrapper {
            position: relative !important;
        }

        .video-js {
            padding-top: 55.25% !important;
        }
    </style>
    <link href="http://vjs.zencdn.net/4.3/video-js.css" rel="stylesheet">
    <script src="http://vjs.zencdn.net/4.3/video.js"></script>
</head>
<body>
    <form id="form1" runat="server" style="margin: 0px;">
        <div style="display: none" id="divProgress">
          
            <div align="center" style="width: 100%; position: fixed; z-index: 100001; top: 0px; left: 0px; vertical-align: middle; text-align: center; _height: expression(document.body.offsetHeight + 'px');">
                <div style="margin-top: 250px">
                    <img id="imgloading" src="images/sportzlyloader.GIF" />
                </div>
            </div>
            <div id="backgroundElement" style="position: fixed; left: 0px; top: 0px; z-index: 10000; width: 100%; height: 1800px; background-color: #666666; opacity: 0.4; filter: alpha(opacity=40);">
            </div>
        </div>
        <asp:ScriptManager EnablePageMethods="true" runat="server">
        </asp:ScriptManager>
        <uc4:Facebook ID="Facebook1" runat="server" />
    </form>
    <uc3:ErrorControl ID="ErrorControl1" runat="server" />
      <a href="https://plus.google.com/104464555582490744086" rel="publisher"></a>
    <div id="wrapper">
        <header>
            <section id="login-drawer">
                <div class="container">
                    <uc1:LoginControl ID="LoginControl1" runat="server" />
                </div>
            </section>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-5">
                        <h1 class="logo"><a href="http://www.sportzly.com">
                            <img src="Common/Styles/css/images/logo.png" alt="Sportzly" /></a></h1>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                        <div class="header-right">
                            <div class="actions">
                                <a class="login-button free-signup show-for-small" href="#signup-form">SIGNUP</a>
                               <%-- <a style="font-size:15px;text-decoration:underline;font-weight:600;margin-left:10px;margin-right:10px;" href="http://www.sportzlystore.com/" target="_blank">Shop</a>--%>
                                <a class="login-button close-event">LOGIN</a>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <section id="slider">
            <div class="container">
                <h3>Manage your team</h3>
                <h4>Attract sponsors, build an ecosystem</h4>

                <section class="icons show-for-small">
                    <h2 class="msg">TEAM COMMUNICATION AND MANAGEMENT</h2>
                    <h3 class="msg1">made simple</h3>
                    <div class="row icon-size">
                        <div class="col-xs-4 col-sm-2 col-md-1 icon-text"><i class="fa fa-mobile"><i class="fa fa-align-left"></i></i><span>Text</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-video-camera"></i><span>Video</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-camera"></i><span>Photos</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-calendar-o"></i><span>Events</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-calendar"></i><span>Calender</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-map-marker"></i><span>Location</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-user"></i><span>Roster</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-table"></i><span>Scorecard</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa standing"></i><span>Standings</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-file-text"></i><span>Documents</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa paypal"></i><span>Paypal</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa sponsors"></i><span>Sponsors</span></div>
                    </div>
                </section>

                <div class="row">
                    <div class="col-xs-12 col-sm-7  col-md-5">
                        <div class="form-container" id="signup-form">
                            <uc2:SignupControl ID="SignupControl1" runat="server" />
                            <div class="form-group">
                                <p>By Signing Up, You agree to the Sportzly <a href="Terms.aspx">Terms of Service</a>, Sportzly <a href="Privacy.aspx">Privacy Policy</a> and Communications Terms</p>
                            </div>
                            <div class="signup-with">
                                <h2>Sign Up with:</h2>
                                <div class="social-icon">
                                    <a href="javascript:;" onclick="OpenFaceBook();" title="Facebook">
                                        <img src="Common/Styles/css/images/icon-facebook.jpg" alt="Facebook"></a>
                                    <a href="javascript:;" title="Twitter" onclick="OpenTwitter();">
                                        <img src="Common/Styles/css/images/icon-twitter.jpg" alt="Twitter"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <section class="icons  hide-for-small">
                    <h2 class="msg">TEAM COMMUNICATION AND MANAGEMENT</h2>
                    <h3 class="msg1">made simple</h3>
                    <div class="row icon-size">
                        <div class="col-xs-4 col-sm-2 col-md-1 icon-text"><i class="fa fa-mobile"><i class="fa fa-align-left"></i></i><span>Text</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-video-camera"></i><span>Video</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-camera"></i><span>Photos</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-calendar-o"></i><span>Events</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-calendar"></i><span>Calender</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-map-marker"></i><span>Location</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-user"></i><span>Roster</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-table"></i><span>Scorecard</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa standing"></i><span>Standings</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa fa-file-text"></i><span>Documents</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa paypal"></i><span>Paypal</span></div>
                        <div class="col-xs-4 col-sm-2 col-md-1"><i class="fa sponsors"></i><span>Sponsors</span></div>
                    </div>
                </section>


            </div>
        </section>

        <section id="content">
            <div class="container">
                <section class="video-container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 video-desc">
                            <h1>What is <strong class="colorize">Sportzly?</strong></h1>
                            <p><strong>Sportzly is a different kind of social network</strong> all about organizing and managing your sports. It's a tool for organizing your sports teams online, for planning games and events, and for managing and promoting your league. It's for people who are passionate about playing sports and staying active. If that's you, you've come to the right place!</p>
                        </div>
                        <div class="col-xs-12 col-sm-6 video-wrap">

                            <div class="wrapper">
                                <div class="videocontent">
                                    <video id="my_video_1" class="video-js vjs-default-skin" controls
                                        preload="none" width="auto" height="auto" poster="upload/video/0.jpg"
                                        data-setup="{}">
                                        <source src="http://www.sportzly.com/Upload/video/Sportzly 2nd-1.mp4" type='video/mp4' />
                                        <source src="http://www.sportzly.com/Upload/video/Sportzly 2nd-1.webm" type='video/webm' />
                                    </video>
                                </div>
                            </div>


                        </div>
                    </div>
                </section>
                <section class="featured-teams-section">
                    <div class="row">
                        <h3 class="heading line"><span>Featured Teams</span></h3>
                        <uc6:Teams ID="Teams1" runat="server" />
                    </div>
                </section>
                <section class="featured-members-section" style="margin: 46px 0 34px;">
                    <%--<div class="row">--%>
                        <h3 class="heading line"><span>Featured Members</span> </h3>
                        <uc5:Players ID="Players1" runat="server" />
                   <%-- </div>--%>
                </section>
            </div>
        </section>



        <%--<div id="backstretch">
                    <img src="images/slider-01.jpg" alt="" class="active" />
                    <img src="images/slider-02.jpg" alt="" />
                    <img src="images/slider-03.jpg" alt="" />
                </div>--%>


        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4 footer-logo">
                        <img src="images/footer-logo.png" alt="Sportzly" /></div>
                    <div class="col-xs-12 col-sm-4">
                        <nav id="footer-nav">
                            <ul>
                                <li><a href="howitworks.aspx">HOW IT WORKS</a></li>
                                <li><a href="aboutus.aspx">ABOUT US</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-xs-12 col-sm-4 copyright">Copyright © 2014 sportzly.com. All Rights Reserved</div>
                </div>
            </div>
        </footer>



    </div>
    <div id="fb-root">
    </div>
</body>
</html>
<script src="Scripts/browser.js"></script>
<script type="text/javascript">

    var i = 2;
    var messages = ["Team Communication & Management",
         "Send group text messages with a click",
         "Upload Videos directly",
         "Upload Images directly",
         "Sync your phone calander"];
    var messagespart = ["made simple",
        "to all members",
        "from your phone",
        "from your phone",
        "with events"]

    $(document).ready(function () {
        var b = BrowserDetect.browser;
        var v = BrowserDetect.version;
        if (b == "Explorer") {
            if (v == "7" || v == "8") {
                alert("Your browser is old and not supported by us. Please upgrade your browser or use chrome, firefox or safari");
            }
        }
        setInterval("RotateMessage()", 5000);
    });

    function RotateMessage() {
        $(".msg").text(messages[i - 1]);
        $(".msg1").text(messagespart[i - 1]);
        i = i + 1;
        if (i == 6) { i = 1; }
    }


</script>

<script type="text/javascript">
    function OpenFaceBook() {
        FB.init({
            appId: 605932659468778,
            status: true,
            cookie: true,
            oauth: true,
            xfbml: true
        });

        FB.login(function (response) {
            if (response.authResponse) {
                var accetoken = response.authResponse.accessToken;
                FB.api('/me', function (response) {
                    $("#divProgress").show();
                    postFBData(response.id, accetoken);

                });
            } else {
            }
        }, { scope: 'email,publish_stream' });
    }

    function OpenTwitter() {
        var pathname = window.location.href;
        $.ajax({
            type: 'POST',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ url: pathname }),
            url: 'Default.aspx/TwitterLogin',
            success: function (data) {
                window.location.href = 'http://twitter.com/oauth/authorize?oauth_token=' + data.d;
            }
        });
    }

    function postFBData(userid, token) {
        $.ajax({
            type: 'POST',
            dataType: "json",
            url: 'Fbhandler.ashx?AccessToken=' + token + '&&UID=' + userid + '',
            success: function (data) {

                var name = data.name;
                var email = data.email;
                var fbid = data.fbid;

                signupfacebook(email, fbid, name);

            }
        });
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#myCarousel').carousel(0);
        $('#myCarousel1').carousel(0);
    });
</script>
