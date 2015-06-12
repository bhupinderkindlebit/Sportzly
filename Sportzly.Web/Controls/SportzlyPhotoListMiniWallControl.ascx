<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SportzlyPhotoListMiniWallControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.SportzlyPhotoListMiniWallControl" %>
<%--<div class="photos-section userPhotos" data-bind="visible: Result().length > 0">
    <div class="section-title">
        <h2>
            PHOTOS <strong>(<span data-bind="text: ResultCount"></span>)</strong></h2>
        <a class="view-all" data-bind="attr: { href: 'Albums.aspx?' + getQueryString() }">View
            All <i class="fa fa-fw"></i></a>
    </div>
    <ul class="photo-gallery" data-bind="foreach: Result">
        <li><a data-bind="attr: { href: 'AlbumPhotos.aspx?albumid=' + AlbumId() + '&teamid=' + getTeam() + '' }">
            <img alt="photos1" data-bind="attr: { src: FilePath }" width="165" height="165"></a></li>
    </ul>
</div>--%>
<div class="photos-section userPhotos" data-bind="visible: Result().length > 0">
    <div class="section-title">
        <h2>
            PHOTOS <strong>(<span data-bind="text: ResultCount"></span>)</strong></h2>
        <a data-bind="attr: { href: 'Albums.aspx?' + getQueryString() }" class="view-all">View
            All <i class="fa fa-fw"></i></a>
    </div>
    <ul class="photo-gallery" data-bind="foreach: Result">
        <li><a data-bind="attr: { href: 'AlbumPhotos.aspx?albumid=' + AlbumId() + '&teamid=' + getTeam() + '' }">
            <img data-bind="attr: { src: FilePath }" width="165" height="140" alt="photos1"></a></li>
    </ul>
</div>
