﻿var teamViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.addTeam = function (team) { self.Result.push(team); }
    self.clear = function () { self.Result.removeAll(); }
    self.delTeam = function (act) { self.Result.remove(act); }
    this.load = function () {
        var user = getUserEmail();
        var criteria = getTeamQueryString();
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.addTeam(model);
                }
                //                self.Result = ko.mapping.fromJS(results);
                bindTeamList();
            }
        }
        GetTeams(scsHdlr, errHdlr, getUser().UserKey, user, criteria);
    }
    //this.load();
}

var teamModel = new teamViewModel();



bindTeamList = function () {
    ko.applyBindings(teamModel, $('.teamsList').get(0));
}

CheckTeam = function (data) {

    var id = data.Id();
    var userKey = getUser().UserKey;


    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            window.location.href = 'team.aspx?' + id + '';
        }
    }
    CheckTeamMember(scsHdlr, errHdlr, userKey, id);
}

joinTeam = function (data, join) {

    var id = data.Id();
    var userKey = getUser().UserKey;
    

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            if (join) {
                data.MemberCount(data.MemberCount() + 1);
            }
            else {
                data.MemberCount(data.MemberCount() - 1);
            }
            data.Joined(join);
        }
    }
    JoinTeam(scsHdlr, errHdlr, userKey, id, join);
}

followTeam = function (data, follow) {

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
    FollowTeam(scsHdlr, errHdlr, userKey, id, follow);
}

deleteTeam = function (data) {

    var id = data.Id();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            teamModel.delTeam(data);
        }
    }

    if(confirm("Are you sure you want to delete this team"))
        DeleteTeam(scsHdlr, errHdlr, userKey, id);
}

teamModel.load();