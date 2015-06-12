

function buildLinks(json, aid) {
    var
    photo,
    $links = $(),
    $thumb,
    $anchor;

    while (photo = json.shift()) {
        $anchor = $('<a/>').attr({
            // get the medium-large size photo
            href: photo.FilePath,
            title: photo.AlbumName,
            rel: 'group_' + aid,
            'class': 'group_' + aid
        });

        $thumb = $('<img/>').attr({
            // get the small-square size thumbnail photo
            src: photo.FilePath,
            alt: photo.Id,
            height: 10
        }).appendTo($anchor);

        $links = $links.add($anchor);
    }
    $("#lightBoxContainer").empty().hide().append($links);
    $("a.group_" + aid).colorbox({ rel: 'group_' + aid, height: "90%", open: true, returnFocus: false });
    $("a.group_" + aid).eq(0).click();
}

getAlbumPhotos = function (aid, pid) {

    $("a.group_" + aid).colorbox({ rel: 'group' + aid, height: '90%' });

    //return;
    var scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            buildLinks(results.Results[0].Photos, aid);
        }
    }

    GetAlbumPhotos(scsHdlr, errHdlr, getUser().UserKey, aid, pid);
}

closeVideoUploadify = function (result) {
    //  alert(result);
    var results = getJson(result);
    if (valid(results)) {
        var model = ko.mapping.fromJS(results.Results[0]);
        activitiesModel.addActAt(model, 0);
    }
    window.parent.closeBulletinUpdate();
}

closeProfileUpdate = function (result) {
    location.href = location.href;
}