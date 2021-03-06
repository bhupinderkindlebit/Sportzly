﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="Sportzly.Web.Terms" %>

<%@ Register Src="Controls/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc1" %>
<%@ Register src="Controls/SignupControl.ascx" tagname="SignupControl" tagprefix="uc2" %>
<%@ Register src="Controls/ErrorControl.ascx" tagname="ErrorControl" tagprefix="uc3" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
	<meta charset="utf-8">
	<title>Sportzly-About Us</title>
	<script language="javascript" src="Scripts/jquery-1.9.1.min.js"></script>
	<script language="javascript" src="Scripts/knockout-2.2.1.js"></script>
</head>
<body>
	<form id="form1" runat="server">
	<asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server">
	</asp:ScriptManager>
    </form>
	<uc3:ErrorControl ID="ErrorControl1" runat="server" />

	<div class="page">
		<section id="login-drawer" style="display: block;"><uc1:LoginControl ID="LoginControl1" runat="server" />
			
		</section>
		<header id="home-header">
			<div class="holder">
				<h1 class="logoOuter"><a href="#"></a></h1>
				<div class="actions" style="display: none;"><a class="login-button close">LOGIN</a></div>
				<ul id="home-nav">
					<li><a href="howitworks.aspx">HOW IT WORKS</a></li>
					<li><a href="default.aspx">SIGN UP</a></li>
				</ul>
			</div>
		</header>
		<%--<section id=<"main-slider">
			
            <div class="Terms-area">
                
                <div class="Terms-area-wrapper" > --%> 
    <br />  
        <section id="wrapper" class="form">                
                   
                  <h2>Terms of Use</h2>
                                                                   
                   <br />
                INTRODUCTION
 
 <p>
This Agreement contains the complete terms and conditions that apply to your participation in our site.
      The Agreement describes and encompasses the entire agreement between us and you, and supersedes all 
     prior or contemporaneous agreements, representations, warranties and understandings with respect to the
      Site, the content and computer programs provided by or through the Site, and the subject matter of this Agreement.
      If you wish to become a member of this social networking website and communicate with other members,
      please read these terms of use carefully before using our site and its services. 
     By accessing this site or using any part of the site or any content or services hereof, you agree to become
      bound by these terms and conditions. If you do not agree to all the terms and conditions, then you may not access the 
     site or use the content or any services in the site. Amendments to this agreement can be made and effected by us from time 
     to time without specific notice to your end. Agreement posted on the Site reflects the latest agreement and you should 
     carefully review the same before you use our site.
 </p>
                    <br />
<b>ELIGIBILITY</b>
  <br />
  <p>
This website including its tools, applications and services are intended solely 
      for access and use by individual who are at least (13) years old and above. 
      By accessing and using our website including its tools, applications and services,
       you warrant and represent that you are at least  (13) years old and with full authority,
       right, and capacity to enter into this Agreement and to abide by all of the terms and conditions of this Agreement.
 </p>
 
<b>Use of the site & PROHIBITIONS</b>
                     <br />
 <p>
This site allows you to join social networks, gain friends, mingle with your love ones, express your thoughts, 
     and make some comments and discussion, and communicate with other members. You understand and agree,
      however, that you will use this site including its tools and services with full sense of responsibility 
     and in a manner that is consistent with these Terms and in such a way as to ensure compliance with all
      applicable laws and regulations. You agree that you will use the site and its services in compliance with 
     all applicable local, state, national, and international laws, rules and regulations, including any laws 
     regarding the transmission of technical data exported from your country of residence and all United States export control laws.
You may view, download for collection purposes only, and print pages or other contents from the website for your own personal use,
      subject to the restrictions set out below and elsewhere in these terms of use.
(a) you must not use our sites, including its services and or tools if you are not able to form legally binding 
     contracts, are under the age of 13, or are temporarily or indefinitely suspended from using our sites, services, or tools
(b) you should not post any blogs, items, messages, and or contents that are inappropriate and fails to observe sense of decency 
     and or would offend other persons;
(c) you must not republish, sell, rent or sub-license any materials from this website including republication on another website;
(d) you must not collect and disclose information about users’ personal information;
(e) you must not reproduce, duplicate, copy or otherwise exploit material on our website for a commercial purpose
(f) you must not post false, inaccurate, misleading, defamatory, or libelous content;
(g) you must not take any action that may damage the rating system.
(h) You must not use our website in any way that causes, or may cause, damage to the website or 
     impairment of the availability or accessibility of the website; or in any way which is unlawful, 
     illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity.
 </p>
                    <br />
