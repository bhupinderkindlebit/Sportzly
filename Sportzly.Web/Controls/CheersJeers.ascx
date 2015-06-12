<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CheersJeers.ascx.cs"
    Inherits="Sportzly.Web.Controls.CheersJeers" %>

<div class="right-comment">
    <span class="points">
         <span data-bind="text: Cheers.Cheers"></span>        
        <span class="in-points"> <br /> points</span>
        <br />
        <a href="#" class="right-comment-link" data-bind="click: function () { cheers($data, true); }">
            <img alt="" src="images/cheers.png" />
        </a>
    </span>
    <span class="points">        
        <span data-bind="text: Cheers.Jeers"></span>
        <span class="in-points"> <br /> points</span>
        <br />
        <a href="#" class="right-comment-link" data-bind="click: function () { cheers($data, false); }">
            <img alt="" src="images/cheers2.png" />
        </a>
    </span>
</div>

