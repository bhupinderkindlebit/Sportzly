<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Facebook.ascx.cs" Inherits="Sportzly.Web.Controls.Facebook" %>
<div id="External_Popup" class="External_Popup"></div>
<div id="Internal_Popup" class="Internal_Popup">
    <div class="PopupHeader">
        <p style="color: white; float: left">Enter your email address to continue</p>
    </div>
    <div id="PopupContentDiv" class="PopupContentDiv">
        <form>
        <input class="signup-email field" placeholder="Email Address" id="txtEmail" />
        <br />
        <br />
        <input class="signup-email field" placeholder="Re-enter Email Address" id="txtReEnterEmail" />
        <br />
        <br />
        <input class="signup-submit-btn" type="button" onclick="signuptw('#txtEmail', '#txtReEnterEmail');" value="Sign Up for Sportzly">
        <input id="hdTwitterID" type="hidden" />
        <input id="hdTwitterUserName" type="hidden" /> </form>
    </div>
</div>
