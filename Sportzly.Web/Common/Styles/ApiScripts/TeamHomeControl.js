var teamViewModel1 = function () {
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
                console.log(results.Results.length);
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.addTeam(model);
                }
                //                self.Result = ko.mapping.fromJS(results);
                bindTeamList1();
               
            }
        }
        GetTeamsHome(scsHdlr, errHdlr);
    }
    //this.load();
}

var teamModel1 = new teamViewModel1();



bindTeamList1 = function () {
    ko.applyBindings(teamModel1, $('.featured-teams-container').get(0));
    ko.applyBindings(teamModel1, $('.featured-teams-container1').get(0));
}

showalert = function () {
    errorModel.addErr(new error("You need to register/login in order to see profile", "10101", "Error"));
    return;
}

teamModel1.load();