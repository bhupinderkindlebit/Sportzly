var actPages = 0
var _type = 0;

ko.bindingHandlers.stopBindings = {
    init: function () {
        return { controlsDescendantBindings: true };
    }
};

function activitiesViewModel() {
    var self = this;
    self.activities = ko.observableArray([]);
    self.addAct = function (act) { self.activities.push(act); }
    self.addActAt = function (act, idx) { self.activities.splice(idx, 0, act); }
    self.remActivity = function (act) { deleteActivity(act.Id()); self.activities.remove(act); }
    self.clear = function () {
        //for (item in self.activities)
        self.activities.removeAll();
    }
}

var activitiesModel = new activitiesViewModel();

ko.applyBindings(activitiesModel, $('div.member-comment').get(0));


commenttruncate = function (content) {

    var showChar = 190;
    var showMoreChar = 400;
    var ellipsestext = "...";
    var moretext = "See More";
    var lesstext = "See Less";
    var i = 0;




    if ($.trim(content).toLowerCase().indexOf(">http://www.youtube.com/watch?v=") >= 0) {
        var i = content.indexOf(">http://www.youtube.com/watch?v=");
        var videoId = content.substr(i + 32).replace("</a>", "");
        content = ReplaceAll(content, "http://www.youtube.com/watch?v=" + videoId);
        content = content.replace('<a target="_blank" href=""></a>', '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
        content = content.replace('<a href="" target="_blank"></a>', '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
        content = content.replace("<a target='_blank' href=''></a>", '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
        content = content.replace("<a href='' target='_blank'></a>", '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
        return content;
    }
    else if ($.trim(content).toLowerCase().indexOf("http://www.youtube.com/watch?v=") >= 0) {
        var i = content.indexOf("http://www.youtube.com/watch?v=");
        var videoId = content.substr(i + 31);
        content = content.replace("http://www.youtube.com/watch?v=" + videoId, '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
        return content;
    }
    else if ($.trim(content).toLowerCase().indexOf(">http://youtu.be/") >= 0) {
        var i = content.indexOf(">http://youtu.be/");
        while (i > 0) {
            var j = content.indexOf("</a>");
            var videoId = content.substr(i + 17, j - (i + 17));
            content = ReplaceAll(content, "http://youtu.be/" + videoId);
            content = content.replace('<a target="_blank" href=""></a>', '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
            content = content.replace('<a href="" target="_blank"></a>', '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
            content = content.replace("<a target='_blank' href=''></a>", '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
            content = content.replace("<a href='' target='_blank'></a>", '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
            i = content.indexOf(">http://youtu.be/");
        }

        return content;
    }
    else if ($.trim(content).toLowerCase().indexOf("http://youtu.be/") >= 0) {
        var i = content.indexOf("http://youtu.be/");
        var videoId = content.substr(i + 16);
        content = content.replace("http://youtu.be/" + videoId, '<iframe title="YouTube video player" class="youtube-player" type="text/html" width="350" height="220" frameborder="0"  src=http://www.youtube.com/embed/' + videoId + ' allowfullscreen></iframe>');
        return content;
    }
    else {
        if (content.length > showChar) {
            var c = content.substr(0, showChar);
            if (c.indexOf("<a") == -1 && c.indexOf("<iframe") == -1) {
                var h = content.substr(showChar, content.length - showChar);
                var html = c + '<span class="moreelipses">' + ellipsestext + '</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelinka">' + moretext + '</a></span>';
                return html;
            }
            else {
                return content;
            }
        }
        else {
            return content;
        }

    }

}
function ReplaceAll(FieldValue, Delimiter) {
    var DelimiterIndex;

    DelimiterIndex = FieldValue.indexOf(Delimiter);

    while (DelimiterIndex != -1) {

        FieldValue = FieldValue.replace(Delimiter, "")
        DelimiterIndex = FieldValue.indexOf(Delimiter);
    }

    return FieldValue;
}

getActivities = function () {

    var user = getUserEmail();

    scsHdlr = function (result) {

        var results = getJson(result);

        if (valid(results)) {

            displayActivities(results.Results);
            // truncate();
            if (results.RemainingResult == undefined || results.RemainingResult > 0) {
                $('.showmore').show();
                $(".footer-content-streams").show();
            }
            else {
                $('.showmore').hide();
                $(".footer-content-streams").hide();
            }
            //var ellipsestext = "...";
            //var moretext = "See More";
            //var lesstext = "See Less";
            //$(".morelinka").click(function () {
            //    if ($(this).hasClass("less")) {
            //        $(this).removeClass("less");
            //        $(this).html(moretext);
            //    } else {
            //        $(this).addClass("less");
            //        $(this).html(lesstext);
            //    }
            //    $(this).parent().prev().toggle();
            //    $(this).prev().toggle();
            //    return false;
            //});
            //if (results.Results.length == 0) {
            //    if (user != null) {
            //        scsHdlrr = function (result) {
            //            var results = getJson(result);

            //            if (results.ResultError.Message == "1")
            //            {
            //                $.colorbox({
            //                    href: "message.aspx", iframe: true, height: '230', width: "420"
            //                });
            //                //if ($.cookie('__skip') === null || ($.cookie('__skip') === undefined)) {  // if expired / non-existent
            //                //    window.location.href = "welcome.aspx";
            //                //    return false;
            //                //}                          

            //            }
            //        }

            //        CheckUser(scsHdlrr, errHdlr, getUser().UserKey, getUserEmail(), getTeam());
            //    }
            //    else if (getTeam() > 0) {
            //        scsHdlrr = function (result) {
            //            var results = getJson(result);
            //            if (results.ResultError.Message == "1") {
            //                $.colorbox({
            //                    href: "message.aspx", iframe: true, height: '230', width: "420"
            //                });

            //                //if ($.cookie('__skip') === null || ($.cookie('__skip') === undefined)) {  // if expired / non-existent
            //                //    window.location.href = "welcome.aspx";
            //                //    return false;
            //                //}

            //            }
            //        }

            //        CheckUser(scsHdlrr, errHdlr, getUser().UserKey, getUserEmail(), getTeam());
            //    }
            //    else {
            //        $.colorbox({
            //            href: "message.aspx", iframe: true, height: '230', width: "420"
            //        });
            //        //if ($.cookie('__skip') === null || ($.cookie('__skip') === undefined)) {  // if expired / non-existent
            //        //    window.location.href = "welcome.aspx";
            //        //    return false;
            //        //}
            //    }
            //}
        }
    }
    actPages = parseInt(activitiesModel.activities().length);
    GetActivities(scsHdlr, errHdlr, getUser().UserKey, actPages, user, _type, getTeam(), getEvent());
}

displayActivities = function (data) {
    for (var d in data) {
        data[d].Description = commenttruncate(data[d].Description);
        var model = ko.mapping.fromJS(data[d]);
        activitiesModel.addAct(model);
    }
}

$(document).ready(getActivities);

cmts = function (data, event) {
    var event = event || window.event;
    var target = event.originalEvent.target || event.originalEvent.srcElement;
    var idx = $('.left-comment>img.button').index($(target));
    $('.nd-comment').eq(idx).toggle('fast');
}

deleteActivity = function (id) {
    DeleteActivity(null, null, getUser().UserKey, id);
}

$(".menu-streams a").click(function () {
    var self = $(this);
    setActivityType(self.text());
    activitiesModel.clear();
    var _cmt = [];
    getActivities();
});

setActivityType = function (typeText) {
    switch (typeText) {
        case "Videos":
            _type = 2;
            break;
        case "Overview":
            _type = 0;
            break;
        case "Documents":
            _type = 4;
            break;
        case "Quotes":
            _type = 1;
            break;
        case "Photos":
            _type = 3;
            break;
    }
}
