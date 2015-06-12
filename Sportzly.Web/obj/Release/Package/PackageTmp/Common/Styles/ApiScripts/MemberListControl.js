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
        GetTeamMembers(scsHdlr, errHdlr, getUser().UserKey, teamId);
    }

    self.load();
}

var teamMembersModel = new teamMembersViewModel();


bindTeamMembers = function () {
    ko.applyBindings(teamMembersModel, $('.membersList').get(0));
    applSearchFilter(".search-fans", ".members >li");

}

approveMember = function (data, approve) {

    var id = data.Id();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            if (approve) {
                teamMembersModel.ResultCount(teamMembersModel.ResultCount() + 1);
            }
            else {
                teamMembersModel.ResultCount(teamMembersModel.ResultCount() - 1);
                teamMembersModel.remove(data);
            }
            data.IsApproved(approve);
        }
    }
    ApproveTeamMember(scsHdlr, errHdlr, userKey, id, teamId, approve);
}

ko.bindingHandlers.stopBindings = {
    init: function () {
        return { controlsDescendantBindings: true };
    }
};