
var userFriendsViewModel = function () {
    var self = this;

    self.load = function () {
        self.Result = ko.observableArray();
        self.ResultCount = ko.observable();
        self.PendingResultCount = ko.observable();
        self.PendingResult = ko.observableArray();
        self.userEmail = ko.observable();
        self.ResultCount = 0;
        self.userEmail = getUserEmailOrMe();

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {



                var approved = $.grep(results.Results, function (v) { return v.Status == 4; });
                var pending = $.grep(results.Results, function (v) { return v.Status == 3; });


                self.ResultCount = approved.length;
                self.PendingResultCount = pending.length;

                for (var d in approved) {

                    if (d < 50) {
                        var model = ko.mapping.fromJS(approved[d]);
                        self.Result.push(model);
                    }
                    else
                        break;
                }

                //for (var d in pending) {
                //    var model = ko.mapping.fromJS(pending[d]);
                //    self.PendingResult.push(model);
                //}

                bindUserFriends();
            }
        }
        GetUserFriends(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, false);
    }

    self.refresh = function () {
        self.Result = ko.observableArray();
        self.ResultCount = ko.observable();
        self.PendingResultCount = ko.observable();
        self.PendingResult = ko.observableArray();
        self.userEmail = ko.observable();
        self.ResultCount = 0;
        self.userEmail = getUserEmailOrMe();

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {



                var approved = $.grep(results.Results, function (v) { return v.Status == 4; });
                var pending = $.grep(results.Results, function (v) { return v.Status == 3; });


                self.ResultCount = approved.length;
                self.PendingResultCount = pending.length;

                for (var d in approved) {

                    if (d < 21) {
                        var model = ko.mapping.fromJS(approved[d]);
                        self.Result.push(model);
                    }
                    else
                        break;
                }

               
            }
            var element = $('.userFriends')[0];
            ko.cleanNode(element);
            //ko.applyBindings(userFriendsModel, $('.userFriends').get(0));
        }
        GetUserFriends(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, false);
    }

    self.load();
}

var userFriendsModel = new userFriendsViewModel();


bindUserFriends = function () {

    //var el = $('.userFriends').get(0);
   
    //var el1 = $('.userFriends');
   
    //ko.cleanNode(el1);
    ko.applyBindings(userFriendsModel, $('.userFriends').get(0));
    //ko.applyBindings(userFriendsModel, $('.userFriendsPending').get(0));
    //if (userFriendsModel.PendingResultCount > 0) {        
    //    $('#MyUpdatesPendingResultCount').show();
    //    $('#MyUpdatesPendingResultCount').text(userFriendsModel.PendingResultCount);        
    //} else {
    //    $('#MyUpdatesPendingResultCount').hide();
    //}
}
