﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserDetailViewControl.ascx.cs" Inherits="Sportzly.Web.Controls.UserDetailViewControl" %>
<style type="text/css">
    .line1 a img {
        margin-top: 0px;
    }

    .line1 {
        border-bottom: 1px solid #CCCCCC;
        float: left;
        margin-bottom: 5px;
        padding-bottom: 5px;
        padding-left: 20px;
        width: 310px;
    }
    /* all */
    ::-webkit-input-placeholder {
        font-size: 12px;
    }

    ::-moz-placeholder {
        font-size: 12px;
    }
    /* firefox 19+ */
    :-ms-input-placeholder {
        font-size: 12px;
    }
    /* ie */
    input:-moz-placeholder {
        font-size: 12px;
    }

    .un-team ul {
        margin: 0;
        padding: 0;
        height:0;
        line-height:0;
    }

    .un-team li {
        border-radius: 5px;    
        padding: 3px 10px;
        list-style: none outside none;
        background-color:white;
        width:250px;
        margin-bottom:5px;
    }

        .un-team li h4 {
            margin: 25px 0px 25px 10px;
            color: #13680c;
            font-size: 12px;
            font-weight: 700;
            float:left;
        }

         .un-team li h4 a {
         
            color: #13680c;
           
        }

    .avatar {
        margin-top: 0px;
        display: inline-block;
        float: left;
     
        padding: 1px;
        text-decoration: none;
        height:50px;
        width:50px;
    }
</style>
<script src="Scripts/StesCodes.js"></script>
<script src="Scripts/stesGrid.js"></script>
<script src="Scripts/ContactGrabber.js"></script>
<link href="../Common/Styles/css/ContactGrabber.css" rel="stylesheet" />
<link href="../Common/Styles/css/FriendsInviter.css" rel="stylesheet" />
<link href="../Common/Styles/css/stesgrid.css" rel="stylesheet" />
<link href="../Common/Styles/css/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
<script src="Scripts/FriendsInviter.js"></script>
<div class="clear"></div>
<article class="johnny-streams">
    <div class="line1">
        <a data-bind="attr: { href: 'profile.aspx?' + EmailId() }">
            <img alt="" data-bind="attr: { src: ProfileFoto }" height="70" /></a>
        <a data-bind="attr: { href: 'profile.aspx?' + EmailId() }">
            <h2 data-bind="text: DisplayName"></h2>
        </a>
        <b><span data-bind="text: OtherLevel" class="fans"></span>
            <br />
            <span data-bind="text: OtherSportsTag" class="fans"></span></b>
        <span data-bind="visible: typeof (FavSports.Value) === 'function'">Favorite Sports: <span data-bind="    text: function () { if (typeof (FavSports.Value) === 'function') { return FavSports.Value(); } else { return '' } }()"></span></span>
        <b>
            <p class="im" data-bind="text: Summary"></p>
        </b>
        <div class="city1" style="float: left;">
            <span data-bind="text: City.Value"></span>, <span data-bind="    text: Country.Value"></span>
        </div>
        <div class="clear"></div>
    </div>

    <div class="line1">
        <div style="float: left; text-align: center; width: 100%; margin-top: 7px;">
           <%-- <a href="newteam.aspx">
                <img src="../images/createteam1.png" style="float: none; margin-left: 2px; margin-right: 0px;" /></a>
            <a href="CreateEvent.aspx" id="ancCreateEvent" style="display: none;">
                <img src="../images/cevent.png" style="float: none; margin-left: 2px; margin-right: 0px;" /></a>--%>

                  <a onclick="showCreateTeam()" style="cursor:pointer;">
                <img src="../images/createteam1.png" style="float: none; margin-left: 2px; margin-right: 0px;" /></a>
            <a onclick="showEvent()" id="ancCreateEvent" style="cursor:pointer;display: none;">
                <img src="../images/cevent.png" style="float: none; margin-left: 2px; margin-right: 0px;" /></a>

        </div>

    </div>
    <div class="line1" data-bind="visible: ActiveTeamsLogos().length > 0">
        <div style="float: left; text-align: center; width: 100%;">
            <div class="my-team" style="background: none; color: #555555; font-size: 21px; margin: 0 auto;">My Teams</div>
        </div>
        <div class="un-team" style="margin-top: 40px;" >
            <ul data-bind="foreach: ActiveTeamsLogos">
                <li>
                    <a data-bind="attr: { href: 'team.aspx?' + Id(), title: TeamName() }" class="avatar">
                        <img data-bind="attr: { src: Photo, alt: TeamName }" width="50" height="50"></a>
                    <h4><a data-bind="attr: { href: 'team.aspx?' + Id() }">
                        <span data-bind="text: TeamName()"></span>
                    </a>
                    </h4>
                </li>
            </ul>

        </div>
    </div>

    <%--<div class="line2">
        <%-- <span class="view-player">
           <span data-bind="text: Groups().length">0</span>
            <span class="player">
                <br>
                Groups</span></span>
        <span class="view-player" style="margin-left: 80px;">
            <!-- ko template: ActiveTeams().length > 0 ? 'hasTeams' : 'noTeams' -->
            <!-- /ko -->
            <script id="hasTeams" type="text/html">
                <a data-bind="attr: { href: 'teams.aspx?' + EmailId() }"><span data-bind="    text: ActiveTeams().length">0</span>            <span class="player">
                    <br>
                    Teams</span></a>
            </script>
            <script id="noTeams" type="text/html">
                <span data-bind="text: ActiveTeams().length">0</span>
                <span class="player">
                    <br>
                    Teams</span>
            </script>
        </span>
        <span class="view-player">
            <span data-bind="text: Awards().length">0</span>
            <span class="player">
                <br>
                Awards</span></span>
    </div>--%>
    <div class="clear"></div>
