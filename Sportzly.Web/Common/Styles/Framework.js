var currentUser = null;
var invite = "";

errHdlr = function (err) {
    // alert("Error: " + err._message);
}

valid = function (result, hide) {

    if (result == null) return false;
    if (hide == null || hide == undefined)
        hide = false;

    if (hide || result.ResultError == null) return true;
    switch (result.ResultError.ErrorType) {
        case "Internal":
        case 0:
            showError(result.ResultError, "Error");
            return false;
        case "Error":
        case 1:
            showError(result.ResultError, "Error");
            return false;
        case "Warning":
        case 2:
            showError(result.ResultError, "Warn");
            return false;
        case "Message":
        case 3:
            showError(result.ResultError, "Message");
            return true;

    }
}

showError = function (err, tpe, autohide) {
    var model = new error(err.Message, err.Code, tpe);
    errorModel.addErr(model);
    if (autohide != undefined && autohide) {
        setTimeout(function () { errorModel.removeErr(model) }, 5000);
    }
};

getJson = function (result) {
    if (result == "") return null;
    return $.parseJSON(result);
}

addUser = function (user) {
    var expiration_date = new Date();
    var cookie_string = '';
    expiration_date.setFullYear(expiration_date.getFullYear() + 1);
    var expires = "; expires=" + expiration_date.toGMTString();
    document.cookie = "__sportzly=" + JSON.stringify(user) + expires + "; path=/";;
}

getUser = function () {

    if (currentUser == null) {
        var userCookie = readUser();
        if (userCookie != null)
            currentUser = userCookie.Results[0];
    }
    return currentUser;
}
readUser = function () {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == "__sportzly") {
            var user = $.parseJSON(unescape(y));
            return user;
        }
    }
    return null;
}

moreActivities = function () {
    getActivities();
}


bindBlur = function (event) {
    var event = event || window.event;
    var self = event.target || event.srcElement;
    if (self.value == '') {
        if (self.type.toLowerCase() == "password") {
            var $ctrl = $('#undefined_' + self.id);
            $(self).hide();
            $ctrl.show();
        } else {
            self.value = self.defaultValue;
        }
    }
}

bindFocus = function (event) {
    var event = event || window.event;
    var self = event.target || event.srcElement;
    if (self.id.toLowerCase().indexOf("undefined") >= 0) {
        var ids = self.id.split('_');
        var $ctrl = $('#' + ids[1]);
        $ctrl.val('');
        $(self).hide();
        $ctrl.show();
        $ctrl.focus();
    } else {
        if (self.value == self.defaultValue) { self.value = ''; }
    }
}

getUserEmail = function () {
    if (typeof (userEmail) == 'undefined')
        userEmail = location.href.split('?')[1];
    if (userEmail != undefined)
        userEmail = userEmail.split("&")[0];
    if (userEmail != undefined && userEmail.indexOf('@') >= 0) // check if it is email
        return userEmail;
    else return null;
}

getTeamQueryString = function () {
    var currentUserEMail = getUserEmail();
    if (currentUserEMail != null || currentUserEMail != undefined) {
        var parts = location.href.split('?')[1];
        if (parts != undefined)
            return userEmail.split("&")[1];
        return null;
    }
    else {
        return location.href.split('?')[1];
    }
}

getUserEmailOrMe = function () {
    var _userEmail = getUserEmail();

    if (typeof (_userEmail) == undefined || _userEmail == null)
        return getUser().EmailId;
    return _userEmail;
}

parseDate = function (input) {
    var parts = input.match(/(\d+)/g);
    // new Date(year, month [, date [, hours[, minutes[, seconds[, ms]]]]])
    return new Date(Date.UTC(parts[2], parts[0] - 1, parts[1])); // months are 0-based
}

ko.observableArray.fn.distinct = function (prop) {
    var target = this;
    target.index = {};
    target.index[prop] = ko.observable({});

    ko.computed(function () {
        //rebuild index
        var propIndex = {};

        ko.utils.arrayForEach(target(), function (item) {
            var key = ko.utils.unwrapObservable(item[prop]);
            if (key) {
                propIndex[key] = propIndex[key] || [];
                propIndex[key].push(item);
            }
        });

        target.index[prop](propIndex);
    });

    return target.index[prop];
};

