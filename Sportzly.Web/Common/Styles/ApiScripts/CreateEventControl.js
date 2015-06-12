﻿showHideOption = function () {
    var opt = $(".frequency").val();
    if (opt == 3) {
        $("#WeekDays").show();
    }
    else {
        $("#WeekDays").hide();
    }
}
calfunc = function () {
    var id = GetQueryStringByParam("id");
    if (id == null) {
        return 0;
    }
    else {
        return id;
    }

}
DeleteEvent = function () {
    var r = confirm("Are you sure want to cancelled the event?");
    if (r) {
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                alert('Event has been cancelled and memebers are notified by email.');
                window.location.href = "events.aspx";
            }
        }

        CancelEvent(scsHdlr, errHdlr, getUser().UserKey, parseInt(calfunc()));
    }
    else {
        return false;
    }
}


showHideOpp = function () {
    var opt = 0;

    if ($('#ContentPlaceHolder1_CreateEventControl_rdEvent').is(':checked')) {
        opt = 1;
    }
    else if ($('#ContentPlaceHolder1_CreateEventControl_rdGame').is(':checked')) {
        opt = 2;
    }
    else if ($('#ContentPlaceHolder1_CreateEventControl_rdPratice').is(':checked')) {
        opt = 3;
    }

    if (opt == 2) {
        $("#oppIndBlock").show();
        // $(".oppTeamTypeBlock").show();
        $("#titleBlock").hide();
        $(".eventTitle").text("New Game");
        $("#homeGameBlock").show();
    }
    else {
        $("#oppIndBlock").hide();
        // $(".oppTeamTypeBlock").hide();
        $("#titleBlock").show();
        $(".eventTitle").text("");
        $("#homeGameBlock").hide();
    }

    //var _editName = "Save";
    //if (eventId == 0) {
    //    _editName = "Create";
    //}

    //$(".save").val(_editName + " " + $(".eventType option[value='" + opt + "']").text());
    // $(".save").val(_editName + " " + $(".eventType option[value='" + opt + "']").text());
    //showHideOppBox();
}

showHide = function (opt) {
    if (opt == 2) {
        $(".teamList").prop('disabled', true).trigger("chosen:updated");
        $(".addInvitees").prop('disabled', false);
    }
    else {
        $(".teamList").prop('disabled', false).trigger("chosen:updated");
        $(".addInvitees").prop('disabled', true);
    }
}

showHideOppNew = function (opt) {   
    if (opt == 2) {

        $("#oppIndBlock").show();
        //  $(".oppTeamTypeBlock").show();
        $("#titleBlock").hide();
        $(".eventTitle").text("New Game");
        $("#homeGameBlock").show();
        $("#seasonblock").css("width", "395px");
        $(".season").css("width", "200px");
    }
    else {
        $("#oppIndBlock").hide();
        //  $(".oppTeamTypeBlock").hide();
        $("#titleBlock").show();
        $(".eventTitle").text("");
        $("#homeGameBlock").hide();
        $("#seasonblock").css("width", "700px");
        $(".season").css("width", "580px");
    }

    //showHideOppBox();
}

showHideOppBox = function () {
    var opt = $(".gameType").first().is(':checked');

    if (opt) {
        //  $(".oppTeamBlock").show();
        $("#oppIndBlock").hide();
    }
    else {
        // $(".oppTeamBlock").hide();
        $("#oppIndBlock").show();
    }
}

showHideTeam = function () {
    var teamCount = $(".teamList>option").length;
    if (teamCount == 1)
        $("#teamBlock").hide();
    else
        $("#teamBlock").show();
}

showHideOption();
showHideOpp();
//showHideTeam();
//showHide();

validateEvent = function () {    
    var form = $("form");
    $.validator.setDefaults({ ignore: ":hidden:not(select)" })
    $.validator.addClassRules("eventTitle", { required: true });
    $.validator.addClassRules("dateFrom", { required: true });
    $.validator.addClassRules("dateTo", { required: true });
    $.validator.addClassRules("timeFrom", { required: true });
    $.validator.addClassRules("timeTo", { required: true });
    $.validator.addClassRules("teamList", { required: true });
    $.validator.addClassRules("addressLine", { required: true });
    //$.validator.addClassRules("city", { required: true });
    //$.validator.addClassRules("state", { required: true });
    //$.validator.addClassRules("country", { required: true });
    //$.validator.addClassRules("comments", { required: true });
    $.validator.addClassRules("oppName", { required: true });

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

$(document).ready(function () {
    var options = {
        //map: ".map_canvas",
        //details: ".details",
        //detailsAttribute: "data-geo"
    };

    $("#ContentPlaceHolder1_CreateEventControl_addressLine").geocomplete(options).bind("geocode:result", function (event, result) {
        //setTimeout(function () { $(".map_canvas").show(); }, 2000);
    });


});


$('#btnNeverMindEvent').click(function () {
    window.parent.closeBulletinUpdate();
});