<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedControl.ascx.cs" Inherits="Sportzly.Web.Controls.FeedControl" %>

<script src="Scripts/jquery.accessible-news-slider.js"></script>
<link href="Content/themes/base.css" rel="stylesheet" />
<link href="Content/themes/default/theme.css" rel="stylesheet" />

<div class="feedEntity">
    <ul id="newsslider2" data-bind="foreach: Result, visible: Result().length > 0" style="display: none">
        <li>
            <a data-bind="attr: { href: Link() }" target="_blank">
                <img data-bind="attr: { src: ImagePath() }" width="135" height="135" alt="" /></a>
            <h3><a data-bind="attr: { href: Link() }" target="_blank"><span data-bind="    text: Title()"></span></a></h3>
            <p data-bind="text: Description()"></p>
                <br />
                <a data-bind="attr: { href: Link() }" target="_blank">&raquo; read more</a>
            
        </li>
    </ul>
</div>
