getMutual = function () {
    var mutual = location.href.split('?')[1];
    if (mutual != undefined) {
        mutual = mutual.split("&")[1];
        if (mutual != undefined && mutual == "m")
            return true;
        else
            return false;
    }
    else
        return false;
}

var userFriendsViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.userEmail = ko.observable();

    self.load = function () {

        self.userEmail = getUserEmailOrMe();
        self.mutual = getMutual();

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount = results.Results.length;
                for (var d in results.Results) {

                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.Result.push(model);

                }

                bindUserFriends();
            }
        }
        GetUserFriends(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, self.mutual);
    }

    self.load();
}

var userFriendsModel = new userFriendsViewModel();


bindUserFriends = function () {
   
    ko.applyBindings(userFriendsModel, $('.friendList').get(0));

    applSearchFilter(".search-fans", ".freindsListUL>li");
}



getStatusText = function (statusId) {

    var status = "";
    switch (statusId) {
        case 0:
            break;
        case 1:
        case 5:
            status = "";
            break;
        case 2:
            status = "Request Sent"
            break;
        case 3:
            status = "Request Recieved";
            break;
        case 4:
            status = ""
            break;
        case 6:
            status = "Request declined"
            break;
    }
    return status;
}
