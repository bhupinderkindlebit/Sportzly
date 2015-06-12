


var userDetailsViewModel = function () {
    var self = this;
    self.Result = ko.observable();
    this.load = function () {
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                self.Result = ko.mapping.fromJS(results.Results[0]);
                var count = results.Results[0].TeamCount;
                if (count == "0") {
                    $("#ancCreateEvent").css("display", "none");
                }
                else {
                    $("#ancCreateEvent").css("display", "inline-block");
                }
                bindUserDetails();
            }
        }
        GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, getUser().EmailId);
    }

    this.load();
}

var userDetailsModel = new userDetailsViewModel();

bindUserDetails = function () {
    ko.applyBindings(userDetailsModel.Result, $('.leftPanelUserDetails').get(0));
    ko.applyBindings(userDetailsModel.Result, $('.profile-pic').get(0));
}

inviteFriends = function () {
    $("#loading3").nimbleLoader("show", {
        hasBackground: true,
        backgroundColor: "#ffffff",
        backgroundOpacity: "0.7",
        height: "86%"
    });
    $(".loading_bar_1").css("height", "86%");
    var txt = $("#txtbxInvite").val();
    if (txt != '' && txt != 'Enter mutliple e-mail addresses separated by comma or semi colon') {
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
                $("#txtbxInvite").val('');
                $("#loading3").nimbleLoader("hide");
                alert('Invitations have been sent');                
            }
        }

        InviteFriends(scsHdlr, errHdlr, getUser().UserKey, txt,"Invite Textbox");
    }
}