﻿$('#btnImageUpload').click(function () {
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
    window.parent.closeBulletinUpdate();
});

$(document).ready(function () {
    $("#uploadImageBoxConatiner").show();
    $("#uploadImageBoxConatinerInner").html('');
    $(".btnImageUpload").hide();
    $("#uploadImageBoxFive").uploadifive({
        height: 30,
        'buttonClass': 'btn btn-primary blue fontphoto uploadlogo',
        'formData': { 'uid': getUser().UserKey, 'teamId': teamId },
        'uploadScript': 'uploadify/uploadify.aspx',
        width: 120,
        'fileType': 'image',
        'fileSizeLimit': '15MB',
        'uploadLimit': 50,
        'onUploadComplete': function (file, data) {
            if (data.indexOf("Failed") == 0) {               
                return;
            }
            var results = getJson(data);
            if (valid(results)) {
                var previewPanel = $("#uploadImageBoxConatinerInner  #uploadImagePreView");
                if (previewPanel.get(0) == undefined) {
                    $("#uploadImageBoxConatinerInner").append("<div id='imagePreViewContainer'><ul><li><div class='left-lable spl904 md800'><label class='lable'>Album Name</label></div><div class='right-lable spl905 md801'><input type='text' class='input' id='albumTextBox'></div></li><li><div class='spl901'><div class='left-lable md800'><label class='lable'>Add to Existing Album</label></div><div class='right-lable photoadd-row md801'><select id='ddlAlbums' class='search_select search-select dk-selected' /></div></div></li><li><div class='spl900'><div class='left-lable md800'><label class='lable'>Description</label></div><div class='right-lable photoadd-row md801'><textarea id='albumTextArea' style='height: 120px;'></textarea><input type='hidden' value='' id='imageIds' /></div></div><div id='uploadImagePreView' class='photoadd-row2 spl903 ' style='width: 250px; height: 120px; overflow: scroll;border:solid 1px #666;'></div></li></ul></div>");
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
                }
                if (!isNaN(results.Results[0].Id)) {
                    var previewPanel = $("#uploadImageBoxConatinerInner  #uploadImagePreView");
                    previewPanel.append("<img src='" + results.Results[0].FilePath + "' height=100 width=100></img>");
                    $("#uploadImageBoxConatinerInner  #imageIds").val($("#uploadImageBoxConatinerInner  #imageIds").val() + "|" + results.Results[0].Id);
                }
            }
        }

    });
});

$('#btnNeverPhotoUpload').click(function () {
    window.parent.closeBulletinUpdate();
});




