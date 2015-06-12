<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SportzlyBulletinBoardControl.ascx.cs" Inherits="Sportzly.Web.Controls.SportzlyBulletinBoardControl" %>
<style type="text/css">
    .morecontent span {
        display: none;
    }

    .number-university h2 {
        font-size: 12px !important;
    }

    .number-university {
        height: auto !important;
        background: white !important;
    }

    .in-university-football {
        height: auto !important;
        background: url("images/bg-university.png") repeat-y scroll left top transparent !important;
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
</style>
<script src="Scripts/StesCodes.js"></script>
<script src="Scripts/stesGrid.js"></script>
<script src="Scripts/ContactGrabber.js"></script>
<link href="../Common/Styles/css/ContactGrabber.css" rel="stylesheet" />
<link href="../Common/Styles/css/FriendsInviter.css" rel="stylesheet" />
<link href="../Common/Styles/css/stesgrid.css" rel="stylesheet" />
<link href="../Common/Styles/css/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
<script src="Scripts/FriendsInviter.js"></script>
<link href="Common/Styles/css/form.css" rel="stylesheet" />
<script src="Common/Styles/jquery.form.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="Scripts/jquery.geocomplete.js"></script>

<style type="text/css">
    .ui-autocomplete {
        max-height: 165px !important;
        height: auto !important;
    }
</style>
<script src="Scripts/teampage.js"></script>
<script src="Version1/Validation/jquery.validate.js"></script>
<script src="Version1/Validation/delegate.js"></script>
<article class="university-football">
    <div class="called">
        <h3 class="">Team Actions</h3>
        <a class="btn btn-primary bluenew btnright fancybox" href="#inline1">Text to Team</a>
        <a class="btn btn-primary bluenew btnright fancybox" href="#inline2"><i class="fa fa-fw"></i> Poll</a>
        <a class="btn btn-primary bluenew btnright fancybox" href="#inline3"><i class="fa fa-fw"></i> Event</a>
        <a class="btn btn-primary bluenew btnright" href="#"><i class="fa fa-fw"></i> Admin</a>
        <a class="btn btn-primary bluenew btnright" href="#"><i class="fa fa-fw"></i> Invite</a>
        <a class="btn btn-primary bluenew btnright fancybox" href="#inline4"><i class="fa fa-fw"></i> Photo</a>
        <a class="btn btn-primary bluenew btnright" href="#"><i class="fa fa-fw"></i> Documents</a>
        <a class="btn btn-primary bluenew btnright" href="#"><i class="fa fa-fw"></i> Videos</a>
    </div>
    <div class="row row-field" id="div3" runat="server" visible="false">
        <label class="narrow fixed">Country</label>
        <asp:DropDownList ID="ddlCountry" runat="server" data-placeholder="Choose a Country" CssClass="field field-text narrow">
        </asp:DropDownList>
    </div>
    <div class="row row-field" id="div1" runat="server" style="text-align: center;">
        <p>
            Enter your phone number and carrier to receive text messages from team bulletin board
        </p>
    </div>
    <div class="row row-field" id="divMobile" runat="server">
        <label class="narrow fixed">Mobile Phone</label>
        <input id="txtPhone" type="text" runat="server" lengthtxt="10" class="field field-text narrow valid-num valid-length valid-required" placeholder="Ex:8885553333" />
    </div>
    <div class="row row-field" id="divcarrier" runat="server" style="display: none;">
        <label class="narrow fixed">Carrier</label>
        <asp:DropDownList ID="ddlCarrier" runat="server" class="field field-text narrow"></asp:DropDownList>
    </div>
    <div class="row row-field" id="divcity" runat="server" visible="false">
        <label class="narrow fixed">City</label>
        <input id="txtCity" type="text" class="field field-text narrow" runat="server" />
    </div>
    <div class="row row-field" id="div2" runat="server" visible="false" style="text-align: center;">
        <input class="signup-submit-btn" type="submit" value="Update" style="width: 18%; margin-top: 5px;">
    </div>
    <h3>Bulletin Board</h3>
    <article class="in-university-football">
        <div data-bind="foreach: notices()">
            <div class="board-member">
                <span class="col-xs-2 col-sm-2 ">
                    <img alt="memebr" data-bind="attr: { src: PhotoPath() }"></span>
                <div class="col-sm-10">
                    <h4 data-bind="text: Description()"></h4>
                    <span class="posted-by col-sm-8 eat-left">Posted by: <a data-bind="attr: { href: 'profile.aspx?' + EmailId() }"><span data-bind="text: OwnerName()"></span></a></span><span class="col-sm-4 pull-right text-right" data-bind="text: CreateDate()"></span>
                </div>
            </div>
        </div>
        <!--<p class="msg text-center">A text message will be sent to all team members</p>-->
        <div class="page-nav">
            <div data-bind="visible: teamModel.isMyTeam()" style="display: none;">
                <a class="btn btn-primary blue fancybox" href="#inline1">Text to Team</a>
            </div>
            <div style="max-width:;display: none;" id="inline1" form="true">
                <div class="form-row poll">
                    <h3>Text to Team</h3>
                    <ul>
                        <li class="first">
                            <div class="left-lable">
                                <label class="lable">Notice:</label>
                            </div>
                            <div class="right-lable">
                                <textarea placeholder="Only 140 Characters will be displayed as text, remaining can be seen in the email" style="height: 250px;" class="input" id="txtNotice" name="txtNotice"></textarea>
                            </div>
                        </li>
                        <li>
                            <label class="required">*Required</label>
                        </li>
                        <li class="last">
                            <div class="button-row">
                                <input type="button" class="buttonblue" id="btnSendText" value="Create" name="Add Event">
                                <input type="button" id="" class="buttonblack fancyboxclose" value="Never mind" name="Add Event">
                                <span class="character-text">Character Count: <span id="spCount"> </span></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <section class="join-a-team join-a-team-next-page2 pull-right">
                <span class="page-team" data-bind="text: pageText">1-3 of 86</span>
                <button class="btn btn-primary blue" type="button" onclick="getPrevPage()"><span class="prev"></span>PREVIOUS</button>
                <button class="btn btn-primary blue" type="button" onclick="getNextPage()">NEXT <span class="next"></span></button>
            </section>
        </div>
        <div class="clearfix"></div>
    </article>
    <!--End-in-university-football-->
    <div class="clear"></div>
</article>

<article class="invitearticle" data-bind="visible: teamModel.isMyTeam()">
    <div class="invite-section invite-section-box">
        <div class="col-xs-12 col-sm-12 col-md-12 eat-nopadding2">
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="invite-team-member">
                    <h3>Invite Team Members</h3>
                    <textarea placeholder="Copy and Paste multiple email addresses from any place you have 
them, dont worry about format we will work it out"
                        id="txtbxInvite"
                        rows="3" cols="2"></textarea>
                    <button type="button" class="btn btn-primary blue" onclick="inviteToTeam(); return false;" id="btnInvite">SEND INVITE</button>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 eat-nopadding2">
                <div class="invite-member">
                    <h3>Invite Members</h3>
                    <ul class="icon-social">
                        <li class="first"><a href="javascript:;" onclick="authService('facebook');" alt="facebook" title="Facebook">
                            <img alt="facebook" src="Version1/Images/facebook-icon.png"></a></li>
                        <li><a href="javascript:;" onclick="authService('twitter');" title="Twitter">
                            <img alt="facebook" src="Version1/Images/twitter-icon.png"></a></li>
                        <li><a href="javascript:;" onclick="contactGrabber.auth('gmail');window.open('oauth.aspx?currpage=gmail', 'googleoauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Gmail">
                            <img alt="facebook" src="Version1/Images/google-icon.png"></a></li>
                        <li><a href="javascript:;" onclick="contactGrabber.auth('yahoo');window.open('oauth.aspx?currpage=yahoo', 'yahoooauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Yahoo">
                            <img alt="facebook" src="Version1/Images/yahoo-icon.png"></a></li>
                        <li class="last"><a href="javascript:;" onclick="contactGrabber.auth('hotmail');window.open('oauth.aspx?currpage=hotmail', 'windowsliveauth', 'location=1,status=1,scrollbars=1,width=700,height=400');" title="Hotmail">
                            <img alt="facebook" src="Version1/Images/email-icon.png"></a></li>
                    </ul>
                    <a class="btn-facebook-share" href="javascript:;" onclick="PublishOnFacebook('Request to Join Team');" title="Facebook Post"></a><a class="btn-twitter-share" href="https://twitter.com/share" target="_blank" data-lang="en" id="imgTwitter"></a>
                    <script>
                        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");
                    </script>
                </div>
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
        return StesCodes.getSignatureKey($("#MainContentPlaceHolder_bulletinBoardControl_licKey").val());
    }
    var getFormattedKeyAll = function () {
        //Syntax: StesCodes.getSignatureKey(<string>)
        //Example: StesCodes.getSignatureKey(<(optional) - license key>)       
        return StesCodes.getSignatureKey($("#MainContentPlaceHolder_bulletinBoardControl_licKeyAll").val());
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
        $("#MainContentPlaceHolder_bulletinBoardControl_hdnServiceName").val(friendsInviter.getSelectedService());
        $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val(getFormattedKey());
        scsHdlr = function (result) {
            var results = getJson(result);
            friendsInviter.load(results);
        }
        var signatureKey = $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
        var serviceName = $("#MainContentPlaceHolder_bulletinBoardControl_hdnServiceName").val();
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
            $("#MainContentPlaceHolder_bulletinBoardControl_hdn_friends_ids").val(fids);
            scsHdlr = function (result) {
                var results = getJson(result);
                friendsInviter.messageSent(results);
            }
            var signatureKey = $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_bulletinBoardControl_hdnServiceName").val();
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
            $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val(getFormattedKey());
            $("#MainContentPlaceHolder_bulletinBoardControl_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_bulletinBoardControl_status_hdn").val();
            var userName = "";
            var password = "";
            FetchContacts(scsHdlr, errHdlr, signatureKey, serviceName, userName, password);
        }
        else {
            $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val(getFormattedKeyAll());
            $("#MainContentPlaceHolder_bulletinBoardControl_status_hdn").val(service);
            scsHdlr = function (result) {
                var results = getJson(result);
                contactGrabber.displayContacts(results, false);
            }

            var signatureKey = $("#MainContentPlaceHolder_bulletinBoardControl_hdnSignatureKey").val();
            var serviceName = $("#MainContentPlaceHolder_bulletinBoardControl_status_hdn").val();
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
        $("#MainContentPlaceHolder_bulletinBoardControl_hdnSelectedContacts").val(a);
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
        $("#MainContentPlaceHolder_bulletinBoardControl_hdnSelectedContacts").val(contactGrabber.getSelectedContactsNew());
        $("#MainContentPlaceHolder_bulletinBoardControl_status_hdn").val(contactGrabber.getSelectedService());
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                alert('Invitations have been sent');
            }
            contactGrabber.closewindow();
        }

        InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, $("#MainContentPlaceHolder_bulletinBoardControl_hdnSelectedContacts").val(), getTeam(), contactGrabber.getSelectedService());
    }
</script>
<div class="break"></div>
<div>
    <iframe src="" frameborder="0" height="0px" width="0px" id="logoutframe"></iframe>
</div>
