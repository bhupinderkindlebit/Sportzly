var energizeEvents = function() {
    $(document).ready(function() {
        $("#divService select").change(function() {
            var serviceValue = $(this).val();
            $("#divForm").show();
            $("#divOutlook").hide();
            if ((serviceValue == "gmail") || (serviceValue == "facebook") || (serviceValue == "yahoo") || (serviceValue == "hotmail") || (serviceValue == "msn") || (serviceValue == "msnmessenger")) {
                window.open('oauth.aspx?currpage=' + serviceValue, serviceValue + 'oauth', 'location=1,status=1,scrollbars=1,width=700,height=400');
            }
            else if (serviceValue == "outlook") {
                $("#divForm").hide();
                $("#divOutlook").show();
            }
        });
    });
    $(document).ready(function() {
        $("#mailServerList > li").click(function() {
            var serviceValue = $(this).find("img").attr("alt");
            $("#divService select").val(serviceValue);
            $("#divForm").show();
            $("#divOutlook").hide();
            if ((serviceValue == "gmail") || (serviceValue == "facebook") || (serviceValue == "yahoo") || (serviceValue == "hotmail") || (serviceValue == "msn") || (serviceValue == "msnmessenger")) {
                window.open('oauth.aspx?currpage=' + serviceValue, serviceValue + 'oauth', 'location=1,status=1,scrollbars=1,width=700,height=400');
            }
            else if (serviceValue == "outlook") {
                $("#divForm").hide();
                $("#divOutlook").show();
            }
            document.body.scrollTop = 750;
        });
    });
}
var contactGrabber = (function() {
    var logout = function(a) {
        if (a == "google")
            document.getElementById("logoutframe").src = "https://mail.google.com/mail/?logout&hl=en";
        else if (a == "yahoo")
            document.getElementById("logoutframe").src = "http://www.yahoo.com/_ylt=AoK55ZOw4K2dbB1FQCeJ.IabvZx4/SIG=13d8g0r4k/**https%3A//login.yahoo.com/config/login%3F.src=fpctx%26logout=1%26.direct=1%26.done=http%3A//www.yahoo.com/";
        else
            document.getElementById("logoutframe").src = "http://login.live.com/logout.srf?app=0000000040051700";
    }
    var logoutUser = function(a) {
        logout(a);
    }
    var showLoading = function() {
        $(".loading").show();
    }
    var hideLoading = function() {
        $(".loading").hide();
    }
    var clearForm = function() {
        $("#txtUsername").val("");
        $("#txtPassword").val("");
        $("#divRecipients").show();
        configureEvent();
    }
    var showErrorMessage = function(a) {
        $("#divRecipients").hide();
        resetContactList();
        alert(a);
    }
    var resetContactList = function() {
        var defaultContactList = "<div class=\"fl break\"><table class=\"panWid minH\">";
        defaultContactList += "<tr class=\"headFrame\"><td class=\"selectTd\">Select</td><td>Name</td><td>Email</td></tr>";
        defaultContactList += "<tr><td colspan=\"3\"><i>No contacts found!</i></td></tr>";
        defaultContactList += "</table></div>";
        $("#ContactsTable").html(defaultContactList);
        $("#divService select").val("aol");
    }
    var finishLoading = function(a) {
        if (a == undefined)
            clearForm();
        else
            showErrorMessage(a);
        hideLoading();
        energizeEvents();
        if ($("#divService select").val() == "outlook") {
            $("#divForm").hide();
            $("#divOutlook").show();
            $("#divService select").val("outlook");
        }
        else {
            $("#divForm").show();
            $("#divOutlook").hide();
        }
    }
    var unload = function(a) {
        finishLoading(a);
    }
    var selectContacts = function() {
        selectUnselect();
    }
    var selectUnselect = function() {

        var totalContact = $("#ContactsTable table tr").length;
        var selectedContacts = "", count = 0;
        for (var i = 0; i < totalContact; i++) {
            if ($("#ContactsTable table tr").eq(i).find("input[type=checkbox]").attr("checked") == "checked") {
                selectedContacts += $("#ContactsTable table tr").eq(i).find("input[type=checkbox]").attr("value") + ",";
                count++;
            }
        }
        if (selectedContacts.indexOf(",") != -1)
            selectedContacts = selectedContacts.substr(0, selectedContacts.length - 1);
        if (count == 0)
            selectedContacts = "no contacts selected";
        $("#recipients").val(selectedContacts);
        $("#divSelectedContactsCount").show().html(count + " contact(s) selected.")
    }
    var selectAllContacts = function() {
        $("#ContactsTable table tr").find("input[type=checkbox]").attr("checked", "checked");
        selectUnselect();
    }
    var unSelectAllContacts = function() {
        $("#ContactsTable table tr").find("input[type=checkbox]").removeAttr("checked");
        selectUnselect();
    }
    var configureEvent = function() {
        setClickEvents();
    }
    var replaceSepChar = function(a) {
        while (a.indexOf("~") != -1) {
            a = a.replace("~", "");
        }
        return a;
    }
    var configureSelectedContacts = function() {
        var totalContact = $("#ContactsTable table tr").length;
        var selectedContacts = "", count = 0;
        for (var i = 0; i < totalContact; i++) {
            if ($("#ContactsTable table tr").eq(i).find("input[type=checkbox]").attr("checked") == "checked") {
                selectedContacts += replaceSepChar($("#ContactsTable table tr").eq(i).find("td").eq(1).text()) + "~" + $("#ContactsTable table tr").eq(i).find("td").eq(2).text() + ",";
                count++;
            }
        }
        if (selectedContacts.indexOf(",") != -1)
            selectedContacts = selectedContacts.substr(0, selectedContacts.length - 1);
        return selectedContacts;
    }
    var setClickEvents = function() {
        $("#divSelect").click(function() {
            selectAllContacts();
        });
        $("#divUnselect").click(function() {
            unSelectAllContacts();
        });
        $("#divDone").click(function() {
            setSelectedContacts(configureSelectedContacts());
            doneEvent();
        });
    }
    var resetContacts = function() {
        $("#divRecipients").hide();
        $("#divSelectedContactsCount").hide();
        resetContactList();
    }
    return {
        logoutUser: logoutUser,
        showLoading: showLoading,
        hideLoading: hideLoading,
        unload: unload,
        selectContacts: selectContacts,
        configureEvent: configureEvent,
        resetContacts: resetContacts
    }
})();
energizeEvents();
var startGrabbingOauth = function(a) {
    contactGrabber.logoutUser(a);
    grabContactsOauth();
}