<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TeamListControl.ascx.cs" Inherits="Sportzly.Web.Controls.TeamListControl" %>

<div data-bind="foreach: Result(), visible: Result().length > 0" class="teamsList" style="display: none">
    <div class="schedule-list">

        <div class="left-schedule-list" style="width: 185px;">

            <a data-bind="attr: { href: 'javascript:' }, click: function () { CheckTeam($data); }">
                <img class="chicago-img" width="155" height="155" alt="" data-bind="    attr: { src: Photo() }">

                <span class="chicago" data-bind="text: TeamName()"></span></a>

        </div>
        <!--End-left-schedule-list-->

        <div class="center-schedule-list">

            <span class="sports-text">SPORTS: <span class="soccer-text" data-bind="text: SportsName()"></span></span><%--<span class="text-right">Stats</span>--%><br>

            <span class="sports-text">SEASON: <span class="soccer-text" data-bind="text: Season()"></span></span><%--<span class="text-right">Leagues</span>--%><br>

            <span class="sports-text">LOCATION: <span class="soccer-text" data-bind="text: City()"></span>, <span class="soccer-text" data-bind="    text: Country()"></span></span>
            <br>

            <span class="sports-text">LEVEL:  <span class="soccer-text" data-bind="text: TeamCategory()"></span></span>
            <br>
            <br />

            <span class="sports-text">ABOUT:
                <br>
                <span class="soccer-text soccer-text2" data-bind="text: Description()"></span></span>

        </div>
        <!--End-center-schedule-list-->

        <div class="right-schedule-list">

            <span class="sports-text">Roster (<span class="soccer-text" data-bind="text: MemberCount()"></span>)</span>
            <span class="text-right"><a data-bind="attr: { href: 'members.aspx?' + Id() }">See All</a></span><br>

            <div class="video-biker video-biker2">
                <div data-bind="foreach: Members()">
                    <!-- ko if: $index() < 8 -->
                    <div class="info-video info-video3">

                        <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                            <img data-bind="attr: { src: Photo() }" height="35px"></a>

                    </div>
                    <!--End-info-video2-->
                    <!-- /ko -->

                </div>

                <div class="clear"></div>

            </div>
            <!--End-video-biker-video-biker2-->

        </div>
        <!--End-right-schedule-list-->

        <div class="right-schedule-list-request">
            <div style="float: left; width: 200px; height: 60px;">
                <div style="float: left; width: 85px; height: 50px;">
                    <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: OwnerName() }">
                        <img data-bind="attr: { src: PhotoPath() }" height="50" style="margin-top: 0px;" />
                    </a>
                </div>
                <div style="float: left; width: 115px; height: auto;">
                    <span class="sports-text">FOUNDER:</span>
                    <br />
                    <a data-bind="attr: { href: 'profile.aspx?' + EmailId() }"><span class="soccer-text" style="color: #008800; font-weight: bold;" data-bind="    text: OwnerName()"></span></a>
                </div>
            </div>
            <span class="sports-text" style="margin-left: 25px;">&nbsp;<span class="soccer-text"></span></span>
            <%--  <span class="sports-text" style="margin-left: 25px;">Founded: <span class="soccer-text" data-bind="text: FoundedDate()"></span></span>--%>
            <%-- <a class="request" data-bind="attr: { href: 'team.aspx?' + Id() }, visible: MyTeam()">VIEW TEAM</a>--%>

            <span data-bind="visible: !MyTeam()">
                <a data-bind="attr: { href: 'javascript:' }, click: function () { joinTeam($data, true); }, visible: !Joined()" class="request">Request to Join</a><a data-bind="    attr: { href: 'javascript:' }, click: function () { joinTeam($data, false); }, visible: Joined()" class="request">Withdraw Request</a>
                <div data-bind="visible: !IsPrivate()">
                    <a data-bind="attr: { href: 'javascript:' }, click: function () { followTeam($data, true); }, visible: !Followed()" class="request">BECOME A FAN</a>
                    <a data-bind="attr: { href: 'javascript:' }, click: function () { followTeam($data, false); }, visible: Followed()" class="request">LEAVE FANNING</a>
                </div>

            </span>
            <a data-bind="attr: { href: 'newteam.aspx?' + Id() }, visible: MyTeam()" class="request">EDIT TEAM DETAILS</a>
            <a data-bind="attr: { href: 'javascript:' }, click: function () { deleteTeam($data); }, visible: MyTeam()" class="request">DELETE TEAM</a>
            <%--<span data-bind="visible: !MyTeam()">
                <a class="send-a-message" href="">send a message</a>
            </span>--%>
        </div>
        <!--End-right-schedule-list-request-->

        <div class="clear"></div>

    </div>
    <!--End-schedule-list-->
</div>
