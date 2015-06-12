var $window = $(window),
  $inner = $('#inner'),
  $carousel = $('#carousel');

var _orientation = 'horizontal',
    _duration = 600,
    _animating = false;
var queryArr = [];
var userPhotosViewModel = function () {
    var self = this;

    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.userEmail = ko.observable();


    self.load = function () {

        self.userEmail = getUserEmail();

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount = results.Results.length;

                var pages = 0;
                if ((self.ResultCount) % 9 == 0) {
                    pages = self.ResultCount / 9;
                }
                else {
                    pages = Math.ceil(self.ResultCount / 9);
                }

                var previd = 0;
                var nextid = 0;
                var str = "";

                if (self.ResultCount <= 9) {
                    str = str + "<div>";
                    for (var j = 0; j < self.ResultCount; j++) {

                        if (j == 0) {
                            previd = 0;
                        }
                        else {
                            previd = results.Results[j - 1].Id;
                        }

                        if (j == self.ResultCount - 1) {
                            nextid = 0;
                        }
                        else {
                            nextid = results.Results[j + 1].Id;
                        }

                        queryArr.push("" + results.Results[j].Id + "");
                        str = str + "<img src='" + results.Results[j].FilePath + "' class='t" + (j + 1) + "' onclick='ViewPhoto(" + previd + "," + results.Results[j].Id + "," + nextid + ");'/>";
                    }
                    str = str + "</div>";
                }
                else {
                    for (var i = 0; i < pages; i++) {
                      
                        if ((i + 1) == pages) {
                            str = str + "<div>";
                            var k = 1;
                            for (j = (i * 9) ; j < results.Results.length; j++) {

                                if (j == 0) {
                                    previd = 0;
                                }
                                else {
                                    previd = results.Results[j - 1].Id;
                                }

                                if (j == self.ResultCount - 1) {
                                    nextid = 0;
                                }
                                else {
                                    nextid = results.Results[j + 1].Id;
                                }
                                str = str + "<img src='" + results.Results[j].FilePath + "' class='t" + ((k)) + "' onclick='ViewPhoto(" + previd + "," + results.Results[j].Id + "," + nextid + ");' />";
                                k = k + 1;
                            }
                            str = str + "</div>";
                        }
                        else {
                            str = str + "<div>";
                            for (var j = 0; j < 9; j++) {

                                var m = j * (i + 1);
                               
                                if (m == 0) {
                                    previd = 0;
                                }
                                else {
                                    previd = results.Results[m - 1].Id;
                                }

                                if (m == self.ResultCount - 1) {
                                    nextid = 0;
                                }
                                else {
                                    nextid = results.Results[m + 1].Id;
                                }

                                queryArr.push("" + results.Results[m].Id + "");

                                str = str + "<img src='" + results.Results[j+(i*9)].FilePath + "' class='t" + (j + 1) + "' onclick='ViewPhoto(" + previd + "," + results.Results[j+(i*9)].Id + ","+ nextid + ");'/>";
                            }
                            str = str + "</div>";
                        }
                        
                    }
                }



                $("#carousel").html(str);
                StartCrousel();
                //for (var d in results.Results) {
                //    //var model = ko.mapping.fromJS(results.Results[d]);
                //    //self.Result.push(model);

                //}

                bindUserPhotos();
            }
        }

        var aid = albumId();

        GetUserPhotosByAlbum(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, getTeam(), parseInt(aid));

        scsHdlrCount = function (result) {
            var results = getJson(result);
            if (valid(results)) {

                self.ResultCount = results.Results.length;
                if (results.Results.length > 0) {
                    $("#ancAlbum").text("Albums (" + results.Results[0].AlbumCount + ")");
                }
                else {
                    $("#ancAlbum").text("Albums (0)");
                }
            }
        }
        GetAlbumCount(scsHdlrCount, errHdlr, getUser().UserKey, self.userEmail, getTeam());

    }

    self.load();
}

var userPhotosModel = new userPhotosViewModel();


bindUserPhotos = function () {
    ko.applyBindings(userPhotosModel, $('.photosList').get(0));

    applSearchFilter(".search-fans", ".phtosListUL>li");

}

