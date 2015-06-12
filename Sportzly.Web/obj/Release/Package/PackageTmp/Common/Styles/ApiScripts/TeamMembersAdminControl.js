var teamMembersViewModel = function () {

    var self = this;   

    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.userEmail = ko.observable();
    self.remove = function (act) { self.Result.remove(act); }

    self.load = function () {

        self.userEmail = getUserEmail();

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount(results.Results.length);
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.Result.push(model);
                }
                                
                bindTeamMembers();              
            }
        }
        GetTeamMembersApproved(scsHdlr, errHdlr, getUser().UserKey, teamId);       
    }

    self.load();
}

var teamMembersModel = new teamMembersViewModel();

bindTeamMembers = function () {
    ko.applyBindings(teamMembersModel, $('.membersList1').get(0));
    applSearchFilter(".search-fans", ".members >li");
}

ApprovedTeamAdminfn = function () {
    var id = "";
    var i = 0;
    $('.chklist').each(function () {
        if ($(this).is(':checked')) {
            id = id + $(this).attr('userid') + ",";
            i = i + 1;
        }
    });

    if (i > 4) {
        $('.successMsg').text('');
        $('.errorMsg1').text('You can make team admin to maximum 4 team members');
        return;
    }
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
              
        $('.successMsg').text(results.ResultError.Message);
        $('.errorMsg1').text('');
    }
    ApprovedTeamAdmin(scsHdlr, errHdlr, userKey, id, teamId);
}

$('#btnNeverMindAdmin').click(function () {
    window.parent.closeBulletinUpdate();
});
