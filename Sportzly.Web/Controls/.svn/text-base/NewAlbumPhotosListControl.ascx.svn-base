<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewAlbumPhotosListControl.ascx.cs" Inherits="Sportzly.Web.Controls.NewAlbumPhotosListControl" %>
<%@ Register Src="CommentsControl.ascx" TagName="Comments" TagPrefix="uc2" %>

<script src="/Scripts/jquery.tools.min.js"></script>

<script src="/caroufredsel/jquery.carouFredSel-6.2.0-packed.js" type="text/javascript"></script>


<style type="text/css">
    #wrapper {
        width: 100%;
        height: 100%;
        min-width: 570px;
        min-height: 770px;
        overflow: hidden;
        position: relative;
    }

    #inner {
        position: absolute;
        display: none;
    }

        #inner.horizontal {
            width: 100%;
            height: 770px;
            left: 0;
        }

        #inner.vertical {
            width: 420px;
            height: 100%;
            margin: 0 0 0 -210px;
            top: 0;
            left: 50%;
        }

    #carousel > div {
        width: 700px;
        height: 770px;
        float: left;
        position: relative;
    }

    #carousel img {
        display: block;
        width: 204px;
        height: 204px;
        position: absolute;
        border: 1px solid #ccc;
        background-color: white;
        padding: 9px;
        margin: 7px;
    }

    img.t1 {
        left: 10px;
        top: 10px;
    }

    img.t2 {
        left: 243px;
        top: 10px;
    }

    img.t3 {
        left: 475px;
        top: 10px;
    }

    img.t4 {
        left: 10px;
        top: 243px;
    }

    img.t5 {
        left: 243px;
        top: 243px;
    }

    img.t6 {
        left: 475px;
        top: 243px;
    }

    img.t7 {
        left: 10px;
        top: 476px;
    }

    img.t8 {
        left: 243px;
        top: 476px;
    }

    img.t9 {
        left: 475px;
        top: 476px;
    }

        img.t9:hover {
            transform: scale(1.02) translateZ(0px);
        }

    img.t8:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t7:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t6:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t5:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t4:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t3:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t2:hover {
        transform: scale(1.02) translateZ(0px);
    }

    img.t1:hover {
        transform: scale(1.02) translateZ(0px);
    }

    #left, #right, #up, #down {
        display: block;
        height: 60px;
        position: absolute;
    }

    #left {
        bottom: 50%;
        left: 0;
    }

    #right {
        bottom: 50%;
        right: 0;
    }

    #up {
        top: 0;
        left: 50%;
    }

    #down {
        bottom: 0;
        left: 50%;
    }

        #left:after, #right:after, #up:after, #down:after {
            content: '';
            border: 5px solid transparent;
            display: block;
            width: 0;
            height: 0;
            margin: -5px;
            position: absolute;
        }

    #left:after {
        margin-left: 0;
        left: 50%;
        top: 50%;
    }

    #right:after {
        margin-right: 0;
        right: 50%;
        top: 50%;
    }

    #up:after {
        margin-top: 0;
        top: 50%;
        left: 50%;
    }

    #down:after {
        margin-bottom: 0;
        bottom: 50%;
        left: 50%;
    }

    #imgdiv {
        margin: 10px;
    }

    #red_div {
        width: 600px;
        float: left;
        height: auto;
    }

    #green_div {
        width: 418px;
        height: auto;
        float: left;
        border: 3px solid #e1e1e1;
        border-radius: 7px 7px 7px 7px;
        background-color: #e1e1e1;
    }

    #yellow_div {
        width: 140px;
        height: 45px;
        float: right;
        border: 11px solid #e1e1e1;
        border-radius: 7px 7px 7px 7px;
    }

    .imgAlbumPhoto {
        border: 1px solid #CCCCCC;
    }

    #yellow_div ul {
        text-decoration-style: none;
        height: 45px;
        width: 130px;
        margin-top: 10px;
        margin-left: 10px;
    }

    #yellow_div li {
        display: block;
        line-height: 25px;
        font-family: Arial;
        font-size: 12px;
        color: #007400;
        width: 130px;
    }

    .outer {
        display: block !important;
        width: 400px;
    }

    .inner {
        border: 1px solid #e1e1e1;
        border-radius: 7px 7px 7px 7px;
        width: 400px;
        margin: 7px;
        background-color: white;
    }

    #imgPhoto img {
        display: block;
        margin: 0 auto;
    }

    #left_arrow {
        background: none repeat scroll 0 0 transparent;
        height: 100px;
        left: 0;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 0;
        width: 30px;
    }

        #left_arrow img {
            background: no-repeat scroll 0 0 transparent;
            cursor: pointer;
            display: block;
            float: left;
            font-size: 0;
            height: 30px;
            line-height: 0;
            margin: 90px 10px;
            width: 30px;
        }

    #rite_arrow {
        background: none repeat scroll 0 0 transparent;
        height: 100px;
        left: 0;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 0;
        width: 30px;
        left: auto;
        right: 0;
    }

        #rite_arrow img {
            background: no-repeat scroll 0 0 transparent;
            cursor: pointer;
            float: right;
            font-size: 0;
            height: 30px;
            line-height: 0;
            margin: 90px 10px;
            width: 30px;
        }

    #center_div {
        border: 0 none;
        margin: 0 40px;
        padding: 0;
        width: 600px;
    }

    .overlay {
        background-color: rgba(0, 0, 0, 0.15);
        bottom: 0;
        left: 0;
        position: fixed;
        right: 0;
        top: 0;
        z-index: 200200;
    }

    .overlayBox {
        background-color: #FFFFFF;
        border: 6px solid #1E940F;
        border-radius: 5px 5px 5px 5px;
        color: #7F7F7F;
        margin-top: 12px;
        padding: 20px;
        position: absolute;
        top: 20px;
        z-index: 200200;
    }

        .overlayBox .closePosition {
            height: 26px;
            position: absolute;
            right: -14px;
            top: -13px;
            width: 26px;
            z-index: 200201;
        }

    .overlayClose {
        background: url("/images/cancel.png") repeat scroll left top transparent;
        cursor: pointer;
        display: block;
        height: 26px;
        width: 26px;
    }

    .overlayContent .media-overlay .glaze_maincontainer .glaze_container .left_glazecol, .overlayContent .media-overlay .glaze_maincontainer .glaze_container .right_glazecol {
        background: none repeat scroll 0 0 transparent;
        height: 100px;
        left: 0;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 0;
        width: 100px;
    }

    .left_glazecol {
        float: left;
        height: 100px;
        padding-right: 10px;
        width: 120px;
    }

    .overlayContent .media-overlay .glaze_maincontainer .glaze_container .center_glazecol {
        border: 0 none;
        margin: 0 40px;
        padding: 0;
        width: 600px;
    }

    .center_glazecol {
        background: none repeat scroll 0 0 #FFFFFF;
        border: 1px solid #FFFFFF;
        float: left;
        padding: 20px;
    }

    .overlayContent .media-overlay .glaze_maincontainer .glaze_container .left_glazecol, .overlayContent .media-overlay .glaze_maincontainer .glaze_container .right_glazecol {
        left: auto;
        right: 0;
    }

    .right_glazecol {
        float: left;
        height: 100px;
        padding-left: 10px;
        width: 120px;
    }



    .media-center-asset {
        background: none repeat scroll 0 0 #EEEEEE;
        margin-bottom: 10px;
        width: 100%;
        text-align:center;
    }

    .clearfix:after, .cf:after {
        clear: both;
        content: "";
        display: block;
        height: 0;
        visibility: hidden;
    }

    .media-center-info {
        background: url("/images/vertical-border-bg.png") repeat-y scroll 419px 0 transparent;
        width: 100%;
    }
