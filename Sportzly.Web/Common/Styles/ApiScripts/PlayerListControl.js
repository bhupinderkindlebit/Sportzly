var teamViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.addTeam = function (team) { self.Result.push(team); }
    self.clear = function () { self.Result.removeAll(); }
    self.delTeam = function (act) { self.Result.remove(act); }
    this.load = function () {
        var user = getUserEmail();
        var criteria = getTeamQueryString();
        bindTeamList();
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.addTeam(model);
                }
                //                self.Result = ko.mapping.fromJS(results);
                
            }
        }
        GetPlayers(scsHdlr, errHdlr, getUser().UserKey);
    }
    //this.load();
}

var teamModel = new teamViewModel();



bindTeamList = function () {
    ko.applyBindings(teamModel, $('.teamsList').get(0));
}

joinTeam = function (data, join) {

    var id = data.Id();
    var userKey = getUser().UserKey;
    

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            if (join) {
                data.MemberCount(data.MemberCount() + 1);
            }
            else {
                data.MemberCount(data.MemberCount() - 1);
            }
            data.Joined(join);
        }
    }
    JoinTeam(scsHdlr, errHdlr, userKey, id, join);
}

followTeam = function (data, follow) {

    var id = data.Id();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            if (follow) {
                data.FollowerCount(data.FollowerCount() + 1);
            }
            else {
                data.FollowerCount(data.FollowerCount() - 1);
            }
            data.Followed(follow);
        }
    }
    FollowTeam(scsHdlr, errHdlr, userKey, id, follow);
}

deleteTeam = function (data) {

    var id = data.Id();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            teamModel.delTeam(data);
        }
    }

    if(confirm("Are you sure you want to delete this team"))
        DeleteTeam(scsHdlr, errHdlr, userKey, id);
}
setFriendshipStatus = function (data, ele) {
   
    var statusId = parseInt(data);

    var status = getFriendshipStatus(statusId);
    if (statusId == 3)
        $(ele).next().show();
    if (status != "") $(ele).show();
    return status;
}
friendshipAction = function (data, ele, accept,Id) {

    var statusId = parseInt(data);
    var toUserId = parseInt(Id);
     
    switch (statusId) {
        case 0:
            break;
        case 1:
        case 5:
        case 6:
            sendFriendshipRequest(ele, toUserId);
            break;
        case 2:
            cancelFriendshipRequest(ele, toUserId);
            break;
        case 3:
            respondFriendshipRequest(ele, toUserId, accept);
            break;
        case 4:
            endFriendship(ele, toUserId);
    }
}
sendFriendshipRequest = function (ele, toUserId) {
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            $(ele).hide();
        }
    }
    SendFriendshipRequest(scsHdlr, errHdlr, getUser().UserKey, toUserId);
}

cancelFriendshipRequest = function (ele, toUserId) {
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            userDetailsModel.load();
        }
    }
    CancelFriendshipRequest(scsHdlr, errHdlr, getUser().UserKey, toUserId);
}
respondFriendshipRequest = function (ele, toUserId, accept) {
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            userDetailsModel.load();
            $(".decline").hide();
        }
    }
    RespondFriendshipRequest(scsHdlr, errHdlr, getUser().UserKey, toUserId, accept);
}
endFriendship = function (ele, toUserId) {
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            userDetailsModel.load();
        }
    }
    EndFriendship(scsHdlr, errHdlr, getUser().UserKey, toUserId);

}
getFriendshipStatus = function (statusId) {

    var status = "";
    switch (statusId) {
        case 0:
            break;
        case 1:
        case 5:
            // status = "Request Friendship";
            status = "images/connect.png";
            break;
        case 2:
            status = "images/cancelrequest.png";
            // status = "Friendship Request Pending. Cancel request?"
            break;
        case 3:
            status = "images/accept.png";
            // status = "Accept friendship Request";
            break;
        case 4:
            status = "images/end.png";
            // status = "Already Friend. End Friendship?"
            break;
        case 6:
            status = "images/connt_again.png";
            //status = "Request declined. Request again?"
            break;
    }
    return status;
}

teamModel.load();