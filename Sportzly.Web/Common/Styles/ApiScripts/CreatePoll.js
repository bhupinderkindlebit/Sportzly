﻿function addAwards() {
    //var awardValue = $("#txtOption").val();

    //if (awardValue != "") {
    //    var awardsDdl = $("#ContentPlaceHolder1_CreatePoll1_ddlOptions");
    //    awardsDdl.append(new Option(awardValue, awardValue));
    //    $("#txtOption").val("");
    //    $('option', awardsDdl).prop('selected', 'selected');
    //}
}

function EditAwards() {

    //var awardsDdl = $("#ContentPlaceHolder1_CreatePoll1_ddlOptions option:selected");

    //if ($(awardsDdl).text() != "") {
    //    $("#txtOption").val($(awardsDdl).text());
    //    $("#liAdd").hide();
    //    $("#liEdit").hide();
    //    $("#liDelete").hide();
    //    $("#liUpdate").show();
    //    $("#liCancel").show();
    //}
    //else {
    //    alert("Please select option first");
    //}

}
function DeleteAwards() {
    //var awardsDdl = $("#ContentPlaceHolder1_CreatePoll1_ddlOptions option:selected");
    //if ($(awardsDdl).text() != "") {
    //    $(awardsDdl).remove();
    //}
    //else {
    //    alert("Please select option first");
    //}
}

function CancelAwards() {

    //$("#txtOption").val("");
    //$("#liAdd").show();
    //$("#liEdit").show();
    //$("#liDelete").show();
    //$("#liUpdate").hide();
    //$("#liCancel").hide();

}

function UpdateAwards() {

    //var awardValue = $("#txtOption").val();
    //var awardsDdl = $("#ContentPlaceHolder1_CreatePoll1_ddlOptions");
    //if (awardValue != "") {
    //    $(awardsDdl).find('option:selected').text(awardValue);
    //    $("#txtOption").val("");
    //}
    //$("#liAdd").show();
    //$("#liEdit").show();
    //$("#liDelete").show();
    //$("#liUpdate").hide();
    //$("#liCancel").hide();

}

$(function () {
    //$(".dateExpiry").datepicker({ dateFormat: "mm/dd/yy", minDate: +2 });

});

validatePoll = function () {   
    var form = $("form");
    $.validator.setDefaults({ ignore: ":hidden:not(select)" })
    $.validator.addClassRules("pollQuestion", { required: true });
    //$.validator.addClassRules("dateExpiry", { required: true });
   // $.validator.addClassRules("ddlOptions", { required: true });
    
    var txt = "";
    //$("#ContentPlaceHolder1_CreatePoll1_ddlOptions > option").each(function () {
    //    txt = txt + this.text + ";";

    //});
    
    $("#ContentPlaceHolder1_CreatePoll1_hdAwards").val(txt);

    form.validate({
        focusInvalid: true,
        onkeyup: false,
        showErrors: function (errorMap, errorList) {            
            if (errorList.length > 0) {
                $('.errorMsg1').text('Please enter all the required information');
                return false;
            }
            //this.defaultShowErrors();
        }
    });

    return form.valid();
}

$('#btnNeverMindPoll').click(function () {
    window.parent.closeBulletinUpdate();
});
