function CreateTeam() {
    var TeamName = $("#txtTeamName").val();
    var Sports = $("#ddlSport").val();
    var Country = $("#ddlCountry").val();
    var City = $("#txtCity").val();
    var Level = $("#ddlLevel").val();
    //$("#hdTeamId").val("35");
    // $("#hTeam").text("Awesome. Your Team " + TeamName + " has been created.");
    //$("#a2").fancybox({
    //    helpers: {
    //        overlay: { closeClick: false }
    //    },
    //    'closeBtn': false
    //}).trigger('click');
    var TeamId = 0;
    scsHdlr = function (result) {
        var resultsn = getJson(result);
        TeamId = resultsn.Results[0].Id;
        $("#hdTeamId").val(TeamId);
        $("#hTeam").text("Awesome. Your Team " + TeamName + " has been created.");
        $("#a2").fancybox({
            helpers: {
                overlay: { closeClick: false }
            },
            'closeBtn': false
        }).trigger('click');
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
    window.location.href = "team.aspx?" + $("#hdTeamId").val();
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