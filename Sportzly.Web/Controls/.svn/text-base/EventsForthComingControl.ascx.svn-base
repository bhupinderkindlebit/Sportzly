<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventsForthComingControl.ascx.cs" Inherits="Sportzly.Web.Controls.EventsForthComingControl" %>
<script src="Scripts/jquery.bxslider.js"></script>
<link href="Common/Styles/css/jquery.bxslider.css" rel="stylesheet" />
<style type="text/css">
    #eventObjsList123 a:hover {
        text-decoration: none;
    }
</style>
<div id="eventObjsList123" style="background-color: white; padding: 10px; margin-bottom: 10px;border-radius:7px;">

    <span class="chicago" style="float: none;">SCHEDULE</span> 
  
    <a href="~/Calender.aspx" runat="server" id="A3" class="liitem"><span class="chicago" style="float: right; margin-top: 0px; font-size: 15px; text-decoration: underline;margin-right:5px;"><img src="images/outlook.png" title="Outlook"/></span> </a>
    <a href="~/Calender.aspx" runat="server" id="A4" class="liitem"><span class="chicago" style="float: right; margin-top: 0px; font-size: 15px; text-decoration: underline;margin-right:5px;"><img src="images/gcal.png" title="Google Calender"/></span> 

    </a>  
    <a href="~/Calender.aspx" runat="server" id="A1" class="liitem"><span class="chicago" style="float: right; margin-top: 0px; font-size: 15px; text-decoration: underline;margin-right:5px;"><img src="images/android1.png" title="Android" /></span> </a>
    <a href="webcal://www.sportzly.com/CalenderGenerator.aspx" runat="server" id="A2" class="liitem"><span class="chicago" style="float: right; margin-top: 0px; font-size: 15px;margin-right:5px; text-decoration: underline;"><img src="images/iphone.png" title="iPhone"/> </span> </a><span class="chicago" style="float: right; margin-top: 0px; font-size: 15px;margin-right:5px;" id="spnEvent" runat="server">EXPORT TO</span><a href="events.aspx?" runat="server" id="myEvents" class="liitem"><span class="chicago" style="float: right; margin-top: 0px; font-size: 15px; text-decoration: underline;margin-right:60px;">VIEW FULL SCHEDULE</span> </a>
   
    <hr style="color: #008800;margin-top:15px;" />
    <div data-bind="foreach: { data: Result }, visible: Result().length > 0" style="display: none; width: 650px;" class="slider1">
        <div class="slide" style="width: 250px;">

            <div>

                <a data-bind="attr: { href: 'event.aspx?' + EventId() }">
                    <span class="soccer-text" style="color: #008800; font-size: 15px; font-weight: bold; text-transform: uppercase;" data-bind="text: FormatStartDate()"></span>
                    <br>
                    <span class="soccer-text">Team :</span> <span class="soccer-text" data-bind="text: TeamName()" ></span>
                    <br>
                    <span class="soccer-text" data-bind="text: StartTime() + ' (' + TimeZone() + ') - ' + EventTypeName() + ' : ' + EventName()"></span>
                    <br>

                    <span class="soccer-text">@ <span class="soccer-text" data-bind="text: Address()"></span></span>
                    <br>
                </a>
            </div>
            <!--End-right-schedule-list-request-->

            <div class="clear"></div>

        </div>
        <!--End-schedule-list-->

    </div>

    <div data-bind="visible: Result().length == 0" style="display: none">
        No events at this time for you
    </div>
    <div style="text-align: right;display: none;" id="ancCreateEvent1" >
        <hr style="color: #008800;" />
        <a href="CreateEvent.aspx">
            <img src="../images/cevent.png" style="float: none; margin-left: 2px; margin-right: 0px;" /></a>
    </div>
    <%-- <span><a href="createevent.aspx">Create new event</a></span>--%>
</div>
<script type="text/javascript">

    //$(document).ready(function () {

    //    buildGallery = function () {

    //        $(".slider1").bxSlider({              
    //            slideWidth: 205,
    //            minSlides: 3,
    //            maxSlides: 3,
    //            moveSlides: 3,
    //            slideMargin: 10,
    //            pager: false
    //        });
    //    }



    //});
</script>
