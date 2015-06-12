var pendingfriendObjViewModel = function () {
    var self = this;

    self.load = function () {
        self.Result = ko.observableArray();
        self.ResultCount = ko.observable();
        self.PendingResultCount = ko.observable();
        self.PendingResult = ko.observableArray();
        self.userEmail = ko.observable();
        self.ResultCount = 0;
        self.userEmail = getUserEmailOrMe();

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount = results.Results.length;
                self.PendingResultCount = results.Results.length;

                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.PendingResult.push(model);
                }

                bindPendingUserFriends();
            }
        }
        GetPendingUserFriends(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, false);
    }

    self.load();
}
var pendingfriendObjModel = new pendingfriendObjViewModel();

bindPendingUserFriends = function () {

    ko.applyBindings(pendingfriendObjModel, $('.userFriendsPending').get(0));
    if (pendingfriendObjModel.PendingResultCount > 0) {
        $('#MyUpdatesPendingResultCount').show();
        $('#MyUpdatesPendingResultCount').text(pendingfriendObjModel.PendingResultCount);
    } else {
        $('#MyUpdatesPendingResultCount').hide();
    }
}
respondRequest = function (data, response) {


    var statusId = parseInt(data.Status());
    var toUserId = parseInt(data.Id());

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            pendingfriendObjModel.PendingResultCount = pendingfriendObjModel.PendingResultCount - 1;

            if (pendingfriendObjModel.PendingResultCount > 0) {
                $('#MyUpdatesPendingResultCount').show();
                $('#MyUpdatesPendingResultCount').text(pendingfriendObjModel.PendingResultCount);
            } else {
                $('#MyUpdatesPendingResultCount').hide();
            }

            if (response == "true" || response == true) {
                var add = '<div class="info-video info-video3">';
                add = add + '<a href="profile.aspx?' + data.EmailId() + '" title="' + data.DisplayName() + '">';
                add = add + '<img src="' + data.ProfileFoto() + '" alt="' + data.DisplayName() + '" width="50" height="50" style="margin-left:0px;"></a></div>';
                $("#divFriends").append(add);
                $(".userFriends").show();
                var fcount = $("#spFriendCount").text();
                if (fcount != "") {
                    $("#spFriendCount").text(parseInt(fcount) + 1);
                }
            }
            pendingfriendObjModel.PendingResult.remove(data);
            //if (userFriendsModel) {

            //    userFriendsModel.refresh();
            //}

        }
    }

    RespondFriendshipRequest(scsHdlr, errHdlr, getUser().UserKey, toUserId, response);

}