REGISTRATION / MEMBER ACCOUNT
                    <br />
                    <p>
As a condition of becoming a member of this social networking website including the use of its tools, 
 applications and services, you are required to register with the site and be required to provide
  password and user name. You must complete the full registration process and shall provide the site
   with accurate, complete, and updated registration information. Failure to do so shall constitute a 
   breach of the Terms of Use, which may result in immediate termination of your account.
You are entirely responsible for maintaining the confidentiality of your password. You agree not to 
 use the Member Account, Member profile, username, or password of another Member at any time. 
  You agree to notify us immediately if you suspect any unauthorized use of your Member Account or
  Member profile or access to your password. You are solely responsible for 
  any and all use of your Member Account and Member profile. You must not transmit any worms or
  viruses or any code of a destructive nature. Any information provided by you or gathered by the 
  site or third parties during any visit to the site shall be subject to the terms of Sportzly’s Privacy Policy.
In addition, you may not register for more than one Member Account, register for a Member Account on behalf of an
 individual other than yourself or register a Member Account on behalf of any group or entity. Furthermore, you may 
 not use or attempt to use another's Member Account without authorization from us or create a false identity on our Services.
</p>
 <br />

<b>NON-COMMERCIAL USE BY MEMBERS.</b>
<p>
Members on this social networking website are prohibited to use the services of the website in connection
 with any commercial endeavors or ventures. This includes providing links to other websites, whether deemed 
    competitive to this website or not. Juridical persons or entities including but not limited to organizations, 
    companies, and/or businesses may not become Members of Sportzly and should not use the site for any purpose.
</p>
 <br />
<b>LINKs & FRAMINGS</b>
<br />
 <p>                   
Illegal and/or unauthorized uses of the Services, including unauthorized framing of or linking to the Sites will 
     be investigated, and appropriate legal action may be taken. Some links, however, are welcome to the site and 
     you are allowed to establish hyperlink to appropriate part within the site provided that: (i) you post your 
     link only within the forum, chat or message board section; (ii) you do not remove or obscure any advertisements, 
     copyright notices or other notices on the placed at the site; (iii) the link does not state or imply any sponsorship
      or endorsement of your site and (iv) you immediately stop providing any links to the site on written notice from us.
      However, you must check the copyright notice on the homepage to which you wish to link to make sure that one of our
      content providers does not have its own policies regarding direct links to their content on our sites.
</p>
 <br />
<b>CHAT ROOMS, FORUMS, COMMUNICATIONS AND OTHER MATERIALS POSTED BY YOU</b>
<br />
  <p>
You are responsible for the content of your communications, messages and posts, and its consequences. 
      We reserves the right to terminate your registration if we become aware, at our sole discretion,
       that you are violating any of the guidelines set forth in this agreement and privacy policy. 
      While we want to encourage an open exchange of information and ideas, yet, we do not review postings 
      made in any chat rooms, forums and other public-posting areas on the site. You can expect these areas 
      to include information and opinions from a variety of individuals and organizations other than us. We do
       not endorse or guarantee the accuracy, integrity or quality of any posting, regardless of whether the posting 
      comes from a user, from a celebrity or "expert" guest, or from a member of our staff.
By participating in this social networking site, you understand and agree not to post or transmit any material that,
       in our judgment, is defamatory, abusive, obscene, threatening or unlawful in any way, or any material that infringes 
      on the rights of others or contains any virus or other computer programming routine which may interfere with or damage
       the site or otherwise interrupt on the ability of others to use or enjoy the same. We reserve the right to delete, 
      move or edit any postings that come to our attention that we consider unacceptable or inappropriate, whether for 
      legal or for any other reason. Furthermore, we reserve the right to deny access to anyone who we believe, in our
       sole discretion, has in any way breached these Terms or where we reasonably believe a user does not comply 
      with any relevant age restrictions on the site.
 </p>
 <br />
<b>
WARRANTY DISCLAIMER AND EXCLUSIONS / LIMITATIONS OF LIABILITY</b>
<p>
You represent and warrant that (a) all of the information provided by you to our webiste to participate
     in the Service is correct and current; and (b) you have all necessary right, power and authority to 
    enter into this Agreement and to perform the acts required of you hereunder.
