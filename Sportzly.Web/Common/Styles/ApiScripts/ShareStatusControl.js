
shareUpdate = function () {

    var txt = shareStatusModel.status();
    if (txt == "Whats up?") {
        txt = '';
    }
    if (txt != '') {
        txt = replaceTextWithHTMLLinks(txt);

        $("#loading1").nimbleLoader("show", {
            hasBackground: true,
            backgroundColor: "#ffffff",
            backgroundOpacity: "0.7",
            height: "35%"
        });
        $(".loading_bar_1").css("height", "35%");

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                var model = ko.mapping.fromJS(results.Results[0]);
                activitiesModel.addActAt(model, 0);
                $("#txtbxStatus").val("Whats up?");
                $("#txtbxStatus").focus();

                $("#loading1").nimbleLoader("hide");
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


imageUploadify = function () {
    $("#commentBox111").hide();
    $("#uploadImageBoxConatiner").show();
    $("#uploadVideoBoxContainer").hide();
    $("#uploadImageBoxConatinerInner").html('');
    $(".btnImageUpload").hide();

}

showAlbum = function (ele, aid, pid) {
    getAlbumPhotos(aid, pid);
}

moveImagesToAlbum = function () {
    var ids = $("#uploadImageBoxConatiner  #imageIds").val();
    var msg = replaceTextWithHTMLLinks($("#uploadImageBoxConatiner  #albumTextArea").val());
    var albName = $("#uploadImageBoxConatiner  #albumTextBox").val();
    var albId = $("#uploadImageBoxConatiner  #ddlAlbums").val();
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            var model = ko.mapping.fromJS(results.Results[0]);
            activitiesModel.addActAt(model, 0);
            cancelUpload();
        }
    }

    MoveImagesToAlbum(scsHdlr, errHdlr, getUser().UserKey, albName, ids, msg, getTeam(), albId);
}

documentUploadify = function () {
    $.colorbox({
        href: "Document.aspx?teamid=" + getTeam(), iframe: true, height: '400', width: "750"
        , onClosed: function () {
            window.location = "team.aspx?" + getTeam();
        }
    });
}

$(document).ready(function () {
    $("#uploadImageBoxConatiner").hide();
    $("#uploadVideoBoxContainer").hide();
    $("#uploadImageBoxFive").uploadifive({
        height: 30,
        'buttonClass': 'uploadlogo',
        'formData': { 'uid': getUser().UserKey, 'teamId': teamId },
        'uploadScript': 'uploadify/uploadify.aspx',
        width: 120,
        'fileType': 'image',
        'fileSizeLimit': '15MB',
        'uploadLimit': 50,
        'onUploadComplete': function (file, data) {
            if (data.indexOf("Failed") == 0) {
                alert(data);
                return;
            }
            var results = getJson(data);
            if (valid(results)) {
                var previewPanel = $("#uploadImageBoxConatinerInner  #uploadImagePreView");
                if (previewPanel.get(0) == undefined) {
                    $("#uploadImageBoxConatinerInner").append("<div id='imagePreViewContainer'><div id='uploadImagePreView' style=' width:600px; overflow:scroll'></div><div>Album Name <input style='width:500px' type='text' id='albumTextBox'><br/> Add to Existing Album <select id='ddlAlbums' /><br>Description <textarea  style='width:500px'  id='albumTextArea'/><input type='hidden' value=''  id=imageIds></div></div>");
                    scsHdlr = function (result) {
                        var results = getJson(result);
                        if (valid(results)) {
                            self.ResultCount = results.Results.length;
                            var ddlAlbums = $('#ddlAlbums');
                            for (var d in results.Results) {
                                ddlAlbums.append(
                                $('<option/>', {
                                    value: results.Results[d].Id,
                                    text: results.Results[d].Name
                                }));
                            }
                        }
                    }

                    GetAlbumsByUser(scsHdlr, errHdlr, getUser().UserKey);
                    $(".btnImageUpload").show();
                    //$("#uploadImageBoxConatiner").append("<input type='button' value='Save' onClick='moveImagesToAlbum()'>");
                }
                if (!isNaN(results.Results[0].Id)) {
                    var previewPanel = $("#uploadImageBoxConatinerInner  #uploadImagePreView");
                    previewPanel.append("<img src='" + results.Results[0].FilePath + "' height=100 width=100></img>");
                    $("#uploadImageBoxConatinerInner  #imageIds").val($("#uploadImageBoxConatinerInner  #imageIds").val() + "|" + results.Results[0].Id);
                }
            }
        },
        'onFallback': function () {
            $("#uploadImageBoxFive").hide();
            $("#uploadImageBox").show();

            $("#uploadImageBox").uploadify({
                height: 30,
                'fileSizeLimit': '15MB',
                'fileTypeDesc': 'Image Files',
                'fileTypeExts': '*.gif; *.jpg; *.png; *.jpeg;',
                swf: 'uploadify/uploadify.swf',
                'formData': { 'uid': getUser().UserKey },
                uploader: 'uploadify/uploadify.aspx',
                width: 120,
                'onUploadSuccess': function (file, data, response) {
                    if (data.indexOf("Failed") == 0) {
                        alert(data);
                        return;
                    }
                    var results = getJson(data);
                    if (valid(results)) {
                        var previewPanel = $("#uploadImageBoxConatinerInner  #uploadImagePreView");
                        if (previewPanel.get(0) == undefined) {
                            $("#uploadImageBoxConatinerInner").append("<div id='imagePreViewContainer'><div id='uploadImagePreView' style=' width:600px; overflow:scroll'></div><div>Album Name <input style='width:500px' type='text' id='albumTextBox'><br/> Add to Existing Album <select id='ddlAlbums' /><br>Description <textarea  style='width:500px'  id='albumTextArea'/><input type='hidden' value=''  id=imageIds></div></div>");
                            scsHdlr = function (result) {
                                var results = getJson(result);
                                if (valid(results)) {
                                    self.ResultCount = results.Results.length;
                                    var ddlAlbums = $('#ddlAlbums');
                                    for (var d in results.Results) {
                                        ddlAlbums.append(
                                        $('<option/>', {
                                            value: results.Results[d].Id,
                                            text: results.Results[d].Name
                                        }));
                                    }
                                }
                            }

                            GetAlbumsByUser(scsHdlr, errHdlr, getUser().UserKey);
                            $(".btnImageUpload").show();
                            // $("#uploadImageBoxConatiner").append("<input type='button' value='Save' onClick='moveImagesToAlbum()'>");
                        }
                        if (!isNaN(results.Results[0].Id)) {
                            var previewPanel = $("#uploadImageBoxConatinerInner  #uploadImagePreView");
                            previewPanel.append("<img src='" + results.Results[0].FilePath + "' height=100 width=100></img>");
                            $("#uploadImageBoxConatinerInner  #imageIds").val($("#uploadImageBoxConatinerInner  #imageIds").val() + "|" + results.Results[0].Id);
                        }
                    }
                }
            });
        }

    });
});

cancelUpload = function () {
    $("#commentBox111").show();
    $("#uploadImageBoxConatiner").hide();
    $("#uploadVideoBoxContainer").hide();
    //$("#uploadImageBoxConatiner  #imageIds").val('');
}


$("#txtbxInvite").keypress(function (event) {
    if (event.which == 13) {
        event.preventDefault();
        $("#btnInvite").focus();
        InviteFriends();
    }
});



