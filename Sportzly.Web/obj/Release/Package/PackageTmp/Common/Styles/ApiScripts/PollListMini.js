
var userPollViewModel = function () {
    var self = this;

    self.load = function () {
        self.Result = ko.observableArray();
        self.ResultCount = ko.observable();      

        scsHdlr = function (result) {
           
            var results = getJson(result);
            if (valid(results)) {
                self.ResultCount(results.Results.length);
                for (var d in results.Results) {
                    if (d < 10) {
                        var model = ko.mapping.fromJS(results.Results[d]);
                        self.Result.push(model);
                    }                    
                }               
                bindPolls();
            }
        }
        
        GetPolls(scsHdlr, errHdlr, getUser().UserKey, parseInt(getTeam()));
        
    }   

    self.load();
}

var userPollModel = new userPollViewModel();


bindPolls = function () {
    ko.applyBindings(userPollModel, $('.pendingPolls').get(0));
}

OpenPoll = function (data) {

    var pollid = data.PollId();
    var myPopup=$().speedoPopup({
        theme: "lightbox",
        effectIn: "slideRight",
        effectOut: "slideRight",
        width: 400,
        height: 400,
        href: 'polldetail.aspx?'+pollid
    });

    
}
