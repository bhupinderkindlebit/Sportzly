<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Howitworks.aspx.cs" Inherits="Sportzly.Web.Howitworks" %>

<!DOCTYPE html>

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
					<li><a href="aboutus.aspx">ABOUT US</a></li>
					<li><a href="default.aspx">SIGN UP</a></li>
				</ul>
			</div>
		</header>
		<section id="main-slider">
			
            <div class="Howitworks-area">
                
                <div class="Howitworks-area-wrapper" >                  
                   
                  <h2>How It Works</h2>
                                                                   
                   <br />
                    <p>Sportzly helps you create your personalized sports experience. We understand that your sports life is different from your personal or professional 
                    life. Sports is where you can be YOU. We have created a platform that will enhance your sports life to the maximum potential.</p> 
                   <br />
                     <p>
                        It’s very easy to find and connect with players and enthusiasts like you. It has never been easy to find and stay connected with your
                             local as well as professional teams, leagues, events, communities.</p>
                    <br />
                        <p>If you manage a team, league, event, training camps or a sporting community, Sportzly provides plenty of tools to organize and manage. 
                            It helps you to always stay connected with your members and create an interactive and engaging community.
                        </p>
                    <br />
                        <p>
                            If you are a sports player no matter what your level is you can create your sports profile and stay connected with your friends and idols.
                        </p>

                        </div>
               
                </div>
            
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
				<a href="#">Help Center</a> 
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