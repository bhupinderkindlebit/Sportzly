﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WelcomeSportzlyControl.ascx.cs" Inherits="Sportzly.Web.Controls.WelcomeSportzlyControl" %>

<script src="Scripts/StesCodes.js"></script>
<script src="Scripts/stesGrid.js"></script>
<script src="Scripts/ContactGrabber.js"></script>
<script src="Scripts/FriendsInviter.js"></script>
<link href="/Common/Styles/css/loader.css" rel="stylesheet" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="../Version1/css/bootstrap.min.css">
<link href="../Version1/CSS/font-awesome.min.css" rel="stylesheet" />
<!-- Common CSS -->
<link type="text/css" href="../Version1/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="../Version1/script/eventcalendar/dropkick.css">
<!-- fancybox Responsive CSS -->
<link rel="stylesheet" type="text/css" href="../Version1/script/fancybox/jquery.fancybox.css?v=2.1.5" media="screen" />



<link href="../Common/Styles/css/ContactGrabber.css" rel="stylesheet" />
<link href="../Common/Styles/css/FriendsInviter.css" rel="stylesheet" />
<link href="../Common/Styles/css/stesgrid.css" rel="stylesheet" />
<link href="../Common/Styles/css/jquery-ui-1.10.2.custom.css" rel="stylesheet" />

<script src="Version1/Script/js/jquery.js"></script>
<script src="Version1/Script/js/modernizr.custom.82896.js"></script>
<script src='Version1/Script/fancybox/jquery.fancybox.js'></script>
<script type="text/javascript" src="Version1/Script/js/jquery.bxslider.js"></script>
<script src="Version1/Script/js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript" src="Version1/Script/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="Version1/script/eventcalendar/jquery.ui.timepicker.js"></script>
<script src="Version1/Script/js/bootstrap.min.js"></script>
<script src="Version1/Script/js/general.js"></script>
<script src="Version1/Script/eventcalendar/dropkick.min.js"></script>
<script src="Version1/Script/eventcalendar/dropkick.jquery.js"></script>
<script src="/Scripts/jquery.nimble.loader.js"></script>
<script src="Version1/Validation/jquery.validate.js"></script>
<script src="Version1/Validation/delegate.js"></script>
<div id="fb-root"></div>
<div id="overlay" onclick="overlay('hidden','');">
    <div></div>
</div>
<style type="text/css">
    #cssmenu ul ul {
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
    }

        #cssmenu ul ul a {
            line-height: 33px;
        }

        #cssmenu ul ul ul {
            left: 100%;
            top: 0;
        }

    #divResult {
        position: absolute;
        width: 335px;
        display: none;
        margin-top: -1px;
        border: solid 1px #dedede;
        border-top: 0px;
        overflow: hidden;
        border-bottom-right-radius: 6px;
        border-bottom-left-radius: 6px;
        -moz-border-bottom-right-radius: 6px;
        -moz-border-bottom-left-radius: 6px;
        box-shadow: 0px 0px 5px #999;
        border-width: 3px 1px 1px;
        border-style: solid;
        border-color: #333 #DEDEDE #DEDEDE;
        background-color: white;
        z-index: 9999;
    }

    .display_box {
        padding: 4px;
        border-top: solid 1px #dedede;
        font-size: 12px;
        z-index: 9999;
        float: left;
        width: 325px;
    }

        .display_box:hover {
            background: #007400;
            color: #FFFFFF;
            cursor: pointer;
        }




    #cssmenu li ul {
        background: white;
        border-left: 4px solid #007e00;
        border-right: 4px solid #007e00;
        border-bottom: 4px solid #007e00;
        display: none;
        height: auto;
        filter: alpha(opacity=95);
        opacity: 0.95;
        position: absolute;
        width: 152px;
        z-index: 200;
        /*top:1em;
		/*left:0;*/
    }

    #cssmenu li:hover > ul {
        display: block;
    }

    #cssmenu li li {
        display: block;
        float: none;
        padding: 0px;
        position: relative;
        width: 152px;
        background: none;
    }

    #cssmenu li ul a {
        display: block;
        font-size: 12px;
        font-style: normal;
        /*padding: 0px 10px 0px 15px;*/
        text-align: center;
    }

        #cssmenu li ul a:hover {
            opacity: 1.0;
            filter: alpha(opacity=100);
        }

    #cssmenu p {
        clear: left;
    }

    #cssmenu .active > a {
        background: #a80329;
        -webkit-box-shadow: 0 -4px 0 #a80329, 0 -5px 0 #b81c40, 0 -6px 0 #a80329;
        -moz-box-shadow: 0 -4px 0 #a80329, 0 -5px 0 #b81c40, 0 -6px 0 #a80329;
        box-shadow: 0 -4px 0 #a80329, 0 -5px 0 #b81c40, 0 -6px 0 #a80329;
        color: #ffffff;
    }

        #cssmenu .active > a:hover {
            color: white;
        }
