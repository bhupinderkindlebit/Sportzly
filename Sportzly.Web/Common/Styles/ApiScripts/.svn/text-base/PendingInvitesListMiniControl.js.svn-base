
var userInviteViewModel = function () {
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
                bindInvites();
            }
        }
        GetPendingInvitesUser(scsHdlr, errHdlr, getUser().UserKey);
    }   

    self.load();
}

var userInviteModel = new userInviteViewModel();


bindInvites = function () {
    ko.applyBindings(userInviteModel, $('.pendingInvites').get(0));
  
}

sendInvite = function (data) {

    var email = data.Email(); 
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {               
                alert('Invitation have been sent');
            }
        }

        ReInviteFriends(scsHdlr, errHdlr, getUser().UserKey, email);
    
}
