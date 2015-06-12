var teamViewModel = function () {
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
        GetPlayersHome(scsHdlr, errHdlr);
    }
    //this.load();
}

var teamModel = new teamViewModel();



bindTeamList = function () {
    ko.applyBindings(teamModel, $('.featured-members-container').get(0));
    ko.applyBindings(teamModel, $('.featured-members-container1').get(0));
}


teamModel.load();