</style>
<a class="view-all right fancybox none paddingtop10 paddingbottom10" style="display: none;" id="anc1" href="#div1"></a>
<div id="div1" style="max-width: 730px; display: none;">
    <div class="form-row list_ss">
        <h3>Welcome to sportzly..</h3>
        <ul>
            <li class="first center">
                <div class="left-lable width25 floatleft">
                    <label class="lable left">Get Started..</label>
                </div>
            </li>

            <li class="marginbottom15"><a class="view-all right fancybox floatleft" href="#div2">
                <i class="fa fa-fw"></i>
                Create New Team
            </a></li>
            <li>[OR]</li>
            <li>
                <div class="search-bar none">
                    <input class="searchnew width335" type="text" placeholder="Search for people or teams" id="txtSportzlySearch">
                    <a href="#">
                        <i class="fa fa-search"></i>
                    </a>
                    <div id="divResult">
                    </div>
                </div>
            </li>
            <li>
                <div class="left-lable width50">
                    <label class="lable left"><a href="MyUpdates.aspx">Not Now </a>, take me to stream page</label>
                </div>
            </li>
        </ul>
    </div>
</div>

    <div id="div2" style="max-width: 830px; display: none;" form="true">
        <a class="view-all right fancybox none paddingtop10 paddingbottom10" style="display: none;" id="a2" href="#div3"></a>



        <div class="form-row list_ss">
            <h3>Create Team</h3>
            <ul>
                <li>
                    <div class="left-lable">
                        <label class="lable">Team Name*</label>
                    </div>
                    <div class="right-lable">
                        <input class="input MyRule" type="text" placeholder="Untitled Team" value="" name="txtTeamName" id="txtTeamName" />
                    </div>
                </li>
                <li>
                    <div class="left-lable">
                        <label class="lable">Sport*</label>
                    </div>
                    <div class="right-lable">
                        <select name="ddlSport" class="search_select search-select MyRule" id="ddlSport">
                            <asp:Panel ID="ltrSport" runat="server" />
                        </select>
                    </div>
                </li>
                <li>
                    <div class="left-lable">
                        <label class="lable">Level*</label>
                    </div>
                    <div class="right-lable">
                        <select name="ddlLevel" class="search_select search-select MyRule" id="ddlLevel">
                            <asp:Panel ID="ltrLevel" runat="server" />
                        </select>
                    </div>
                </li>
                <li>
                    <div class="left-lable">

                        <label class="lable">Country*</label>
                    </div>
                    <div class="right-lable">
                        <select name="ddlCountry" class="search_select search-select MyRule" id="ddlCountry">
                            <asp:Panel ID="ltrCountry" runat="server" />
                        </select>
                    </div>
                </li>
                <li>
                    <div class="left-lable">
                        <label class="lable">City*</label>
                    </div>
                    <div class="right-lable">
                        <input class="input MyRule1" type="text" placeholder="City, State" value="" name="txtCity" id="txtCity" />
                    </div>
                </li>
                <li class="last">
                    <div class="button-row">
                        <input class="buttonblue" type="button" value="Create Team" name="Create Team" id="btnCreateTeam" >
                    </div>
                </li>
                <li class="center">
                    <div class="left-lable width50">
                        <label class="lable center"><a href="MyUpdates.aspx">Not Now </a>, take me to stream page</label>
                    </div>
                </li>
            </ul>
        </div>
    </div>

<input type="hidden" id="hdTeamId" />

        <div id="div3" style="max-width: 730px; display: none;">

            <div class="invite-section invite-section-box">
                <div class="col-xs-12 col-sm-12 col-md-12 eat-nopadding2">
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <div class="invite-team-member">
                            <h3 id="hTeam">Awesome. Your Team has been created.</h3>
                            <h3>Invite Team Members</h3>

                            <textarea placeholder="Copy and Paste multiple email addresses from any place you have 