function animateThumbs(direction, $item, val, opacity) {
   
    var ani = {
        opacity: opacity
    };
    ani[getMarginProperty()] = val;

    if (direction == 'next') {
        var x1 = '.t1',
            x2 = '.t2, .t4',
            x3 = '.t3, .t5, .t7',
            x4 = '.t6, .t8',
            x5 = '.t9';
    } else {
        var x1 = '.t9',
            x2 = '.t6, .t8',
            x3 = '.t3, .t5, .t7',
            x4 = '.t2, .t4',
            x5 = '.t1';
    }

    $(x1, $item).delay(_duration * 0).animate(ani, _duration);
    $(x2, $item).delay(_duration * 0.25).animate(ani, _duration);
    $(x3, $item).delay(_duration * 0.5).animate(ani, _duration);
    $(x4, $item).delay(_duration * 0.75).animate(ani, _duration);
    $(x5, $item).delay(_duration * 1).animate(ani, _duration);
}
function getMarginProperty() {
    return (_orientation == 'horizontal') ? 'marginLeft' : 'marginTop';
}
function getMargin(direction) {
    var margin = ($window[(_orientation == 'horizontal') ? 'width' : 'height']() / 2) + 210

    if (direction == 'next') {
        margin = -margin;
    }
    return margin;
}
function StartCrousel() {

    $inner.show();

    $carousel.carouFredSel({
        width: '100%',
        height: '100%',
        direction: 'right',
        items: 1,
        auto: false,
        scroll: {
            fx: 'none',
            timeoutDuration: 3000,
            conditions: function (direction) {

                _animating = true;

                if ($carousel.hasClass('prepared')) {
                    $carousel.removeClass('prepared');
                    return true;
                }

                $carousel.addClass('prepared');

                animateThumbs(direction, $carousel.children().first(), getMargin(direction), 0);

                setTimeout(
                    function () {
                        $carousel.trigger(direction);
                    }, _duration + 800
                );

                return false;
            },
            onBefore: function (data) {
                var direction = data.scroll.direction;
               
                var css = {
                    opacity: 0
                };
                css[getMarginProperty()] = -getMargin(direction);

                $('img', data.items.visible).css(css);
                animateThumbs(direction, data.items.visible, 0, 1);
            },
            onAfter: function (data) {
                data.items.old.children().css({
                    'marginLeft': 0,
                    'marginTop': 0
                });

                setTimeout(
                    function () {
                        _animating = false;
                    }, _duration + 800
                );
            }
        }
    });

    $('#left, #right').click(function () {
        if (_animating) {
            return false;
        }
        var direction = this.id,
            scroll = (direction == 'right') ? 'next' : 'prev',
            newOrientation = (direction == 'up' || direction == 'down') ? 'vertical' : 'horizontal';
        
        if (_orientation != newOrientation) {
            _orientation = newOrientation;
            $inner.toggleClass('horizontal').toggleClass('vertical');
            $carousel.trigger('configuration', ['direction', direction]);
        }
        $carousel.trigger(scroll);

        return false;
    });
}
function DisplayComments(data) {
    var comment = "";
    for (var d in data) {
        comment = comment + '<div style="margin-top: 20px">';
        comment = comment + '<img class="img-in-nd-comment" alt="" src="' + data[d].Owner.ProfileFoto + '" height="50px" style="float: left; margin-left: 10px" />';
        comment = comment + ' <a href="profile.aspx"><span class="name-comment" style="float: left; margin-left: 10px; width: 79%;">' + data[d].Owner.DisplayName + '</span></a>'
        comment = comment + '<p class="left-comment-text" style="float: left; margin-left: 10px; width: 75%;">';
        comment = comment += '' + data[d].Description + '';
        comment = comment + '</p>';
        comment = comment + '<a href="#"><span class="button button2" style="float: left; margin-left: 50px; width: 75%;">' + data[d].MinutesAgo + '</span></a>';
        comment = comment + '<div class="clear">';
        comment = comment + '</div>';
        comment = comment + '</div>';
    }
    $(".in-nd-comment").html('');
    $(".in-nd-comment").html(comment);
}

