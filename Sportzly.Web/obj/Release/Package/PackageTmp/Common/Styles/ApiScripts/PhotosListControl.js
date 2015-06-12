var userPhotosViewModel = function () {
    var self = this;

    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.userEmail = ko.observable();
    self.albums = ko.observable();

    self.load = function () {

        self.userEmail = getUserEmail();

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount = results.Results.length;
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.Result.push(model);
                }
                self.albums = self.Result.distinct("AlbumName");
                bindUserPhotos();
            }
        }
        GetUserPhotos(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, getTeam());
    }

    self.load();
}

var userPhotosModel = new userPhotosViewModel();


bindUserPhotos = function () {
    ko.applyBindings(userPhotosModel, $('.photosList').get(0));

    applSearchFilter(".search-fans", ".phtosListUL>li");

}


