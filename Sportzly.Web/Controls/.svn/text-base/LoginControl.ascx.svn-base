<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.LoginControl" %>
<div class="drawer-holder wrapper">
    <form onsubmit="return login('#login-email', '#login-password');" method="post">
        <div id="login-form">
            <div class="close-drawer close-event">
                Close
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-3">
                    <input class="login-email field" type="email" id="login-email" name="login-email" onblur="bindBlur(event)" onfocus="bindFocus(event)"
                        value="Email Address" autocapitalize="off" autocomplete="off" autocorrect="off"
                        spellcheck="false" />
                </div>
                <div class="col-xs-12 col-sm-3">
                    <input class="login-password field" type="password" name="login-password" id="login-password" onblur="bindBlur(event)" onfocus="bindFocus(event)"
                        value="Password" style="display: none;" />
                    <input class="login-password field" type="text" name="undefined_login-password" id="undefined_login-password" onblur="bindBlur(event)" onfocus="bindFocus(event)"
                        value="Password" />
                </div>
                <div class="col-xs-12 col-sm-2 login-btn">
                    <input class="login-submit-btn" type="submit" value="LOGIN" />
                </div>
                <div class="col-xs-12 col-sm-4">
                    <p class="login-forgot">
                        <a href="forgotpassword.aspx">FORGOT PASSWORD?</a>
                    </p>
                </div>
            </div>
        </div>
    </form>
    <div class="clearfix">
    </div>
</div>