You hereby accepts and agree that it is beyond our control, and no duty to take any action regarding: which 
    users gain access to the Site or use the Services; what effects the Content may have on you; how you may
     interpret or use the Content; or what actions you may take as a result of having been exposed to the Content.
     You release us from all liability for you having acquired or not acquired Content through the Site or the Services.
It should noted that the Site or Services may contain, or direct you to sites containing, information that 
    some people may find offensive or inappropriate. We make no representations concerning any content contained
     in or accessed through the Site or Services, and we will not be responsible or liable for the accuracy,
     copyright compliance, legality or decency of material contained in or accessed through the Site or the Services. 
    THE SERVICE, CONTENT, AND SITE ARE PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS 
    OR IMPLIED, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.
In addition, we make no representation that the operation of our site will be uninterrupted or error-free, and we will
     not be liable for the consequences of any interruptions or errors. We may change, restrict access to, suspend or
     discontinued the site or any part of it at anytime. The information, content and services on the site are provided
     on an “as is” basis. When you use the site and or participate herein, you understand and agree that you participate at your own risk.
</p>
 <br />
<b>
INTELLECTUAL PROPERTY rights</b>
<p>
The Web allows people throughout the world to share valuable information, ideas and creative works. To ensure continued open access to 
    such materials, we all need to protect the rights of those who share their creations with us. Although we make the Site freely accessible,
     we don't intend to give up our rights, or anyone else's rights, to the materials appearing on them. The materials available on the site
     shall remain the property of Sportzly and/or its licensors, and are protected by copyright, trademark and other intellectual property 
    laws. You acquire no proprietary interest in any such rights. Furthermore, you may not remove or obscure the copyright notice or any
     other notices contained in the site or anything retrieved or downloaded from them.
You hereby acknowledge that all rights, titles and interests, including but not limited to rights covered by the Intellectual Property Rights,
     in and to the site, and that You will not acquire any right, title, or interest in or to the site except as expressly set forth in this 
    Agreement. You will not modify, adapt, translate, prepare derivative works from, decompile, reverse engineer, disassemble or otherwise
     attempt to derive source code from any of our services, software, or documentation, or create or attempt to create a substitute or 
    similar service or product through use of or access to the Program or proprietary information related thereto.
 </p>
                    <br />
<b>Confidentiality</b>
<p>
You agree not to disclose information you obtain from us and or from our clients, advertisers, suppliers and forum members. 
    All information submitted to by an end-user customer pursuant to a Program is proprietary information of Sportzly. 
    Such customer information is confidential and may not be disclosed. Publisher agrees not to reproduce, disseminate, 
    sell, distribute or commercially exploit any such proprietary information in any manner.
</p>
 <br />
                   
 <b>NON-ASSIGNMENT OF RIGHTS
</b>
 <p>
 Your rights of whatever nature cannot be assigned nor transferred to anybody, and any such attempt may result in 
     termination of this Agreement, without liability to us. However, we may assign this Agreement to any person at any time without notice.
</p>
 <br />
<b>
Waiver and Severability of Terms.</b>
<br />
<p>
Failure of the Sportzly to insist upon strict performance of any of the terms, conditions and covenants hereof shall not be deemed a 
    relinquishment or waiver of any rights or remedy that the we may have, nor shall it be construed as a waiver of any subsequent 
    breach of the terms, conditions or covenants hereof, which terms, conditions and covenants shall continue to be in full force and effect.
No waiver by either party of any breach of any provision hereof shall be deemed a waiver of any subsequent or prior breach of the 
    same or any other provision.
In the event that any provision of these Terms and Conditions is found invalid or unenforceable pursuant to any judicial decree or 
    decision, such provision shall be deemed to apply only to the maximum extent permitted by law, and the remainder of these Terms 
    and Conditions shall remain valid and enforceable according to its terms.
</p>
 <br />
<b>                    
Entire Agreement</b>
 <br />
<p>
This Agreement shall be governed by and construed in accordance with the substantive laws of United States of America, 
    without any reference to conflict-of-laws principles. The Agreement describes and encompasses the entire agreement 
    between us and you, and supersedes all prior or contemporaneous agreements, representations, warranties and understandings
     with respect to the Site, the contents and materials provided by or through the Site, and the subject matter of this Agreement.
</p>
 <br />

