<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommentsControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.CommentsControl" %>

<div>
    <div class="nd-comment">

        <div class="in-nd-comment" data-bind="foreach : activities, visible: activities().length > 0" >
            <div>
                <img class="img-in-nd-comment" alt="" data-bind="attr:{src:Owner.ProfileFoto}" height="50px" />
                <a data-bind="attr: { href: 'profile.aspx?' + Owner.EmailId() }"><span class="name-comment" data-bind="    text: Owner.DisplayName"></span></a>
                <p class="left-comment-text" data-bind="html:Description">
                </p>
                <a href="#"><span class="button button2" data-bind="text:MinutesAgo"></span></a>
                <%--<a href="#" data-bind="click:function(){ cheers($data, true); }"><span data-bind="text: 'Like (' + Cheers.Cheers() + ')'"></span></a><a href="#" data-bind="click:function(){ cheers($data, false); }"><span
                    data-bind="text: 'Dislike (' + Cheers.Jeers() + ')'"></span></a>--%>
                <div class="clear">
                </div>
            </div>
        </div>
        <!--End-in-nd-comment-->
        <div class="say-something">
            <input type="text" value="Say something..." onblur="bindBlur(event)" onfocus="bindFocus(event)" class="commentsBoxes" />
        </div>
        <!--End-say-something-->
    </div>
    <!--End-nd-comment-->
</div>
