<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlayerListControl.ascx.cs" Inherits="Sportzly.Web.Controls.PlayerListControl" %>

<div data-bind="foreach: Result(), visible: Result().length > 0" class="teamsList" style="display: none">
    <div class="schedule-list">

        <div class="left-schedule-list" style="width: 185px;">

            <a data-bind="attr: { href: 'profile.aspx?' + EmailId() }">
                <img class="chicago-img" width="155" height="155" alt="" data-bind="    attr: { src: ProfilePhoto() }">

                <span class="chicago" data-bind="text: DisplayName()"></span></a>

        </div>
        <!--End-left-schedule-list-->

        <div class="center-schedule-list">

            <span class="sports-text">SPORTS: <span class="soccer-text" data-bind="text: FavSports()"></span></span><%--<span class="text-right">Stats</span>--%><br>

            <span class="sports-text">LOCATION: <span class="soccer-text" data-bind="text: City()"></span>, <span class="soccer-text" data-bind="    text: Country()"></span></span>
            <br>

            <span class="sports-text">LEVEL:  <span class="soccer-text" data-bind="text: Level()"></span></span>
            <br>
             <span class="sports-text">ROLE:  <span class="soccer-text" data-bind="text: Role()"></span></span>
            <br>
            <br />



            <span class="soccer-text soccer-text2" data-bind="text: Summary()"></span>

        </div>
        <!--End-center-schedule-list-->
      <div class="right-schedule-list">

            <span class="sports-text">Friends (<span class="soccer-text" data-bind="text: FriendCount()"></span>)</span>
            <span class="text-right"><a data-bind="attr: { href: 'friends.aspx?' + EmailId() }">See All</a></span><br>

            <div class="video-biker video-biker2">
                <div data-bind="foreach: Friends()">
                    <!-- ko if: $index() < 8 -->
                    <div class="info-video info-video3">

                        <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                            <img data-bind="attr: { src: Profilephoto(), alt: DisplayName() }" height="35px"></a>

                    </div>
                    <!--End-info-video2-->
                    <!-- /ko -->

                </div>
                <div data-bind="foreach: Friends1()">
                    <!-- ko if: $index() < 8 -->
                    <div class="info-video info-video3">

                        <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }">
                            <img data-bind="attr: { src: Profilephoto() }" height="35px"></a>

                    </div>
                    <!--End-info-video2-->
                    <!-- /ko -->

                </div>
                <div class="clear"></div>

            </div>
            <!--End-video-biker-video-biker2-->

        </div>
<div class="right-schedule-list-request">

            <span data-bind="visible: !MyFriend()">
                <a data-bind="attr: { href: 'javascript:' }, click: function () { sendFriendshipRequest($element, Id()); }, visible: !MyFriend()" class="request">Connect</a>
                </span>
              
          
              <%-- <input type="image" class="edit-profile" style="display:none"
                                   data-bind="
    attr: { src: setFriendshipStatus(Status(), $element) },
    click: function () { friendshipAction(Status(), $element, true,Id()); }
                                   "
                                   />
                               <input type="image" class="edit-profile decline" style="display:none" src="images/decline.png"
                                   data-bind="
    click: function () { friendshipAction($data, $element, false); }
                                   "
                                   />--%>
           
           
        </div>        <div class="clear"></div>
    </div>
    <!--End-right-schedule-list-request-->

    

</div>
<!--End-schedule-list-->