<b>Choice of Law; Jurisdiction; Forum</b>
                    <br />
<p>
Any dispute, controversy or difference which may arise between the parties out of, in relation to or in connection with this Agreement 
    is hereby irrevocably submitted to the exclusive jurisdiction of the courts of United States of America, to the exclusion of any other 
    courts without giving effect to its conflict of laws provisions or your actual state or country of residence.
</p>
 <br />
 <b>Term</b> 
<br />
<p>
This Agreement will remain in full force and effect while you use the Website. You may terminate your membership at any time for 
    any reason by following the instructions on the “TERMINATION OF ACCOUNT” in the setting page. We may terminate your membership 
    for any reason at any time. If you are using a paid version of the Service and we terminate your membership in the Service because 
    you have breached this Agreement, you will not be entitled to any refund of unused subscription fees. Even after your membership is 
    terminated, certain sections of this Agreement will remain in effect.
</p>
 
             </section>
            
            <div class="wrapper">
				<div class="slide-title" style="background:none;">Sharing Sports Beats Has Never Been this Cool!
				We are a social network that provides you informative news and great deals based on your interest - sports.
				</div>
			
				<div class="clearfix"></div>
				<div id="Div1" style="display: none;">
					<div class="feature-box">
						<div class="feature-box-content">
						<h2 class="content-image-a">Explore recreational sports</h2>
						<p>Find players, partners, teams, games and leagues, or just see what's happening in your area.</p>
						</div>
					</div>
					<div class="feature-box">
						<div class="feature-box-content">
						<h2 class="content-image-b">Connect with players in your area</h2>
						<p>Find players, partners, teams, games and leagues, or just see what's happening in your area.</p>
						</div>
					</div>
					<div class="feature-box last">
						<div class="feature-box-content">
						<h2 class="content-image-c">Organize team games and leagues</h2>
						<p>Find players, partners, teams, games and leagues, or just see what's happening in your area.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="wrapper">
				<div class="slide-title" style="background:none;">Sharing Sports Beats Has Never Been this Cool!
				We are a social network that provides you informative news and great deals based on your interest - sports.
				
				<div class="clearfix"></div>
				<div id="features" style="display: none;">
					<div class="feature-box">
						<div class="feature-box-content">
						<h2 class="content-image-a">Explore recreational sports</h2>
						<p>Find players, partners, teams, games and leagues, or just see what's happening in your area.</p>
						</div>
					</div>
					<div class="feature-box">
						<div class="feature-box-content">
						<h2 class="content-image-b">Connect with players in your area</h2>
						<p>Find players, partners, teams, games and leagues, or just see what's happening in your area.</p>
						</div>
					</div>
					<div class="feature-box last">
						<div class="feature-box-content">
						<h2 class="content-image-c">Organize team games and leagues</h2>
						<p>Find players, partners, teams, games and leagues, or just see what's happening in your area.</p>
						</div>
					</div>
				</div>
			</div>
                </div>
		</section>
		<section id="middle" style="display: none;">
				<div class="video-block">
					<div class="video-supp">
						<h1>What is <strong class="colorize">Sportzly?</strong></h1>
						<p><strong>Sportzly is a different kind of social network</strong> all about organizing and managing your sports. It's a tool for organizing your sports teams online, for planning games and events, and for managing and promoting your league. It's for people who are passionate about playing sports and staying active. If that's you, you've come to the right place!</p>
						<a class="discover-btn lightbox">Discover a whole new world of sports!</a>
					</div>
					<div class="video-player">
						<div class="video-player-component">
								<a href="#" class="video-player-splash">
									<span class="video-player-overlay"></span>
									<span class="video-player-btn"></span>
								</a>
						</div>
						<span class="video-player-shadow"></span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="trending-now-section">
					<h3 class="heading">Trending Now</h3>
					<div class="article-tile">
						<a href="#" class="article-tile-body">
							<span class="article-tile-thumbnail">
								<span class="article-tile-thumbnail-image">
									<img src="images/article-image-01.jpg">
								</span>
								<span class="article-tile-title">
									<span class="article-tile-overlay"></span>
									<strong class="article-tile-title-text">He's the best around</strong>
								</span>
								<span class="article-tile-description">
									<span class="article-tile-description-text">James had 26 points, 11 rebounds and 13 assists, and got the kind of help that was worth leaving home for, leading the Heat in a 121-106 rout of the Oklahoma City Thunder on Thursday night...</span>
								</span>
							</span>
						</a>
					</div>
					<div class="article-tile">
						<a href="#" class="article-tile-body">
							<span class="article-tile-thumbnail">
								<span class="article-tile-thumbnail-image">
									<img src="images/article-image-02.jpg">
								</span>
								<span class="article-tile-title">
									<span class="article-tile-overlay"></span>
									<strong class="article-tile-title-text">Finally an NBA champion</strong>
								</span>
								<span class="article-tile-description">
									<span class="article-tile-description-text">James had 26 points, 11 rebounds and 13 assists, and got the kind of help that was worth leaving home for, leading the Heat in a 121-106 rout of the Oklahoma City Thunder on Thursday night...</span>
								</span>
							</span>
						</a>
					</div>
					<div class="article-tile last">
						<a href="#" class="article-tile-body">
							<span class="article-tile-thumbnail">
								<span class="article-tile-thumbnail-image">
									<img src="images/article-image-03.jpg">
								</span>
								<span class="article-tile-title">
									<span class="article-tile-overlay"></span>
									<strong class="article-tile-title-text">Hammel strikes out 10 in Orioles' win against Nationals</strong>
								</span>
								<span class="article-tile-description">
									<span class="article-tile-description-text">James had 26 points, 11 rebounds and 13 assists, and got the kind of help that was worth leaving home for, leading the Heat in a 121-106 rout of the Oklahoma...</span>
								</span>
							</span>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="featured-members-section">
					<h3 class="heading">Featured Members</h3>
					<div class="featured-members-container">
						<div class="user-tile">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-01.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Amanda H.</a>
						</div>
						<div class="user-tile">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-02.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Joseph C.</a>
						</div>
						<div class="user-tile">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-03.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Mark H.</a>
						</div>
						<div class="user-tile">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-04.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Hubert J.</a>
						</div>
						<div class="user-tile">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-05.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Lynn M.</a>
						</div>
						<div class="user-tile">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-06.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Johnny R.</a>
						</div>
						<div class="user-tile last">
							<div class="user-tile-bg">
								<a href="#" class="user-tile-avatar">
									<img src="images/user-07.jpg">
								</a>
							</div>
							<a href="#" class="user-tile-username">Jane B.</a>
						</div>
					</div>
				</div>
		</section>
		<footer id="footer">
			<div class="wrapper">
			<a href="#" class="footer-logo"></a>
    <%--	<div class="footer-nav">
               <a href="#">News</a>|
				<a href="#">Testimonials</a> | 
				<a href="#">Security</a> | 
				<a href="#">Legal</a> | 
				<a href="#">Store</a> | 
				<a href="#">Locator</a> | 
				<a href="#">Jobs</a> | 
				<a href="#">Help Center</a>-
            </div>--%>
		</footer>
		<div class="lightbox-wrapper">
			<div class="lightbox-overlay">
			</div>
			<div class="lightbox-container">
				<div class="lightbox-contents">
					<div class="lightbox-contents-left">
						<div class="lightbox-title">
							<strong>Create Your Sportzly Account</strong>
							<p>
								Join the Online Sports Community</p>
						</div>
						<div id="lightbox-form">
							<form action="" method="" name="">
							<input class="lightbox-field" type="text" name="lightbox-name" value="Full Name"
								autocapitalize="off" autocomplete="off" autocorrect="off" spellcheck="false" />
							<input class="lightbox-field" type="email" name="lightbox-email" value="Email Address"
								autocapitalize="off" autocomplete="off" autocorrect="off" spellcheck="false" />
							<input class="lightbox-field" type="password" name="lightbox-password" value="Password" />
							<input class="lightbox-field" type="password" name="lightbox-confirm" value="Confirm Password" />
							<input class="lightbox-submit-btn" type="submit" value="Create My Account">
							</form>
						</div>
						<span>By clicking Create my account you agree to the <a href="#">Terms of Service</a></span>
					</div>
					<div class="lightbox-contents-right">
						<span>Also Introducing:<br/><strong>Sportzly Mobile App</strong></span>
						<p>
							Mingle with friends and get the latest sports updates<br/> directly on your iPhone
							or Android!</p>
						<a href="#">Download Now!</a>
						<div class="lightbox-contents-right-image">
						</div>
					</div>
				</div>
				<div class="lightbox-close">
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>