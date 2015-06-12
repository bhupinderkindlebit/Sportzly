
applSearchFilter(".teamSearch", ".list-communities");

searchTeams = function () {

    var keyWord = $("#searchTeamsText").val();
    var sports = $(".ddlSports").val();
    var level = $(".ddlLevel").val();
    var location = $(".ddlLocation").val();

    var user = getUserEmail();
    scsHdlr = function (result) {
        
        var results = getJson(result);
        if (valid(results)) {

            teamModel.clear();
            for (var d in results.Results) {
                var model = ko.mapping.fromJS(results.Results[d]);
                teamModel.addTeam(model);
            }
            //                self.Result = ko.mapping.fromJS(results);
            

        }
    }

    SearchTeams(scsHdlr, errHdlr, getUser().UserKey, user, keyWord, sports, level, location);
    return false;
}

$('#searchTeamsText').keypress(function (event) {
    if (event.keyCode == 13) {
        return searchTeams();
    }
});

$(document).ready(function () {
    if (getUserEmail() != null) {
        $('#teamFilterPanel').hide();
        $('.find-teams').height(52);        
    }
    else {
        $('#teamFilterPanel').show();
    }
});