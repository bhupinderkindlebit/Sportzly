var userPhotosViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.userEmail = ko.observable();
    self.load = function () {
        self.userEmail = getUserEmail();

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount = results.Results.length;
                for (var d in results.Results) {
                    if (d < 4) {
                        var model = ko.mapping.fromJS(results.Results[d]);
                        self.Result.push(model);
                    }
                    else
                        break;
                }

                bindUserPhotos();
            }
        }
        GetUserPhotosNew(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, getTeam());
    }

    self.load();
}

var userPhotosModel = new userPhotosViewModel();


bindUserPhotos = function () {
    ko.applyBindings(userPhotosModel, $('.userPhotos').get(0));
}

getQueryString = function () {
    return userEmail == null ? getTeam() : userEmail;
}
