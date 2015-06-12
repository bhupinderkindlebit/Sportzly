<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventDetailControl.ascx.cs" Inherits="Sportzly.Web.Controls.EventDetailControl" %>
<%@ Register Src="~/Controls/ActivitiesControl.ascx" TagPrefix="uc1" TagName="ActivitiesControl" %>
<%@ Register Src="~/Controls/ShareStatusControl.ascx" TagPrefix="uc1" TagName="ShareStatusControl" %>
<style type="text/css">
    .request {
        display: inline-block;
    }

    .number-135 > a {
        color: white;
        float: none;
    }

    h2.media {
        font-size: 18px;
    }

    div.search-member {
        float: left;
    }
</style>
<section id="wrapper">

    <section id="content">

        <section class="bottom-content-biker">





            <div class="clear"></div>



            <section class="left-bottom-content-biker eventEntity">

                <div class="video-biker">
                    <div>
                        <img alt="" width="200" height="200" data-bind="attr: { src: TeamLogoUrl() }, visible: TeamLogoUrl() != ''" id="imgEventLogo" />
                    </div>
                    <div class="info-video info-video2">

                        <div style="height: 10px;"></div>
                        <div class="infomation-sports">
                            <span class="suport">Event Type</span>
                            <a class="soccer" data-bind="text: EventTypeName()"></a>
                        </div>
                        <div class="infomation-sports">
                            <span class="suport">TEAM NAME</span>
                            <a class="soccer" data-bind="text: TeamName()"></a>
                        </div>
                        <%-- <div class="infomation-sports">
                            <span class="suport">SEASON</span>
                            <a class="soccer" data-bind="text: Season()"></a>
                        </div>
                        <!--End-infomation-sports-->

                        <!--End-infomation-sports-->
                        <div class="infomation-sports">
                            <span class="suport">Location</span>
                            <a class="soccer" data-bind="text: Location()"></a>
                        </div>
                        <div class="infomation-sports">
                            <span class="suport">Address</span>
                            <a class="soccer" data-bind="text: Address()"></a>
                        </div>--%>
                    </div>
                    <!--End-info-video-->
                    <div class="clear"></div>
                </div>
                <!--End-video-biker-->
                <div data-bind="visible: Attendees().length > 0 ">
                    <h2 class="media far">Attending <span>(<span class="soccer-text" data-bind="text: Attendees().length">0</span>)</span></h2>
                    <div class="video-biker">
                        <div data-bind="foreach: Attendees()">
                            <div class="info-video info-video3">

                                <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                                    <img data-bind="attr: { src: ProfileFoto() }" height="35px"></a>

                            </div>
                            <!--End-info-video2-->

                        </div>


                        <div class="clear"></div>
                    </div>
                </div>
                <!--End-video-biker-->
                <div data-bind="visible: Pending().length > 0 ">
                    <h2 class="media far">Pending <span>(<span class="soccer-text" data-bind="text: Pending().length">0</span>)</span></h2>
                    <div class="video-biker">
                        <div data-bind="foreach: Pending()">
                            <div class="info-video info-video3">

                                <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                                    <img data-bind="attr: { src: ProfileFoto() }" height="35px"></a>

                            </div>
                            <!--End-info-video2-->

                        </div>


                        <div class="clear"></div>
                    </div>
                </div>
                <!--End-video-biker-->
                <div data-bind="visible: NotAttending().length > 0 ">
                    <h2 class="media far">Not Attending <span>(<span class="soccer-text" data-bind="text: NotAttending().length">0</span>)</span></h2>
                    <div class="video-biker">
                        <div data-bind="foreach: NotAttending()">
                            <div class="info-video info-video3">

                                <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                                    <img data-bind="attr: { src: ProfileFoto() }" height="35px"></a>

                            </div>
                            <!--End-info-video2-->

                        </div>


                        <div class="clear"></div>
                    </div>
                </div>

            </section>
            <!--End-left-bottom-content-biker-->
            <script type="text/javascript">

                $(document).ready(function () {


                    $('#tlogo').hover(function () {
                        var logo = $("#ancEditEventNew").attr("logo");
                        if (logo == "true") {
                            $(".image_title").show();
                        }
                        else {
                            $(".image_title").hide();
                        }
                    }, function () { $(".image_title").hide(); });
                });
            </script>


        </section>


        <section class="right-bottom-content-biker">

            <section class="top-right-bottom-content-biker">

                <div class="eventEntity1">
                    <h2 class="media" style="padding: 10px;"><span class="number-135" data-bind="text: EventTypeName()"></span></h2>
                    <article style="width: 700px; float: left; background: none repeat scroll 0 0 #cccccc; height: auto; border-radius: 7px 7px 7px 7px; box-shadow: 2px 3px 2px #CCCCCC;">
                        <article style="width: 660px; height: auto; margin: 5px 10px; background: none repeat scroll 0 0  white; padding: 10px;">


                            <h2 class="media" style="text-transform: capitalize;"><span class="number-135" data-bind="text: EventName()"><a data-bind="    attr: { href: 'event.aspx?' + EventId() }"></a></span></h2>
                            <br />

                            <h2 class="media" style="text-transform: capitalize;">
                                <img src="images/calender.png" style="float: left;" /><span class="number-135" style="margin-left: 15px;"> <span data-bind="text: StartDateF()"></span>&nbsp;<span data-bind="    text: StartTime()"></span> to <span data-bind="    text: EndDateF()"></span>&nbsp;<span data-bind="    text: EndTime() + ' (' + TimeZone() + ')' "></span></span></h2>
                            <br />


                            <h2 class="media" style="text-transform: capitalize;">
                                <img src="images/location.png" style="float: left;" /><span data-bind="text: Address()" style="margin-left: 15px;" class="number-135"></span></h2>
                            <br />
                            <span data-bind="text: Comments()" style="margin-left: 15px;" class="number-135"></span>
                            <br />
                            <span id="Div1" data-bind="visible: IsMy()" style="margin-left: 350px; display: none;">
                                <a data-bind="attr: { href: 'createevent.aspx?id=' + EventId() }" class="request">EDIT</a>
                                <a data-bind="attr: { href: 'javascript:' }, click: function () { DeleteEvent($data); }" class="request">CANCEL</a>
                                <br>
                            </span>
                            <h2 class="media" style="text-transform: capitalize;">
                                <span id="respond" class="number-135" data-bind="visible: IsTeamMember()">
                                    <div data-bind="visible: !IsPast()" style="display: none;">
                                        Attending? <span data-bind="visible: HasResponse(), text: MyStatus()" class="request" style="background-color: #999999;"></span><a data-bind="    attr: { href: 'javascript:' }, click: function () { joinEvent($data, true); }, visible: MyStatus() != 'YES' && !IsPast()" class="request">YES</a>
                                        <a data-bind="attr: { href: 'javascript:' }, click: function () { joinEvent($data, false); }, visible: MyStatus() != 'NO' && !IsPast()" class="request">NO</a>
                                    </div>
                                    <br>
                                </span></h2>
                        </article>
                    </article>


                </div>

                <uc1:ShareStatusControl runat="server" ID="shareStatusControl" />
                <br />
                <br />
                <uc1:ActivitiesControl runat="server" ID="activitiesControl" />
            </section>
            <div class="footer-content-streams">

                <a href="javascript:void(0);moreActivities();" style="color: #fff" class="showmore">SHOW MORE POSTS</a>

            </div>
        </section>


        <div class="clear"></div>

    </section>
    <!--End-bottom-content-biker-->