</article>
<div class="clear"></div>
<div id="loader3" class="container-loader">
<div id="loading3" class="nimble-loader">
<article>
    <div id="divcontacts">


        <h3>Invite friends</h3>
        <img src="../images/fbb.png" onclick="authService('facebook');" alt="facebook" title="Facebook" />
        <img src="../images/tt.png" onclick="authService('twitter');" title="Twitter" />
        <img src="../images/gg.png" onclick="contactGrabber.auth('gmail');window.open('oauth.aspx?currpage=gmail', 'googleoauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Gmail" />
        <img src="../images/yy.png" onclick="contactGrabber.auth('yahoo');window.open('oauth.aspx?currpage=yahoo', 'yahoooauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Yahoo" />
        <img src="../images/h2.png" onclick="contactGrabber.auth('hotmail');window.open('oauth.aspx?currpage=hotmail', 'windowsliveauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Hotmail" /><h3 style="float: right; width: 130px;">[OR]</h3>
    </div>
    <div>

        <div>
            <textarea class="invite-email1 field" id="txtbxInvite" placeholder="Copy and Paste multiple email addresses from any place you have them, dont worry about format we will work it out"></textarea>
            <div style="float: left;">
                <input value="" type="image" onclick="inviteFriends(); return false;" id="btnInvite" src="images/newinvite.png" />
            </div>
            <div style="float: left; margin: 0px 0px 5px 35px;">
                <img src="../images/invite.png" />
            </div>
        </div>

    </div>
</article>
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
        return StesCodes.getSignatureKey($("#MainContentPlaceHolder_UserDetailViewControl1_licKey").val());
    }
    var getFormattedKeyAll = function () {
        //Syntax: StesCodes.getSignatureKey(<string>)
        //Example: StesCodes.getSignatureKey(<(optional) - license key>)       
        return StesCodes.getSignatureKey($("#MainContentPlaceHolder_UserDetailViewControl1_licKeyAll").val());
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
        $("#MainContentPlaceHolder_UserDetailViewControl1_hdnServiceName").val(friendsInviter.getSelectedService());
        $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val(getFormattedKey());
        scsHdlr = function (result) {
            var results = getJson(result);
            friendsInviter.load(results);
        }
        var signatureKey = $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val();
        var serviceName = $("#MainContentPlaceHolder_UserDetailViewControl1_hdnServiceName").val();
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
            InviteFriends(scsHdlr, errHdlr, getUser().UserKey, fids, "Facebook");

            friendsInviter.closePopup();
            friendsInviter.closewindow();
            //friendsInviter.sendMessageFB(fids, link);
        }
        else {
            $("#MainContentPlaceHolder_UserDetailViewControl1_hdn_friends_ids").val(fids);
            scsHdlr = function (result) {
                var results = getJson(result);
                friendsInviter.messageSent(results);
            }
            var signatureKey = $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_UserDetailViewControl1_hdnServiceName").val();
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
            $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val(getFormattedKey());
            $("#MainContentPlaceHolder_UserDetailViewControl1_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_UserDetailViewControl1_status_hdn").val();
            var userName = "";
            var password = "";
            FetchContacts(scsHdlr, errHdlr, signatureKey, serviceName, userName, password);
        }
        else {
            $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val(getFormattedKeyAll());
            $("#MainContentPlaceHolder_UserDetailViewControl1_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_UserDetailViewControl1_status_hdn").val();
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
        $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSelectedContacts").val(a);
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
        $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSelectedContacts").val(contactGrabber.getSelectedContactsNew());
        $("#MainContentPlaceHolder_UserDetailViewControl1_status_hdn").val(contactGrabber.getSelectedService());

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                alert('Invitations have been sent');
            }
            contactGrabber.closewindow();
        }
        InviteFriends(scsHdlr, errHdlr, getUser().UserKey, $("#MainContentPlaceHolder_UserDetailViewControl1_hdnSelectedContacts").val(), contactGrabber.getSelectedService());

    }
</script>
<div class="break"></div>
<div>
    <iframe src="" frameborder="0" height="0px" width="0px" id="logoutframe"></iframe>
</div>
