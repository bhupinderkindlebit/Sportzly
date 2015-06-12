<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyCheersJeers.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyCheersJeers" %>

<div class="col-xs-4 col-sm-4 right-comment">
    <div class="post-count col-xs-6 col-sm-6">
        <span class="count" data-bind="text: Cheers.Cheers"></span> <span class="points">points</span> <a class="btn-count blue" data-bind="click: function () { cheers($data, true); }">
            CHEERS</a>
    </div>
    <div class="post-count col-xs-6 col-sm-6">
        <span class="count" data-bind="text: Cheers.Jeers"></span> <span class="points">points</span> <a class="btn-count blue black" data-bind="click: function () { cheers($data, false); }">
            JEERS</a>
    </div>
</div>
