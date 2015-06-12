﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BulletinBoardControl.ascx.cs" Inherits="Sportzly.Web.Controls.BulletinBoardControl" %>

<%@ Register Src="~/Controls/MyEventsForthComingControl.ascx" TagPrefix="uc1" TagName="MyEventsForthComingControl" %>
<style type="text/css">
    .morecontent span
    {
        display: none;
    }

    .number-university h2
    {
        font-size: 12px !important;
    }

    .number-university
    {
        height: auto !important;
        background: white !important;
    }

    .in-university-football
    {
        height: auto !important;
        background: url("images/bg-university.png") repeat-y scroll left top transparent !important;
    }
    /* all */
    ::-webkit-input-placeholder
    {
        font-size: 12px;
    }

    ::-moz-placeholder
    {
        font-size: 12px;
    }
    /* firefox 19+ */
    :-ms-input-placeholder
    {
        font-size: 12px;
    }
    /* ie */
    input:-moz-placeholder
    {
        font-size: 12px;
    }

    #overlay
    {
        height: 189px !important;
        position: absolute !important;
        top: 575px !important;
    }

    .bodybg.fl
    {
        left: -50px !important;
        position: absolute !important;        
    }
</style>
<script src="/Scripts/jquery.nimble.loader.js"></script>
<link href="/Common/Styles/css/loader.css" rel="stylesheet" />
<script src="Scripts/StesCodes.js"></script>
<script src="Scripts/stesGrid.js"></script>
<script src="Scripts/ContactGrabber.js"></script>
<link href="../Common/Styles/css/ContactGrabber.css" rel="stylesheet" />
<link href="../Common/Styles/css/FriendsInviter.css" rel="stylesheet" />
<link href="../Common/Styles/css/stesgrid.css" rel="stylesheet" />
<link href="../Common/Styles/css/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
<script src="Scripts/FriendsInviter.js"></script>
<%--<link href="Common/Styles/css/form.css" rel="stylesheet" />--%>
<script src="Common/Styles/jquery.form.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="Scripts/jquery.geocomplete.js"></script>
<style type="text/css">
    .ui-autocomplete
    {
        max-height: 165px !important;
        height: auto !important;
    }
</style>
<article class="university-football">
    <div class="called">
        <h3 class="">Team Actions</h3>
        <a onclick="showBulletine(null)" class="btn btn-primary bluenew btnright">Text to Team</a>
        <a onclick="showPoll()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Poll</a>
        <a onclick="showEvent()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Event</a>
        <a onclick="showAdmin()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Admin</a>
        <a onclick="showInvite()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Invite</a>
        <a onclick="showPhoto()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Photo</a>
        <a onclick="showDocument()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Documents</a>
        <a onclick="showVideo()" class="btn btn-primary bluenew btnright"><i class="fa fa-fw"></i> Videos</a>
    </div>

    <h3>Bulletin Board</h3>
    <article class="in-university-football">
        <div data-bind="foreach: notices()">
            <div class="number-university board-member" data-bind="click: function () { showBulletine($data); }">
                <span class="col-xs-2 col-sm-2 ">
                    <img alt="" data-bind="attr: { src: PhotoPath() }"></span>
                <div class="col-sm-10">
                    <h4 data-bind="text: Description()"></h4>
                    <span class="post posted-by col-sm-8 eat-left">Posted by: <a href="#" class="name-post" data-bind="text: OwnerName()"></a></span>
                    <span class="post-span col-sm-4 pull-right text-right" data-bind="text: CreateDate()"></span>
                </div>
            </div>
        </div>
        <div class="page-nav">
            <a class="btn btn-primary blue" onclick="showBulletine(null)">Text to Team</a>
            <section class="join-a-team join-a-team-next-page2 pull-right">
                <span class="page-team" data-bind="text: pageText" style="padding-top:2px;"></span>
                <a href="javascript:getPrevPage()" class="prev1 btn btn-primary blue"><span class="prev"></span>PREVIOUS </a>
                <a href="javascript:getNextPage()" class="next1 btn btn-primary blue" style="margin-left: 3px;">NEXT <span class="next"></span></a>
            </section>
        </div>

        <div class="clear"></div>

    </article>
    <div class="clear"></div>

   
</article>

 <uc1:myeventsforthcomingcontrol runat="server" id="myeventsforthcomingcontrol" />
 <div class="clear"></div>

