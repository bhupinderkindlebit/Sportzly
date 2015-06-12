var userDetailsViewModel = function () {
    var self = this;
    self.Result = ko.observable();
    this.load = function () {
        var user = getUserEmail();
      
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                self.Result = ko.mapping.fromJS(results);
                bindUserDetails();
                bindBasicDetails(self);
            }
        }
        GetUserDetail(scsHdlr, errHdlr, getUser().UserKey, user);
    }


    this.load();
}

friendshipAction = function (data, ele, accept) {

    var statusId = parseInt(data.Results()[0].FriendshipStatus());
    var toUserId = parseInt(data.Results()[0].Id());
     
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
            userDetailsModel.load();
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

setFriendshipStatus = function (data, ele) {
    var statusId = parseInt(data.Results()[0].FriendshipStatus());

    var status = getFriendshipStatus(statusId);
    if (statusId == 3)
        $(ele).next().show();
    if (status != "") $(ele).show();
    return status;
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

var userDetailsModel = new userDetailsViewModel();

var triggers;

bindUserDetails = function () {
    ko.applyBindings(userDetailsModel.Result, $('.left-infomation-profile').get(0));
}

isMyProfile = function () {
    var em = getUserEmail();
    return em === getUser().EmailId;
}


$(document).ready(function () {

   $("#editProfile").click(function () {
        location.href = "ProfileUpdate.aspx";
    });

});









