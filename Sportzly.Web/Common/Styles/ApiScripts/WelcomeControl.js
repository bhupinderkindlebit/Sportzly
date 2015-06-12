function NotNow() {   
    var cookie_string = '';
    var date = new Date();
    date.setTime(date.getTime() + (21600 * 1000));  
    var expires = "; expires=" + date.toGMTString();
    document.cookie = "__skip=1" + expires + "; path=/";;
    window.location.href = "myupdates.aspx";
}

function showinvite()
{
    $("#divInvite").slideToggle();
    $("#divcontacts").slideToggle();
    
}

inviteFriends = function () {
    var txt = $("#txtbxInvite").val();
    if (txt != '' && txt != 'Enter multiple e-mail addresses separated by comma or semi colon') {
        scsHdlr = function (result) {

            var results = getJson(result);
            if (valid(results)) {
              
                $("#txtbxInvite").val('');
                alert('Invitations have been sent');
            }
        }

        InviteFriends(scsHdlr, errHdlr, getUser().UserKey, txt);
    }
}