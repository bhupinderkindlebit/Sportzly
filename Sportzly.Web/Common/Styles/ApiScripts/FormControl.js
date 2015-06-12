$('#btnDocumentUpload').click(function () {
    var title = $("#docTitle").val();
    var files = $("#hdFilePath").val();
    var names = $("#hdFileName").val();
    var msg = $("#docTextArea").val();
    files = files.slice(0, -1);
    names = names.slice(0, -1);

    scsHdlr = function (result) {
        var results = getJson(result);

        window.parent.closeBulletinUpdate();
    }

    SaveFiles(scsHdlr, errHdlr, getUser().UserKey, title, files, msg, parseInt(teamfunc()), names);
});

$(document).ready(function () {
    $("#uploadDocumentBoxConatiner").show();
    $("#uploadDocumentBoxConatinerInner").html('');
    $(".btnDocumentUpload").hide();
    $("#uploadDocumentBoxFive").uploadifive({
        height: 30,
        'buttonClass': 'btn btn-primary blue fontphoto uploadlogo',
        'formData': { 'uid': getUser().UserKey, 'teamId': teamfunc() },
        'uploadScript': 'uploadify/uploadifyDoc.aspx',
        width: 120,                
        'fileSizeLimit': '15MB',
        'uploadLimit': 50,
        'onUploadComplete': function (file, data) {

            if (data.indexOf("Failed") == 0) {
                return;
            }

            var previewPanel = $("#uploadDocumentBoxConatinerInner  #uploadDocumentPreView");
            if (previewPanel.get(0) == undefined) {
                $("#uploadDocumentBoxConatinerInner").append("<div id='imagePreViewContainer'><ul class='md555'><li><div class='left-lable spl904 md800'><label class='lable'>Document Name</label></div><div class='right-lable spl905 md801'><input type='text' class='input' id='docTitle'></div></li><li><div class='spl900'><div class='left-lable md800'><label class='lable'>Description</label></div><div class='right-lable photoadd-row md801'><textarea id='docTextAreay' style='height: 120px;'></textarea><input type='hidden' value='' id='imageIds' /></div></div><div id='uploadDocumentPreView' class='photoadd-row2 spl903 ' style='width: 250px; height: 120px; overflow: scroll;border:solid 1px #666;'></div></li></ul></div>");
            }

            $("#hdFileName").val($("#hdFileName").val() + file.name + ",");
            $("#hdFilePath").val($("#hdFilePath").val() + data + ",");

            var previewPanel = $("#uploadDocumentBoxConatinerInner  #uploadDocumentPreView");
            previewPanel.append("<span>" + file.name + "</span><br />");

            $(".btnDocumentUpload").show();
        }
    });
});

$('#btnNeverDocumentUpload').click(function () {
    window.parent.closeBulletinUpdate();
});

teamfunc = function () {
    var id = GetQueryStringByParam("teamid");
    if (id == null) {
        return 0;
    }
    else {
        return id;
    }

}

function GetQueryStringByParam(param) {

    param = param.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + param + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

