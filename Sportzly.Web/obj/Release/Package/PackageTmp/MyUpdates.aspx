<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master"
    AutoEventWireup="true" CodeBehind="MyUpdates.aspx.cs" Inherits="Sportzly.Web.MyUpdates" %>

<%@ Register Src="Controls/ShareStatusControl.ascx" TagName="ShareStatusControl"
    TagPrefix="uc1" %>
<%@ Register Src="Controls/ActivitiesControl.ascx" TagName="ActivitiesControl" TagPrefix="uc2" %>
<%@ Register Src="Controls/UserDetailViewControl.ascx" TagName="UserDetailViewControl" TagPrefix="uc3" %>
<%@ Register Src="~/Controls/FriendListMiniControl.ascx" TagPrefix="uc1" TagName="FriendListMiniControl" %>
<%@ Register Src="~/Controls/PendingFriendsControl.ascx" TagPrefix="uc1" TagName="PendingFriendsControl" %>
<%@ Register Src="~/Controls/PendingTeamRequestControl.ascx" TagPrefix="uc1" TagName="PendingTeamRequestControl" %>
<%@ Register Src="~/Controls/EventListMiniControl.ascx" TagPrefix="uc1" TagName="EventListMiniControl" %>

<%@ Register Src="~/Controls/EventsForthComingControl.ascx" TagPrefix="uc1" TagName="EventsForthComingControl" %>


<%@ Register Src="Controls/PendingInvitesListMiniControl.ascx" TagName="PendingInvitesListMiniControl" TagPrefix="uc4" %>


<%@ Register Src="Controls/StreamProfileUpdate.ascx" TagName="StreamProfileUpdate" TagPrefix="uc5" %>
<%@ Register Src="~/Controls/FeedControl.ascx" TagPrefix="uc1" TagName="FeedControl" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!--End-header-->
    <section class="wrapper">

        <section id="content" class="content-streams">

            <section class="bottom-content-biker">

                <section class="left-streams">

                    <uc5:StreamProfileUpdate ID="StreamProfileUpdate1" runat="server" />


                    <uc1:EventsForthComingControl runat="server" ID="EventsForthComingControl" />
                    <uc1:FeedControl runat="server" ID="FeedControl" />
                    <uc1:ShareStatusControl ID="ShareStatusControl1" runat="server" />


                    <nav class="main-menu menu-streams">

                        <ul>

                            <li>

                                <span>

                                    <a href="#">Overview</a>

                                </span>

                            </li>

                            <li>

                                <span>

                                    <a href="#">Documents</a>

                                </span>

                            </li>

                            <li>

                                <span>

                                    <a href="#">Photos</a>

                                </span>

                            </li>

                            <li>

                                <span>

                                    <a href="#">Quotes</a>

                                </span>

                            </li>

                            <li>

                                <span>

                                    <a href="#">Videos</a>

                                </span>

                            </li>



                        </ul>

                        <%-- <select>

                        	<option><img alt="" src="images/$.png" />Stream</option>

                        </select>--%>
                    </nav>

                    <div class="clear"></div>





                    <section class="left-bottom-content-biker-streams">
                        <div class="left-bottom-content-biker-streams-border">
                            <section class="top-right-bottom-content-biker">
                                <uc2:ActivitiesControl ID="ActivitiesControl1" runat="server" />
                            </section>
                            <!--End-top-right-bottom-content-biker-->
                        </div>
                        <div class="footer-content-streams">
                            <a href="javascript:void(0);moreActivities();" style="color: #fff" class="showmore">SHOW MORE POSTS</a>
                        </div>
                    </section>
                    <!--End-left-bottom-content-biker-->


                </section>

                <section class="right-bottom-content-biker-stream">

                    <uc3:UserDetailViewControl
                        ID="UserDetailViewControl1" runat="server" />
                    &nbsp;<article class="marcus-schwartz" style="margin-top: 0px;">
                        <article class="menu-marcus">
                            <ul>

                                <li class="active" style="width: 95px;"><a href="#" class="friend"><span id="MyUpdatesPendingResultCount" style="display: none;"></span></a></li>
                                <%--  <li><a href="#" class="mail"></a></li>--%>
                                <li style="width: 96px;"><a href="#" class="football"><span id="MyUpdatesTeamPendingResultCount" style="display: none;"></span></a></li>
                                <li class="finally" style="width: 95px;"><a href="#" class="calender"><span id="spCalenderResult" style="display: none;"></span></a></li>

                            </ul>
                            <div class="text-marcus">
                                <uc1:PendingFriendsControl runat="server" ID="PendingFriendsControl" />
                            </div>
                            <%--<div class="text-marcus">
											tab2
										</div>--%>
                            <div class="text-marcus">
                                <uc1:PendingTeamRequestControl runat="server" ID="PendingTeamRequestControl" />
                            </div>
                            <div class="text-marcus">
                                <uc1:EventListMiniControl runat="server" ID="EventListMiniControl" />
                            </div>


                        </article>

                        <article class="album-galery">
                            <uc1:FriendListMiniControl runat="server" ID="FriendListMiniControl" />
                            <%--<a href="Friends.aspx"><img alt="" src="images/alink.png"/></a>--%>



                            <div class="clear"></div>

                        </article>

                        <article class="album-galery">
                            <uc4:PendingInvitesListMiniControl ID="PendingInvitesListMiniControl1" runat="server" />
                            <div class="clear"></div>
                        </article>
                    </article>


                    <article class="ads">

                        <img alt="" src="images/ads.png" style="display: none;" />

                    </article>
                </section>
                <!--End-right-bottom-content-biker-->



                <div class="clear"></div>

            </section>
            <!--End-bottom-content-biker-->

            <div class="clear"></div>

        </section>
        <!--End-section-content-->
    </section>
    <!--End-wrapper-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            var index = 0;
            jQuery('.text-marcus').eq(0).show();
            jQuery('.menu-marcus ul li').click(function () {
                $('.menu-marcus ul li').not(this).removeClass('active');
                $(this).addClass('active');
                var z = $(this).index();
                jQuery('.text-marcus').not($('.text-marcus').eq(z)).hide();
                jQuery('.text-marcus').eq(z).show();

                return false;
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var ellipsestext = "...";
            var moretext = "See More";
            var lesstext = "See Less";

            $("body").delegate(".morelinkb", "click", function (event) {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });

            $("body").delegate(".morelinka", "click", function (event) {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });

        });
    </script>
</asp:Content>