them, dont worry about format we will work it out"
                                id="txtbxInvite"
                                rows="3" cols="2"></textarea>
                            <button type="button" class="btn btn-primary blue" onclick="inviteToTeam()">SEND INVITE</button>
                            <button type="button" class="btn btn-primary blue" onclick="GoToMyTeam()">GO TO MY TEAM</button>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 eat-nopadding2">
                        <div class="invite-member">
                            <h3>Invite Members</h3>
                            <ul class="icon-social">
                                <li class="first"><a href="javascript:;" title="Facebook" onclick="authService('facebook');">
                                    <img alt="facebook" src="Version1/images/facebook-icon.png"></a></li>
                                <li><a href="javascript:;" onclick="authService('twitter');" title="Twitter">
                                    <img alt="facebook" src="Version1/images/twitter-icon.png"></a></li>
                                <li><a href="javascript:;" onclick="contactGrabber.auth('gmail');window.open('oauth.aspx?currpage=gmail', 'googleoauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Gmail">
                                    <img alt="facebook" src="Version1/images/google-icon.png"></a></li>
                                <li><a href="javascript:;" onclick="contactGrabber.auth('yahoo');window.open('oauth.aspx?currpage=yahoo', 'yahoooauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Yahoo">
                                    <img alt="facebook" src="Version1/images/yahoo-icon.png"></a></li>
                                <li class="last"><a href="javascript:;" onclick="contactGrabber.auth('hotmail');window.open('oauth.aspx?currpage=hotmail', 'windowsliveauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Hotmail">
                                    <img alt="facebook" src="Version1/images/email-icon.png"></a></li>
                            </ul>
                            <a class="btn-facebook-share" href="javascript:;" onclick="PublishOnFacebook('Request to Join Sportzly');" title="Facebook Post"></a><a class="btn-twitter-share" href="https://twitter.com/share" target="_blank" data-lang="en" id="imgTwitter" style="margin-top:5px;"></a>
                            <script>
                                !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" value="" id="licKey" runat="server" />
        <input type="hidden" value="" id="licKeyAll" runat="server" />
        <div class="container1 panWid">

            <div class="body fl break panWid pad padTop">

                <input type="hidden" runat="server" id="hdnSignatureKey" value="" />
                <input type="hidden" runat="server" id="hdnSelectedContacts" value="" />
                <input type="hidden" id="hdn_ol_filename" value="0" runat="server" />
                <input type="hidden" id="hdn_ol_type" value="0" runat="server" />
                <input type="hidden" id="hdn_oauth" runat="server" value="" />
                <input type="hidden" id="status_hdn" runat="server" value="" />
                <input type="hidden" id="hdn_friends_ids" value="0" runat="server" />
                <input type="hidden" id="hdnServiceName" runat="server" value="" />
            </div>
            <div class="bodybg" id="popupcontainer" style="display: none; z-index: 9999999; position: absolute;">
                <div style="top: 20px; width: 642px; z-index: 9999999" class="generic_dialog_popup">
                    <div class="closeboxholder">
                        <div class="closebox">
                            <a href="javascript:;" onclick="contactGrabber.closewindow();" title="Close">
                                <img src="images/closebox.png" alt="Close" title="Close" style="border: none; width: 25px;" /></a>
                        </div>
                    </div>
                    <div class="contacts-tpl fl">
                        <div class="tpl-header fl fullWid"></div>
                        <div class="tpl-loading fl fullWid">
                            <span>
                                <img src="images/sload.gif" /></span><span class="loading-content">Please authorize your account...</span>
                        </div>

                        <div class="tpl-contacts fl fullWid tpl-default"></div>
                    </div>
                </div>
            </div>
            <div class="bodybg fl" id="popupFIcontainer" style="display: none; z-index: 9999999; position: absolute;">
                <div style="top: 20px; width: 642px; z-index: 9999999" class="generic_dialog_popup">
                    <div class="closeboxholder">
                        <div class="closebox">
                            <a href="javascript:;" onclick="friendsInviter.closewindow();" title="Close">
                                <img src="images/closebox.png" alt="Close" title="Close" style="border: none; width: 25px;" /></a>
                        </div>
                    </div>
                    <div class="inviter-tpl fl">
                        <div class="tpl-header fl fullWid"></div>
                        <div class="tpl-loading fl fullWid">Please authorize your account...</div>
                        <div class="tpl-contacts fl fullWid tpl-default"></div>
                        <div class="tpl-footer fl fullWid tpl-default">
                            <div class="tpl-footer-wrapper fl">
                                <div class="fl">
                                    <div class="sendBtn">Send</div>
                                </div>
                                <div class="fl ui-send-loading"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script language="javascript" type="text/javascript">
            //callback function for signature formatter
            var callbackFn = function (data) {
                //console.log(JSON.stringify(data));
                //your logic here
            }
            var callbackFnNew = function (data) {
                //console.log(JSON.stringify(data));
                //your logic here
            }
            var formatSignature = function (license) {
                //Syntax: StesCodes.init(<array>,<string>);
                //Example: StesCodes.init(<(required) - array of license keys>,<(optional) - callback frunction name>);
                StesCodes.init(license, "callbackFn");
            }
            var formatSignatureAll = function (license) {
                //Syntax: StesCodes.init(<array>,<string>);
                //Example: StesCodes.init(<(required) - array of license keys>,<(optional) - callback frunction name>);
                StesCodes.init(license, "callbackFnNew");
            }
            var getFormattedKey = function () {
                //Syntax: StesCodes.getSignatureKey(<string>)
                //Example: StesCodes.getSignatureKey(<(optional) - license key>)       
                return StesCodes.getSignatureKey($("#ContentPlaceHolder1_WelcomeSportzlyControl_licKey").val());
            }
            var getFormattedKeyAll = function () {
                //Syntax: StesCodes.getSignatureKey(<string>)
                //Example: StesCodes.getSignatureKey(<(optional) - license key>)       
                return StesCodes.getSignatureKey($("#ContentPlaceHolder1_WelcomeSportzlyControl_licKeyAll").val());
            }

        </script>

        <script language="javascript" type="text/javascript">
            friendsInviter.init({
                popup: true,
                send: function (fids, selectedService) {
                    sendMessageToFriends(fids, selectedService);
                }
            });
            function authService(a) {
                friendsInviter.auth(a, getFormattedKey());
            }
            var hideframe_startprocessing = function () {
                friendsInviter.fetchLoading();
                $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnServiceName").val(friendsInviter.getSelectedService());
                $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val(getFormattedKey());
                scsHdlr = function (result) {
                    var results = getJson(result);
                    friendsInviter.load(results);
                }
                var signatureKey = $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val();
                var serviceName = $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnServiceName").val();
                FetchTwitterContacts(scsHdlr, errHdlr, signatureKey, serviceName);
            }

            var sendMessageToFriends = function (fids, selectedService) {
                //var link = "";
                //scsHdlr = function (result) {
                //    var results = getJson(result);
                //    link = results.Results[0].Token;

                //}
                //GetInviteToken(scsHdlr, errHdlr, getUser().UserKey, getTeam());
                if (selectedService == "facebook") {
                    $(".inviter-tpl .inviter-tpl").hide();
                    scsHdlr = function (result) {

                        var results = getJson(result);
                        if (valid(results)) {

                            alert('Invitations have been sent');
                        }
                    }
                    fids = fids.replace(",", ";");

                    InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, fids, getTeam(), "Facebook");
                    friendsInviter.closePopup();
                    friendsInviter.closewindow();
                    //friendsInviter.sendMessageFB(fids, link);
                }
                else {
                    $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdn_friends_ids").val(fids);
                    scsHdlr = function (result) {
                        var results = getJson(result);
                        friendsInviter.messageSent(results);
                    }
                    var signatureKey = $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val();
                    var serviceName = $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnServiceName").val();
                    SendTwitterContacts(scsHdlr, errHdlr, signatureKey, serviceName, fids, parseInt($("#hdTeamId").val()));
                    friendsInviter.closewindow();
                }

            }
        </script>

        <script language="javascript" type="text/javascript">

            contactGrabber.init({
                popup: true, //displays the contacts in popup
                send: function () {
                    send(); //this function is called when the send button is clicked.
                }
            });
            $(".contactgrabberbox > li").click(function (a) {
                var thisObj = contactGrabber.auth($(this).attr("ref"));
            });
            var grabAllContacts = function (service) {
                if (service == "facebook") {
                    $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val(getFormattedKey());
                    $("#ContentPlaceHolder1_WelcomeSportzlyControl_status_hdn").val(service);
                    scsHdlr = function (result) {
                        var results = getJson(result);
                        contactGrabber.displayContacts(results, false);
                    }

                    var signatureKey = $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val();
                    var serviceName = $("#ContentPlaceHolder1_WelcomeSportzlyControl_status_hdn").val();
                    var userName = "";
                    var password = "";
                    FetchContacts(scsHdlr, errHdlr, signatureKey, serviceName, userName, password);
                }
                else {
                    $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val(getFormattedKeyAll());
                    $("#ContentPlaceHolder1_WelcomeSportzlyControl_status_hdn").val(service);
                    scsHdlr = function (result) {
                        var results = getJson(result);
                        contactGrabber.displayContacts(results, false);
                    }

                    var signatureKey = $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSignatureKey").val();
                    var serviceName = $("#ContentPlaceHolder1_WelcomeSportzlyControl_status_hdn").val();
                    var userName = "";
                    var password = "";
                    FetchContacts(scsHdlr, errHdlr, signatureKey, serviceName, userName, password);
                }

            }
            var startGrabbingOauth = function (a) {

                contactGrabber.grabContacts();
                if ((a == "google") || (a == "gmail"))
                    document.getElementById("logoutframe").src = "https://mail.google.com/mail/?logout&hl=en";
                else if (a == "yahoo")
                    document.getElementById("logoutframe").src = "http://www.yahoo.com/_ylt=AoK55ZOw4K2dbB1FQCeJ.IabvZx4/SIG=13d8g0r4k/**https%3A//login.yahoo.com/config/login%3F.src=fpctx%26logout=1%26.direct=1%26.done=http%3A//www.yahoo.com/";
                else
                    document.getElementById("logoutframe").src = "http://login.live.com/logout.srf?app=0000000040051700";
            }
            var openauth = function (a) {

                if (a == "gmail")
                    window.open("oauth.aspx?currpage=gmail", "googleoauth", "location=1,status=1,scrollbars=1,width=700,height=400");
                else if (a == "facebook")
                    window.open("oauth.aspx?currpage=facebook", "fbauth", "location=1,status=1,scrollbars=1,width=700,height=400");
                else if (a == "yahoo")
                    window.open("oauth.aspx?currpage=yahoo", "yahoooauth", "location=1,status=1,scrollbars=1,width=700,height=400");
                else
                    window.open("oauth.aspx?currpage=hotmail", "windowsliveauth", "location=1,status=1,scrollbars=1,width=700,height=400");

            }
            function hideloader_() {
                try {
                    if (document.getElementById("loading_iframe") != null)
                        document.getElementById("loading_iframe").style.display = "none";
                } catch (e) { }
            }
            var listener = function (e) {
                var code;
                if (!e) var e = window.event;
                if (e.keyCode) code = e.keyCode;
                else if (e.which) code = e.which;
                if (code == 13) {
                    contactGrabber.grabContacts();
                }
            }


            var setSelectedContacts = function (a) {
                $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSelectedContacts").val(a);
            }
            function initialoutlook(a, b) {
                document.getElementById("<%# hdn_ol_filename.ClientID %>").value = a;
                document.getElementById("<%# hdn_ol_type.ClientID %>").value = b;
                grabAllContacts("outlook");
            }
            function hideloader() {
                if (document.getElementById("loading_iframe") != null)
                    document.getElementById("loading_iframe").style.display = "none";
            }
            var send = function () {
                $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSelectedContacts").val(contactGrabber.getSelectedContactsNew());
                $("#ContentPlaceHolder1_WelcomeSportzlyControl_status_hdn").val(contactGrabber.getSelectedService());
                scsHdlr = function (result) {

                    var results = getJson(result);
                    if (valid(results)) {
                        alert('Invitations have been sent');
                    }
                    contactGrabber.closewindow();
                }

                InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, $("#ContentPlaceHolder1_WelcomeSportzlyControl_hdnSelectedContacts").val(), parseInt($("#hdTeamId").val()), contactGrabber.getSelectedService());
            }
        </script>
        <div class="break"></div>
        <div>
            <iframe src="" frameborder="0" height="0px" width="0px" id="logoutframe"></iframe>
        </div>

        <script type="text/javascript">

            function PublishOnFacebook(name) {

                var link = "";
                scsHdlr = function (result) {
                    var results = getJson(result);
                    link = results.Results[0].Token;
                    var desc = results.Results[0].MailHTML;

                    scsHdlrN = function (resultN) {
                        var resultsN = getJson(resultN);
                        if (valid(resultsN)) {

                            var photolink = "http://www.sportzly.com/" + resultsN.Results[0].Photo;

                            var videolink = link;
                            FB.ui({
                                method: 'stream.publish',
                                display: 'dialog',
                                message: 'Post About Sportzly',
                                attachment: {
                                    name: 'Sportzly',
                                    caption: name,
                                    description: desc,
                                    "media": [{ "type": 'image', "src": photolink, "href": videolink }],
                                    href: videolink
                                },
                                action_links: [{ text: 'Join Sportzly', href: videolink }],
                                user_message_prompt: 'Share your thoughts about Sportzly'
                            },
                              function (response) {
                                  if (response && response.post_id) {
                                      alert("Post to Facebook Successfully");
                                  } else {


                                  }
                              });
                        }
                    }
                    GetTeams(scsHdlrN, errHdlr, getUser().UserKey, null, parseInt($("#hdTeamId").val()));
                }
                GetInviteToken(scsHdlr, errHdlr, getUser().UserKey, parseInt($("#hdTeamId").val()));
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                
                jQuery("#anc1").fancybox({
                    helpers: {
                        overlay: { closeClick: false }                        
                    },
                    'closeBtn': false
                }).trigger('click');
                

            });
        </script>
        <script type="text/javascript">
            $(function () {
                var currentRequest = null;
                $("#txtSportzlySearch").keyup(function () {
                    var inputSearch = $(this).val();
                    var dataString = "{keyword:'" + inputSearch + "'}";
                    if (inputSearch != '') {
                        currentRequest = $.ajax({
                            type: "POST",
                            url: "search.asmx/Search",
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            data: dataString,
                            cache: false,
                            beforeSend: function () {
                                if (currentRequest != null) {
                                    currentRequest.abort();
                                }
                            },
                            success: function (html) {
                                $("#divResult").html('');
                                $("#divResult").html(html.d).show();
                            }
                        });
                    } return false;
                });

                $(document).on("click", "div.display_box", function (e) {
                    var $clicked = $(e.target);
                    var link = $clicked.find('.name').attr("link");

                    if (link != "" && link != undefined) { window.location.href = link; }

                });
                $(document).on("click", "body", function (e) {
                    var $clicked = $(e.target);
                    if (!$clicked.hasClass("search")) {
                        jQuery("#divResult").fadeOut();
                    }
                });
                $('#inputSearch').click(function () {
                    jQuery("#divResult").fadeIn();
                });
            });

        </script>
        

        <script>
            $(function () {
                
                $('#div2').validate({
                    submitHandler: function (form) { // for demo                     
                        return false; // form demo
                    },
                    onsubmit: false,
                    rules: {
                        txtTeamName: {
                            required: true
                        },
                        txtCity: { required: true },
                        ddlSport: { required: true },
                        ddlCountry: { required: true },
                        ddlLevel: { required: true }

                    },
                    messages: {
                        txtTeamName: {
                            required: "Please enter team name"                          
                        },
                        txtCity: {
                            required: "Please enter city"
                        },
                        ddlSport: {
                            required: "Please select sport"
                        }
                        ,
                        ddlLevel: {
                            required: "Please select level"
                        }
                        ,
                        ddlCountry: {
                            required: "Please select country"
                        }
                    },
                    ignore: []
                    //,
                    //highlight: function (element, errorClass) {
                    //    $(element).siblings('.dk-select').addClass('error');
                    //    $('.dk-selected').css('border', 'none');
                    //},
                    //unhighlight: function (element, errorClass) {
                    //    $(element).siblings('.dk-select').removeClass('error');
                    //    $('.dk-selected').css('border', '1px solid #ccc');
                    //}
                });

                $("#btnCreateTeam").click(function (event) {
                   
                    var valid = $("#div2").valid();                   
                    if (valid) {
                        CreateTeam();
                    }
                    else {
                        event.preventDefault();
                    }

                });
            });
</script>