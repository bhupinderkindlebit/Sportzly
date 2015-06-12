<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Communities.aspx.cs" Inherits="Sportzly.Web.Communities" %>
<%@ Register src="Controls/ProfileHeaderControl.ascx" tagname="ProfileHeaderControl" tagprefix="uc1" %>
<%@ Register Src="Controls/CommunityFilterControl.ascx" TagPrefix="uc1" TagName="CommunityFilterControl" %>
<%@ Register Src="Controls/CommunityListControl.ascx" TagPrefix="uc1" TagName="CommunityListControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
             <section id="wrapper">
             
                 <uc1:ProfileHeaderControl ID="ProfileHeaderControl1" runat="server" />
                
                <section id="side-bar">
                	<uc1:CommunityFilterControl runat="server" id="CommunityFilterControl" />
                    
                    <section class="bottom-side-bar">
                    	<h2 class="title-community-bottom">Partner Teams</h2>
                        <action class="sports">
                        	<p class="title-sports">NBC Sports</p>
                            <img class="img-sports" alt="" src="images/sports.png" />
                            <span class="clb">FOUNDER:</span>
                            <span class="name-clb">NBC Sports</span>
                            <span>9,589 Members</span>
                            <a href="#"><img class="view-sports" alt="" src="images/view.png" /></a>
                        </action><!--End-sports-->
                        <div class="clear"></div>
                        <action class="sports">
                        	<p class="title-sports">NBC Sports</p>
                            <img class="img-sports" alt="" src="images/sports.png" />
                            <span class="clb">FOUNDER:</span>
                            <span class="name-clb">NBC Sports</span>
                            <span>9,589 Members</span>
                            <a href="#"><img class="view-sports" alt="" src="images/view.png" /></a>
                        </action><!--End-sports-->
                        <div class="clear"></div>
                        <action class="sports">
                        	<p class="title-sports">NBC Sports</p>
                            <img class="img-sports" alt="" src="images/sports.png" />
                            <span class="clb">FOUNDER:</span>
                            <span class="name-clb">NBC Sports</span>
                            <span>9,589 Members</span>
                            <a href="#"><img class="view-sports" alt="" src="images/view.png" /></a>
                        </action><!--End-sports-->
                        <div class="clear"></div>
                        <action class="sports">
                        	<p class="title-sports">NBC Sports</p>
                            <img class="img-sports" alt="" src="images/sports.png" />
                            <span class="clb">FOUNDER:</span>
                            <span class="name-clb">NBC Sports</span>
                            <span>9,589 Members</span>
                            <a href="#"><img class="view-sports" alt="" src="images/view.png" /></a>
                        </action><!--End-sports-->
                        <div class="clear"></div>
                        <action class="sports">
                        	<p class="title-sports">NBC Sports</p>
                            <img class="img-sports" alt="" src="images/sports.png" />
                            <span class="clb">FOUNDER:</span>
                            <span class="name-clb">NBC Sports</span>
                            <span>9,589 Members</span>
                            <a href="#"><img class="view-sports" alt="" src="images/view.png" /></a>
                        </action><!--End-sports-->
                        <div class="clear"></div>
                        <action class="sports">
                        	<p class="title-sports">NBC Sports</p>
                            <img class="img-sports" alt="" src="images/sports.png" />
                            <span class="clb">FOUNDER:</span>
                            <span class="name-clb">NBC Sports</span>
                            <span>9,589 Members</span>
                            <a href="#"><img class="view-sports" alt="" src="images/view.png" /></a>
                        </action><!--End-sports-->
                    	<div class="clear"></div>
                    </section><!--End-bottom-side-bar-->
                    
                </section><!--End--side-bar-->
                
                
                
                
                
                <section id="content" class="communities">
                         <uc1:CommunityListControl runat="server" id="CommunityListControl" />

                      </section><!--End-left-communities-->
                    <div class="clear"></div>
                     <div class="footer-content">
                    	<select>
                        	<option><img alt="" src="images/$.png" />SHOW MORE ARTICLES</option>
                        </select>
                    </div>
                 </section><!--End-section-content-->
                <div class="clear"></div>
             </section>
   

</asp:Content>
