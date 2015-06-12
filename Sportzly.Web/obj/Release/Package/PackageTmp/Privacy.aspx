<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="Sportzly.Web.Privacy" %>
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
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-45569497-1', 'sportzly.com');
        ga('send', 'pageview');

</script>
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
		 <section id="wrapper" class="form">
                
                <div class="Aboutus-area-wrapper" >                  
                   
                 <h2>Privacy Policy </h2>
					
					<p>This Privacy Policy governs the manner in which Sportzly.com collects, uses, maintains and discloses information collected from users (each, a "User") of the http://Sportzly.com website ("Site"). This privacy policy applies to the Site and all products and services offered by Sportzly.com.</p>
					
					<h3>Personal identification information</h3>
					<p>We may collect personal identification information from Users in a variety of ways, including, but not limited to, when Users visit our site, register on the site, fill out a form, and in connection with other activities, services, features or resources we make available on our Site. Users may be asked for, as appropriate, name, email address, mailing address, phone number. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personally identification information, except that it may prevent them from engaging in certain Site related activities.</p>
					
					Non-personal identification information
					<p>We may collect non-personal identification information about Users whenever they interact with our Site. Non-personal identification information may include the browser name, the type of computer and technical information about Users means of connection to our Site, such as the operating system and the Internet service providers utilized and other similar information.Web browser cookies</p>
					<p>Our Site may use "cookies" to enhance User experience. User's web browser places cookies on their hard drive for record-keeping purposes and sometimes to track information about them. User may choose to set their web browser to refuse cookies, or to alert you when cookies are being sent. If they do so, note that some parts of the Site may not function properly.</p>
					<h3>How we use collected information</h3>
					<p>Sportzly.com may collect and use Users personal information for the following purposes:</p>
					<p>- To improve customer service<br/>Information you provide helps us respond to your customer service requests and support needs more efficiently.</p>
					<p>- To personalize user experience <br />
					We may use information in the aggregate to understand how our Users as a group use the services and resources provided on our Site.</p>				
					<p>- To improve our Site <br />
					We may use feedback you provide to improve our products and services.</p>	
					<p>- To process payments <br />
					We may use the information Users provide about themselves when placing an order only to provide service to that order. We do not share this information with outside parties except to the extent necessary to provide the service.</p>		
					<p>- To run a promotion, contest, survey or other Site feature <br />
					To send Users information they agreed to receive about topics we think will be of interest to them.</p>	
					<p>- To send periodic emails <br />
					We may use the email address to respond to their inquiries, questions, and/or other requests.</p>	
					<h3>How we protect your information</h3>
					<p>We adopt appropriate data collection, storage and processing practices and security measures to protect against unauthorized access, alteration, disclosure or destruction of your personal information, username, password, transaction information and data stored on our Site.</p>
					<p>Sharing your personal information</p>
					<p>We do not sell, trade, or rent Users personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.</p>
					<p>Changes to this privacy policy</p>
					<p>Sportzly.com has the discretion to update this privacy policy at any time. When we do, we will revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.</p>
					<p>Your acceptance of these terms</p>
					<p>By using this Site, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our Site. Your continued use of the Site following the posting of changes to this policy will be deemed your acceptance of those changes.</p>
					<p>Contacting us</p>
					<p>
					If you have any questions about this Privacy Policy, the practices of this site, or your dealings with this site, please contact us at:<br/></p>
					<p><a href="#">Sportzly.com </a><br />
					<a href="#">http://Sportzly.com </a><br />
					<a href="#">postmaster@sportzly.com</a></p>
					<p>This document was last updated on April 25, 2013</p>
				</section>
</div>
	
</body>
</html>

