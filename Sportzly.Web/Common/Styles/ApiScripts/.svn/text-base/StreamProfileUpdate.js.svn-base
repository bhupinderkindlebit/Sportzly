$(document).ready(function () {

    $("#uploadProfileImageBoxFive").uploadifive({
        height: 36,
        'buttonClass': 'uploadlogo1',
        'buttonText': '',
        'multi': false,
        'fileType': 'image',
        'fileSizeLimit': '15MB',
        'formData': { 'uid': getUser().UserKey },
        'uploadScript': 'uploadify/uploadifyProfilelogo.aspx',
        width: 149,
        'onUploadComplete': function (file, data) {
            if (data.indexOf("Failed") == 0) {
                alert(data);
                return;
            }

            $('#MainContentPlaceHolder_StreamProfileUpdate1_imgProfile').attr("src", "images/profile/" + data);
            $("#MainContentPlaceHolder_StreamProfileUpdate1_imageHidden").val("images/profile/" + data);

        },
        'onFallback': function () {

            $("#uploadProfileImageBoxFive").hide();
            $("#uploadProfileImageBox").show();

            $("#uploadProfileImageBox").uploadify({
                height: 36,
                'multi': false,
                'fileSizeLimit': '15MB',
                'fileTypeDesc': 'Image Files',
                'fileTypeExts': '*.gif; *.jpg; *.png; *.jpeg;',
                'buttonImage': '/images/profile_photo.png',
                swf: 'uploadify/uploadify.swf',
                'formData': { 'uid': getUser().UserKey },
                uploader: 'uploadify/uploadifyProfilelogo.aspx',
                width: 149,
                'onUploadSuccess': function (file, data, response) {
                    if (data.indexOf("Failed") == 0) {
                        alert(data);
                        return;
                    }

                    $('#MainContentPlaceHolder_StreamProfileUpdate1_imgProfile').attr("src", "images/profile/" + data);
                    $("#MainContentPlaceHolder_StreamProfileUpdate1_imageHidden").val("images/profile/" + data);

                }

            });
        }

    });
    var options = {
        //map: ".map_canvas",
        //details: ".details",
        //detailsAttribute: "data-geo"
    };
    //$("#MainContentPlaceHolder_StreamProfileUpdate1_txtCity").geocomplete(options).bind("geocode:result", function (event, result) {
    //    //setTimeout(function () { $(".map_canvas").show(); }, 2000);

    //});
    $("#MainContentPlaceHolder_StreamProfileUpdate1_ddlCountry").change(function () {
        var c = $("#MainContentPlaceHolder_StreamProfileUpdate1_ddlCountry").val();
        if (c == "India") {
            $("#MainContentPlaceHolder_StreamProfileUpdate1_divcarrier").hide();
        }
        else {
            $("#MainContentPlaceHolder_StreamProfileUpdate1_divcarrier").show();
        }

    });
});