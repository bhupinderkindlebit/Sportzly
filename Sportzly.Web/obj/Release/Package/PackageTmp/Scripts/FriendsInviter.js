
/*----------------------------------------*/
/* Copy right @ StesCodes Friends Inviter */
/*----------------------------------------*/

var friendsInviter = (function() {
    var selectedContacts = {}, autoCompletePreData = {}, autoCompleteData = [], selectedService = "", popup = false, sendFunction = function() { };
    var services = { twitter: { name: "twitter", type: "oAuth", icon: "twitter_logo.png" },
        facebook: { name: "facebook", type: "oAuth", icon: "facebook_logo.png" }
    }
    ///Purpose: Bind friends details
    ///syntax: generateFriendsList(<(array)-list of friends>,<(string)- selected || all>)
    var generateFriendsList = function(contactsList, type) {
        var len = contactsList.length;
        var friendsListDom = "";
        for (var i = 0; i < len; i++) {
            var listData = "";
            listData += "<li data=\"" + contactsList[i].id + "\" " + ((contactsList[i].selected) ? "class=\"tpl-contacts-li-select\"" : "") + ">";
            listData += "<div class=\"tpl-contacts-holder fl\" title=\"" + contactsList[i].name + "\">";
            listData += "<div class=\"fl tpl-left\"><img src=\"" + contactsList[i].img + "\" /></div>";
            listData += "<div class=\"fl tpl-right\">";
            listData += "<div class=\"tpl-right-inner\">" + contactsList[i].name + "</div>";
            listData += "</div></div></li>";
            if (type == "selected" && contactsList[i].selected) {
                friendsListDom += listData;
                addRefObj(contactsList[i], contactsList[i].selected);
            }
            else if (type == "all") {
                friendsListDom += listData;
                addRefObj(contactsList[i], contactsList[i].selected);
            }
        }
        if (len == 0)
            $(".inviter-tpl .tpl-contacts").addClass(((type == "all") ? "tpl-noresultsfound" : "tpl-nofriendsselected"));
        else
            $(".inviter-tpl .tpl-contacts").removeClass("tpl-noresultsfound").removeClass("tpl-nofriendsselected");
        $(".inviter-tpl .tpl-contacts-list").html(friendsListDom);
        if ($(".inviter-tpl .tpl-contacts-li-select").length > 0)
            $(".inviter-tpl .tpl-contacts-li-select").append("<div class=\"tpl-contacts-li-select-iconholder posrel\"><div class=\"tpl-contacts-li-select-icon posabs\"></div></div>");
        $(".inviter-tpl .selected-contacts").html("selected (0)");
        autoComplete(contactsList);
        attachEventhandler();
        $('body,html').animate({
            scrollTop: 570
        }, 800)
    }
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
        for (var key in availableTagObj) {
            if (availableTagObj.hasOwnProperty(key)) {
                availableTags.push(availableTagObj[key]);
            }
        }
        $(".inviter-tpl .searchTxt").autocomplete({
            source: function(request, response) {
                var results = $.ui.autocomplete.filter(availableTags, request.term);
                response(results.slice(0, 8));
            },
            select: function(event, ui) {
                showsearch(ui.item.value);
            }
        });
    }
    ///Purpose: transform array into object
    ///Syntax: preinitialize(<(array) - friends list>)
    var preinitialize = function (contactsList) {
       
        var len = contactsList.length;
        for (var i = 0; i < len; i++) {
            addRefObj(contactsList[i], contactsList[i].selected);
        }
    }

    ///Purpose: attach the event handler for the search textbox
    ///Syntax: listener(<(event) - events >
    var listener = function(e) {
        var code;
        if (!e) var e = window.event;
        if (e.keyCode) code = e.keyCode;
        else if (e.which) code = e.which;
        if (code == 13) {//If enter key is pressed, the if condition will be executed
            friendsInviter.showsearch($(".inviter-tpl .searchTxt").val());
            return false;
        }
    }

    ///Purpose: add the header and contacts wrapper at init
    ///Syntax: addRequiredDom()
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
        headerDOM += "<div class=\"fr marRight10 selected-contacts tpl-default\">Selected</div>";
        headerDOM += "<div class=\"fr marRight10 all-contacts tpl-default\">All</div>";
        headerDOM += "<div class=\"fr marRight10 clear-contacts tpl-default\">Clear</div>";
        headerDOM += "<div class=\"fr marRight10 tpl-default\">";
        headerDOM += "<input type=\"text\" id=\"txtsearch\" onkeydown=\"javascript:return friendsInviter.listener(event)\" onclick=\"friendsInviter.showAll();\" autocomplete=\"off\" class=\"ac_input searchTxt textclass\">";
        headerDOM += "</div>";
        headerDOM += "<div class=\"fr marRight10 tpl-default\">Search </div>";
        headerDOM += "</div>";
        var bodyDom = "<div class=\"tpl-contacts-wrapper\"><ul class=\"tpl-contacts-list\"></ul></div>";
        $(".inviter-tpl .tpl-header").html(headerDOM);
        $(".inviter-tpl .tpl-contacts").html(bodyDom);
        //$(".inviter-tpl .tpl-footer").after("<div class=\"tpl-ad fl fullWid\"><div class=\"fr powered\"><span>Powered by </span><span><a href=\"http://stescodes.com/invitefriends.aspx\" target=\"_blank\">StesCodes.com</a></span></div></div>");
    }

    ///Purpose: add new object to the collection
    ///Syntax: addRefObj(<(object)>,<(bool) - selected or not>)
    var addRefObj = function(data, boolVal) {
        if (selectedContacts[data.id] == undefined) {
            selectedContacts[data.id] = {};
            selectedContacts[data.id].selected = boolVal;
            selectedContacts[data.id].id = data.id;
            selectedContacts[data.id].img = data.imageurl;
            selectedContacts[data.id].name = data.name;
        }
    }

    ///Purpose: select a friend
    ///Syntax: select(<(dom)-clicked li>)
    var select = function(me) {
        var id = me.attr("data");
        selectedContacts[id] = {};
        selectedContacts[id].selected = true;
        selectedContacts[id].id = id;
        selectedContacts[id].img = me.find("img").attr("src");
        selectedContacts[id].name = me.find(".tpl-contacts-holder").attr("title");
        $(".inviter-tpl .selected-contacts").html("selected (" + (getSelectionCount() + 1) + ")");
    }

    ///Purpose: deselect a friend
    ///Syntax: deSelect(<(dom)-clicked li>)
    var deSelect = function(me) {
        var id = me.attr("data");
        selectedContacts[id].selected = false;
        $(".inviter-tpl .selected-contacts").html("selected (" + (getSelectionCount() - 1) + ")");
    }

    ///Purpose: get the selection count
    ///Syntax: getSelectionCount()
    var getSelectionCount = function() {
        var str = $(".inviter-tpl .selected-contacts").html();
        return parseInt(str.substring(str.indexOf("(") + 1, str.indexOf(")")));
    }

    ///Purpose: Attach event handlers
    ///Syntax: attachEventhandler()
    var attachEventhandler = function() {
        //Events of friends list
        $(".inviter-tpl .tpl-contacts-holder").unbind("click mouseover mouseout");
        $(".inviter-tpl .tpl-contacts-holder").bind({
            mouseover: function() {
                $(this).closest("li").addClass("tpl-contacts-li-hover");
            },
            mouseout: function() {
                $(this).closest("li").removeClass("tpl-contacts-li-hover");
            },
            click: function() {
                var target = $(this).closest("li");
                if (target.hasClass("tpl-contacts-li-select")) {
                    friendsInviter.deSelect(target);
                    target.removeClass("tpl-contacts-li-select").removeClass("tpl-contacts-li-hover").find(".tpl-contacts-li-select-iconholder").remove();
                }
                else {
                    if (selectedService == "facebook") {
                        //$(".tpl-contacts-li-select").closest("li").each(function() {
                        //    var newtarget = $(this);
                        //    friendsInviter.deSelect(newtarget);
                        //    newtarget.removeClass("tpl-contacts-li-select").removeClass("tpl-contacts-li-hover").find(".tpl-contacts-li-select-iconholder").remove();
                        //});
                        friendsInviter.select(target);
                        target.addClass("tpl-contacts-li-select");
                        target.append("<div class=\"tpl-contacts-li-select-iconholder posrel\"><div class=\"tpl-contacts-li-select-icon posabs\"></div></div>");
                    }
                    else {
                        friendsInviter.select(target);
                        target.addClass("tpl-contacts-li-select");
                        target.append("<div class=\"tpl-contacts-li-select-iconholder posrel\"><div class=\"tpl-contacts-li-select-icon posabs\"></div></div>");
                    }
                }

            }
        });

        //selected contacts link click
        $(".inviter-tpl .selected-contacts").unbind("click");
        $(".inviter-tpl .selected-contacts").click(function() {
            friendsInviter.showSelected();
        });

        //all contacts link click
        $(".inviter-tpl .all-contacts").unbind("click");
        $(".inviter-tpl .all-contacts").click(function() {
            friendsInviter.showAll();
        });

        //clear selection link click
        $(".inviter-tpl .clear-contacts").unbind("click");
        $(".inviter-tpl .clear-contacts").click(function() {
            friendsInviter.clearSelection();
        });

        //send message button click
        $(".inviter-tpl .sendBtn").unbind("click");
        $(".inviter-tpl .sendBtn").click(function() {
            var fids = [];
            var fndData = friendsInviter.getSelected();
            var len = fndData.length;
            if (len > 0) {
                $(".inviter-tpl .ui-send-loading").show();
                for (var i = 0; i < len; i++)
                    fids.push(fndData[i].id);
                fids = fids.join(",");
                sendFunction(fids, selectedService);
            }
            else {
                alert("Please select atleast one friend.");
            }
        });
    }

    var storeSendAnalytics = function(contacts, service) {

    }
    ///Purpose: message sent status
    ///Syntax: messageSent(<(string) - type>)
    var messageSent = function(obj) {
        $(".inviter-tpl .ui-send-loading").hide();
        if (obj.error == "") {
            storeSendAnalytics(getSelectedContacts(), selectedService);
            clearSelection();
            alert(obj.status);
        }
        else {
            alert(obj.error);
        }
    }

    var getSelectedService = function() {
        return selectedService;
    }
    var getFriends = function() {
        return selectedContacts;
    }
    ///Purpose: clear all friends selection
    ///Syntax: clearSelection()
    var clearSelection = function() {
        var selectedContactList = []
        for (var key in selectedContacts) {
            if (selectedContacts.hasOwnProperty(key)) {
                selectedContacts[key].selected = false;
            }
        }
        $(".inviter-tpl .tpl-contacts-li-select-iconholder").remove();
        $(".inviter-tpl .tpl-contacts-li-select").each(function() {
            $(this).removeClass("tpl-contacts-li-select");
        });
        $(".inviter-tpl .selected-contacts").html("selected (0)");
    }

    ///Purpose: show all contacts
    ///Syntax: showAll()
    var showAll = function() {
        var selectedContactList = [], selCount = 0;
        for (var key in selectedContacts) {
            if (selectedContacts.hasOwnProperty(key)) {
                if (selectedContacts[key].selected)
                    selCount++;
                selectedContactList.push({ name: selectedContacts[key].name, id: selectedContacts[key].id, img: selectedContacts[key].img, selected: ((selectedContacts[key].selected) ? true : false) });
            }
        }
        generateFriendsList(selectedContactList, "all");
        $(".inviter-tpl .selected-contacts").html("selected (" + selCount + ")");
    }

    ///Purpose: get selected contacts
    ///Syntax: getSelectedContacts()
    var getSelectedContacts = function() {
        var selectedContactList = []
        for (var key in selectedContacts) {
            if (selectedContacts.hasOwnProperty(key)) {
                if (selectedContacts[key].selected)
                    selectedContactList.push({ name: selectedContacts[key].name, id: selectedContacts[key].id, img: selectedContacts[key].img, selected: ((selectedContacts[key].selected) ? true : false) });
            }
        }
        return selectedContactList;
    }


    var getSelected = function() {
        var selectedContactList = [];
        autoCompleteData = [];
        for (var key in selectedContacts) {
            if (selectedContacts.hasOwnProperty(key)) {
                selectedContactList.push({ name: selectedContacts[key].name, id: selectedContacts[key].id, img: selectedContacts[key].img, selected: ((selectedContacts[key].selected) ? true : false) });
                if ($.trim(selectedContacts[key].name).indexOf(" ") != -1) {
                    var thisData = selectedContacts[key].name.split(" ");
                    var len = thisData.length;
                    for (var i = 0; i < len; i++) {
                        if (autoCompletePreData[thisData[i]] == undefined) {
                            autoCompletePreData[thisData[i]] = thisData[i];
                        }
                    }
                }
                else {
                    if (autoCompletePreData[selectedContacts[key].name] == undefined) {
                        autoCompletePreData[selectedContacts[key].name] = selectedContacts[key].name;
                    }
                }
            }
        }
        for (var key in autoCompletePreData) {
            if (autoCompletePreData.hasOwnProperty(key)) {
                if (autoCompletePreData[key])
                    autoCompleteData.push(autoCompletePreData[key]);
            }
        }
        return selectedContactList;
    }

    ///Purpose: show selected friends
    var showSelected = function() {
        var selectedContactList = []
        for (var key in selectedContacts) {
            if (selectedContacts.hasOwnProperty(key)) {
                if (selectedContacts[key].selected)
                    selectedContactList.push({ name: selectedContacts[key].name, id: selectedContacts[key].id, img: selectedContacts[key].img, selected: ((selectedContacts[key].selected) ? true : false) });
            }
        }
        generateFriendsList(selectedContactList, "selected");
        $(".inviter-tpl .selected-contacts").html("selected (" + selectedContactList.length + ")");
    }
    var showsearch = function(selVal) {
        selVal = selVal.replace("</strong>", "");
        selVal = selVal.replace("<strong>", "");
        var selectedContactList = [], selCount = 0;
        for (var key in selectedContacts) {
            if (selectedContacts.hasOwnProperty(key)) {
                if (selectedContacts[key].name.toLowerCase().indexOf(selVal.toLowerCase()) != -1)
                    selectedContactList.push({ name: selectedContacts[key].name, id: selectedContacts[key].id, img: selectedContacts[key].img, selected: ((selectedContacts[key].selected) ? true : false) });
                if (selectedContacts[key].selected)
                    selCount++;
            }
        }
        generateFriendsList(selectedContactList, "all");
        $(".inviter-tpl .selected-contacts").html("selected (" + selCount + ")");
    }
    var auth = function(pagename, signature) {
        if (popup == true)
            friendsInviter.overlay("visible", "popup");
        $("#popupFIcontainer").show();
        selectedService = pagename;
        $(".inviter-tpl .tpl-loading").html("Please authorize your account...").removeClass("nobg error");
        $(".inviter-tpl").show();
        $(".inviter-tpl .tpl-loading").show();
        $(".inviter-tpl .tpl-default").hide();
        selectedContacts = {};
        $(".inviter-tpl .tpl-header-icon img").attr("src", "images/" + pagename + "_logo.png");
        if (pagename == "facebook")
            loginfbuser();
        else
            window.open("oauth.aspx?currpage=" + pagename + "&signature=" + signature, "mywindow", "location=1,status=1,scrollbars=1,width=700,height=400");
    }
    var fetchLoading = function() {
        $(".inviter-tpl .tpl-loading").html("Fetching friends...");
    }

    var displayError = function(errMsg) {
        $(".inviter-tpl .tpl-loading").html("Error: " + errMsg).addClass("nobg error");
        $(".inviter-tpl").show();
        $(".inviter-tpl .tpl-loading").show();
        $(".inviter-tpl .tpl-default").hide();
    }

    var load = function (friendsDetails) {
        
        $(".inviter-tpl .tpl-loading").hide();
        $(".inviter-tpl .tpl-default").show();
        $(".inviter-tpl .all-contacts").html("All (" + friendsDetails.friends.length + ")");
        if (friendsDetails.error != "") {
            displayError(friendsDetails.error);
        }
        else {

            preinitialize(friendsDetails.friends);
            generateFriendsList(getSelected(), "all");
            //if (selectedService == "") {
            //    selectedService = 'twitter';
            //}
            //storeGrabAnalytics(friendsDetails.friends, selectedService);
        }

    }
    var storeGrabAnalytics = function(friendsArray, service) {
    }

    var init = function(pop) {
        addRequiredDom();
        if (pop) {
            if (pop.popup)
                popup = pop.popup;
            if (pop.send)
                sendFunction = pop.send;
        }
        if (popup == true) {
            $("#popupFIcontainer").css("position", "absolute");
            $("#popupFIcontainer .generic_dialog_popup").draggable({ cancel: '.tpl-service-list,.textclass,.tpl-contacts,.messageTxt' });
            addAlwaysScrollTop();
            $("#popupFIcontainer .closeboxholder").show();
        }
        else {
            $("#popupFIcontainer").css("position", "relative");
            //$("#popupFIcontainer .generic_dialog_popup").css("position", "relative");
            $("#popupFIcontainer .closeboxholder").hide();
        }
        $(".inviter-tpl .subjectTxt").val("Friends Inviter");
        $(".inviter-tpl .messageTxt").html("Hi, \n                 StesCodes Friends Inviter is so cool, am just playing around it. Am Inviting you to take a look at it, so that you will feel the same. \n                 Visit http://stescodes.com/invitefriends.aspx \n\n- StesCodes.");
        $(".inviter-tpl .tpl-header-icon").unbind("mouseover mouseout click");
        $(".inviter-tpl .tpl-header-icon").bind({
            mouseover: function() {
                $(this).find(".service-icon").addClass("service-icon-hover");
            },
            mouseout: function() {
                $(this).find(".service-icon").removeClass("service-icon-hover");
            },
            click: function() {
                if ($(".inviter-tpl .tpl-service-list:visible").length > 0)
                    $(".inviter-tpl .tpl-service-list").hide();
                else
                    $(".inviter-tpl .tpl-service-list").show();
            }
        });
        $(".inviter-tpl .tpl-service-list ul li").unbind("click");
        $(".inviter-tpl .tpl-service-list ul li").bind({
            click: function() {
                friendsInviter.auth($(this).attr("service"), getFormattedKey());
                $(".inviter-tpl .tpl-service-list").hide();
            }
        });
    }
    var fbinitilize = function (appid, msg) {
        
        window.fbAsyncInit = function () {            
            FB.init({ appId: appid, status: true, cookie: true, xfbml: true, "viewMode": "website" });
        };
        (function() {
            var ef = document.createElement('script'); ef.async = true;
            ef.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
            document.getElementById('fb-root').appendChild(ef);

        } ());
    }
    function loadmyfbfriends() {
        
        FB.api('/me/friends', { fields: 'id,name,picture,username' }, function(result) {
            // resut has the data
            if (result != null) {
                friendsInviter.load({ friends: generateFacebookFriends(result.data), service: "facebook", error: "" });
            }
        });
    }
    function generateFacebookFriends(obj_fb) {
        var fbObj = [], len = obj_fb.length;
        for (var i = 0; i < len; i++) {
            if (obj_fb[i].username != null && obj_fb[i].username != "") {
                fbObj.push({ name: obj_fb[i].name, id: obj_fb[i].username+'@facebook.com', imageurl: obj_fb[i].picture.data.url });
            }
        }
        return fbObj;
    }
    var sendMessageFB = function (friendfb, linksportzly) {
       
        var description = $(".inviter-tpl .messageTxt").text();
        var title = "Sportzly";
        FB.ui({ method: 'send', to: friendfb, name: title, description: description, link: linksportzly, picture: 'http://sportzly.com/images/team/ef30b23a6b734d20a5f6a209bdff4f4d.jpg' },
                 function(response) {
                     if (response == null) {

                     }
                     else {
                         messageSent({ status: "Message sent", error: "", service: "facebook" });
                         friendsInviter.clearSelection();
                     }
                     $(".inviter-tpl .inviter-tpl").show();
                     $(".inviter-tpl .ui-send-loading").hide();
                 });
    }

    var closePopup = function () {
        friendsInviter.clearSelection();
        $(".inviter-tpl .inviter-tpl").show();
        $(".inviter-tpl .ui-send-loading").hide();
    }

    var loadFB = function () {
        
        if (popup == true)
            friendsInviter.overlay("visible", "popup");
        $("#popupFIcontainer").show();
        selectedService = "facebook";
        $(".inviter-tpl .tpl-loading").html("Please authorize your account...").removeClass("nobg error");
        $(".inviter-tpl").show();
        $(".inviter-tpl .tpl-loading").show();
        $(".inviter-tpl .tpl-default").hide();
        selectedContacts = {};
        $(".inviter-tpl .tpl-header-icon img").attr("src", "images/facebook_logo.png");
       
        window.fbAsyncInit = function () {
            FB.init({ appId: 605932659468778, status: true, cookie: true, xfbml: true, "viewMode": "website" });
            FB.login(function (response) {               
                if (response.status == "connected") {
                    fetchLoading();
                    loadmyfbfriends();
                }
            });
        };
        (function () {
            var ef = document.createElement('script'); ef.async = true;
            ef.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
            document.getElementById('fb-root').appendChild(ef);

        }());
       
    }

    var loginfbuser = function() {
        FB.login(function (response) {            
            if (response.status == "connected") {
                fetchLoading();
                loadmyfbfriends();
            }
        });
    }
    var addAlwaysScrollTop = function() {
        jQuery(function() {
            var offset = jQuery("#popupFIcontainer .generic_dialog_popup").offset();
            var topPadding = 25;
            jQuery(window).scroll(function() {
                if (jQuery(window).scrollTop() > offset.top) {
                    jQuery("#popupFIcontainer .generic_dialog_popup").stop().animate({
                        marginTop: jQuery(window).scrollTop() - offset.top + topPadding
                    });
                } else {
                    jQuery("#popupFIcontainer .generic_dialog_popup").stop().animate({
                        marginTop: 0
                    });
                };
            });
        });
    }
    var overlay = function(a, b) {
        var el = document.getElementById("overlay");
        var visiblevalue = "visible";
        if (a == "hidden")
            visiblevalue = "hidden";
        else
            visiblevalue = "visible";
        if (visiblevalue == "hidden") {
            if (b == "popup")
                $("#popupFIcontainer").fadeOut(500);
            else {
                if (document.getElementById("popupFIcontainer") != null)
                    $("#popupFIcontainer").fadeOut(500);
            }
        }
        else {
            if (b == "popup") {
                checkeditoralignment(710, 650, b);
                $("#popupFIcontainer").fadeIn(500, function() {
                    checkeditoralignment(710, 650, b);
                });
            }

        }
        el.style.visibility = visiblevalue;
    }

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
            if (document.getElementById("popupFIcontainer") != null) {
                document.getElementById("popupFIcontainer").style.left = screenleft + "px";
                document.getElementById("popupFIcontainer").style.top = screentop + "px";
                document.getElementById("overlay").style.height = _docHeight + "px";
            }
        }
    }
    var closewindow = function() {
        $(".inviter-tpl").hide();
        overlay("hidden", 'popup');
    }
    ///Public methods
    return {
        auth: auth,
        clearSelection: clearSelection,
        init: init,
        load: load,
        select: select,
        fetchLoading: fetchLoading,
        sendMessageFB: sendMessageFB,
        deSelect: deSelect,
        showSelected: showSelected,
        showAll: showAll,
        showsearch: showsearch,
        messageSent: messageSent,
        listener: listener,
        getSelectedService: getSelectedService,
        getSelected: getSelectedContacts,
        fbinitilize: fbinitilize,
        storeSendAnalytics: storeSendAnalytics,
        storeGrabAnalytics: storeGrabAnalytics,
        overlay: overlay,
        closewindow: closewindow,
        getFriends: getFriends,
        closePopup: closePopup,
        loadFB: loadFB
    }
})();