function ViewPhoto(previd, id, nextid) {
    scsHdlr = function (result) {
        var results = getJson(result);
        $("#hdPhotoId").val(id);
        if (valid(results)) {
            self.ResultCount = results.Results.length;
            var str = "";
            for (var i = 0; i < results.Results.length; i++) {
                //$("#srcPhoto").attr('src', results.Results[i].ImagePath);
                str = str + "<img src='" + results.Results[i].ImagePath + "'></img>";
                
                if (results.Results[i].IsOwner == true) {
                    
                }
                else {
                    $(".delphoto").html('');
                }
            }

            $(".imgAlbumPhoto").html(str);

            var user = getUserEmail();
            var comment = "";
            scsHdlr = function (result) {
                var results = getJson(result);
                if (valid(results)) {
                    //displayActivities(results.Results);
                    //if (results.RemainingResult == undefined || results.RemainingResult > 0) {
                    //    $('.showmore').show();
                    //}
                    //else
                    //    $('.showmore').hide();
                    DisplayComments(results.Results);

                }
            }

            if (previd == 0) {
                $(".leftArrow").hide();
            }
            else {
                $(".leftArrow").attr("photoid", previd);

            }

            if (nextid == 0) {
                $(".rightArrow").hide();
            }
            else {
                $(".rightArrow").attr("photoid", nextid);
            }
            //actPages = parseInt(activitiesModel.activities().length);
            GetPhotoComments(scsHdlr, errHdlr, getUser().UserKey, 1, id, getTeam());

            //$.colorbox({ html: $("#overlay").html() });
           setTimeout(function () {  // set timeout 2 sec
                //    $("#viewbox").trigger("click");
            $.colorbox({ html: $("#overlay").html(), width: '760px' });
            
                //    //create colorbox for inline content "#pictureColorbox" and call showPicture on complete
                //    //$.colorbox({ href: "#pictureColorbox", inline: true, title: '', initialWidth: 900, initialHeight: 600, scrolling: false, onComplete: function () { showPicture(id); } });
           }, 2000);

            // $("#viewbox").click();              

        }
    }
    var teamid = teamfunc();
    var aid = albumId();
    GetPhotoDetail(scsHdlr, errHdlr, getUser().UserKey, id, parseInt(teamid), parseInt(aid));
}

