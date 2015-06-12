<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingInvitesTeamListFullControl.ascx.cs" Inherits="Sportzly.Web.Controls.PendingInvitesTeamListFullControl" %>
<style type="text/css">
    .ch {
        float: left;
        margin-left: 22px;

    }

    span.name-ct {
        color: #404040;
        float: left;
        font-size: 15px;
        text-align: left;
        width: 260px;
       
    }
    section#content article.list-img-content-fans article.top-list-img-content-fans ul li {
        width:300px;
         margin:5px;
    }
</style>
<section id="content" class="membersList">
    <article class="top-content-fans">
        <div class="fans-2">
            <span class="number-fans" data-bind="text: ResultCount"></span>
        </div>
        Search:
        <input class="search-fans" type="text" value="Search Email Address" onblur="bindBlur(event)" onfocus="bindFocus(event)" />
        <div class="clear"></div>
    </article>
    <!--End-top-content-fans-->
    <article class="list-img-content-fans">
        <article class="top-list-img-content-fans">
            <ul data-bind="foreach: Result()" class="freindsListUL">
                <li>
                    <input type="checkbox" class="ch" data-bind="attr: { userid: Email() }" />
                    <span class="name-ct" data-bind="text: Email()"></span>
                    <br />
                </li>
            </ul>
        </article>
        <!--End-top-list-img-content-fans-->
         <article style="float: left; margin-left:20px; margin-top: 10px;">
            <a href="javascript:;" onclick="checkall();">
                <img src="images/check_all.png" />
            </a>
            <a href="javascript:;" onclick="uncheckall();">
                <img src="images/uncheck_all.png" />
            </a>
            </article>
        <article style="float: right;margin-right:20px;margin-top:10px;">           
            <a href="javascript:;" onclick="sendInvite();"><img src="images/send_invite_blue.png" /> </a>
            <a href="myupdates.aspx" id="anCancel"><img src="images/admin_cancel.png" /> </a>
        </article>

    </article>
    <!--End-list-img-content-fans-->


    <div class="clear"></div>
    <div class="footer-content">
       
    </div>
</section>
<!--End-section-content-->
