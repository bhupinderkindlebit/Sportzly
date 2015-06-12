<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ScorecardControl.ascx.cs" Inherits="Sportzly.Web.Controls.ScorecardControl" %>
<script type="text/javascript" src="/Common/Styles/ApiScripts/ScorecardControl.js"> </script>
<style type="text/css"> 
    #uploadDocumentBox-button {
        height: 36px !important;
        width: 133px !important;
        /*margin-left: 45px;
        margin-top: 20px;*/
    }
</style>
<section class="like-box" style="padding: 5px">
    <article class="top-like-box">

        <h3>Upload Scorecard</h3>

        <div class="clear"></div>
    </article>
    <!--End-top-like-box-->

    <div id="scrollbar1">
        <div class="scrollbar">
            <div class="track">
                <div class="thumb">
                    <div class="end"></div>
                </div>
            </div>
        </div>
        <div class="viewport">
            <div class="overview">
                <article class="list-comment">
                    <!--End-in-comment-like-box-->
                    <div class="say-something say-something-list-comment">                     
                        <div style="float: left; margin: 15px 0 0 45px">
                            <input id="uploadDocumentBox" name="uploadDocumentBox" type="file" />
                        </div>
                        <input type="hidden" id="hdFileName" value="" />
                        <input type="hidden" id="hdFilePath" value="" />                       
                    </div>
                    <div class="clear"></div>
                </article>
                <!--End-list-comment-->
            </div>
        </div>
    </div>

</section>
