
login = function (user, pwd) {
   
    var email = $(user).val();
    var pwd = $(pwd).val();

    scsHdlr = function (result) {
        var results = getJson(result);       
        if (valid(results)) {
            addUser(results);          
           // var gender = results.Results[0].GenderId;         
            //if (gender != 0) {               
                redirectToLoggedIn();
            //}
            //else {
               
            //    var expiration_date = new Date();
            //    var cookie_string = '';
            //    expiration_date.setFullYear(expiration_date.getFullYear() + 1);

            //    var expires = "; expires=" + expiration_date.toGMTString();
            //    document.cookie = "__register=1"+ expires+"; path=/";;
            //    window.location.href = "ProfileSave.aspx";
            //    //$.colorbox({ href: "ProfileSave.aspx", iframe: true, height: '700', width: "1000" });
            //}
        }
    }

    Login(scsHdlr, errHdlr, email, pwd, invite);

    return false;
}