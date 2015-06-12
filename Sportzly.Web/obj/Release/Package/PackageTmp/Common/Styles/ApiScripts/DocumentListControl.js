$(document).ready(function () {
    var atags = $('.documents-listing .aTag');

    $(atags).each(function (index) {
        toggleAndChangeText(this);
    });
})

var userAlbumsViewModel = function () {
    var self = this;

    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.addDoc = function (doc) { self.Result.push(doc); }
    self.load = function () {

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                self.ResultCount = results.Results.length;
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.Result.push(model);
                }
                bindDocs();
            }
        }

        GetAllDocuments(scsHdlr, errHdlr, getUser().UserKey, getTeam());
    }

    self.load();
}

var userAlbumsModel = new userAlbumsViewModel();

bindDocs = function () {
    ko.applyBindings(userAlbumsModel, $('.membersList').get(0));
    applSearchFilter(".search-fans", ".freindsListUL1  >.doctitle1");
}

showDocument = function () {
    $.colorbox({
        href: "Document.aspx?teamid=" + teamId + "", iframe: true, height: '500', width: "780", scrolling: false
       , onClosed: function () { window.location = "documentlist.aspx?" + teamId + ""; }
    });
}

closeBulletinUpdate = function () {
    $.colorbox.close();
}