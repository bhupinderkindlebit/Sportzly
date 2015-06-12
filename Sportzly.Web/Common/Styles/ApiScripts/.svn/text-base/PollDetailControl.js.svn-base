var pollViewModel = function () {
    var self = this;
    self.event = ko.observable();

    this.load = function () {
        var user = getUserEmail();
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.event = model;
                }
                //                self.Result = ko.mapping.fromJS(results);
                bindPoll();

            }
        }

        GetPollData(scsHdlr, errHdlr, getUser().UserKey, pollId);
    }
    this.load();
}

var pollModel = new pollViewModel();


bindPoll = function () {
    ko.applyBindings(pollModel.event, $('.pollEntity').get(0));
}

SaveChoice = function (data) {

    var Pollid = data.PollId();

    var userKey = getUser().UserKey;
    var optionId = $('input[type="radio"]:checked').val();
    if (optionId == "") { return false; }
    scsHdlr = function (result) {
        var results = getJson(result);
        alert("Thank you. Your vote save successfully.");
    }

    SaveOption(scsHdlr, errHdlr, userKey, Pollid, parseInt(optionId));

}

PollResult = function () {
    $(".divPoll").show();
}


EditPoll = function (data) {
    var Pollid = data.PollId();
   
    $(".speedo-ui-close").get(0).click();
    //setTimeout(function () { window.location.href = "CreatePoll.aspx?" + Pollid; }, 2000);
   
}
