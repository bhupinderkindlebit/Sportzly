inviteToTeam = function () {
    var params = {
        loaderClass: "loading_bar",
        debug: true,
        speed: 'fast',
        hasBackground: false,
        zIndex: 99
    };

    $.fn.nimbleLoader.setSettings(params);

    $("#loading1").nimbleLoader("show", {
        hasBackground: true,
        backgroundColor: "#ffffff",
        backgroundOpacity: "0.7"
    });
   
    var txt = $("#txtbxInvite").val();
    if (txt != '') {
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                $("#loading1").nimbleLoader("hide");
                $("#txtbxInvite").val('');
                alert('Invitations have been sent');
                window.location = "members.aspx?" + teamId + "";
            }
        }

        InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, txt, getTeam(), "Invite Textbox");
    }
}

