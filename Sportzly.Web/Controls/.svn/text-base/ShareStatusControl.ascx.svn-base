<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShareStatusControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.ShareStatusControl" %>
<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />
<script src="/Scripts/jquery.nimble.loader.js"></script>
<link href="/Common/Styles/css/loader.css" rel="stylesheet" />
<style type="text/css">
    .uploadlogo {
        border-radius: 0px;
        margin-bottom: 5px;
    }

    
</style>
<div id="loader1" class="container-loader">
<div id="loading1" class="nimble-loader">
<div class="search-member search-streams" id="commentBox111">

    <input class="search-info-member search-info-streams" type="text" id="txtbxStatus" data-bind="value: status" onblur="bindBlur(event)" onfocus="bindFocus(event)" value="Whats up?" />
    <input class="submit-member" type="button" data-bind="click: shareUpdate" id="btnUpdateStatus" />



</div>
   
<div id="uploadImageBoxConatiner" style="background-color: #fff; padding: 5px; border: 1px solid #CCC">
    <div id="uploadImageBoxFive"></div>
    <div id="uploadImageBox" style="display:none;"></div>
    <div id="uploadImageBoxConatinerInner"></div>
    <input class="submit-member" value="Cancel" type="button" onclick="cancelUpload()" />
    <input type='button' value='Save' onClick="moveImagesToAlbum()" class="btnImageUpload"/>
</div>
<div class="link-member">
    <a href="javascript:;imageUploadify();">
        <img class="click-link" src="images/link2-member.png" /></a>
    <a href="javascript:;videoUploadify();">
        <img class="click-link" src="images/link3-member.png" /></a>
    <a href="javascript:;documentUploadify();" id="ancDoc" style="display: none;">
        <img class="click-link" src="images/document1.png" height="30" /></a>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        /*********************************************************************************************************************
       * INITIALISATION
       * Define some sets of params
       * Init the global param for the plugin
       ********************************************************************************************************************/

        // Params example 1
        var params = {
            loaderClass: "loading_bar_1",
            debug: true,
            speed: 'fast',
            hasBackground: false,
            zIndex: 99
        };

        // Overwriting default params : nimbleLoader will use param1 as default options
        $.fn.nimbleLoader.setSettings(params);



    });
</script>

