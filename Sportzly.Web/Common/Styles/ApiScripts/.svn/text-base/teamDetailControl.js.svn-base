var teamViewModel = function () {
    var self = this;
    self.team = ko.observable();
    self.isMyTeam = ko.observable();
    self.isMyTeam(true);

    this.load = function () {
          var user = getUserEmail();
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.team = model;
                }
                self.isMyTeam(teamModel.team.IsTeamAdmin());
                //                self.Result = ko.mapping.fromJS(results);
                bindTeam();

                //if (teamModel.team.EmailId() == getUser().EmailId) {
                //    self.isMyTeam(teamModel.team.EmailId() == getUser().EmailId);
                //}
                //else {


                // }
                var link = "";
                scsHdlrN = function (result) {
                    var resultsn = getJson(result);
                    link = resultsn.Results[0].Token;
                    $("#imgTwitter").attr("href", "https://twitter.com/share?url=" + link + "&text=You have been invited by " + results.Results[0].TeamName + " to join his/her team on Sportzly.");

                }
                GetInviteTokenTwitter(scsHdlrN, errHdlr, getUser().UserKey, getTeam());
            }
        }

        GetTeams(scsHdlr, errHdlr, getUser().UserKey, null, teamId);
    }
    this.load();
}

var teamModel = new teamViewModel();


bindTeam = function () {
    ko.applyBindings(teamModel.team, $('.teamEntity').get(0));
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