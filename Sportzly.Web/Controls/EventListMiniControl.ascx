<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventListMiniControl.ascx.cs" Inherits="Sportzly.Web.Controls.EventListMiniControl" %>

<style type="text/css">
    .request {
        background: none repeat scroll 0 0 #1275BC;
        border-radius: 20px;
        color: #FFFFFF !important;
      display: inline-block;
        font-family: 'proxima_nova_rgbold';
        font-size: 11px;
        font-weight: bold;
        height: 23px;
        line-height: 23px;
        margin-left: 22px;
        margin-top: 10px;
        text-align: center;
        text-transform: uppercase;
        width: 50px;
    }
    .text-marcus span {
        line-height:20px;
    }
</style>
<div class="eventObjsList">

    <div data-bind="foreach: Result(), visible: Result().length > 0" style="display: none">
        <div class="schedule-list" data-bind="visible: !HasResponse()" style="padding-top:0px;">


            <div class="center-schedule-list" style="padding:10px 10px;">
                <span class="soccer-text" data-bind="text: FormatStartDate()" style="font-size:20px;"></span>
                <br />
                <span class="soccer-text" style="color:#A9A9A9;float:left;width:295px; font-size:13px;" data-bind="text: StartTime() + ' (' + TimeZone() + ')'+ ': ' + TeamName() + ' (' + Address() + ')'"></span>
                <br />
                <span class="soccer-text" data-bind="text: EventName()" style="font-size:13px;color:black;float:left;width:295px; "></span>              
                <div id="respond" style="color:#A9A9A9;font-size:13px;font-weight:bold;">
                    Attending?
                    <a data-bind="attr: { href: 'javascript:' }, click: function () { joinEvent($data, true); }" class="request">YES</a>
                    <a data-bind="attr: { href: 'javascript:' }, click: function () { joinEvent($data, false); }" class="request">NO</a>
                    <br>
                </div>

                <span class="soccer-text" style="color:#A9A9A9;font-size:13px;" data-bind="text: AttendeeCount() +' People attending'"></span>
                

            </div>


            <div class="clear"></div>

        </div>
        <!--End-schedule-list-->
    </div>

</div>
