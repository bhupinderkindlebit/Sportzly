inviteToTeam = function () {

    var params = {
        loaderClass: "loading_bar_1",
        debug: true,
        speed: 'fast',
        hasBackground: false,
        zIndex: 99
    };

    $.fn.nimbleLoader.setSettings(params);

    $("#loading3").nimbleLoader("show", {
        hasBackground: true,
        backgroundColor: "#ffffff",
        backgroundOpacity: "0.7",
        height:"210px"
    });

    var txt = $("#txtbxInvite").val();
    if (txt != '') {
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                $("#loading3").nimbleLoader("hide");
                $("#txtbxInvite").val('');                
                $('.successMsg').text('Invitations have been sent');                
            }
        }

        InviteToTeam(scsHdlr, errHdlr, getUser().UserKey, txt, getTeam(), "Invite Textbox");
    }
}

