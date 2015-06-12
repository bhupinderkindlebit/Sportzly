
var userInviteViewModel = function () {
    var self = this;

    self.load = function () {
        self.Result = ko.observableArray();
        self.ResultCount = ko.observable();

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {              
                self.ResultCount(results.Results.length);
                for (var d in results.Results) {

                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.Result.push(model);

                }
                bindInvites();
            }
        }
        GetPendingInvitesTeam(scsHdlr, errHdlr, getUser().UserKey, teamId);
        $("#anCancel").attr('href', "team.aspx?" + teamId + "");
    }

    self.load();
}

var userInviteModel = new userInviteViewModel();


bindInvites = function () {
    ko.applyBindings(userInviteModel, $('.membersList').get(0));
    applSearchFilter(".search-fans", ".freindsListUL    >li");
}

sendInvite = function () {

    var email = "";
    var i = 0;
    $('.ch').each(function () {
        if ($(this).is(':checked')) {
            email = email + $(this).attr('userid') + ";";
            i = i + 1;
        }
    });
    if (i == 0) {
        errorModel.addErr(new error("Please select atleast 1 email address", "1010", "Error"));
        return;
    }
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            alert('Invitations have been sent');
        }
    }

    InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, email, teamId);

}

checkall = function () {
    $(".ch").each(function () {
        $(this).prop("checked", true);
    });
}

uncheckall = function () {
    $(".ch").each(function () {
        $(this).prop("checked", false);
    });
}

