
var imageEleId;
var imageHidden;

showUploadPhoto = function (ele, hdn) {
    imageEleId = ele;
    imageHidden = hdn;
    $.colorbox({ href: "UploadPhoto.aspx", iframe: true, height: '400', width: "700" });
}

closePhotoUpload = function (imageUrl) {
    $("#" + imageEleId).attr("src", imageUrl);
    $("#" + imageHidden).val(imageUrl);
    $.colorbox.close();
}

//addAwards = function (event) {

//    awardValue = $("#OtherddlAwards").val();
//    if (awardValue != "") {
//        //var parentDiv = $("#OtherddlAwards").parent().parent();
//        // var awardsDdl = $(">select", parentDiv);
//        var awardsDdl = $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlAwards");
//        awardsDdl.append(new Option(awardValue, awardValue));
//        $("#OtherddlAwards").val("");

//        $('option', awardsDdl).prop('selected', 'selected');
//    }
//}


function getage(dateString) {
    var today = new Date();
    var birthDate = new Date(dateString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}



$(document).ready(function () {

    var country = $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCountries").val();
   
    if (country != "" && country != undefined) {
        if (country == "United States" || country == "Canada") {
           
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").removeClass("phone");
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").addClass("usa");
            //$("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCarrier").addClass("carrier");
            $("#limobile").show();
            $("#limsg").show();
        }
        else {
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").removeClass("usa");
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").addClass("phone");
            //$("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCarrier").removeClass("carrier");
            $("#limsg").hide();
            $("#limobile").hide();
        }
    }

    var countryc = $("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCountries").val();
    
    if (countryc != "" && countryc !=undefined) {
        if (countryc == "United States" || countryc == "Canada") {
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").removeClass("phone");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").addClass("usa");
            //$("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCarrier").addClass("carrier");
            $("#limobile").show();
            $("#limsg").show();
        }
        else {
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").removeClass("usa");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").addClass("phone");
            //$("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCarrier").removeClass("carrier");
            $("#limsg").hide();
            $("#limobile").hide();
        }
    }

    $("#uploadProfileImageBoxFive").uploadifive({
         height: 36,
        'buttonClass': 'uploadlogo',
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
            var url = document.URL.toLowerCase();
            if (url.indexOf('profilesave') == -1) {
                $('#MainContentPlaceHolder_ProfileUpdateControl1_imgProfile').attr("src", "images/profile/" + data);
                $("#MainContentPlaceHolder_ProfileUpdateControl1_imageHidden").val("images/profile/" + data);
            }
            else {
                $('#ContentPlaceHolder1_ProfileUpdateControl1_imgProfile').attr("src", "images/profile/" + data);
                $("#ContentPlaceHolder1_ProfileUpdateControl1_imageHidden").val("images/profile/" + data);
            }
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
                    var url = document.URL.toLowerCase();
                    if (url.indexOf('profilesave') == -1) {
                        $('#MainContentPlaceHolder_ProfileUpdateControl1_imgProfile').attr("src", "images/profile/" + data);
                        $("#MainContentPlaceHolder_ProfileUpdateControl1_imageHidden").val("images/profile/" + data);
                    }
                    else {
                        $('#ContentPlaceHolder1_ProfileUpdateControl1_imgProfile').attr("src", "images/profile/" + data);
                        $("#ContentPlaceHolder1_ProfileUpdateControl1_imageHidden").val("images/profile/" + data);
                    }
                }

            });
        }

    });

    $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCountries").chosen().change(function () {
        if ($(this).val() == "United States" || $(this).val() == "Canada") {
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").removeClass("phone");
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").addClass("usa");
            if ($("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").val() != "") {
                $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCarrier").removeClass("carrier");
                $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCarrier").addClass("carrier");
            }
            $("#limobile").show();
            $("#limsg").show();
        }
        else {
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").removeClass("usa");
            $("#MainContentPlaceHolder_ProfileUpdateControl1_txtPhone").addClass("phone");
            $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlCarrier").removeClass("carrier");
            $("#limsg").hide();
            $("#limobile").hide();
        }
    });

    
    $("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCountries").chosen().change(function () {
        if ($(this).val() == "United States" || $(this).val() == "Canada") {
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").removeClass("phone");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").addClass("usa");
            if ($("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").val() != "") {
                $("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCarrier").removeClass("carrier");
                $("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCarrier").addClass("carrier");
            }
            $("#limobile").show();
            $("#limsg").show();
        }
        else {
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").removeClass("usa");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").addClass("phone");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCarrier").removeClass("carrier");
            $("#limsg").hide();
            $("#limobile").hide();
        }
    });

});