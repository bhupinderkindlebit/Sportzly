<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BulletinBoardUpdateControl.ascx.cs"
    Inherits="Sportzly.Web.Controls.BulletinBoardUpdateControl" %>
<%--<div class="form-row poll">
    <h3>Text to Team</h3>
    <article class="top-like-box" style="padding:10px 20px;">
        <img class="like-img" alt="" data-bind="attr:{src:PhotoPath}" width="40px" style="float: left;">
        <div style="float: left;padding-left: 10px;">
            <span class="name-ct name-ct2">
                <span class="date"></span><span data-bind="text:'Posted by:' + OwnerName"></span><span class="date" data-bind="text:CreateDate"></span></span>
            <p data-bind="text: Description"></p>
            <div class="clear"></div>
        </div>
    </article>
    <article class="list-comment">
        <div data-bind="foreach:notices()">

            <div class="in-comment-like-box">
                <img alt="" data-bind="attr:{src:PhotoPath()}" width="40px"><br />
                <span class="name-ct" data-bind="text:OwnerName()"><span class="date" data-bind="text:CreateDate()"></span></span>
                <p data-bind="text: Description()"></p>
                <div class="clear"></div>
            </div>
            <!--end-number-university-->
        </div>
    </article>
    <ul>
        <li>
            <div class="left-lable">
                <label class="lable">
                    Notice:</label>
            </div>
            <div class="right-lable">
                <textarea class="input comment-input" id="txtNotice" style="height: 250px;" placeholder="Only 140 Characters will be displayed as text, remaining can be seen in the email"></textarea>
            </div>
        </li>
        <li>
            <label class="required">
                *Required</label>
        </li>
        <li>
            <div class="button-row">
                <input type="submit" value="Create" class="buttonblue">
                <input type="button" value="Never mind" id="btnNeverMindTextToTeam" class="buttonblack fancyboxclose">
                <span class="character-text">Character Count: <span id="spCount"></span></span>
            </div>
        </li>
    </ul>
</div>--%>


<!--=== Popup Main Div Start ===-->
<div class="popup_main">
    <h1><b>Text To Team</b></h1>
    <article class="top-like-box" style="padding: 10px 20px;">
        <img class="like-img" alt="" data-bind="attr:{src:PhotoPath}" width="40px" style="float: left;">
        <div style="float: left; padding-left: 10px;">
            <span class="name-ct name-ct2">
                <span class="date"></span><span data-bind="text:'Posted by:' + OwnerName"></span><span class="date" data-bind="text:CreateDate"></span></span>
            <p data-bind="text: Description"></p>
            <div class="clear"></div>
        </div>
    </article>
    <article class="list-comment">
        <div data-bind="foreach:notices()">

            <div class="in-comment-like-box">
                <img alt="" data-bind="attr:{src:PhotoPath()}" width="40px"><br />
                <span class="name-ct" data-bind="text:OwnerName()"><span class="date" data-bind="text:CreateDate()"></span></span>
                <p data-bind="text: Description()"></p>
                <div class="clear"></div>
            </div>
        </div>
    </article>
    <div class="main_bg">
        <h2><b>Notice:</b></h2>
        <form action="">
            <textarea rows="" cols="" id="txtNotice" placeholder="Only 140 Characters will be displayed as text, remaining can be seen in the email"></textarea>
            <label>*Required</label>
            <input type="submit" value="Create" />
            <input type="reset" value="Never Mind" id="btnNeverMindTextToTeam" />
            <span>Character Count: <span id="spCount"></span></span>
            <div class="clear" style="height: 20px;"></div>
        </form>
    </div>
</div>

<!--=== Popup Main Div End ===-->
