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
                var tb = "";
                if (results.Results.length == 0)
                {
                    tb = tb + "<span class='number-135' style='margin-left:23px;'>No Team Docs Found</span>";
                    $("#ancViewAllDocuments").hide();
                }

              
                for (var d in results.Results) {
                    var title = results.Results[d].title;
                    if (title.length > 20) {
                        title = title.substring(0, 20) + "...";
                    }

                    if(d % 2 == 0)
                        tb = tb + "<div class='doctitle detail-row' style='cursor:pointer;background-color:#f9f9f9;'><span class='spanTitle label' id='span" + results.Results[d].Id + "' tooltip='" + results.Results[d].title + "' onclick='showdoc(" + results.Results[d].Id + ")' >" + title + "</span> <span class='spanDate label-name'>" + results.Results[d].postdate + " </span></div>";
                    else
                        tb = tb + "<div class='doctitle detail-row' style='cursor:pointer;;background-color:#fff;'><span class='spanTitle label' id='span" + results.Results[d].Id + "' tooltip='" + results.Results[d].title + "' onclick='showdoc(" + results.Results[d].Id + ")' >" + title + "</span> <span class='spanDate label-name'>" + results.Results[d].postdate + " </span></div>";

                    tb = tb + "<div class='innerDiv' id='div" + results.Results[d].Id + "'><ul class='uldoc'>";
                    for (var f in results.Results[d].Files) {
                        tb = tb + "<li class='lidoc'><a href='filedownload.ashx?filename=" + results.Results[d].Files[f].filepath + "&name=" + results.Results[d].Files[f].filename + "'>" + results.Results[d].Files[f].filename + "</a> </li>";
                    }
                    tb = tb + "</ul></div>";
                }
                $(".docListUL").html(tb);
            }
        }

        GetDocuments(scsHdlr, errHdlr, getUser().UserKey,getTeam());
    }

    self.load();
}

var userAlbumsModel = new userAlbumsViewModel();
bindDocs = function () {
    ko.applyBindings(userAlbumsModel, $('.docListUL').get(0));

}