$(document).ready(function () {

    //$("#viewbox").colorbox({ inline: true });
    $("body").delegate(".commentsBoxes", "keypress", function (event) {
        // $(".commentsBoxes").keypress(function (event) {

        if (event.which == 13) {
            event.preventDefault();
            $(this).focus();
            var id = $("#hdPhotoId").val();
            var txt = $(this).val();
            // var photoid = getCmt(eval(id));
            ShareComments(txt, id);
            $(this).val("");
        }
    });

    $("body").delegate(".leftArrow", "click", function (event) {
        // $(".commentsBoxes").keypress(function (event) {
        var photoid = $(this).attr("photoid");
        scsHdlr = function (result) {
            var results = getJson(result);
            $("#hdPhotoId").val(photoid);
            if (valid(results)) {
                self.ResultCount = results.Results.length;
                var str = "";
                for (var i = 0; i < results.Results.length; i++) {
                    //$("#srcPhoto").attr('src', results.Results[i].ImagePath);
                    str = str + "<img src='" + results.Results[i].ImagePath + "' />";
                    if (results.Results[i].IsOwner == true) {

                    }
                    else {
                        $(".delphoto").html('');
                    }
                }
                $(".imgAlbumPhoto").html('');
                $(".imgAlbumPhoto").html(str);

                var user = getUserEmail();
                var comment = "";
                scsHdlr = function (result) {
                    var results = getJson(result);
                    if (valid(results)) {

                        DisplayComments(results.Results);

                    }
                }


                //actPages = parseInt(activitiesModel.activities().length);
                GetPhotoComments(scsHdlr, errHdlr, getUser().UserKey, 1, parseInt(photoid), getTeam());


                var index = queryArr.indexOf("" + photoid + "");

                if (index > 0) {
                    $(".leftArrow").attr("photoid", queryArr[index - 1]);
                    $(".leftArrow").show();
                }
                else {
                    $(".leftArrow").hide();
                }
                $(".rightArrow").attr("photoid", photoid);
                $(".rightArrow").show();

                //$.colorbox({ html: $("#overlay").html() });
                setTimeout(function () {  // set timeout 2 sec
                    $.colorbox.resize({ width: 'auto' });
                    //    $("#viewbox").trigger("click");
                    //$.colorbox({ html: $("#overlay").html(), width: '750px' });
                    //    //create colorbox for inline content "#pictureColorbox" and call showPicture on complete
                    //    //$.colorbox({ href: "#pictureColorbox", inline: true, title: '', initialWidth: 900, initialHeight: 600, scrolling: false, onComplete: function () { showPicture(id); } });
                }, 2000);

                // $("#viewbox").click();              

            }
        }
        var teamid = teamfunc();
        var aid = albumId();
        GetPhotoDetail(scsHdlr, errHdlr, getUser().UserKey, parseInt(photoid), parseInt(teamid), parseInt(aid));
    });

    $("body").delegate(".rightArrow", "click", function (event) {
        // $(".commentsBoxes").keypress(function (event) {
        var photoid = $(this).attr("photoid");
        scsHdlr = function (result) {
            var results = getJson(result);
            $("#hdPhotoId").val(photoid);
            if (valid(results)) {
                self.ResultCount = results.Results.length;
                var str = "";
                for (var i = 0; i < results.Results.length; i++) {
                    //$("#srcPhoto").attr('src', results.Results[i].ImagePath);
                    str = str + "<img src='" + results.Results[i].ImagePath + "' />";
                    if (results.Results[i].IsOwner == true) {

                    }
                    else {
                        $(".delphoto").html('');
                    }
                }
                $(".imgAlbumPhoto").html('');
                $(".imgAlbumPhoto").html(str);

                var user = getUserEmail();
                var comment = "";
                scsHdlr = function (result) {
                    var results = getJson(result);
                    if (valid(results)) {

                        DisplayComments(results.Results);

                    }
                }


                //actPages = parseInt(activitiesModel.activities().length);
                GetPhotoComments(scsHdlr, errHdlr, getUser().UserKey, 1, parseInt(photoid), getTeam());


                var index = queryArr.indexOf("" + photoid + "");


                if (index < queryArr.length - 1) {
                    $(".rightArrow").attr("photoid", queryArr[index + 1]);
                    $(".rightArrow").show();
                }
                else {
                    $(".rightArrow").hide();
                }
                $(".leftArrow").attr("photoid", photoid);
                $(".leftArrow").show();
                //$.colorbox({ html: $("#overlay").html() });
                setTimeout(function () {  // set timeout 2 sec
                    $.colorbox.resize({ width: 'auto' });
                    //    $("#viewbox").trigger("click");
                    //$.colorbox({ html: $("#overlay").html(), width: '750px' });
                    //    //create colorbox for inline content "#pictureColorbox" and call showPicture on complete
                    //    //$.colorbox({ href: "#pictureColorbox", inline: true, title: '', initialWidth: 900, initialHeight: 600, scrolling: false, onComplete: function () { showPicture(id); } });
                }, 2000);

                // $("#viewbox").click();              

            }
        }
        var teamid = teamfunc();
        var aid = albumId();
        GetPhotoDetail(scsHdlr, errHdlr, getUser().UserKey, parseInt(photoid), parseInt(teamid), parseInt(aid));
    });


    $("body").delegate(".delphoto", "click", function (event) {

        var r = confirm("Are you sure want to delete this ?");
        
        if (r) {
            var id = $("#hdPhotoId").val();
            DeletePhoto(null, null, getUser().UserKey, parseInt(id));
            $.fn.colorbox.close();
            scsHdlr = function (result) {
                var results = getJson(result);
                if (valid(results)) {

                    self.ResultCount = results.Results.length;

                    var pages = 0;
                    if ((self.ResultCount) % 9 == 0) {
                        pages = self.ResultCount / 9;
                    }
                    else {
                        pages = Math.ceil(self.ResultCount / 9);
                    }

                    var previd = 0;
                    var nextid = 0;
                    var str = "";

                    if (self.ResultCount <= 9) {
                        str = str + "<div>";
                        for (var j = 0; j < self.ResultCount; j++) {

                            if (j == 0) {
                                previd = 0;
                            }
                            else {
                                previd = results.Results[j - 1].Id;
                            }

                            if (j == self.ResultCount - 1) {
                                nextid = 0;
                            }
                            else {
                                nextid = results.Results[j + 1].Id;
                            }

                            queryArr.push("" + results.Results[j].Id + "");
                            str = str + "<img src='" + results.Results[j].FilePath + "' class='t" + (j + 1) + "' onclick='ViewPhoto(" + previd + "," + results.Results[j].Id + "," + nextid + ");'/>";
                        }
                        str = str + "</div>";
                    }
                    else {
                        for (var i = 0; i < pages; i++) {

                            if ((i + 1) == pages) {
                                str = str + "<div>";
                                var k = 1;
                                for (j = (i * 9) ; j < results.Results.length; j++) {

                                    if (j == 0) {
                                        previd = 0;
                                    }
                                    else {
                                        previd = results.Results[j - 1].Id;
                                    }

                                    if (j == self.ResultCount - 1) {
                                        nextid = 0;
                                    }
                                    else {
                                        nextid = results.Results[j + 1].Id;
                                    }
                                    str = str + "<img src='" + results.Results[j].FilePath + "' class='t" + ((k)) + "' onclick='ViewPhoto(" + previd + "," + results.Results[j].Id + "," + nextid + ");' />";
                                    k = k + 1;
                                }
                                str = str + "</div>";
                            }
                            else {
                                str = str + "<div>";
                                for (var j = 0; j < 9; j++) {

                                    var m = j * (i + 1);

                                    if (m == 0) {
                                        previd = 0;
                                    }
                                    else {
                                        previd = results.Results[m - 1].Id;
                                    }

                                    if (m == self.ResultCount - 1) {
                                        nextid = 0;
                                    }
                                    else {
                                        nextid = results.Results[m + 1].Id;
                                    }

                                    queryArr.push("" + results.Results[m].Id + "");

                                    str = str + "<img src='" + results.Results[j + (i * 9)].FilePath + "' class='t" + (j + 1) + "' onclick='ViewPhoto(" + previd + "," + results.Results[j + (i * 9)].Id + "," + nextid + ");'/>";
                                }
                                str = str + "</div>";
                            }

                        }
                    }



                    $("#carousel").html(str);
                    StartCrousel();
                    //for (var d in results.Results) {
                    //    //var model = ko.mapping.fromJS(results.Results[d]);
                    //    //self.Result.push(model);

                    //}

                    bindUserPhotos();
                }
            }

            var aid = albumId();

            GetUserPhotosByAlbum(scsHdlr, errHdlr, getUser().UserKey, getUserEmail(), getTeam(), parseInt(aid));
        }
        else {
            return false;
        }
        
    });

    var _cmt = [];
    function getCmt(id) {
        if (isNaN(id))
            id = id();
        _c = _cmt["_" + id];
        if (_c == null || _c == undefined) {
            _c = new loadComments(id);
            _cmt["_" + id] = _c;
        }
        return _c;
    }

    function ShareComments(msg, photoid) {

        // msg = replaceTextWithHTMLLinks(msg);

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                AddComments(results.Results);
            }
        }

        SaveComment(scsHdlr, errHdlr, getUser().UserKey, msg, parseInt(photoid), getTeam());
    }

    function AddComments(data) {
        var comment = "";
        for (var d in data) {
            comment = comment + '<div style="margin-top: 20px">';
            comment = comment + '<img class="img-in-nd-comment" alt="" src="' + data[d].Owner.ProfileFoto + '" height="50px" style="float: left; margin-left: 10px" />';
            comment = comment + ' <a href="profile.aspx"><span class="name-comment" style="float: left; margin-left: 10px; width: 79%;">' + data[d].Owner.DisplayName + '</span></a>'
            comment = comment + '<p class="left-comment-text" style="float: left; margin-left: 10px; width: 75%;">';
            comment = comment += '' + data[d].Description + '';
            comment = comment + '</p>';
            comment = comment + '<a href="#"><span class="button button2" style="float: left; margin-left: 50px; width: 75%;">' + data[d].MinutesAgo + '</span></a>';
            comment = comment + '<div class="clear">';
            comment = comment + '</div>';
            comment = comment + '</div>';
        }

        $(".in-nd-comment").append(comment);
        $.colorbox.resize();
    }

});