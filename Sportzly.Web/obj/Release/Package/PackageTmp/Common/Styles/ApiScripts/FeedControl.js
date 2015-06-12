var feedViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();

    this.load = function () {
        var user = getUserEmail();

        if (teamId > 0) {
            scsHdlr = function (result) {
                var results = getJson(result);
                var sportId = "";
                if (valid(results)) {
                    for (var d in results.Results) {
                        sportId = results.Results[d].SportsId;
                    }
                    if (sportId != "" && (sportId == "2" || sportId=="3")) {
                        scsHdlr = function (result) {
                            var results = getJson(result);
                            if (valid(results)) {
                                for (var d in results.Results) {
                                    var model = ko.mapping.fromJS(results.Results[d]);
                                    self.Result.push(model);
                                }
                                bindFeeds();
                                $('#newsslider2').accessNews({
                                    speed: "slow",
                                    slideBy: 4,
                                    slideShowInterval: 100000,
                                    slideShowDelay: 100000
                                });
                            }
                        }
                        GetFeedData(scsHdlr, errHdlr, getUser().UserKey, parseInt(sportId));
                    }
                }
               
               
            }
            GetTeams(scsHdlr, errHdlr, getUser().UserKey, null, teamId);
        }
        else {
            var user = getUserEmail();
            var sportId = "";
            scsHdlr = function (result) {
                var results = getJson(result);
                if (valid(results)) {
                    for (var d in results.Results) {                        
                        sportId = results.Results[d].FavSports.Key;
                        
                    }
                    if (sportId != "" && (sportId == "2" || sportId == "3")) {
                        scsHdlr = function (result) {
                            var results = getJson(result);
                            if (valid(results)) {
                                for (var d in results.Results) {
                                    var model = ko.mapping.fromJS(results.Results[d]);
                                    self.Result.push(model);
                                }
                                bindFeeds();
                                $('#newsslider2').accessNews({
                                    speed: "slow",
                                    slideBy: 4,
                                    slideShowInterval: 100000,
                                    slideShowDelay: 100000
                                });
                            }
                        }
                       
                        GetFeedData(scsHdlr, errHdlr, getUser().UserKey, parseInt(sportId));
                    }
                }
            }
        
           
            
            GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, getUser().EmailId);
        }
    }
    this.load();
}

var feedModel = new feedViewModel();


bindFeeds = function () {
    ko.applyBindings(feedModel, $('.feedEntity').get(0));
}