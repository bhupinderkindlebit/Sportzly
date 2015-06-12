<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhotoListMiniControl.ascx.cs" Inherits="Sportzly.Web.Controls.PhotoListMiniControl" %>



<div class="userPhotos" data-bind="visible: Result().length > 0">
    <h2 class="media" runat="server" id="h1">PHOTOS <span>(<span class="number-135" data-bind="text: ResultCount"></span>) <a data-bind="    attr: { href: 'Albums.aspx?' + getQueryString() }">See all</a></span></h2>

    <div class="video-biker" data-bind="foreach: Result" style="margin-top: 5px;">
        <div class="info-video">
            <a data-bind="attr: { href: 'AlbumPhotos.aspx?albumid=' + AlbumId() + '&teamid=' + getTeam() + '' }">
                <img alt="" data-bind="attr: { src: FilePath }" width="94" height="94" />
            </a>
        </div>
    </div>
    <br />
    <br />
    <br />
</div>




