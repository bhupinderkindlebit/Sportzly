<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Community.aspx.cs" Inherits="Sportzly.Web.Community" %>

<%@ Register Src="Controls/ProfileHeaderControl.ascx" TagName="ProfileHeaderControl" TagPrefix="uc1" %>

<%@ Register Src="~/Controls/CommunityControl.ascx" TagPrefix="uc1" TagName="CommunityControl" %>
<%@ Register Src="Controls/CommunityFilterControl.ascx" TagPrefix="uc1" TagName="CommunityFilterControl" %>



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
                         

                    
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                     <uc1:CommunityControl runat="server" id="communityControl" Visible="false" />
                         <div style="text-align:right; padding-right:20px">
                     <asp:LinkButton ID="lbEdit" runat="server" OnClick="LinkButton1_Click" CssClass="linkButton" Visible="false">Edit Team</asp:LinkButton>
                             
                             <asp:LinkButton ID="lbCancel" runat="server" Visible="false" CssClass="linkButton" OnClick="lbCancel_Click">Cancel Editing</asp:LinkButton>
                             <asp:LinkButton ID="lbSave" runat="server"  CssClass="linkButton" Visible="false">Save Changes</asp:LinkButton>
                             </div>
                         </ContentTemplate>
                 </asp:UpdatePanel>

                      </section>
                 
                 <br />
                 <!--End-left-communities-->
                    <div class="clear"></div>
                     <div class="footer-content">
                    	
                    </div>
                 </section>
    <!--End-section-content-->
    <div class="clear"></div>
    </section>
   

</asp:Content>

