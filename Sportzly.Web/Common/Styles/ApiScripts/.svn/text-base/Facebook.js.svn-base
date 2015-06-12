signupfacebook = function (email, facebookid, username) {

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            scsHdlrP = function (result) {
                var results = getJson(result);
                if (valid(results)) {
                    var password = results.Results[0].Password;                   
                    scsHdlrL = function (result) {
                        var resultsl = getJson(result);
                        addUser(resultsl);
                        $("#divProgress").hide();
                        //var gender = resultsl.Results[0].GenderId;
                       
                        //if (gender != 0) {
                            redirectToLoggedIn();
                        //}
                        //else {
                        //    var expiration_date = new Date();
                        //    var cookie_string = '';
                        //    expiration_date.setFullYear(expiration_date.getFullYear() + 1);
                        //    var expires = "; expires=" + expiration_date.toGMTString();
                        //    document.cookie = "__register=1" + expires + "; path=/";;
                        //    window.location.href = "ProfileSave.aspx";
                        //}
                    }
                    LoginWay(scsHdlrL, errHdlr, email, password);
                }
            }
            GetNewUsersDetails(scsHdlrP, errHdlr, facebookid, "")          

        }
    }
    SignupFB(scsHdlr, errHdlr, email, facebookid, username, invite)
}


signuptwitter = function (email, twitterid, username) {
    $("#divProgress").show();
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            scsHdlrP = function (result) {
                var results = getJson(result);
                if (valid(results)) {
                    var password = results.Results[0].Password;
                    scsHdlrL = function (resultM) {
                        var resultsl = getJson(resultM);
                        addUser(resultsl);
                        $("#divProgress").hide();
                        //var gender = resultsl.Results[0].GenderId;
                        
                        //if (gender != 0) {
                            redirectToLoggedIn();
                        //}
                        //else {
                        //    var expiration_date = new Date();
                        //    var cookie_string = '';
                        //    expiration_date.setFullYear(expiration_date.getFullYear() + 1);
                        //    var expires = "; expires=" + expiration_date.toGMTString();
                        //    document.cookie = "__register=1" + expires + "; path=/";;
                        //    window.location.href = "ProfileSave.aspx";
                        //}
                    }
                    LoginWay(scsHdlrL, errHdlr, email, password);
                }
            }
            GetNewUsersDetails(scsHdlrP, errHdlr, "", twitterid)
        }
    }   
    SignupTwitter(scsHdlr, errHdlr, email, twitterid, username, invite)
}


function StartTwitter(id, username) {   
    $("#hdTwitterID").val(id);
    $("#hdTwitterUserName").val(username);
    $('#External_Popup').show();
    $('#Internal_Popup').show();
}

function signuptw(mail, reemail) {
    var email = $(mail).val();
    var email1 = $(reemail).val();
    if (email == "") {
        alert("Please Enter the Email Address");
        return false;
    }
    if (email != email1) {
        alert("Email Address should be same");
        return false;
    }
    signuptwitter(email, $("#hdTwitterID").val(), $("#hdTwitterUserName").val());
}