</style>
<section id="content" class="photosList">
    <article class="top-content-fans">
        <div class="fans-2">
        </div>
        <div class="link-2">
           
            <a href="Albums.aspx" id="ancAlbum"></a>
 <span data-bind="text: 'Photos (' + ResultCount + ')' "></span>
        </div>

        <div class="clear"></div>
    </article>
    <!--End-top-content-fans-->
    <article class="list-img-content-fans">
        <article class="top-list-img-content-fans">
            <div id="wrapper">
                <div id="inner" class="horizontal">
                    <div class="phtosListUL" id="carousel">
                    </div>
                </div>
                <a href="#" id="left">
                    <img src="../images/left1.png" /></a>
                <a href="#" id="right">
                    <img src="../images/right1.png" /></a>
            </div>
        </article>
    </article>
    <!--End-list-img-content-fans-->


    <div class="clear"></div>
    <div class="footer-content">
    </div>
    
</section>

<!--End-section-content-->




<%--<div style="display: none;" id="viewphoto">

    <div id="overlay">
        <div id="left_arrow">
            <img src="../images/left.png" style="visibility: visible" class="leftArrow" />
        </div>
        <div id="center_div">
            <div id="imgdiv">
                <div id="imgPhoto" style="width: 600px; background: none repeat scroll 0 0 #EEEEEE; float: left" class="imgAlbumPhoto">
                </div>
            </div>


            <div id="red_div" style="margin: 10px;">
                <div id="green_div">
                    <div class="in-nd-comment inner" id="divcomment">
                    </div>

                    <div class="say-something" style="border: 1px solid #e1e1e1; border-radius: 7px 7px 7px 7px; margin: 7px; width: 389px; float: left">
                        <input type="text" value="Say something..." onblur="bindBlur(event)" onfocus="bindFocus(event)" class="commentsBoxes" style="height: 20px; margin-left: 49px; margin-top: 7px; width: 321px" />
                    </div>
                </div>
                <div id="yellow_div">
                    <ul>
                        <a href="javascript:;" class="delphoto">
                            <li>Delete photo</li>
                        </a>
                    </ul>
                </div>
            </div>
            <div id="rite_arrow">
                <img src="../images/rite.png" class="rightArrow" />
            </div>
            <!--End-in-nd-comment-->
        </div>

    </div>
    

    <!--End-in-nd-comment-->


</div>--%>
<!--End-nd-comment-->
<input id="hdPhotoId" type="hidden" />
<script type="text/javascript">
    
</script>
