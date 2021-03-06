﻿var eventObjViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.addeventObj = function (eventObj) { self.Result.push(eventObj); }
    self.clear = function () { self.Result.removeAll(); }
    self.deleventObj = function (act) { self.Result.remove(act); }
    self.dateResult = ko.observable();

    this.load = function (callback) {

        self.clear();
        //var criteria = geteventObjQueryString();


        var user = getUserEmailOrMe();

        if (user.indexOf('id=') != -1) {
            user = user.replace("id=", "");
        }

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                var count = results.Results[0].TeamCount;

                if (count == "0") {
                    $("#ancCreateEvent").css("visibility", "hidden");
                }
                else {
                    $("#ancCreateEvent").css("visibility", "visible");
                }
            }
        }
        GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, user);

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.addeventObj(model);
                }
                //                self.Result = ko.mapping.fromJS(results);

                self.dateResult = self.Result.distinct("StartDate");

                if (callback != null)
                    callback();

            }
        }
        var id = GetQueryStringByParam("scorecard");
      
        if (id == null || id=="") {
            GetEventDistinctDates(scsHdlr, errHdlr, getUser().UserKey, emId, $(".dateTo").val(), $(".eventType").val());
        }
        else {
            GetUserEventsByDateGame(scsHdlr, errHdlr, getUser().UserKey, emId, $(".dateTo").val(), $(".eventType").val());
        }

    }
    this.load(bindeventObjList);

}

bindeventObjList = function () {
    var ele = $('.eventObjsList').get(0);
    //ko.cleanNode(ele);
    ko.applyBindings(eventObjModel, ele);

    if (emId != "") {
        $("#spTitle").text("My Events");
    }
    else {
        $("#spTitle").text("Fixtures");
    }
    var id = GetQueryStringByParam("scorecard");
    if (id != null && id != "") {
        $("#spTitle").text("Scorecards");
    }    
}

var eventObjModel = new eventObjViewModel();

loadEvents = function () {
    eventObjModel.load(null);// = new eventObjViewModel();
}

joinEvent = function (data, response) {

    var id = data.EventId();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            eventObjModel.load();
        }
    }
    JoinEvent(scsHdlr, errHdlr, userKey, id, response);

}

saveresult = function (data) {

    var id = data.EventId();
    var userKey = getUser().UserKey;
    var result = $("#txtResult" + id).val();
    var sp = $("#sp" + id);

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            $(sp).text("Result save successfully");
            $(sp).show();
            setTimeout(function () {
                $(sp).fadeOut();
            }, 3000);
        }
    }
    SaveGameResult(scsHdlr, errHdlr, userKey, id, result, "", "");
}
savescorecard = function (data) {

    var id = data.EventId();
    var userKey = getUser().UserKey;
    var resultUrl = $("#txtUrl" + id).val();
    var sp = $("#sps" + id);
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            $(sp).text("Scorecard save successfully");
            $(sp).show();
            setTimeout(function () {
                $(sp).fadeOut();
            }, 3000);
        }
    }
    SaveGameResult(scsHdlr, errHdlr, userKey, id, "", resultUrl, "");
}

uploadscorecard = function (data) {
    var id = data.EventId();
    var timestamp = new Date().getTime();
    $.colorbox({
        href: "UploadScore.aspx?gameid=" + id + "&ts=" + timestamp + "", iframe: true, height: '200', width: "750"
       , onClosed: function () {
           window.location = "events.aspx";
       }
    });
}

DeleteEvent = function (data) {
    var id = data.EventId();
    var r = confirm("Are you sure want to cancelled the event?");
    if (r) {
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                alert('Event has been cancelled and memebers are notified by email.');
                window.location.href = "events.aspx";
            }
        }

        CancelEvent(scsHdlr, errHdlr, getUser().UserKey, id);
    }
    else {
        return false;
    }
}

function GetQueryStringByParam(param) {

    param = param.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + param + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
//loadEvents();


showEvent = function () {
    $.colorbox({
        href: "CreateEvent.aspx", iframe: true, height: '650', width: "750", scrolling: false
        , onClosed: function () { window.location = "events.aspx?" + teamId + ""; }
    });
}

editEvent = function (data) {
    var id = data.EventId();
    $.colorbox({
        href: "createevent.aspx?id=" + id + "", iframe: true, height: '650', width: "750", scrolling: false
        , onClosed: function () { window.location = "events.aspx?" + teamId + ""; }
    });
}

closeBulletinUpdate = function () {
    $.colorbox.close();
}

$("#lnkListCalender").attr("href", "Listcalendar.aspx?" + teamId);

$("#lnkFixtures").attr("href", "events.aspx?" + teamId);
