<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentListMiniControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.DocumentListMiniControl" %>
<style type="text/css">
    .innerDiv
    {
        float: left;
        width: auto;
        height: auto;
        display: none;
    }
    
    .uldoc
    {
        height: auto;
        line-height: 5px;
    }
    
    .lidoc
    {
        display: inline;
        font-family: 'proxima_nova_rgbold';
        font-size: 13px;
        margin-left: 10px;
        line-height: 20px;
    }

    .tooltip
    {
        padding: 8px;
        border: 1px solid black;
        border-radius: 5px 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
        -webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
        -moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
        background-color: #FCFCFC;
        position: absolute;
        z-index: 2;
        font-family: Arial,Helvetica,sans-serif;
        font-size: 12px;
        min-width: 50px;
        margin: 8px;
        word-wrap: break-word;
        overflow: auto;
        color: #007400;
        font-family: 'proxima_nova_rgbold';
        opacity:1;
    }
</style>

<script type="text/javascript">
    $(document).ready(function () {
        var changeTooltipPosition = function (event) {
            var tooltipX = event.pageX; // -8;
            var tooltipY = event.pageY; // +8;
            $('div.tooltip').css({ top: tooltipY, left: tooltipX });
        };
        var showTooltip = function (event) {      
            var id = event.target.id;
            var text = $("#" + id).attr('tooltip');
            $('div.tooltip').remove();
            $('<div class="tooltip">' + text + '</div>')
            .appendTo('body');
            changeTooltipPosition(event);
        };
        var hideTooltip = function () {
            $('div.tooltip').remove();
        };

        $("body").delegate("span.spanTitle", "mousemove", function (event) {
            showTooltip(event);
        });
        $("body").delegate("span.spanTitle", "mouseenter", function (event) {
            showTooltip(event);
        });
        $("body").delegate("span.spanTitle", "mouseleave", function (event) {
            hideTooltip();
        });


    });
</script>
<div class="team-docs">
    <h3>
        TEAM DOCS</h3>
    <div class="docListUL">       
    </div>
    <a id="ancViewAllDocuments" class="btn btn-primary blue mrg-t10">
        VIEW ALL DOCS</a>
</div>
<script type="text/javascript">

    $(document).ready(function () {



    });

    function showdoc(id) {
        $("#div" + id).slideToggle();
    }
</script>

