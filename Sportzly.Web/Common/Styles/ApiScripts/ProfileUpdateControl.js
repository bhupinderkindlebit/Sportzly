
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

addAwards = function (event) {

    awardValue = $("#OtherddlAwards").val();
    if (awardValue != "") {
        //var parentDiv = $("#OtherddlAwards").parent().parent();
        // var awardsDdl = $(">select", parentDiv);
        var awardsDdl = $("#MainContentPlaceHolder_ProfileUpdateControl1_ddlAwards");
        awardsDdl.append(new Option(awardValue, awardValue));
        $("#OtherddlAwards").val("");

        $('option', awardsDdl).prop('selected', 'selected');
    }
}


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

function validateProfile() {

    var form = $("form");
    $.validator.setDefaults({ ignore: ":hidden:not(select)" })
    $.validator.addMethod(
    "sportzlyDate",
    function (value, element) {
        // put your own logic here, this is just a (crappy) example
        return value.match(/^(?:(0[1-9]|1[012])[\- \/.](0[1-9]|[12][0-9]|3[01])[\- \/.](19|20)[0-9]{2})$/);
    },
    "Please enter a valid date."
);
    jQuery.validator.addMethod("phonenumber", function (value, element) {
        return this.optional(element) || /^[0-9\s]*$/i.test(value);
    }, "Please enter valid phone number");

    jQuery.validator.addMethod("agevalidation", function (value, element) {
        var arg = value.split('-');
        var day = arg[1];
        var month = arg[0];
        var year = arg[2];
        var age = 13;

        var mydate = new Date();
        mydate.setFullYear(year, month - 1, day);

        var currdate = new Date();
        currdate.setFullYear(currdate.getFullYear() - age);

        return currdate > mydate;

    }, "You must be at least 13 years of age.");

    $.validator.addClassRules("firstname", { required: true, messages: { required: "First Name is required." } });
    $.validator.addClassRules("lastname", { required: true, messages: { required: "Last Name is required." } });
    $.validator.addClassRules("gender", { required: true });
    $.validator.addClassRules("DOB", { required: true, sportzlyDate: true, agevalidation: true });
    $.validator.addClassRules("city", { required: true });
    $.validator.addClassRules("country", { required: true });
    $.validator.addClassRules("level", { required: true });
    $.validator.addClassRules("sport", { required: true });
    $.validator.addClassRules("role", { required: true });
    //$.validator.addClassRules("carrier", { required: true });
    //$.validator.addClassRules("zip", { required: true });
    $.validator.addClassRules("phone", { phonenumber: true });
    $.validator.addClassRules("usa", { phonenumber: true, minlength: 10, maxlength: 10 });

    form.validate({
        focusInvalid: true,
        onkeyup: false,
        showErrors: function (errorMap, errorList) {
            if (errorList.length > 0)
                showError({ Message: "Please enter all the required information.", Code: 100 }, "Error", true);
            this.defaultShowErrors();
        }
    });

    return form.valid();
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
    });

    
    $("#ContentPlaceHolder1_ProfileUpdateControl1_ddlCountries").chosen().change(function () {
        if ($(this).val() == "United States" || $(this).val() == "Canada") {
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").removeClass("phone");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").addClass("usa");
            $("#limobile").show();
            $("#limsg").show();
        }
        else {
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").removeClass("usa");
            $("#ContentPlaceHolder1_ProfileUpdateControl1_txtPhone").addClass("phone");
            $("#limsg").hide();
            $("#limobile").hide();
        }
    });

});