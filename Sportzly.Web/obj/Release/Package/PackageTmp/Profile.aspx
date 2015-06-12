<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" 
    Inherits="Sportzly.Web.Profile" MasterPageFile="~/MasterPages/ProfileMaster.Master" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/FooterControl.ascx" TagName="FooterControl" TagPrefix="uc2" %>
<%@ Register Src="Controls/ShareStatusControl.ascx" TagName="ShareStatusControl"
    TagPrefix="uc3" %>
<%@ Register Src="Controls/ActivitiesControl.ascx" TagName="ActivitiesControl" TagPrefix="uc4" %>
<%@ Register Src="Controls/UserDetailsControl.ascx" TagName="UserDetails" TagPrefix="uc5" %>
<%@ Register Src="Controls/UserBasicControl.ascx" TagName="UserBasic" TagPrefix="uc6" %>
<%@ Register Src="~/Controls/PhotoListMiniControl.ascx" TagPrefix="uc1" TagName="PhotoListMiniControl" %>
<%@ Register Src="~/Controls/FriendListMiniControl.ascx" TagPrefix="uc1" TagName="FriendListMiniControl" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <section id="wrapper">
                 <section id="header" class="infomation">
                    <div>
                        <uc5:UserDetails ID="UserDetails1" runat="server" />
                     </div>
                     
                         <uc6:UserBasic ID="UserBasic1" runat="server" />
                         
                     
                     <!--End-basic-info-->
                     
                     
                
                <section id="content" style="border: 1px solid #CCCCCC;margin: 20px 20px 0px 0px;width: 960px;background: #fff;">
                          <section class="bottom-content-biker">
                          <div class="left-main-menu"></div>
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
                          
                <section class="left-bottom-content-biker">
                            	      <uc1:PhotoListMiniControl runat="server" id="PhotoListMiniControl" />

                                  <div class="box-video">                         
										 <uc1:FriendListMiniControl runat="server" id="FriendListMiniControl" />
									</div>
                                    
								 
                              </section><!--End-left-bottom-content-biker-->
          
                        	<!--End-left-bottom-content-biker-->
                             <section class="right-bottom-content-biker" style="margin-top:0px;">
                            	<div class="top-right-bottom-content-biker">                                  
                                    
                                     <uc4:ActivitiesControl ID="ActivitiesControl1" runat="server" />
                                </div>
                                <!--End-top-right-bottom-content-biker-->
                             </section><!--End-right-bottom-content-biker-->
                            <div class="clear"></div>
                         </section><!--End-bottom-content-biker-->       	 
                    <div class="clear"></div>
                     <div class="footer-content">

                        	<a href="javascript:void(0);moreActivities();" style="color:#fff" class="showmore">SHOW MORE POSTS</a>

                    </div>
                </section><!--End-section-content-->
             </section>
    <!--End-wrapper-->
<%--    <script type="text/javascript">

        jQuery(document).ready(function () {
            jQuery('#mycarousel').jcarousel({
                start: 3
            });
            jQuery('#mycarousel-2').jcarousel({
                start: 3
            });
            jQuery('#mycarousel-2-1').jcarousel({
                start: 3
            });
            jQuery('#mycarousel-2-2').jcarousel({
                start: 3
            });
            jQuery('#mycarousel-2-3').jcarousel({
                start: 3
            });
        });

    </script>--%>
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
