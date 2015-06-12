
var TeamRequestModel = function () {

    var self = this;
    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.PendingResultCount = ko.observable();
    self.PendingResult = ko.observableArray();
    self.userEmail = ko.observable();

    self.load = function () {
        self.ResultCount( 0);
        self.userEmail = getUserEmailOrMe();

        scsHdlr = function (result) {
//            alert(result);
            var results = getJson(result);
            if (valid(results)) {

                var approved = $.grep(results.Results, function (v) { return v.IsApproved; });
                var pending = $.grep(results.Results, function (v) { return !v.IsApproved; });

                self.ResultCount(approved.length);
                self.PendingResultCount (pending.length);

                for (var d in approved) {
                    if (d < 4) {
                        var model = ko.mapping.fromJS(approved[d]);
                        self.Result.push(model);
                    }
                    else
                        break;
                }

                for (var d in pending) {
                    var model = ko.mapping.fromJS(pending[d]);
                    self.PendingResult.push(model);
                }

                bindTeamRequests();
            }
        }
        GetTeamMembers(scsHdlr, errHdlr, getUser().UserKey, self.userEmail);
    }

    self.load();

}

var teamRequestModel = new TeamRequestModel();

var bindTeamRequests = function () {
    ko.applyBindings(teamRequestModel, $('.teamRequests').get(0));
    if (teamRequestModel.PendingResultCount() > 0) {
        $('#MyUpdatesTeamPendingResultCount').show();
        $('#MyUpdatesTeamPendingResultCount').text(teamRequestModel.PendingResultCount());
    } else {
        $('#MyUpdatesTeamPendingResultCount').hide();
    }
}
    

approveMember = function (data, approve) {

    var id = data.Id();
    var userKey = getUser().UserKey;
    var teamId = data.TeamId();

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            
            //if (approve) {
            //    teamRequestModel.ResultCount(teamRequestModel.ResultCount() + 1);
            //}
            //else {
            //    teamRequestModel.ResultCount(teamRequestModel.ResultCount() - 1);
            //    teamRequestModel.Result.remove(data);
            //}
            //data.IsApproved(approve);           
           
            teamRequestModel.PendingResult.remove(data);
            var tcount = $('#MyUpdatesTeamPendingResultCount').text();
            tcount = tcount - 1;
            if (tcount > 0) {
                $('#MyUpdatesTeamPendingResultCount').show();
                $('#MyUpdatesTeamPendingResultCount').text(tcount);
            } else {
                $('#MyUpdatesTeamPendingResultCount').hide();
            }
            //if (teamRequestModel)
            //    teamRequestModel.load();
        }
    }
    ApproveTeamMember(scsHdlr, errHdlr, userKey, id, teamId, approve);
}

ko.bindingHandlers.stopBindings = {
    init: function () {
        return { controlsDescendantBindings: true };
    }
};