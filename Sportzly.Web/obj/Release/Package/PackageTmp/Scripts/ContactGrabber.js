/*----------------------------------------*/
/* Copy right @ StesCodes Contact Grabber */
/*----------------------------------------*/

var contactGrabber = (function() {
    var contactArray = [], lastAction = "all", selectedArray = [], filteredArray = [], selectedService = "outlook", popup = true, sendFunction = function() { };
    var services = {
        facebook: { name: "facebook", type: "oAuth", icon: "facebook_logo.png" }, gmail: { name: "gmail", type: "oAuth", icon: "gmail_logo.png" }, hotmail: { name: "hotmail", type: "oAuth", icon: "hotmail_logo.png" }, yahoo: { name: "yahoo", type: "oAuth", icon: "yahoo_logo.png" }
    }

   
    ///Purpose: adds the header and contacts wrapper at initilization
    var addRequiredDom = function() {
        var serviceListDom = "<div class=\"tpl-service-list posrel\"><div class=\"posabs service-list\"><ul>";
        for (var key in services) {
            if (services.hasOwnProperty(key)) {
                serviceListDom += "<li class=\"fl\" service=\"" + key + "\"><img src=\"images/" + services[key].icon + "\" /></li>";
            }
        }
        serviceListDom += "</ul></div></div>";
        var headerDOM = "<div class=\"fl tpl-header-wrapper marTop5\">";
        headerDOM += "<div class=\"fl marTop4 fl tpl-header-icon\"><div class=\"fl service-holder\"><div class=\"fl\"><img class=\"img\" src=\"images/facebook_logo.png\" /></div><div class=\"service-icon fr\"></div></div></div>" + serviceListDom;
        headerDOM += "<div class=\"fr marRight10 selected-contacts tpl-default hdrAlign\">Selected</div>";
        headerDOM += "<div class=\"fr marRight10 all-contacts tpl-default hdrAlign\">All</div>";
        headerDOM += "<div class=\"fr marRight10 clear-contacts tpl-default hdrAlign\">Clear</div>";
        headerDOM += "<div class=\"fr marRight10 tpl-default\">";
        headerDOM += "<input type=\"text\" id=\"txtsearch\" autocomplete=\"off\" class=\"ac_input searchTxt textclass\">";
        headerDOM += "</div>";
        headerDOM += "<div class=\"fr marRight10 tpl-default hdrAlign\">Search</div></div>";
        var bodyDom = "<div class=\"tpl-contacts-wrapper\"><div class=\"stesgrid\"></div><div class=\"fl padTop10 sendBtnHolder\"><div class=\"sendBtn\">Send</div></div></div>";
        $(".contacts-tpl .tpl-header").html(headerDOM);
        $(".contacts-tpl .tpl-contacts").html(bodyDom);
        $(".contacts-tpl").show();
       // $(".contacts-tpl .tpl-contacts").after("<div class=\"tpl-ad fl fullWid\"><div class=\"fr powered\"><span>Powered by </span><span><a href=\"http://stescodes.com/grabcontacts.aspx\" target=\"_blank\">StesCodes.com</a></span></div></div>");
    }
    ///Purpose: set autocomplete on the contacts list
    var autoComplete = function(contacts) {
        var len = contacts.length;
        var availableTags = [], availableTagObj = {};
        for (var i = 0; i < len; i++) {
            var name = contacts[i].name;
            if (name.indexOf(" ") != -1) {
                var spltr = name.split(" ");
                var spltLen = spltr.length;
                for (var j = 0; j < spltLen; j++)
                    availableTagObj[spltr[j]] = spltr[j];
            }
            else
                availableTagObj[name] = name;
        }
        //refine the contacts for autocomplete
        for (var key in availableTagObj) {
            if (availableTagObj.hasOwnProperty(key)) {
                availableTags.push(availableTagObj[key]);
            }
        }
        //set the autocomplete on search bar
        $(".contacts-tpl .searchTxt").autocomplete({
            source: function(request, response) {
                var results = $.ui.autocomplete.filter(availableTags, request.term);
                response(results.slice(0, 8)); //set the maximum number of lines to display during autocomplete
            },
            select: function(event, ui) {//this method is called when the autocomplete is selected
                filteredArray = [];
                var len = contactArray.length;
                for (var i = 0; i < len; i++) {
                    if (contactArray[i].name.indexOf(ui.item.value) != -1) {
                        lastAction = "filtered";
                        filteredArray.push({ name: contactArray[i].name, email: contactArray[i].email, selected: contactArray[i].selected, refIndex: i });
                    }
                }
                intDisplay();
                contactGrabber.loadContacts(filteredArray, "", "full");
            }
        });
    }
    ///Purpose: adjust the grid height
    var adjustDesign = function(type) {
        if (type == "full") {
            $(".contacts-tpl .tpl-contacts").css({ "height": "370px", "padding-bottom": "10px" });
            $(".contacts-tpl .tpl-contacts-wrapper").css("height", "348px");
            $(".contacts-tpl .tpl-contacts").css("padding-bottom", "10px");
            return "285px";
        }
        else {
            $(".contacts-tpl .tpl-contacts").css({ "height": "273px", "padding-bottom": "0px" });
            $(".contacts-tpl .tpl-contacts-wrapper").css("height", "241px");
            return "181px";
        }
    }
    
    ///Purpose: load all the contacts in grid
    ///Syntax: loadContacts(<array of contacts>,<all - to pre-select contacts>,<type of grid design(full or small)>)
    var loadContacts = function(contacts, type, adjust) {
        var height = adjustDesign(adjust);
        if (contacts.length == 0) {
            $(".contacts-tpl .stesgrid,.contacts-tpl .sendBtnHolder,.contacts-tpl .tpl-loading").hide();
            $(".contacts-tpl .tpl-contacts-wrapper,.contacts-tpl .tpl-contacts").show().addClass("tpl-noresultsfound");
        } else {
            StesCodesGrid.init({
                target: $(".stesgrid"),
                height: height,
                width: "548px",
                columns: [{ text: "<input type=\"checkbox\" class=\"selectAll\" " + ((type == "all") ? " checked=\"checked\"" : "") + "/>", ref: "selected", sort: false, cls: "centr", width: "40px",
                    formatter: function(a) {
                        return "<input type=\"checkbox\" class=\"choose\" " + ((a) ? " checked=\"checked\"" : "") + "/>";
                    }
                }, { text: "Name", ref: "name", width: "200px", cls: "ellipsis" }, { text: "Email", ref: "email", width: "250px", cls: "ellipsis"}],
                header: { color: "White", borderColor: "#EDEDED", bgColor: "#799DC4" },
                body: { color: "black", borderColor: "#EDEDED", bgColor: "#fff", highlightColor: "#f0f0f7" },
                rows: contacts,
                pageSize: contacts.length,
                columnChooser: false,
                columnRearrange: false,
                expander: false,
                parentContainer: $(".contacts-tpl .tpl-contacts"),
                paginationBottom: false,
                paginationTop: false,
                rowClick: function(indx, data, type, me) {
                    var target = me.closest(".stesgridrow").find(".choose");
                    var status = target.prop("checked");
                    if (status)
                        target.prop("checked", false);
                    else
                        target.prop("checked", true);

                    contactGrabber.selectRow(target, target.prop("checked"), indx);
                },               
                callbacks: {
                    sort: function(target, data, key) {
                        if (target.find(".selectAll").length > 0) {
                            selectClick(target.find(".selectAll"));
                        }
                    }
                }

            });
            $(".contacts-tpl .tpl-contacts,.contacts-tpl .tpl-default,.contacts-tpl .stesgrid,.contacts-tpl .sendBtnHolder,.contacts-tpl .tpl-login-bar").show();
            $(".contacts-tpl .tpl-loading,.contacts-tpl .tpl-login-outlook").hide();
            $(".contacts-tpl .tpl-contacts-wrapper").removeClass("tpl-noresultsfound");
            $(".contacts-tpl .tpl-login-wrapper").fadeOut();
            attachEventHandlers();
            autoComplete(contactArray);
        }

    }
    var rowSelect = function(me, selectStatus, selIndex) {
        if (lastAction == "selected")
            selIndex = selectedArray[selIndex].refIndex;
        else if (lastAction == "filtered")
            selIndex = filteredArray[selIndex].refIndex;
        contactArray[selIndex].selected = selectStatus;
        var len = contactArray.length;
        var count = 0;
        for (var i = 0; i < len; i++) {
            if (contactArray[i].selected)
                count++;
        }
        $(".contacts-tpl .selected-contacts").html("Selected (" + count + ")");
        $(".contacts-tpl .selectAll").prop("checked", (len == count));
    }
    var selectClick = function (me) {
       
        var len = contactArray.length;
        if (lastAction == "selected")
            len = selectedArray.length;
        var selectStatus = me.prop("checked");
        for (var i = 0; i < len; i++) {
            if (lastAction == "selected") {
                contactArray[selectedArray[i].refIndex].selected = selectStatus;
                selectedArray[i].selected = selectStatus;
            }
            else
                contactArray[i].selected = selectStatus;
        }
        if ((lastAction == "selected") && (selectStatus == true))
            contactGrabber.loadContacts(selectedArray, ((selectStatus) ? "all" : ""), "full");
        else {
            contactGrabber.loadContacts(contactArray, ((selectStatus) ? "all" : ""), "full");
            lastAction = "all";
        }
        $(".contacts-tpl .selected-contacts").html("Selected (" + ((selectStatus) ? len : 0) + ")");
    }
    var selectunselect = function (me) {
        
        var selIndex = me.closest(".stesgridrow").attr("index");
        var status = false;
        var selectStatus = me.prop("checked");      
        if (selectStatus) {
            me.prop("checked", false);
            status = false;
        }
        else {
            me.prop("checked", true);
            status = true;
        }
        contactGrabber.selectRow(me, status, selIndex);
        //var len = contactArray.length;
        //if (lastAction == "selected") {
        //    contactArray[selectedArray[selIndex].refIndex].selected = selectStatus;
        //    selectedArray[selIndex].selected = selectStatus;
        //    len = selectedArray.length;
        //}
        //else
        //    contactArray[selIndex].selected = selectStatus; ;


        //var count = 0;
        //for (var i = 0; i < len; i++) {
        //    if (lastAction == "selected") {
        //        if (selectedArray[i].selected)
        //            count++;
        //    }
        //    else {
        //        if (contactArray[i].selected)
        //            count++;
        //    }
        //}
        //contactGrabber.loadContacts(((lastAction == "selected") ? selectedArray : contactArray), ((count == len) ? "all" : ""));
        //$(".contacts-tpl .selected-contacts").html("Selected (" + count + ")");
    }
    var clear = function(adjust) {
        lastAction = "all";
        var len = contactArray.length;
        var selectStatus = false;
        for (var i = 0; i < len; i++) {
            contactArray[i].selected = selectStatus;
        }
        contactGrabber.loadContacts(contactArray, "", adjust);
        $(".contacts-tpl .selected-contacts").html("Selected (0)");
    }
    var selectedContacts = function(adjust) {
        lastAction = "selected";
        var len = contactArray.length;
        var count = 0;
        selectedArray = [];
        for (var i = 0; i < len; i++) {
            if (contactArray[i].selected) {
                selectedArray.push({ name: contactArray[i].name, email: contactArray[i].email, selected: contactArray[i].selected, refIndex: i });
                count++;
            }
        }
        contactGrabber.loadContacts(selectedArray, "all", adjust);
        $(".contacts-tpl .selected-contacts").html("Selected (" + count + ")");
    }
    var all = function(adjust) {
        lastAction = "all";
        var len = contactArray.length;
        var count = 0;
        for (var i = 0; i < len; i++) {
            if (contactArray[i].selected)
                count++;
        }
        contactGrabber.loadContacts(contactArray, ((count == len) ? "all" : ""), adjust);
        $(".contacts-tpl .selected-contacts").html("Selected (" + count + ")");
    }
    var resetSelection = function() {
        intDisplay();
        clear("full");
    }
    var attachEventHandlers = function() {
        $(".contacts-tpl .selectAll").unbind("click");
        $(".contacts-tpl .selectAll").click(function() {
            selectClick($(this));
        });
        $(".contacts-tpl").off("click",".choose");
        //$(".contacts-tpl .choose").click(function() {
           
        //});
        $('.contacts-tpl').on('click', '.choose', function () {
            selectunselect($(this));
        });
        $(".contacts-tpl .clear-contacts").unbind("click");
        $(".contacts-tpl .clear-contacts").click(function() {
            intDisplay();
            clear("full");
        });
        $(".contacts-tpl .selected-contacts").unbind("click");
        $(".contacts-tpl .selected-contacts").click(function() {
            intDisplay();
            selectedContacts("full");
        });
        $(".contacts-tpl .all-contacts").unbind("click");
        $(".contacts-tpl .all-contacts").click(function() {
            intDisplay();
            all("full");
        });

    }
    var grabContacts = function() {
        $(".contacts-tpl .tpl-loading").show().find(".loading-content").html("Fetching contacts...");
        if (services[selectedService].type == "oAuth") {
            grabAllContacts(selectedService);
        }
        else {
            intDisplay();
            grabAllContacts(selectedService);
        }
    }
    var displayContacts = function (contactObj, presel) {
       
        $(".contacts-tpl .tpl-loading").show().find(".loading-content").html("Loading contacts...");
        contactArray = contactObj.contacts;
        if (presel) {
            var len = contactObj.contacts.length;
            for (var i = 0; i < len; i++) {
                contactArray[i].selected = true;
            }
        }
        intDisplay();

        $(".contacts-tpl .all-contacts").html("All (" + contactObj.contacts.length + ")");
        if (contactObj.error != "") {
            $(".contacts-tpl .tpl-error-message").show().html(contactObj.error);
            if (services[selectedService].type == "oAuth")
                $(".contacts-tpl .tpl-login-bar").append("<span class=\"fr autherr\" style=\"color:red\">" + contactObj.error + "</span>");
            else
                $(".contacts-tpl .tpl-login-bar").click();
            $(".contacts-tpl .tpl-loading,.contacts-tpl .tpl-default,.contacts-tpl .tpl-contacts").hide();
        }
        else {
            window.setTimeout('contactGrabber.load("full")', 500);
            $(".contacts-tpl .tpl-error-message,.contacts-tpl .tpl-contacts").hide();
            $(".contacts-tpl .tpl-default").show();
        }
        $(".contacts-tpl .tpl-login").show().find(".contacts-tpl .tpl-login-bar").show();
        $(".contacts-tpl .tpl-ad").css("margin-top", "0px");
        window.setTimeout("contactGrabber.storeAnalytics()", 600);
    }
    var storeAnalytics = function() {

    }

    var auth = function (serviceName, force) {
        
        $(".contacts-tpl .autherr").remove();
        $(".contacts-tpl .tpl-error-message").hide();
        if (popup == true)
            contactGrabber.overlay("visible", "popup");
        $("#popupcontainer").show();
        selectedService = serviceName;
        $(".contacts-tpl .tpl-header-icon").find(".img").attr("src", "images/" + services[serviceName].icon);
        if (services[serviceName].type == "oAuth") {
            $(".contacts-tpl .tpl-loading").show().find(".loading-content").html("Please authorize your account...");
            $(".contacts-tpl .tpl-login").hide();
            $(".contacts-tpl .tpl-login-bar").show().html("Click here to try different username/password");
            $(".contacts-tpl .tpl-ad").css("margin-top", "50px");
            if (force)
                openauth(serviceName);
        }
        else {
            $(".contacts-tpl .tpl-ad").css("margin-top", "0px");
            if (serviceName == "outlook") {
                $(".contacts-tpl .tpl-login,.contacts-tpl .tpl-login-outlook").show();
                $(".contacts-tpl .tpl-login-bar,.contacts-tpl .tpl-loading,.contacts-tpl .tpl-login-wrapper").hide();
            }
            else {
                $(".contacts-tpl .tpl-loading,.contacts-tpl .tpl-login-bar,.contacts-tpl .tpl-login-outlook").hide();
                $(".contacts-tpl .tpl-login,.contacts-tpl .tpl-login-wrapper").show();
                window.setTimeout("makefocus()", 400);
            }
        }
        $(".contacts-tpl .tpl-default,.contacts-tpl .tpl-service-list").hide();
        return services[serviceName];
    }
    var refresh = function(adjust) {
        if (lastAction == "selected")
            selectedContacts(adjust);
        else if (lastAction == "filtered")
            contactGrabber.loadContacts(filteredArray, "", adjust);
        else
            all(adjust);
        if (services[selectedService].type == "oAuth") {
            $(".contacts-tpl .tpl-login-bar").show();
            $(".contacts-tpl .tpl-login-wrapper").hide();
            openauth(selectedService);
        }
        else {
            if (selectedService == "outlook") {
                $(".contacts-tpl .tpl-login").show();
                $(".contacts-tpl .tpl-login-bar,.contacts-tpl .tpl-login-wrapper").hide();
                $(".contacts-tpl .tpl-login-outlook").fadeIn();
            }
            else {
                $(".contacts-tpl .tpl-login").show();
                $(".contacts-tpl .tpl-login-bar,.contacts-tpl .tpl-login-outlook").hide();
                $(".contacts-tpl .tpl-login-wrapper").fadeIn();
            }
        }
    }
    var intDisplay = function() {
        $(".contacts-tpl .tpl-login-wrapper,.contacts-tpl .tpl-login-outlook").hide();
        $(".contacts-tpl .tpl-login-bar").show();
        $(".contacts-tpl .tpl-login-bar").addClass("tpl-collapse");
    }
    var getSelectedContacts = function() {
        var returnArray = [];
        var len = contactArray.length;
        for (var i = 0; i < len; i++) {
            if (contactArray[i].selected)
                returnArray.push({ name: contactArray[i].name, email: contactArray[i].email });
        }
        return returnArray;
    }
    var getSelectedContactsNew = function () {
        var result= "";
        var len = contactArray.length;
        for (var i = 0; i < len; i++) {
            if (contactArray[i].selected)
                result = result + contactArray[i].email+";"               
        }
        return result;
    }
    var getAllContacts = function() {
        var returnContactArray = [];
        var len = contactArray.length;
        for (var i = 0; i < len; i++)
            returnContactArray.push({ name: contactArray[i].name, email: contactArray[i].email });
        return returnContactArray;
    }
    var getService = function() {
        return selectedService;
    }
    var getUnSelectedContacts = function() {
        var returnArray = [];
        var len = contactArray.length;
        for (var i = 0; i < len; i++) {
            if ((contactArray[i].selected == false) || (contactArray[i].selected == undefined))
                returnArray.push({ name: contactArray[i].name, email: contactArray[i].email });
        }
        return returnArray;
    }
    var send = function() {
        sendFunction();
    }
    var init = function(pop) {
        if (pop) {
            if (pop.popup)
                popup = pop.popup;
            if (pop.send)
                sendFunction = pop.send;
        }
        if (popup == true) {
            $("#popupcontainer").css("position", "absolute");
            $(".generic_dialog_popup").draggable({ cancel: '.tpl-service-list,.textclass,.stesgrid' });
            addAlwaysScrollTop();
            $(".closeboxholder").show();
        }
        else {
            $("#popupcontainer").css("position", "relative");
            $(".closeboxholder").hide();
        }
        $(".contacts-tpl .tpl-error-message").hide();
        $(".contacts-tpl .tpl-login").css("padding-bottom", "0px");
        $(".contacts-tpl .tpl-loading").show().find(".loading-content").html("Loading contacts...");
        addRequiredDom();
        $(".contacts-tpl .selected-contacts").html("Selected (0)");
        $(".contacts-tpl .all-contacts").html("All (" + contactArray.length + ")");

        $(".contacts-tpl .tpl-login").css("padding-bottom", "10px");
        $(".contacts-tpl .tpl-default").hide();
        $(".contacts-tpl .tpl-login-bar").unbind("click");
        $(".contacts-tpl .tpl-login-bar").click(function() {
            $(this).hide();
            contactGrabber.refresh("");
            $(".contacts-tpl .tpl-service-list").hide();
        });
        $(".contacts-tpl .sendBtn").unbind("click");
        $(".contacts-tpl .sendBtn").click(function() {
            contactGrabber.send();
        });
        $(".contacts-tpl .tpl-grab-contacts").unbind("click");
        $(".contacts-tpl .tpl-grab-contacts").click(function() {
            contactGrabber.grabContacts();
        });
        $(".contacts-tpl .tpl-service-list ul li").unbind("click");
        $(".contacts-tpl .tpl-service-list ul li").bind({
            click: function() {
                contactGrabber.auth($(this).attr("service"), true);
                $(".contacts-tpl .tpl-service-list").hide();
            }
        });
        $(".contacts-tpl .tpl-header-icon").unbind("mouseover mouseout click");
        $(".contacts-tpl .tpl-header-icon").bind({
            mouseover: function() {
                $(this).find(".service-icon").addClass("service-icon-hover");
            },
            mouseout: function() {
                $(this).find(".service-icon").removeClass("service-icon-hover");
            },
            click: function() {
                $(".contacts-tpl .tpl-service-list").show();
            }
        });
        $(".contacts-tpl .tpl-login-wrapper,.contacts-tpl .tpl-login-outlook,.contacts-tpl .stesgrid").unbind("click");
        $(".contacts-tpl .tpl-login-wrapper,.contacts-tpl .tpl-login-outlook,.contacts-tpl .stesgrid").click(function() {
            $(".contacts-tpl .tpl-service-list").hide();
        });
        $(".contacts-tpl .tpl-loading").hide();
    }
    ///Purpose: brings the popup to the screen display
    var addAlwaysScrollTop = function() {
        jQuery(function() {
            var offset = jQuery("#popupcontainer .generic_dialog_popup").offset();
            var topPadding = 25;
            jQuery(window).scroll(function() {
                if (jQuery(window).scrollTop() > offset.top) {
                    jQuery("#popupcontainer .generic_dialog_popup").stop().animate({
                        marginTop: jQuery(window).scrollTop() - offset.top + topPadding
                    });
                } else {
                    jQuery("#popupcontainer .generic_dialog_popup").stop().animate({
                        marginTop: 0
                    });
                };
            });
        });
    }
    ///Purpose: show overlay to the popup
    var overlay = function(a, b) {
        var el = document.getElementById("overlay");
        var visiblevalue = "visible";
        if (a == "hidden")
            visiblevalue = "hidden";
        else
            visiblevalue = "visible";
        if (visiblevalue == "hidden") {
            if (b == "popup")
                $("#popupcontainer").fadeOut(500);
            else {
                if (document.getElementById("popupcontainer") != null)
                    $("#popupcontainer").fadeOut(500);
            }
        }
        else {
            if (b == "popup") {
                checkeditoralignment(710, 650, b);
                $("#popupcontainer").fadeIn(500, function() {
                    checkeditoralignment(710, 650, b);
                });
            }

        }
        el.style.visibility = visiblevalue;
    }
    ///Purpose: calculate and apply the overlay for the full screen
    function checkeditoralignment(w, h, t) {
        var windowWidth = 0;
        if (typeof (window.innerWidth) == 'number') {
            windowWidth = window.innerWidth;
        }
        else {
            if (document.documentElement && document.documentElement.clientWidth) {
                windowWidth = document.documentElement.clientWidth;
            }
            else {
                if (document.body && document.body.clientWidth) {
                    windowWidth = document.body.clientWidth;
                }
            }
        }
        var windowHeight = 0;
        if (typeof (window.innerHeight) == 'number') {
            windowHeight = window.innerHeight;
        }
        else {
            if (document.documentElement && document.documentElement.clientHeight) {
                windowHeight = document.documentElement.clientHeight;
            }
            else {
                if (document.body && document.body.clientHeight) {
                    windowHeight = document.body.clientHeight;
                }
            }
        }
        var _docHeight = 800;
        try {
            _docHeight = (document.height != undefined) ? document.height : document.body.offsetHeight;
        } catch (e)
          { }
        var divwindiwwidth = w;
        var alpha = windowWidth / 2;
        var beta = divwindiwwidth / 2;
        var screenleft = alpha - beta;
        var divwindiwheight = h;
        var hei_x = windowHeight / 2;
        var hei_y = divwindiwheight / 2;
        var screentop = hei_x - hei_y;
        if (t == "popup") {
            if (document.getElementById("popupcontainer") != null) {
                document.getElementById("popupcontainer").style.left = screenleft + "px";
                document.getElementById("popupcontainer").style.top = screentop + "px";
                document.getElementById("overlay").style.height = _docHeight + "px";
            }
        }
    }
    ///Purpose: close the overlay
    var closewindow = function() {
        overlay("hidden", 'popup');
    }
    return {
        init: init,
        loadContacts: loadContacts,
        selectRow: rowSelect,
        refresh: refresh,
        getSelectedContacts: getSelectedContacts,
        getSelectedContactsNew: getSelectedContactsNew,
        getAllContacts: getAllContacts,
        getUnSelectedContacts: getUnSelectedContacts,
        grabContacts: grabContacts,
        auth: auth,
        displayContacts: displayContacts,
        load: all,
        getSelectedService: getService,
        storeAnalytics: storeAnalytics,
        overlay: overlay,
        closewindow: closewindow,
        send: send,
        reset: resetSelection
      
    }

})();
