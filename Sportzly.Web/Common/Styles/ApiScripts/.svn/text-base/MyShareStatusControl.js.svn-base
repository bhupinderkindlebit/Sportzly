
shareUpdate = function () {
   
    var txt = shareStatusModel.status();
    if (txt == "Whats up?") {
        txt = '';
    }
    if (txt != '') {
        txt = replaceTextWithHTMLLinks(txt);
      
        var params = {
            loaderClass: "loading_bar",
            debug: true,
            speed: 'fast',
            hasBackground: false,
            zIndex: 99
        };
        
        $.fn.nimbleLoader.setSettings(params);

        $("#loading2").nimbleLoader("show", {
            hasBackground: true,
            backgroundColor: "#ffffff",
            backgroundOpacity: "0.7"            
        });        

        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
              
                var model = ko.mapping.fromJS(results.Results[0]);
                activitiesModel.addActAt(model, 0);
                $("#txtbxStatus").val("Whats up?");
                $("#txtbxStatus").focus();
              
                $("#loading2").nimbleLoader("hide");
            }
        }

        ShareUpdate(scsHdlr, errHdlr, getUser().UserKey, txt, getTeam(), getEvent());
    }
}

$("#txtbxStatus").keypress(function (event) {
    if (event.which == 13) {
        event.preventDefault();
        $("#btnUpdateStatus").focus();
        shareUpdate();
    }
});

var shareStatusViewModel = function () {
    var self = this;
    self.Id = 1;
    self.status = ko.observable("Whats up?");
}
var shareStatusModel = new shareStatusViewModel();
ko.applyBindings(shareStatusModel, $("#commentBox111").get(0));

showAlbum = function (ele, aid, pid) {
    getAlbumPhotos(aid, pid);
}

$(document).ready(function () {
    $("#uploadVideoBoxContainer").hide();  
});

cancelUpload = function () {
    $("#commentBox111").show();   
    $("#uploadVideoBoxContainer").hide();
}


$("#txtbxInvite").keypress(function (event) {
    if (event.which == 13) {
        event.preventDefault();
        $("#btnInvite").focus();
        InviteFriends();
    }
});


showPhoto1 = function () {
    $.colorbox({
        href: "Photo.aspx?" + teamId + "", iframe: true, height: '500', width: "780", scrolling: false
        , onClosed: function () { window.location = "team.aspx?" + teamId + ""; }
    });
}

showVideo1 = function () {
    $.colorbox({
        href: "YouTubeUpload.aspx?teamid=" + teamId + "", iframe: true, height: '300', width: "800", scrolling: false
    });
}
