$(document).ready(function () {
    $("#lnkDashboardHeader").attr("href", "team.aspx?" + teamId);
    $('#lnkMembersHeader').attr("href", "members.aspx?" + teamId);
    $('#lnkEventsHeader').attr("href", "events.aspx?" + teamId);
    $('#lnkPhotosVideosHeader').attr("href", "albums.aspx?" + teamId);
    $('#lnkDocumentssHeader').attr("href", "documentlist.aspx?" + teamId);

    if ($(location).attr('href').indexOf("team") >= 0)
        $("#lnkDashboardHeader").parent().addClass("resp-tab-active");

    if ($(location).attr('href').indexOf("members") >= 0)
        $("#lnkMembersHeader").parent().addClass("resp-tab-active");

    if ($(location).attr('href').indexOf("events") >= 0 || $(location).attr('href').indexOf("Listcalendar") >= 0)
        $("#lnkEventsHeader").parent().addClass("resp-tab-active");

    if ($(location).attr('href').indexOf("albums") >= 0)
        $("#lnkPhotosVideosHeader").parent().addClass("resp-tab-active");
    
    if ($(location).attr('href').indexOf("documentlist") >= 0)
        $("#lnkDocumentssHeader").parent().addClass("resp-tab-active");
});



