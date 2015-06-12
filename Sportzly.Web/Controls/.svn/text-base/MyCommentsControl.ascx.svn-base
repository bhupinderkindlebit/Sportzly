<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyCommentsControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.MyCommentsControl" %>

<div class="comment-box">
    <div class="col-sm-2">
        &nbsp;
    </div>
    <div class="col-sm-10 comment nd-comment">
        <div class="row-comment in-nd-comment" data-bind="foreach : activities, visible: activities().length > 0">
            <div>
                <span class="img col-sm-2">
                    <img class="img-in-nd-comment" alt="" data-bind="attr:{src:Owner.ProfileFoto}"></span>
                <div class="col-sm-10 post-data">
                    <a class="post-title" data-bind="attr: { href: 'profile.aspx?' + Owner.EmailId() }">
                        <span class="name-comment" data-bind="text: Owner.DisplayName"></span></a>
                    <p class="left-comment-text" data-bind="html:Description">
                    </p>
                    <div class="comment-links">
                        <a class="button button2 min-ago" data-bind="text:MinutesAgo">5 minutes ago</a>
                        <a class="cheers" data-bind="click:function(){ cheers($data, true); }"><span data-bind="text: Cheers.Cheers()"></span></a><a class="jeers" data-bind="click:function(){ cheers($data, false); }"><span
                            data-bind="text: Cheers.Jeers()"></span></a><a class="btn-deals" href="#"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-comment">
            <span class="replay-icon col-sm-1"></span>
            <div class="col-lg-11 eat-right">
                <input type="text" placeholder="Say something..." class="say-something commentsBoxes"
                    onblur="bindBlur(event)" onfocus="bindFocus(event)" />
            </div>
        </div>
    </div>
</div>
