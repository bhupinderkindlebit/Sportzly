﻿var _pageCount = 0;

function noticesViewModel() {
    var self = this;
    self.pageText = ko.observable();
    self.notice = ko.observable();
    self.notices = ko.observableArray([]);
    self.addAct = function (act) { self.notices.push(act); }
    self.addActAt = function (act, idx) { self.notices.splice(idx, 0, act); }
    self.clear = function () {
        self.notices.removeAll();
    }
}

var noticesModel = new noticesViewModel();

bindResults = function () {    
    ko.applyBindings(noticesModel, $('.list-comment').get(0));

    if (noticesModel.notice() === undefined)
        $('.top-like-box').css("display", "none");
    else
        ko.applyBindings(noticesModel.notice, $('.top-like-box').get(0));
}

getTeamNotices = function (pageCount) {

    var user = getUserEmail();
    var teamId = getTeam();

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            _pageCount = pageCount;
            displayNotices(results.Results);
            bindResults();
        }
    }

    GetTeamNotices(scsHdlr, errHdlr, getUser().UserKey, teamId, msgId, 0, 200);
}

displayNotices = function (data) {
    noticesModel.clear();
    for (var d in data) {
        var model = ko.mapping.fromJS(data[d]);
        if (d == 0) {
            noticesModel.notice(data[d]);
        }
        else {
            noticesModel.addAct(model);
        }
    }
}

$(document).ready(function () {
    getTeamNotices(0);
    $("form").submit(function (e) {
        e.preventDefault();
        if (isEnabled) {
            isEnabled = false;
            postNoticeComment();
            $("ul").hide();
            $(".top-like-box>p").first().text("Saving team post...");
        }

    });

    $("#txtNotice").keyup(function () {
        var count = $(this).val().length;
        if (count > 140) {
            $("#spCount").css("color", "red");
        }
        else {
            $("#spCount").css("color", "#13680C");
        }
        $("#spCount").text($(this).val().length);
    });
    
});

var isEnabled = true;
postNoticeComment = function () {
    var text = $("#txtNotice").val();

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            isEnabled = true;
            //var model = ko.mapping.fromJS(results.Results[0]);
            //noticesModel.addAct(model);
            //$(".comment-input").val("");
            //$(".comment-input").focus();
            window.parent.closeBulletinUpdate();
        }
    }

    UpdateNotice(scsHdlr, errHdlr, getUser().UserKey, text, teamId, msgId);

    return false;
}

$('#btnNeverMindTextToTeam').click(function () {
    window.parent.closeBulletinUpdate();
});