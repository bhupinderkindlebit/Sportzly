<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventListControl.ascx.cs" Inherits="Sportzly.Web.Controls.EventListControl" %>
<style type="text/css">
    @media screen and (-webkit-min-device-pixel-ratio:0)
    {
        span.sports-text
        {
            line-height: 20px;
        }
    }

    .sports-text
    {
        float: left;
        width: 75px;
    }

    .txt1
    {
        border: 1px solid #999999;
        border-radius: 3px;
        box-shadow: 0 0 5px #D6D6D6 inset;
        height: 110px;
        line-height: 20px;
        margin: 5px 0;
        padding-left: 8px;
        width: 185px;
    }

    .txt2
    {
        border: 1px solid #999999;
        border-radius: 3px;
        box-shadow: 0 0 5px #D6D6D6 inset;
        height: 50px;
        line-height: 20px;
        margin: 5px 0;
        padding-left: 8px;
        width: 140px;
    }
</style>
<div class="resp-tabs-container noborder-bottom">
    <div class="eventObjsList tab1 col-xs-12">
        <div class="myEventmenu">
            <ul>
<%--                <li class="dropdown">
                    <a href="events.aspx" class="btn btn-default dropdown-toggle" type="button" id="A1" data-toggle="dropdown"><span class="caret right"></span>Fixtures &nbsp; </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <i class="fa fa-fw ul-arrow1"></i>
                        <li role="presentation">
                            <a role="menuitem" tabindex="-1" href="events.aspx?" runat="server" id="myEvents">My Events</a>
                        </li>
                    </ul>
                </li>--%>
                <li><a class="btn btn-default" id="lnkFixtures">Fixtures &nbsp; </a></li>
                <li class="dropdown">
                    <a class="btn btn-default dropdown-toggle" type="button" id="A2" data-toggle="dropdown"><span class="caret right"></span>Date &nbsp;</a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <i class="fa fa-fw ul-arrow2"></i>
                        <li role="presentation">
                            <div id="datepicker"></div>
                            <input id="dateTo" type="text" data-validate="required" class="dateTo datepicker" />
                        </li>
                    </ul>
                </li>
                <%--<li><a id="lnkListCalender">Calender View</a></li>--%>
                <li><a class="btn btn-default" href="events.aspx?scorecard=1">Scorecards</a></li>
                <li class="dropdown"><a class="btn btn-default dropdown-toggle" type="button" id="A3" data-toggle="dropdown" onclick="refreshEvents(0);"><span class="caret right"></span>Type Of Events &nbsp; </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <i class="fa fa-fw ul-arrow3"></i>
                        <li role="presentation"><a style="cursor: pointer;" role="menuitem" tabindex="-1" runat="server" id="A4" onclick="refreshEvents(1);">Event</a></li>
                        <li role="presentation"><a style="cursor: pointer;" role="menuitem" tabindex="-1" runat="server" id="A5" onclick="refreshEvents(2);">Game</a></li>
                        <li role="presentation"><a style="cursor: pointer;" role="menuitem" tabindex="-1" runat="server" id="A6" onclick="refreshEvents(3);">Practice</a></li>
                    </ul>
                </li>
            </ul>
            <div style="text-align: right; float: right;">
                <select id="eventType" data-validate="required" class="eventType  chosen-select" style="width: 81px; display: none;" name="D1">
                    <option value="0">Types of Events</option>
                    <option value="1">Event</option>
                    <option value="2">Game</option>
                    <option value="3">Practice</option>
                </select>
                <input type="image" onclick="loadEvents(); return false;" src="images/refreshe.png" style="margin-top: -5px; display: none;" class="event" />
            </div>
        </div>
        <div class="schedule schedule-sec2">
            <div class="section-title section-title2">
                <h2 style="color: #646464;" id="spTitle"></h2>
                <a onclick="showEvent()" class="view-all right" id="ancCreateEvent" style="visibility: hidden; cursor: pointer; margin-top: 0px;">
                    <i class="fa fa-fw"></i> Create Event</a>
            </div>
            <div data-bind="foreach: Result, visible: Result().length > 0" style="display: none" class="myEventsList">
                <div class="left-schedule-list" style="background-color: #F3F3F8; float: left; width: 100%; text-align: center;">
                    <span class="chicago" data-bind="text: FormatStartDate()" style="margin-top: 0px; padding: 5px; color: black; font-size: 18px; width: 100%;"></span>
                </div>

                <div data-bind="foreach: Events, visible: Events().length > 0" style="display: none" class="eventpost">
                    <span class="post-img col-xs-2 col-sm-2 col-md-2 eat-nopadding">
                        <a data-bind="attr: { href: 'event.aspx?' + EventId() }">
                            <img class="chicago-img" alt="" data-bind="attr: { src: TeamLogoUrl() }, visible: TeamLogoUrl() != ''">
                            <h3 class="post-title" data-bind="text: TeamName()"></h3>
                        </a>
                    </span>

                    <div class="col-xs-6 col-sm-6 col-md-6 post-data eat-nopadding">
                        <p>
                            <strong>Event</strong> - <span data-bind="text: EventName()"></span>
                            <br />
                            <strong>Team</strong> - <span data-bind="text: TeamName() "></span>
                            <br>
                            <strong>Location</strong>: <span data-bind="text: Address()"></span>
                            <br>
                            <strong>Sport</strong>: <span data-bind="text: TeamSports()"></span><strong class="type-row">Type</strong>: <span data-bind="text: EventTypeName()"></span>
                        </p>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 post-data eat-nopadding date-text"><span data-bind="text: StartTime() + ' (' + TimeZone() + ')' "></span></div>
                    <div class=" col-xs-10 col-sm-10 col-md-10 post-data eat-nopadding">
                        <div class="section-title eventpost eventpostpadding" data-bind="visible: !AddResult()">
                            <div class="col-xs-6 col-sm-6 col-md-6 post-data eat-nopadding">
                                <span class="col-sm-6 col-md-6 attending">
                                    <h2>Attending <strong>(<span data-bind="text: AttendeeCount()"></span>)</strong></h2>
                                </span><span class="post-nobimg photos-col col-sm-6 col-md-6" data-bind="foreach: Attendees()">
                                    <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                                        <img data-bind="attr: { src: ProfileFoto() }"></a></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 post-data btnright">
                                <a class="btn btn-primary blue" data-bind="attr: { href: 'event.aspx?' + EventId() }">View Event</a>
                                <a onclick="editEvent()" class="resbtn" data-bind="attr: { href: 'javascript:' }, click: function () { editEvent($data); }, visible: !IsPast()"><i class="fa fa-fw"></i></a> <a class="greenbtn" data-bind="attr: { href: 'javascript:' }, click: function () { DeleteEvent($data); }, visible: !IsPast()"><i class="fa fa-fw"></i></a>
                            </div>
                        </div>
                        <div class="section-title eventpost eventpostpadding">
                            <div class="col-xs-6 col-sm-6 col-md-6 post-data eat-nopadding">
                                <div data-bind="visible: AddResult() && IsMy()">
                                    <span class="sports-text">Result : </span>
                                    <br />
                                    <div data-bind="foreach: ResultsGames(), visible: ResultsGames().length > 0">
                                        <textarea data-bind="attr: { id: 'txtResult' + $parent.EventId() }, value: Result()" placeholder="Enter the Result" class="txt1"></textarea>
                                    </div>
                                    <div data-bind="visible: ResultsGames().length == 0">
                                        <textarea data-bind="attr: { id: 'txtResult' + EventId() }" placeholder="Enter the Result" class="txt1"></textarea>
                                    </div>
                                    <span data-bind="attr: { id: 'sp' + EventId() }" style="color: #008800;"></span>
                                    <a class="request btn btn-primary blue" id="ancSave" data-bind="attr: { href: 'javascript:' }, click: function () { saveresult($data); }">SAVE RESULT </a>
                                </div>
                                <div data-bind="visible: AddResult() && !IsMy()">
                                    <span class="sports-text">Result : </span>
                                    <br />
                                    <div data-bind="foreach: ResultsGames()">
                                        <span class="sports-text" data-bind="text: Result()" style="width: 205px;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 post-data btnright">
                                <div id="respond" data-bind="visible: IsTeamMember()">
                                    <div data-bind="visible: !IsPast()">
                                        <div style="text-align: center" data-bind="visible: !HasResponse() && !IsPast()"></div>
                                        <span data-bind="visible: HasResponse(), text: MyStatus()" class="request" style="background-color: #999999;"></span>
                                        <a data-bind="attr: { href: 'javascript:' }, click: function () { joinEvent($data, true); }, visible: !HasResponse() && !IsPast()" class="request btn btn-primary blue">YES</a>

                                        <a data-bind="attr: { href: 'javascript:' }, click: function () { joinEvent($data, false); }, visible: !HasResponse() && !IsPast()" class="request btn btn-primary blue">NO</a>
                                        <br>
                                    </div>

                                </div>


                                <div id="Div1" data-bind="visible: IsMy()">

                                    <div data-bind="visible: AddResult()">
                                        <span class="sports-text">Scorecard : </span>
                                        <br />

                                        <a data-bind="attr: { href: 'javascript:' }, click: function () { uploadscorecard($data); }, visible: IsPast()" class="request btn btn-primary blue">ATTACH</a>
                                        <div data-bind="foreach: ResultsGames()" style="float: left; text-align: center; width: 100%;">
                                            <div data-bind="visible: ResultFile() != ''">
                                                <a class="btn btn-primary blue" data-bind="attr: { href: 'ScorecardDownload.ashx?filename=' + ResultFile() + '&name=' + $parent.TeamName() + '' }">Download Scorecard </a>
                                            </div>
                                        </div>
                                        <div style="float: left; text-align: center; width: 100%;">
                                            OR
                                        </div>
                                        <br />
                                        <div data-bind="foreach: ResultsGames(), visible: ResultsGames().length > 0">
                                            <textarea data-bind="attr: { id: 'txtUrl' + $parent.EventId() }, value: ResultUrl()" placeholder="Copy Scorecard URL" class="txt2"></textarea>
                                        </div>
                                        <div data-bind="visible: ResultsGames().length == 0">
                                            <textarea data-bind="attr: { id: 'txtUrl' + EventId() }" placeholder="Copy Scorecard URL" class="txt2"></textarea>
                                        </div>
                                        <span data-bind="attr: { id: 'sps' + EventId() }" style="color: #008800;"></span>
                                        <a class="request btn btn-primary blue" id="a7" data-bind="attr: { href: 'javascript:' }, click: function () { savescorecard($data); }">SAVE SCORECARD </a>
                                    </div>
                                    <br>
                                </div>
                                <div data-bind="visible: AddResult() && !IsMy()">
                                    <div>
                                        <span class="sports-text">Scorecard : </span>

                                        <div data-bind="foreach: ResultsGames()" style="text-align: center; width: 100%;">

                                            <div data-bind="visible: ResultFile() != ''">
                                                <a class="btn btn-primary blue" data-bind="attr: { href: 'ScorecardDownload.ashx?filename=' + ResultFile() + '&name=' + $parent.TeamName() + '' }">Download Scorecard </a>
                                            </div>

                                            <div data-bind="visible: ResultUrl() != ''">
                                                <a class="btn btn-primary blue" data-bind="attr: { href: ResultUrl() }" target="_blank">View Scorecard </a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-bind="visible: Result().length == 0" style="display: none">
                No events at this time for you
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $(".dateTo").datepicker({ dateFormat: "mm-dd-yy" });
        $("#dateTo").change(function () {
            loadEvents();
        });
    });

    function refreshEvents(eventtype) {
        $("#eventType").val(eventtype);
        loadEvents();
        if (emId != "") {
            $("#spTitle").text("My Events");
        }
        else {
            $("#spTitle").text("All Events");
        }
        if ($(".eventType").val() == "1") {
            $("#spTitle").text($("#spTitle").text() + ' - Events');
        }
        else if ($(".eventType").val() == "2") {
            $("#spTitle").text($("#spTitle").text() + ' - Games');
        }
        else if ($(".eventType").val() == "3") {
            $("#spTitle").text($("#spTitle").text() + ' - Pratices');
        }
        else {
            $("#spTitle").text($("#spTitle").text());
        }
    }
</script>
