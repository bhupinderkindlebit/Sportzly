var eventViewModel = function () {
    var self = this;
    self.event = ko.observable();

    this.load = function () {
        var user = getUserEmail();
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.event = model;
                }
                //                self.Result = ko.mapping.fromJS(results);
                bindEvent();

            }
        }

        GetEvents(scsHdlr, errHdlr, getUser().UserKey, null, eventId);
    }
    this.load();
}

var eventModel = new eventViewModel();


bindEvent = function () {
    ko.applyBindings(eventModel.event, $('.eventEntity').get(0));
    ko.applyBindings(eventModel.event, $('.eventEntity1').get(0));
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

joinEvent = function (data, join) {

    var id = data.EventId();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            //if (join) {
            //    data.MemberCount(data.MemberCount() + 1);
            //}
            //else {
            //    data.MemberCount(data.MemberCount() - 1);
            //}
            //data.Joined(join);

            eventModel.load();
        }
    }
    JoinEvent(scsHdlr, errHdlr, userKey, id, join);
}

followEvent = function (data, follow) {

    var id = data.Id();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            if (follow) {
                data.FollowerCount(data.FollowerCount() + 1);
            }
            else {
                data.FollowerCount(data.FollowerCount() - 1);
            }
            data.Followed(follow);
        }
    }
    FollowEvent(scsHdlr, errHdlr, userKey, id, follow);
}