<div id="loader1" class="container-loader">
    <div id="loading1" class="nimble-loader">
        <div class="invite-section invite-section-box invitearticle" data-bind="visible: teamModel.isMyTeam()">
            <div class="col-xs-12 col-sm-12 col-md-12 eat-nopadding2">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="invite-team-member">
                        <h3>Invite team members</h3>
                        <textarea cols="2" rows="3" id="txtbxInvite" placeholder="Copy and Paste multiple email addresses from any place you have them, dont worry about format we will work it out"></textarea>
                        <button onclick="inviteToTeam(); return false;" id="btnInvite" class="btn btn-primary blue" type="button">SEND INVITE</button>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 eat-nopadding2">
                    <div id="divcontacts" class="invite-member">
                        <h3>Invite members</h3>
                        <ul class="icon-social">
                            <li><a style="cursor:pointer;">
                                <img src="../images/facebook-icon.png" onclick="authService('facebook');" alt="facebook" title="Facebook" /></a></li>
                            <li><a style="cursor:pointer;">
                                <img src="../images/twitter-icon.png" onclick="authService('twitter');" title="Twitter" /></a></li>
                            <li><a style="cursor:pointer;">
                                <img src="../images/google-icon.png" onclick="contactGrabber.auth('gmail');window.open('oauth.aspx?currpage=gmail', 'googleoauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Gmail" /></a></li>
                            <li><a style="cursor:pointer;">
                                <img src="../images/yahoo-icon.png" onclick="contactGrabber.auth('yahoo');window.open('oauth.aspx?currpage=yahoo', 'yahoooauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Yahoo" /></a></li>
                            <li><a style="cursor:pointer;">
                                <img src="../images/email-icon.png" onclick="contactGrabber.auth('hotmail');window.open('oauth.aspx?currpage=hotmail', 'windowsliveauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Hotmail" /></a></li>
                        </ul>
                        <a class="btn-facebook-share" style="cursor: pointer;" onclick="PublishOnFacebook('Request to Join Team');"></a>
                        <a class="btn-twitter-share" href="https://twitter.com/share" target="_blank" data-lang="en" id="imgTwitter"></a>
                        <script>
                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
    <div class="bodybg" id="popupcontainer" style="display: none; z-index: 9999999; position: absolute">
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
    <div class="bodybg fl" id="popupFIcontainer" style="display: none">
        <div class="generic_dialog_popup">
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

            scsHdlrN = function (resultN) {
                var resultsN = getJson(resultN);
                if (valid(resultsN)) {
                    // alert(resultsN.Results[0].Photo);
                    var photolink = "http://www.sportzly.com/" + resultsN.Results[0].Photo;
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
            }
            GetTeams(scsHdlrN, errHdlr, getUser().UserKey, null, getTeam());
        }
        GetInviteToken(scsHdlr, errHdlr, getUser().UserKey, getTeam());
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
        return StesCodes.getSignatureKey($("#MyContentPlaceHolder_bulletinBoardControl_licKey").val());
    }
    var getFormattedKeyAll = function () {
        //Syntax: StesCodes.getSignatureKey(<string>)
        //Example: StesCodes.getSignatureKey(<(optional) - license key>)       
        return StesCodes.getSignatureKey($("#MyContentPlaceHolder_bulletinBoardControl_licKeyAll").val());
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
        $("#MyContentPlaceHolder_bulletinBoardControl_hdnServiceName").val(friendsInviter.getSelectedService());
        $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val(getFormattedKey());
        scsHdlr = function (result) {
            var results = getJson(result);
            friendsInviter.load(results);
        }
        var signatureKey = $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
        var serviceName = $("#MyContentPlaceHolder_bulletinBoardControl_hdnServiceName").val();
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
            $("#MyContentPlaceHolder_bulletinBoardControl_hdn_friends_ids").val(fids);
            scsHdlr = function (result) {
                var results = getJson(result);
                friendsInviter.messageSent(results);
            }
            var signatureKey = $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
            var serviceName = $("#MyContentPlaceHolder_bulletinBoardControl_hdnServiceName").val();
            SendTwitterContacts(scsHdlr, errHdlr, signatureKey, serviceName, fids, getTeam());
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
            $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val(getFormattedKey());
            $("#MyContentPlaceHolder_bulletinBoardControl_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
            var serviceName = $("#MyContentPlaceHolder_bulletinBoardControl_status_hdn").val();
            var userName = "";
            var password = "";
            FetchContacts(scsHdlr, errHdlr, signatureKey, serviceName, userName, password);
        }
        else {
            $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val(getFormattedKeyAll());
            $("#MyContentPlaceHolder_bulletinBoardControl_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MyContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
            var serviceName = $("#MyContentPlaceHolder_bulletinBoardControl_status_hdn").val();
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
        $("#MyContentPlaceHolder_bulletinBoardControl_hdnSelectedContacts").val(a);
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
        $("#MyContentPlaceHolder_bulletinBoardControl_hdnSelectedContacts").val(contactGrabber.getSelectedContactsNew());
        $("#MyContentPlaceHolder_bulletinBoardControl_status_hdn").val(contactGrabber.getSelectedService());
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                alert('Invitations have been sent');
            }
            contactGrabber.closewindow();
        }

        InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, $("#MyContentPlaceHolder_bulletinBoardControl_hdnSelectedContacts").val(), getTeam(), contactGrabber.getSelectedService());
    }
</script>
<div class="break"></div>
<div>
    <iframe src="" frameborder="0" height="0px" width="0px" id="logoutframe"></iframe>
</div>
