$(document).ready(function () {
    $('#uploadDocumentBox').uploadify({
        swf: 'uploadify/uploadify.swf',
        'formData': { 'uid': getUser().UserKey },
        uploader: 'uploadify/uploadifyscorecard.aspx',
        'buttonImage': '/images/files.png',
        'auto': true,
        'multi': false,
        'width': 130,
        'height':37,
        'fileTypeExts': '*.doc; *.docx; *.xls; *.xlsx; *.pdf; *.ppt, *.pptx',
        'onUploadStart': function (file) {
            $("#uploadDocumentBox").uploadify("settings", "formData", { 'gameid': gamefunc() });
        },
        'onUploadSuccess': function (file, data, response) {
            if (!response || data.indexOf("Failed") == 0) return;
            savescorecardfile(data);            
        }
    });

    
});

gamefunc = function () {
    var id = GetQueryStringByParam("gameid");
    if (id == null) {
        return 0;
    }
    else {
        return id;
    }

}

SaveDocs = function () {  

    var title = $("#docTitle").val();
    var files = $("#hdFilePath").val();
    var names = $("#hdFileName").val();
    var msg = $("#docTextArea").val();
    files = files.slice(0, -1);
    names = names.slice(0, -1);

    scsHdlr = function (result) {
        var results = getJson(result);      

        window.parent.$.colorbox.close();
       
       
    }

    SaveFiles(scsHdlr, errHdlr, getUser().UserKey, title, files, msg,parseInt(teamfunc()), names);
}

function GetQueryStringByParam(param) {

    param = param.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + param + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

closedoc = function () {
    $.colorbox.close();
}

savescorecardfile = function (name) {

    var id = parseInt(gamefunc());
    var userKey = getUser().UserKey;
  

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            window.parent.$.colorbox.close();
        }
    }
    SaveGameResult(scsHdlr, errHdlr, userKey, id, "", "", name);
}