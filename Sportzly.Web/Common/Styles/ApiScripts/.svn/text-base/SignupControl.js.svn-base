
signup = function (formid,user, eml, pwd, reeml,chage,code) {

        var usr = $(user).val();
        if (usr == "Your Name") {
            usr = "";
        }
        if ($(chage).is(':checked')) { }
        else
        {
            errorModel.addErr(new error("Please check the box if you are above 13", "10104", "Error"));
            return;
        }
        //var ddlmonth = $(month).val();
        //var ddlday = $(day).val();
        //var ddlyear = $(year).val();
        var captchacode = $(code).val();

        //if (ddlmonth == 0) {
        //    errorModel.addErr(new error("Please select month", "10101", "Error"));
        //    return;
        //}
        //if (ddlday == 0) {
        //    errorModel.addErr(new error("Please select day", "10102", "Error"));
        //    return;
        //}
        //if (ddlyear == 0) {
        //    errorModel.addErr(new error("Please select year", "10103", "Error"));
        //    return;
        //}

        if (captchacode == '') {
            errorModel.addErr(new error("Please enter the code given in image", "10104", "Error"));
            return;
        }

        var email = $(eml).val();
        if (email == "Email Address") {
            email = "";
        }

        var pwd = $(pwd).val();
        if (pwd == "Password") {
            pwd = "";
        }

        //var cpwd = $(cnfPwd).val();
        //if (cpwd == "Confirm Password") {
        //    cpwd = "";
        //}
        var cpemail = $(reeml).val();
        if (cpemail == "Re-enter Email Address") {
            cpemail = "";
        }
        //if (pwd != cpwd) {
        //    errorModel.addErr(new error("Password / confirm password does not match", "1010", "Error"));
        //    return;
        //}
        if (email != cpemail) {
            errorModel.addErr(new error("Email / Re-enter Email addrees does not match", "1010", "Error"));
            return;
        }
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                // if (invite != "") {               
                scsHdlrL = function (result) {
                    var results = getJson(result);
                    if (valid(results)) {
                        addUser(results);
                        //if (results.Results[0].Teams.length > 0) { redirectToLoggedInTeam(results.Results[0].Teams[0].Key) }
                        //else { redirectloginaftersignup(); }
                        redirectloginaftersignup();
                        //var gender = results.Results[0].GenderId;

                        //if (gender != 0) {
                        // redirectToLoggedIn();
                        //}
                        //else {

                        //var expiration_date = new Date();
                        //var cookie_string = '';
                        //expiration_date.setFullYear(expiration_date.getFullYear() + 1);

                        // var expires = "; expires=" + expiration_date.toGMTString();
                        // document.cookie = "__register=1" + expires + "; path=/";;
                        //  window.location.href = "ProfileSave.aspx";
                        //$.colorbox({ href: "ProfileSave.aspx", iframe: true, height: '700', width: "1000" });
                        //}
                    }
                }

                Login(scsHdlrL, errHdlr, email, pwd, invite);
                /// }
                // else {
                //   $(".signup-area").fadeOut('slow');
                // }          
            }
        }
        // Signup(scsHdlr, errHdlr, email, pwd, usr, invite,ddlyear+"-"+ddlmonth+"-"+ddlday,captchacode);
        Signup(scsHdlr, errHdlr, email, pwd, usr, invite, captchacode);
    
}