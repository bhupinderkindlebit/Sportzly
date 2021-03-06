﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WelcomeControl.ascx.cs" Inherits="Sportzly.Web.Controls.WelcomeControl" %>
<script src="Scripts/StesCodes.js"></script>
<script src="Scripts/stesGrid.js"></script>
<script src="Scripts/ContactGrabber.js"></script>

<style type="text/css">
        /* all */
::-webkit-input-placeholder { font-size:12px; }
::-moz-placeholder {  font-size:12px; } /* firefox 19+ */
:-ms-input-placeholder {  font-size:12px; } /* ie */
input:-moz-placeholder {  font-size:12px; }
</style>
<link href="../Common/Styles/css/ContactGrabber.css" rel="stylesheet" />
<link href="../Common/Styles/css/FriendsInviter.css" rel="stylesheet" />
<link href="../Common/Styles/css/stesgrid.css" rel="stylesheet" />
<link href="../Common/Styles/css/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
<script src="Scripts/FriendsInviter.js"></script>
<section id="wrapper" class="form profile" style="min-height: 350px;">
    <link href="Common/Styles/css/style.MyUpdates.css" rel="stylesheet" />
    <nav class="head_profile">
        <h1>Welcome to your World of Sports</h1>
    </nav>
    <h3 class="title">Now that you registered, here are some features which will get you started.</h3>
    <h3 class="title" style="float: left;">
        <a href="javascript:;" style="text-decoration: underline;" onclick="showinvite();">
            <img src="images/send_invite.png" style="float: left;" />
        </a>

        <div style="float: left; line-height: 30px;">
            <img src="images/arrow1.png" />
            Click here to Invite Sports buddies and Friends.
        </div>
    </h3>
    <div id="divInvite" style="float: left; margin-left: 172px; width: 350px; margin-top: 10px;">
        <h3>Invite Friends</h3>

        <textarea class="invite-email1 field" id="txtbxInvite" placeholder="Copy and Paste multiple email addresses from any place you have them, dont worry about format we will work it out"></textarea>
        <div>
            <input value="" type="image" onclick="inviteFriends(); return false;" id="btnInvite" src="images/newinvite.png" />
        </div>



    </div>
    <div id="divcontacts" style="float: left; margin-top: 10px;">


        <h3>Invite friends</h3>
        <img src="../images/fbb.png" onclick="authService('facebook');" alt="facebook" title="Facebook" id="imgfb" />
        <img src="../images/tt.png" onclick="authService('twitter');" title="Twitter" />
        <img src="../images/gg.png" onclick="contactGrabber.auth('gmail');window.open('oauth.aspx?currpage=gmail', 'googleoauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Gmail" />
        <img src="../images/yy.png" onclick="contactGrabber.auth('yahoo');window.open('oauth.aspx?currpage=yahoo', 'yahoooauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Yahoo" />
        <img src="../images/h2.png" onclick="contactGrabber.auth('hotmail');window.open('oauth.aspx?currpage=hotmail', 'windowsliveauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Hotmail" />
        <br />
        <img src="../images/facebook_button.png" onclick="PublishOnFacebook('Request to Join Sportzly');" title="Facebook Post" />
        <a href="https://twitter.com/share" target="_blank" data-lang="en" id="imgTwitter">
            <img src="../images/twitter_button.png" title="Twitter Post" /></a>

        <script>
            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");
        </script>
    </div>
    <h3 class="title" style="float: left;">
        <a href="Teams.aspx" target="_blank">
            <img src="images/search_teams.png" style="float: left;" /></a>
        <div style="float: left; line-height: 30px;">
            <img src="images/arrow1.png" />
            Click here to search for teams.
        </div>
    </h3>
    <h3 class="title" style="float: left;"><a href="../NewTeam.aspx" target="_blank">
        <img src="images/create_a_team.png" style="float: left;" /></a>
        <div style="float: left; line-height: 30px;">
            <img src="images/arrow1.png" />
            Create your own team and send invitations to members to Join.
        </div>
    </h3>
    <h3 class="title" style="float: left;">
        <a href="../Players.aspx" target="_blank">
            <img src="images/search_people.png" style="float: left;" /></a>
        <div style="float: left; line-height: 30px;">
            <img src="images/arrow1.png" />
            Search for Sports and Fitness people.
        </div>
    </h3>
    <h3 class="title" style="float: left; clear: both; margin-left: 150px;"><a href="javascript:;" style="text-decoration: underline;" onclick="NotNow();">Not now </a>, take me to stream page</h3>
</section>
<div id="fb-root"></div>
<div id="overlay" onclick="overlay('hidden','');">
    <div></div>
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
<script type="text/javascript">

    function PublishOnFacebook(name) {

        var link = "";
        scsHdlr = function (result) {
            var results = getJson(result);
            link = results.Results[0].Token;
            var desc = results.Results[0].MailHTML;


            // alert(resultsN.Results[0].Photo);
            var photolink = "http://www.sportzly.com/images/logo1.png";
            // alert(photolink);
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
        GetInviteToken(scsHdlr, errHdlr, getUser().UserKey);
    }
</script>
<!--End-university-football-->
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
        return StesCodes.getSignatureKey($("#MainContentPlaceHolder_WelcomeControl1_licKey").val());
    }
    var getFormattedKeyAll = function () {
        //Syntax: StesCodes.getSignatureKey(<string>)
        //Example: StesCodes.getSignatureKey(<(optional) - license key>)       
        return StesCodes.getSignatureKey($("#MainContentPlaceHolder_WelcomeControl1_licKeyAll").val());
    }

