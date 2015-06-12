<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FriendListControl.ascx.cs" Inherits="Sportzly.Web.Controls.FriendListControl" %>
<section id="content" class="friendList">
                	<article class="top-content-fans">
						<div class="fans-2">
							<span class="number-fans" data-bind="text:ResultCount"></span>
					
						</div>
                         <div class="link-2" style="display:none;">
                        	<a href="#">Fans</a>
                            <a href="#">Fanning</a>
                            <a href="#">Invite Contacts </a>
                        </div>
                        
                        	Search: <input class="search-fans" type="text" value="Search Friend" onblur="bindBlur(event)" onfocus="bindFocus(event)" />
                            
                        
                        <div class="clear"></div>
                    </article><!--End-top-content-fans-->
                    <article class="list-img-content-fans">
                    	<article class="top-list-img-content-fans">
                        	<ul data-bind="foreach: Result" class="freindsListUL">
                            	<li> <a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: DisplayName() }"><img data-bind="    attr: { src: ProfileFoto, alt: DisplayName }" width="137px" height="137px"></a><br />
                                	<span class="name-ct" data-bind="text:DisplayName"></span><br /><span class="soccerplayer" data-bind="text:getStatusText(Status())"></span>
                                </li>
                                
                            </ul>
                        </article><!--End-top-list-img-content-fans-->
                        
                       
                    </article><!--End-list-img-content-fans-->
                	
                	 
                    <div class="clear"></div>
                     <div class="footer-content">
                    	<%--<select>
                        	<option><img alt="" src="images/$.png" />SHOW MORE </option>
                        </select>--%>
                    </div>
                </section><!--End-section-content-->