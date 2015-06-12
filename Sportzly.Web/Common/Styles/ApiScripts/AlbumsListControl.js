var userAlbumsViewModel = function () {
    var self = this;

    self.Result = ko.observableArray();
    self.ResultCount = ko.observable();
    self.userEmail = ko.observable();
    self.albums = ko.observable();

    self.load = function () {

        self.userEmail = getUserEmail();

        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                self.ResultCount = results.Results.length;

                if (self.ResultCount == 0) {
                    $('.photo-sec').html("No Photos / Videos at this time for you ");
                }
                else {
                    var tb = "<li>";
                    var i = 0;
                    for (var d in results.Results) {

                        if (i != 0 && i % 9 == 0)
                            tb = tb + "</li><li>";

                        tb = tb + "<span class='listimg'><a class='fancybox2' title='' href='AlbumPhotos.aspx?albumid=" + results.Results[d].Id + "&teamid=" + getTeam() + "'><img alt='' width='150' height='150' src='" + results.Results[d].CoverPath + "'></a><a class='album-text' href='AlbumPhotos.aspx?albumid=" + results.Results[d].Id + "&teamid=" + getTeam() + "'>" + results.Results[d].Name + " - " + results.Results[d].PhotosCount + "</a></span>";

                        i++;
                    }
                    $(".bxslider1").html(tb + "</li>");
                }

                if (self.ResultCount > 0) {
                    $("#ancAlbum").html("ALBUMS (" + self.ResultCount + ")");
                }
                else {
                    $("#ancAlbum").html("ALBUMS (0)");
                }

                if (results.Results.length > 0) {
                    $("#ancPhoto").html("PHOTOS <strong>(" + results.Results[0].TotalPhotosCount + ")</strong>");
                }
                else {
                    $("#ancPhoto").html("PHOTOS <strong>(0)</strong>");
                }

                if (getTeam() > 0) {
                    $("#ancAlbum").attr("href", "/Albums.aspx?" + getTeam());
                }
                else {
                    $("#ancAlbum").attr("href", "/Albums.aspx?" + getUserEmail());
                }

                $('.bxslider1').bxSlider();

                applSearchFilter(".search-fans", ".bxslider1>li");
            }
        }

        GetAlbums(scsHdlr, errHdlr, getUser().UserKey, self.userEmail, getTeam());
    }

    self.load();
}

var userAlbumsModel = new userAlbumsViewModel();


showPhoto = function () {
    $.colorbox({
        href: "Photo.aspx?" + teamId + "", iframe: true, height: '500', width: "780", scrolling: false
        , onClosed: function () { window.location = "albums.aspx?" + teamId + ""; }
    });
}

closeBulletinUpdate = function () {
    $.colorbox.close();
}