ko.bindingHandlers.date = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        try {
            var jsonDate = ko.utils.unwrapObservable(valueAccessor());
            var value = parseJsonDateString(jsonDate);
            var allBindings = allBindingsAccessor();
            //var pattern = allBindings.datePattern || 'MMdd/yyyy';
            var strDate = value.getMonth() + 1 + "-"
                            + value.getDate() + "-"
                            + value.getFullYear();
            var prop = allBindings.prop || 'value';
            if (prop == 'text') {
                $(element).text(strDate);
            }
            else
                element.setAttribute(prop, strDate);
        }
        catch (exc) {

        }
        $(element).change(function () {
            var value = valueAccessor();
            var prop = allBindingsAccessor().prop || 'value';
            if (prop == 'text')
                value($(element).text());
            else

                value(element.getAttribute(prop));
        });
    },
    update: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        //var val = valueAccessor();
        //var prop = /*allBindingsAccessor().prop || */            'value';
        ////if (prop == 'text')
        ////    val($(element).text());
        ////else

        //val(element.getAttribute(prop));
    }
};


var jsonDateRE = /^\/Date\((-?\d+)(\+|-)?(\d+)?\)\/$/;
var parseJsonDateString = function (value) {
    var arr = value && jsonDateRE.exec(value);
    if (arr) {
        return new Date(parseInt(arr[1]));
    }
    return value;
};



redirectToLoggedIn = function () {

    var returnUrl = "";
    try {
        returnUrl = location.href.split('ReturnUrl=%2f')[1].split('&')[0];
    }
    catch (e) { }

    if (returnUrl == undefined || returnUrl == "")
        location.href = "myupdates.aspx";
    else
        location.href = decodeURIComponent(returnUrl);
}
redirectloginaftersignup = function () {

    var returnUrl = "";
    try {
        returnUrl = location.href.split('ReturnUrl=%2f')[1].split('&')[0];
    }
    catch (e) { }

    if (returnUrl == undefined || returnUrl == "")
        location.href = "welcome-sportzly.aspx";
    else
        location.href = decodeURIComponent(returnUrl);
}
redirectToLoggedInTeam = function (id) {
    location.href = "team.aspx?" + id + "";
}

applSearchFilter = function (eventSource, eventTarger) {
    $(eventSource).keyup(function () {
        var searchText = $(this).val().toLowerCase();

        $(eventTarger).each(function (index, value) {
            var txt = $(value).text().toLowerCase();
            if (txt.indexOf(searchText) >= 0) {
                $(value).show();
            }
            else {
                $(value).hide();
            }
        });
    });
}
applSearchFilterNew = function (eventSource, eventTarger) {
    $(eventSource).keyup(function () {
        var searchText = $(this).val().toLowerCase();

        $(eventTarger).each(function (index, value) {
            var txt = $(value).text().toLowerCase();
            if (txt.indexOf(searchText) >= 0)
                $(value).show();
            else
                $(value).hide();
        });
    });
}

getTeam = function () {

    if ('undefined' == typeof (teamId))
        return 0;
    return teamId;
}

getEvent = function () {

    if ('undefined' == typeof (eventId))
        return 0;
    return eventId;
}

function replaceTextWithHTMLLinks(inputText) {

    var links = inputText.match(/\b(http:\/\/|www\.|http:\/\/www\.)[^ <]{2,200}\b/g);
    if (links) {
        for (i = 0; i < links.length; i++) {
            var prot = links[i].indexOf('http://') === 0 || links[i].indexOf('https://') === 0 ? '' : 'http://';
            inputText = inputText.replace(links[i], "<a target='_blank' href='" + prot + links[i] + "'>" + links[i] + "</a>");
        }
    }

    var emailPattern3 = /([\w\.\-\+]+@[a-zA-Z_\-]+?\.[a-zA-Z]{2,6})/gim;
    inputText = inputText.replace(emailPattern3, '<a target="_blank" href="mailto:$1">$1</a>');

    return inputText;
}

albumId = function () {
    var id = GetQueryStringByParam("albumid");
    return id;
}
teamfunc = function () {
    var id = GetQueryStringByParam("teamid");
    if (id == null) {
        return 0;
    }
    else {
        return id;
    }

}
function GetQueryStringByParam(param) {

    param = param.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + param + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}