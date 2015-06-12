var _pageCount = 0;

function noticesViewModel() {
    var self = this;
    self.pageText = ko.observable();
    self.notices = ko.observableArray([]);
    self.addAct = function (act) { self.notices.push(act); }
    self.addActAt = function (act, idx) { self.notices.splice(idx, 0, act); }
    self.clear = function () {
        self.notices.removeAll();
    }
}

var noticesModel = new noticesViewModel();

ko.applyBindings(noticesModel, $('.in-university-football').get(0));
ko.applyBindings(noticesModel, $('.invitearticle').get(0));



getTeamNotices = function (pageCount) {
    var user = getUserEmail();
    var teamId = getTeam();
    var actPages = pageCount * 3;

    scsHdlr = function (result) {
        
        var results = getJson(result);
        if (valid(results)) {
            _pageCount = pageCount;
            displayNotices(results.Results);
            formatBulletin(pageCount);
        }
    }
    $("#ancDoc").show();
    GetTeamNotices(scsHdlr, errHdlr, getUser().UserKey, teamId, actPages, 3);
    //$("#ancEditTeam").attr("href", "newteam.aspx?" + getTeam());
    $("#ancEditTeamNew").attr("href", "newteam.aspx?" + getTeam());
    $("#ancPoll").attr("href", "CreatePoll.aspx?" + getTeam());
    $("#ancAdmin").attr("href", "teammembers.aspx?" + getTeam());
    
    $("#ancViewAllDocuments").attr("href", "documentlist.aspx?teamid=" + getTeam());
}

formatBulletin = function (pageCount) {

    var showChar = 80;
    var showMoreChar = 400;
    var ellipsestext = "...";
    var moretext = "See More";
    var lesstext = "See Less";
    var i = 0;
    $('.number-university h2').each(function () {
        var content = $(this).html();
        if (pageCount == 0 && i == 0) {
            if (content.length > showMoreChar) {

                var c = content.substr(0, showMoreChar);
                var h = content.substr(showMoreChar - 1, content.length - showMoreChar);

                var html = c + '<span class="moreelipses">' + ellipsestext + '</span>&nbsp;<span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';

                $(this).html(html);
            }
        }
        else {
            if (content.length > showChar) {
                var c = content.substr(0, showChar);
                var h = content.substr(showChar - 1, content.length - showChar);

                var html = c + '<span class="moreelipses">' + ellipsestext + '</span>&nbsp;<span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';

                $(this).html(html);
            }
        }

        i = i = 1;

    });

    $(".morelink").click(function () {
        if ($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
}

displayNotices = function (data) {
    noticesModel.clear();
    for (var d in data) {
        if (d == 0) {
            noticesModel.pageText(data[d].PageText);
        }
        var model = ko.mapping.fromJS(data[d]);
        noticesModel.addAct(model);
    }
}


$(document).ready(function () {
   
    getTeamNotices(0);   

    $("#MainContentPlaceHolder_bulletinBoardControl_ddlCountry").change(function () {
        var c = $("#MainContentPlaceHolder_bulletinBoardControl_ddlCountry").val();
        if (c == "India") {
            $("#MainContentPlaceHolder_bulletinBoardControl_divcarrier").hide();
        }
        else {
            $("#MainContentPlaceHolder_bulletinBoardControl_divcarrier").show();
        }

    });
});

getNextPage = function () {
    getTeamNotices(_pageCount + 1);
}

getPrevPage = function () {
    if (_pageCount > 0)
        getTeamNotices(_pageCount - 1);
}

showBulletine = function (data) {
    msgId = "0";
    if (data != null)
        msgId = data.Id();


    var timestamp = new Date().getTime();
    $.colorbox({
        href: "Bulletin.aspx?msgid=" + msgId + "&teamId=" + teamId+"&ts="+timestamp+"", iframe: true, height: '400', width: "750"
        , onClosed: function () { getTeamNotices(0); }
    });
}

inviteToTeam = function () {
    $("#loading2").nimbleLoader("show", {
        hasBackground: true,
        backgroundColor: "#ffffff",
        backgroundOpacity: "0.7",
        height: "3%"
    });
    $(".loading_bar_1").css("height", "3%");
    var txt = $("#txtbxInvite").val();
    if (txt != '') {
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                $("#loading2").nimbleLoader("hide");
                $("#txtbxInvite").val('');
                alert('Invitations have been sent');
            }
        }

        InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, txt, getTeam(),"Invite Textbox");
    }
}


closeBulletinUpdate = function () {
    $.colorbox.close();
}