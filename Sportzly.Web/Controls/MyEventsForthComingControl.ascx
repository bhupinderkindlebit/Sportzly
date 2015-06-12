<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyEventsForthComingControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyEventsForthComingControl" %>
<div class="schedule" id="eventObjsList123">
    <div class="section-title">
        <a href="events.aspx?" runat="server" id="myEvents" class="view-all">View Full Schedule
            <i class="fa fa-fw"></i></a>
        <h2>
            Event</h2>
    </div>
    <div class="eventpost" data-bind="foreach: { data: Result }, visible: Result().length > 0">
        <a data-bind="attr: { href: 'event.aspx?' + EventId() }"><span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding">
            <img data-bind="attr: { src: TeamLogoUrl() }, visible: TeamLogoUrl() != ''" alt=""></span>
            <div class="col-xs-10 col-sm-10 col-md-10 post-data eat-nopadding">
                <h3 class="post-title" data-bind="text: TeamName()">
                    </h3>
                <p>
                    <strong>Event</strong> - <span data-bind="text: EventName()"></span>
                    <br>
                    <strong>Team</strong> - <span data-bind="text: TeamName()"></span>
                    <br>
                    <strong>Location</strong>: <span data-bind="text: Address()"></span>
                    <br>
                    <strong>Sport</strong>: <span data-bind="text: TeamSports()"></span> <strong class="type-row">Type</strong>: <span data-bind="text: EventTypeName()"></span></p>
            </div>
        </a>
    </div>
    <div class="create-eventbtn" style="padding-bottom:10px;">
        <a onclick="showEvent1()" class="button-gra right" style="cursor:pointer;">
            <img src="images/create-event-icon.png" alt="create event">
            Create Event</a>
    </div>
</div>
