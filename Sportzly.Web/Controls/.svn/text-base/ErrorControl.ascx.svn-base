<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.ErrorControl" %>
<div class="error-area" data-bind="foreach: errors, visible: errors().length > 0">
    <div class="error-div" data-bind="style : {backgroundColor: getErrColor()}">
        <div class="t">
            <div style="height: 40px;">
                <span data-bind="text: message"></span>                
                <div class="close-drawer" data-bind="click: function () { $parent.removeErr($index()) }">Close</div>
            </div>
        </div>
    </div>
</div>
