<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyShareStatusControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyShareStatusControl" %>
<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />
<style type="text/css">
    .uploadlogo
    {
        border-radius: 0px;
        margin-bottom: 5px;
    }
</style>

<div class="share-links share-links1">
    <div id="loader2" class="container-loader">
        <div id="loading2" class="nimble-loader">
            <div class="search-member search-streams" id="commentBox111">
                <input class="search-info-member search-info-streams" type="text" id="txtbxStatus" data-bind="value: status" onblur="bindBlur(event)" onfocus="bindFocus(event)" value="Whats up?" />
                <input class="submit-member" type="button" data-bind="click: shareUpdate" id="btnUpdateStatus" />
            </div>
        </div>
    </div>

    <div class="link-member">
        <a href="#" class="button-gra-small">
            <img src="images/links-icon.png" alt="Add Link">
            Add Link</a>
        <a onclick="showPhoto1()" class="button-gra-small" style="cursor: pointer;">
            <img class="click-link" src="images/photo-icon.png" alt="Add Photo" />
            Add Photo</a>
        <a onclick="showVideo1()" class="button-gra-small" style="cursor: pointer;">
            <img class="click-link" src="images/video-icon.png" alt="Add Video" />
            Add Video</a>
        <%--<a href="javascript:;documentUploadify();" id="ancDoc" style="display: none;" class="button-gra-small">
        <img class="click-link" src="images/document1.png" height="30" /></a>--%>
    </div>
</div>