</script>

<script language="javascript" type="text/javascript">
    friendsInviter.init({
        popup: true,
        send: function (fids, selectedService) {
            sendMessageToFriends(fids, selectedService);
        }
    });

    function FBLoad() {

        friendsInviter.loadFB();
    }

    function authService(a) {
        friendsInviter.auth(a, getFormattedKey());
    }
    var hideframe_startprocessing = function () {
        friendsInviter.fetchLoading();
        $("#MainContentPlaceHolder_WelcomeControl1_hdnServiceName").val(friendsInviter.getSelectedService());
        $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val(getFormattedKey());
        scsHdlr = function (result) {
            var results = getJson(result);
            friendsInviter.load(results);
        }
        var signatureKey = $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val();
        var serviceName = $("#MainContentPlaceHolder_WelcomeControl1_hdnServiceName").val();
        FetchTwitterContacts(scsHdlr, errHdlr, signatureKey, serviceName);
    }
    var LoadTw = function () {

        friendsInviter.overlay("visible", "popup");
        $("#popupFIcontainer").show();

        $(".inviter-tpl .tpl-loading").html("Please authorize your account...").removeClass("nobg error");
        $(".inviter-tpl").show();
        $(".inviter-tpl .tpl-loading").show();
        $(".inviter-tpl .tpl-default").hide();

        $(".inviter-tpl .tpl-header-icon img").attr("src", "images/twitter_logo.png");
        friendsInviter.fetchLoading();
        $("#MainContentPlaceHolder_WelcomeControl1_hdnServiceName").val('twitter');
        $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val(getFormattedKey());
        scsHdlr = function (result) {
            var results = getJson(result);
            friendsInviter.load(results);
        }
        var signatureKey = $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val();
        var serviceName = 'twitter';
        FetchTwitterContacts(scsHdlr, errHdlr, signatureKey, serviceName);
    }
    var sendMessageToFriends = function (fids, selectedService) {

        if (selectedService == "facebook") {
            $(".inviter-tpl .inviter-tpl").hide();
            scsHdlr = function (result) {

                var results = getJson(result);
                if (valid(results)) {

                    alert('Invitations have been sent');
                }
            }
            fids = fids.replace(",", ";");
            InviteFriends(scsHdlr, errHdlr, getUser().UserKey, fids, "Facebook");

            friendsInviter.closePopup();
            friendsInviter.closewindow();
            //friendsInviter.sendMessageFB(fids, link);
        }
        else {
            $("#MainContentPlaceHolder_WelcomeControl1_hdn_friends_ids").val(fids);
            scsHdlr = function (result) {
                var results = getJson(result);
                friendsInviter.messageSent(results);
            }
            var signatureKey = $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_WelcomeControl1_hdnServiceName").val();
            SendTwitterContacts(scsHdlr, errHdlr, signatureKey, serviceName, fids);
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
            $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val(getFormattedKey());
            $("#MainContentPlaceHolder_WelcomeControl1_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_WelcomeControl1_status_hdn").val();
            var userName = "";
            var password = "";
            FetchContacts(scsHdlr, errHdlr, signatureKey, serviceName, userName, password);
        }
        else {
            $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val(getFormattedKeyAll());
            $("#MainContentPlaceHolder_WelcomeControl1_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MainContentPlaceHolder_WelcomeControl1_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_WelcomeControl1_status_hdn").val();
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
        $("#MainContentPlaceHolder_WelcomeControl1_hdnSelectedContacts").val(a);
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
        $("#MainContentPlaceHolder_WelcomeControl1_hdnSelectedContacts").val(contactGrabber.getSelectedContactsNew());
        $("#MainContentPlaceHolder_WelcomeControl1_status_hdn").val(contactGrabber.getSelectedService());
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                alert('Invitations have been sent');
            }
            contactGrabber.closewindow();
        }
        InviteFriends(scsHdlr, errHdlr, getUser().UserKey, $("#MainContentPlaceHolder_WelcomeControl1_hdnSelectedContacts").val(), contactGrabber.getSelectedService());

    }
</script>
<div class="break"></div>
<div>
    <iframe src="" frameborder="0" height="0px" width="0px" id="logoutframe"></iframe>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var link = "";
        scsHdlrN = function (result) {
            var resultsn = getJson(result);
            link = resultsn.Results[0].Token;
            var name = "";
            scsHdlr = function (result) {
                var results = getJson(result);
                if (valid(results)) {
                    name = results.Results[0].DisplayName;
                }
                $("#imgTwitter").attr("href", "https://twitter.com/share?url=" + link + "&text=You have been invited by " + name + " to join his/her on Sportzly.");
            }
            GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, getUser().EmailId);

        }
        GetInviteTokenTwitter(scsHdlrN, errHdlr, getUser().UserKey);
    });
</script>
