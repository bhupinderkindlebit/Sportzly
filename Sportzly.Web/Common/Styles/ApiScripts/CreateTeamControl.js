function CreateTeam() {
    var TeamName = $("#txtTeamName").val();
    var Sports = $("#ddlSport").val();
    var Country = $("#ddlCountry").val();
    var City = $("#txtCity").val();
    var Level = $("#ddlLevel").val();
    var TeamId = 0;
    scsHdlr = function (result) {
        var resultsn = getJson(result);
        TeamId = resultsn.Results[0].Id;
        $("#hdTeamId").val(TeamId);
        $("#hTeam").text("Awesome. Your Team " + TeamName + " has been created.");

        $('#div3').attr("style", "display:inline;");
        $.colorbox({
            href: "#div3", inline: true, height: '240', width: "700", scrolling: false,
            onClosed: function () {
                parent.$('#div2').colorbox.close();
            },
        });

        var link = "";
        scsHdlrN = function (result) {
            var resultsn = getJson(result);
            link = resultsn.Results[0].Token;
            $("#imgTwitter").attr("href", "https://twitter.com/share?url=" + link + "&text=You have been invited by " + TeamName + " to join his/her team on Sportzly.");
        }
        GetInviteTokenTwitter(scsHdlrN, errHdlr, getUser().UserKey, TeamId);
    }
    SaveNewTeam(scsHdlr, errHdlr, getUser().UserKey, TeamName, Country, Sports, City, Level);
}

GoToMyTeam = function () {
    parent.$('#div2').colorbox.close();
    parent.window.location.href = "team.aspx?" + $("#hdTeamId").val();
}

inviteToTeam = function () {

    var txt = $("#txtbxInvite").val();
    if (txt != '') {
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                $("#txtbxInvite").val('');
                alert('Invitations have been sent');
            }
        }

        InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, txt, parseInt($("#hdTeamId").val()), "Invite Textbox");
    }
}

validateEvent = function () {

    var form = $("form");
    $.validator.setDefaults({ ignore: ":hidden:not(select)" })
    $.validator.addClassRules("txtTeamName", { required: true });
    $.validator.addClassRules("txtCity", { required: true });
    $.validator.addClassRules("ddlSport", { required: true });
    $.validator.addClassRules("ddlLevel", { required: true });
    $.validator.addClassRules("ddlCountry", { required: true });
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

    if (form.valid()) {
        CreateTeam();
    }
    else {
        event.preventDefault();
    }
}

$(document).ready(function () {
    var options = {
        //map: ".map_canvas",
        //details: ".details",
        //detailsAttribute: "data-geo"
    };

    $("#txtCity").geocomplete(options).bind("geocode:result", function (event, result) {
        //setTimeout(function () { $(".map_canvas").show(); }, 2000);
    });


});

closeCreateTeam = function () {
    window.parent.$.colorbox.close();
}