var imageEleId;
var imageHidden;

showUploadPhoto = function (ele, hdn, id) {
    imageEleId = ele;
    imageHidden = hdn;
    imgSrc = $("#" + imageEleId).attr('src');
    $.colorbox({ href: "UploadPhoto.aspx?type=team&img=" + imgSrc + "&id=" + id, iframe: true, height: '400', width: "900" });
}

closePhotoUpload = function (imageUrl) {
    $("#" + imageEleId).attr("src", imageUrl);
    $("#" + imageHidden).val(imageUrl);
    $.colorbox.close();
}
function addUrl() {
    var UrlValue = $("#txtUrl").val();

    if (UrlValue != "") {
        var urlDdl = $("#MainContentPlaceHolder_NewTeamControl_ddlUrl");
        if (UrlValue.toLowerCase().indexOf("http://") < 0 && UrlValue.toLowerCase().indexOf("https://") < 0)
        {
            UrlValue = "http://" + UrlValue;
        }
        urlDdl.append(new Option(UrlValue, UrlValue));
        $("#txtUrl").val("");
        $('option', urlDdl).prop('selected', 'selected');
    }
}

function EditUrl() {

    var urlDdl = $("#MainContentPlaceHolder_NewTeamControl_ddlUrl option:selected");

    if ($(urlDdl).text() != "") {
        $("#txtUrl").val($(urlDdl).text());
        $("#liAdd").hide();
        $("#liEdit").hide();
        $("#liDelete").hide();
        $("#liUpdate").show();
        $("#liCancel").show();
    }
    else {
        alert("Please select url first");
    }

}
function DeleteUrl() {
    var urlDdl = $("#MainContentPlaceHolder_NewTeamControl_ddlUrl option:selected");
    if ($(urlDdl).text() != "") {
        $(urlDdl).remove();
    }
    else {
        alert("Please select url first");
    }
}

function CancelUrl() {

    $("#txtUrl").val("");
    $("#liAdd").show();
    $("#liEdit").show();
    $("#liDelete").show();
    $("#liUpdate").hide();
    $("#liCancel").hide();

}

function UpdateUrl() {

    var urlValue = $("#txtUrl").val();
    var urlDdl = $("#MainContentPlaceHolder_NewTeamControl_ddlUrl");
    if (urlValue != "") {
        if (urlValue.toLowerCase().indexOf("http://") < 0 && urlValue.toLowerCase().indexOf("https://") < 0) {
            urlValue = "http://" + urlValue;
        }
        $(urlDdl).find('option:selected').text(urlValue);
        $("#txtUrl").val("");
    }
    $("#liAdd").show();
    $("#liEdit").show();
    $("#liDelete").show();
    $("#liUpdate").hide();
    $("#liCancel").hide();

}
validateTeam = function () {

    var form = $("form");
    $.validator.setDefaults({ ignore: ":hidden:not(select)" })
    $.validator.addClassRules("teamName", { required: true });
    $.validator.addClassRules("teamDesc", { required: true });
    $.validator.addClassRules("sport", { required: true });
    $.validator.addClassRules("level", { required: true });
    $.validator.addClassRules("city", { required: true });
    $.validator.addClassRules("country", { required: true });

    form.validate({
        focusInvalid: true,
        onkeyup: false,
        showErrors: function (errorMap, errorList) {
            if (errorList.length > 0)
                showError({ Message: "Please enter all the required information", Code: 100 }, "Error", true);
            this.defaultShowErrors();
        }
    });
    if (form.valid()) {
        var txt = "";
        $("#MainContentPlaceHolder_NewTeamControl_ddlUrl > option").each(function () {
            txt = txt + this.text + ";";
        });

        $("#MainContentPlaceHolder_NewTeamControl_hdUrl").val(txt);
    }
    return form.valid();
}

imageUploadify = function () {
    
    $("#uploadImageBox").uploadify({
        height: 30,
        swf: 'uploadify/uploadify.swf',
        'formData': { 'uid': getUser().UserKey },
        uploader: 'uploadify/uploadifylogo.aspx',
        width: 120,
        'onUploadSuccess': function (file, data, response) {          
            $('#ContentPlaceHolder1_UploadPhotoControl_Image1').attr("src", "images/team/" + data);
            $('#ContentPlaceHolder1_UploadPhotoControl_Image2').attr("src", "images/team/" + data);
            $('#ContentPlaceHolder1_UploadPhotoControl_Button1').show();
            $('#ContentPlaceHolder1_UploadPhotoControl_hdPhoto').val(data);           
           
        }

    });
}

invitePopUp = function (teamId) {
    $.colorbox({
        href: "invite.aspx?" + teamId + "", iframe: true, height: '210', width: "700", scrolling: false,
        onClosed: function () {
            window.location = "team.aspx?" + teamId;
        }
    });
}

$(document).ready(function () {

    $("#uploadTeamImageBoxFive").uploadifive({
        height: 36,
        'buttonClass': 'uploadlogo',
        'buttonText': '',
        'multi': false,
        'fileType': 'image',
        'fileSizeLimit': '15MB',
        'formData': { 'uid': getUser().UserKey },
        'uploadScript': 'uploadify/uploadifylogo.aspx',
         width: 149,
         'onUploadComplete': function (file, data) {
             if (data.indexOf("Failed") == 0) {
                 alert(data);
                 return;
             }
            $('#MainContentPlaceHolder_NewTeamControl_imgProfile').attr("src", "images/team/" + data);
            $("#MainContentPlaceHolder_NewTeamControl_imageHidden").val("images/team/" + data);
        },
        'onFallback': function () {

            $("#uploadTeamImageBoxFive").hide();
            $("#uploadTeamImageBox").show();

            $("#uploadTeamImageBox").uploadify({
                height: 36,
                'fileSizeLimit': '15MB',
                'buttonImage': '/images/edit_logo1.png',
                'multi': false,
                'fileTypeDesc': 'Image Files',
                'fileTypeExts': '*.gif; *.jpg; *.png; *.jpeg;',
                swf: 'uploadify/uploadify.swf',
                'formData': { 'uid': getUser().UserKey },
                uploader: 'uploadify/uploadifylogo.aspx',
                width: 148,
                'onUploadSuccess': function (file, data, response) {
                    if (data.indexOf("Failed") == 0) {
                        alert(data);
                        return;
                    }
                    $('#MainContentPlaceHolder_NewTeamControl_imgProfile').attr("src", "images/team/" + data);
                    $("#MainContentPlaceHolder_NewTeamControl_imageHidden").val("images/team/" + data);
                }

            });

        }

    });

});