<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyActivitiesControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyActivitiesControl" %>
<%@ Register Src="MyCheersJeers.ascx" TagName="MyCheersJeers" TagPrefix="uc1" %>
<%@ Register Src="MyCommentsControl.ascx" TagName="MyCommentsControl" TagPrefix="uc2" %>
<%@ Register Src="~/Controls/LightBoxControl.ascx" TagPrefix="uc1" TagName="LightBoxControl" %>
<script src="Scripts/jquery.cookie.js"></script>
<style type="text/css">
     .morecontent span {
        display: none;
    }
</style>
<uc1:LightBoxControl runat="server" ID="LightBoxControl" />
<script id="imagePreview" type="text/html">
    <div data-bind="if: Album.Photos" style="white-space: nowrap; width: 240px; float: left">
        <div data-bind="foreach: Album.Photos">
            <a data-bind="attr: {'onclick': 'showAlbum(this, ' + $parent.Id()+ ',' + Id() +')', 'href': 'javascript:;', 'title': AlbumName, 'class':'group'+$parent.Id()}">
                <img data-bind="attr:{'src':FilePath}" width="225" height="150" /><br />
            </a>
        </div>
    </div>
</script>
<script id="docPreview" type="text/html">
    <div data-bind="if: Doc.Files" style="height: auto; white-space: nowrap; width: 240px; float: left">
        <p><span class="name-ct" data-bind="text: title()" style="font-size: 13px; font-weight: bold;"></span></p>

        <div data-bind="foreach: Doc.Files">
            <a data-bind="attr: { href: 'filedownload.ashx?filename=' + filepath() + '&name=' + filename() +'' }">
                <span class="name-ct" data-bind="text: filename()" style="font-size: 13px; font-weight: bold;"></span>
                <br />
            </a>

        </div>
    </div>
</script>
<script id="videoPreview" type="text/html">
    <iframe title='YouTube video player' class='youtube-player' type='text/html' width='100%' height="315" frameborder='0' allowfullscreen data-bind="attr:{src:'http://www.youtube.com/embed/' + VideoId() }"></iframe>
</script>

<div class="member-comment post-wrapper" data-bind="foreach : activities">
    <div class="info-comment post" data-bind="attr: {_type: '_type' +ActivityType()}">

        <div class="left-comment">
            <span class="post-img col-xs-2 col-sm-2 col-md-2"><img class="body-comment" alt="" data-bind="attr:{src:Owner.ProfileFoto}" alt="post"></span>
           <div class="col-xs-6 col-sm-6 col-md-6 post-data">
            <a class="post-title" data-bind="attr: {href: 'profile.aspx?' + Owner.EmailId()}"><span class="name-comment" data-bind="text: Owner.DisplayName"></span></a>
            <p class="left-comment-text" data-bind="html:Description">
            </p>           
            <div class="member-comment" data-bind="if: Album">
                <div data-bind="template: { name: 'imagePreview', data: Album, as :'Album'}">
                </div>
            </div>
            <div class="member-comment videoyoutube" data-bind="if: Video">
                <div data-bind="template: { name: 'videoPreview', data: Video, as :'Video'}">
                </div>
            </div>
            <div class="member-comment" data-bind="if: Doc">
                <div data-bind="template: { name: 'docPreview', data: Doc, as :'Doc'}">
                </div>
            </div>
             <div class="comment-links"> 
            <span class="button min-ago" data-bind="text:MinutesAgo"></span><img class="button btn-comment" alt="" src="images/comment.png" style="cursor: pointer" data-bind="event: {load:function(){ getCmt($data.Id).getComments();},click: cmts}" />
            <span class="button" data-bind="{click: $parent.remActivity, visible:Owner.EmailId() == getUser().EmailId}" style="cursor: pointer">Delete</span> 
          </div></div>
        </div>
        <uc1:MyCheersJeers ID="MyCheersJeers" runat="server" />
        <!--End-left-comment-->

        <input data-bind="value: Id" type="hidden" />
        <div data-bind="attr:{Id:'_comments' + Id()}">
        </div>

        <div data-bind="stopBindings: true">
            <div>

                <uc2:MyCommentsControl runat="server" ID="MyCommentsControl" />
            </div>
        </div>

        <div class="clear"></div>
        <!--End-right-comment-->

    </div>
</div>
