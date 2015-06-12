<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserDetailsControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.UserDetailsControl" %>
<acticle class="left-infomation-profile" style="height: 140px">
                     		<img class="profile-img" alt="" data-bind="attr: { src: Results()[0].ProfileFoto() }" Height="100"/>
                           <div class="header-right">
								<h3 style="margin:0;" class="profile-name" data-bind="text: Results()[0].DisplayName"> <a href="#"><img class="pro-profile" alt="" src="images/pro.png" /></a></h3>
								
								<div class="clear"></div>
								<p class="in-city"  ><span data-bind="text: Results()[0].City.Value"></span> <span data-bind="    text: Results()[0].Country.Value"></span></p>
								<p class="living" data-bind="text: Results()[0].Summary"></p>
								<img id="editProfile" class="edit-profile" alt="" src="images/edit-profile.png" data-bind="visible: isMyProfile()" />
								<%--<img class="edit-profile" alt="" src="images/actlvitilog.png" data-bind="visible: isMyProfile()"/>--%>
                               <input type="image" class="edit-profile" style="display:none"
                                   data-bind="
    attr: { src: setFriendshipStatus($data, $element) },
    click: function () { friendshipAction($data, $element, true); }
                                   "
                                   />
                               <input type="image" class="edit-profile decline" style="display:none" value="Decline" src="images/decline.png"
                                   data-bind="
    click: function () { friendshipAction($data, $element, false); }
                                   "
                                   />
							</div>
                     </acticle>

