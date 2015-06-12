var _cmt = [];

getCmt = function (id) {
    
    if (isNaN(id))
        id = id();
    _c = _cmt["_" + id];
    
   // if (_c == null || _c == undefined) {
        _c = new loadComments(id);
        _cmt["_" + id] = _c;
   // }
    return _c;
}
getCmt1 = function (id) {

    if (isNaN(id))
        id = id();
    _c = _cmt["_" + id];

     if (_c == null || _c == undefined) {
    _c = new loadComments(id);
    _cmt["_" + id] = _c;
    }
    return _c;
}
loadComments = function (id) {
    var _self = this;
    var cmtPages = 0

    if (isNaN(id))
        id = id();

    var commentsViewModel = function () {
        var self = this;
        self.activities = ko.observableArray([]);     
        self.addAct = function (act) { self.activities.push(act); };
        self.addActAt = function (act, idx) { self.activities.splice(idx, 0, act); };
        self.clear = function () { self.activities.removeAll(); };
    }

    var commentsModel = new commentsViewModel();
    var ele = $("#_comments" + id).next().children(0).get(0);
  
    if (ele == undefined) return;
    ko.applyBindings(commentsModel, ele);

    this.getComments = function () {

        var v = alert;

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results, true)) {
                displayComments(results.Results);
                //truncate();
                $(".nd-comment").showMin();
                bindCommentBox($("#_comments" + id).parent());
               
            }
        }

        GetComments(scsHdlr, null, getUser().UserKey, 0, id, getTeam(), getEvent());
    }

    var displayComments = function (data) {
        for (var d in data) {
            data[d].Description = commenttruncate(data[d].Description);
            //alert(data[d].Description);
            var model = ko.mapping.fromJS(data[d]);
            commentsModel.addAct(model);
        }
    }

    this.shareComment = function (msg) {

        msg = replaceTextWithHTMLLinks(msg);

        scsHdlr = function (result) {            
            var results = getJson(result);
            if (valid(results)) {
                var model = ko.mapping.fromJS(results.Results[0])
                commentsModel.addAct(model);
            }
        }

        ShareComment(scsHdlr, errHdlr, getUser().UserKey, msg, id, getTeam(), getEvent());
    }

}

bindCommentBox = function (selector) {
    $(" .commentsBoxes", selector).keypress(function (event) {
        if (event.which == 13) {            
            event.preventDefault();
            $(this).focus();
            var id = $(this).parents(".info-comment").find('input[type=hidden]').val();           
            var txt = $(this).val();
            l = getCmt1(eval(id));
            l.shareComment(txt);
            $(this).val("");
        }
    });
}

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
                var html = c + '<span class="moreelipses">' + ellipsestext + '</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelinkb">' + moretext + '</a></span>';
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



(function ($) {
    var size = 3;
    $.fn.showMin = function () {
        this.each(function () {           
            var self = $(this);
            var eles = $(".in-nd-comment>Div", self);
            if (eles.length > size) {

                if ($(">div.marker", self).get(0) != undefined)
                    $(">div.marker", self).remove();

                var more = eles.length - size;
                var moreMessage = "Show " + more + " more message(s)";
                var hideMessage = "Less Messages";
                var marker = $("<div class='marker row-comment text-center'><a class='show-all-comment' href=javascript:;>" + moreMessage + "</a><div>");

                self.s = function () { eles.not(function (i) { return i > (more-1) }).hide() };


                $(marker).bind('click', function (e) {

                    if ($(">a", marker).text() == hideMessage) {
                        self.s();
                        $(">a", marker).text(moreMessage);
                        $(">a", marker).removeClass('show-all-comment1');
                        $(">a", marker).addClass('show-all-comment');
                    }
                    else {
                        eles.show();
                        $(">a", marker).text(hideMessage);
                        $(">a", marker).removeClass('show-all-comment');
                        $(">a", marker).addClass('show-all-comment1');
                    }
                });

                self.prepend(marker);
                self.s();
            }
        });
    };
})(jQuery);

postComment = function (fm) {    
    var id = fm[0].value;
    var txt = fm[1].value;
    l = getCmt1(eval(id));
    l.shareComment(txt);
    fm[1].value = '';
    return false;
}

