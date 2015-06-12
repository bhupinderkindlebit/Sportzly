var userDetailsViewModel = function () {
    var self = this;
    self.Result = ko.observable();
    this.load = function () {
        var user = getUserEmailOrMe();

        if (user.indexOf('id=') != -1) {
            user = user.replace("id=", "");
        }

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                self.Result = ko.mapping.fromJS(results);
                bindUserDetails();
            }
        }
        GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, user);
    }


    this.load();
}

var userDetailsModel = new userDetailsViewModel();


bindUserDetails = function () {
    ko.applyBindings(userDetailsModel.Result, $('.top-infomation-profile').get(0));
}
