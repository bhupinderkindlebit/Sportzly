var j = 0;

var eventObjViewModelforth = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.addeventObj = function (eventObj) { self.Result.push(eventObj); }
    self.clear = function () { self.Result.removeAll(); }
    self.deleventObj = function (act) { self.Result.remove(act); }

    self.load = function () {

        self.clear();
        //var criteria = geteventObjQueryString();


        var user = getUserEmailOrMe();

        if (user.indexOf('id=') != -1) {
            user = user.replace("id=", "");
        }

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {

                if (getTeam() > 0) {
                    var count = results.Results[0].TeamCount;

                    if (count == "0") {
                        $("#ancCreateEvent1").css("display", "none");
                    }
                    else {
                        $("#ancCreateEvent1").css("display", "block");
                    }
                }
            }
        }
        GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, user);


        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                j = results.Results.length;
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.addeventObj(model);

                }

                bindeventObjListforth();
                if (j > 0) {
                    buildGallery();
                }
                ////                self.Result = ko.mapping.fromJS(results);
                //if (callback != null)
                //    callback();
            }

        }
        GetForthComingEvents(scsHdlr, errHdlr, getUser().UserKey, getTeam());
    }
    self.load();

}
var eventObjModelmm = new eventObjViewModelforth();

bindeventObjListforth = function () {

    ko.applyBindings(eventObjModelmm, $('#eventObjsList123').get(0));
}

var i = 0;
buildGallery = function () {

    //i = i + 1;
    //alert(i);
    //if (i == j) {


    $(".slider1").bxSlider({
        slideWidth: 185,
        minSlides: 3,
        maxSlides: 3,
        moveSlides: 3,
        slideMargin: 5,
        pager: false
    });

    //}
}

