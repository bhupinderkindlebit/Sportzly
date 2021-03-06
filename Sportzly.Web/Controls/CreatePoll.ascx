﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreatePoll.ascx.cs"
    Inherits="Sportzly.Web.Controls.CreatePoll" %>
<style>


    .form-row .input
    {
        height: 35px;
    }
</style>
<link href="Content/validationEngine.jquery.css" rel="stylesheet" />
<script type='text/javascript' src='Scripts/jquery.validate.min.js'></script>
<script src="Scripts/jquery.validationEngine.js"></script>
<script src="Scripts/jquery.validationEngine-en.js"></script>
<div class="form-row poll">
    <h3>Poll</h3>
    <ul>
        <li>
            <p class="successMsg" id="successPanel" runat="server">
            </p>
            <p class="errorMsg1" id="errorPanel" runat="server">
            </p>
        </li>
        <li id="titleBlock">
            <div class="left-lable">
                <label class="lable">
                    Question:*</label>
            </div>
            <div class="right-lable">
                <input id="pollQuestion" type="text" class="input pollQuestion"
                    runat="server" placeholder="Question" />
            </div>
        </li>
      <%--  <li id="Li1">
            <div class="left-lable">
                <label class="lable">
                    End Date:*</label>
            </div>
            <div class="right-lable">
                <input id="dateExpiry" type="text" class="input datepicker dateExpiry"
                    runat="server" placeholder="End Date" />
            </div>
        </li>--%>
         <li>
            <div class="left-lable">
                <label class="lable">Team</label>
            </div>
            <div class="right-lable">
                <select id="teamList" data-validate="required" class="teamList chosen-select search_select search-select" runat="server">
                </select>
            </div>
        </li>


      <%--  <li id="Li2" >
            <div class="left-lable">
                <label class="lable">
                    Active:*</label>
            </div>
            <div class="right-lable">
                <input type="checkbox" id="chActive" runat="server" class="checkbox-new" checked />
            </div>
        </li>--%>
       <%-- <li>
            <div class="right-lable right-lable-new">
                <input type="text" name="awards" id="txtOption" class="input" placeholder="Enter Option for Poll" />
            </div>
            <span class="pollicon addicon" id="liAdd"><a href="javascript:;" onclick="addAwards()" title="Add Option">
                <i class="fa fa-fw"></i></a></span> <span class="pollicon addicon" id="liEdit"><a href="javascript:;"
                    onclick="EditAwards()" title="Edit Option"><i class="fa fa-fw"></i></a></span>
            <span class="pollicon addicon" id="liUpdate" style="display: none;"><a href="javascript:;" onclick="UpdateAwards()"
                title="Update Option"><i class="fa fa-fw"></i></a></span> <span class="pollicon deleteicon"
                    id="liCancel" style="display: none;"><a href="javascript:;" onclick="CancelAwards()" title="Cancel Option">
                        <i class="fa fa-fw"></i></a></span> <span class="pollicon deleteicon" id="liDelete">
                            <a href="javascript:;" onclick="DeleteAwards()" title="Delete Option"><i class="fa fa-fw"></i></a></span>
        </li>
        <li>
            <div class="left-lable">
                <label class="lable">
                    Options:*</label>
            </div>
            <div class="right-lable">
                <select id="ddlOptions" name="ddlOptions" class="dropdown input ddlOptions" size="10"
                    multiple="false" runat="server" style="height: 40px" />
            </div>
        </li>--%>
        <li>
            <label class="required">
                *Required</label>
        </li>
        <li>
            <div class="button-row">
                <input name="Add Event" id="saveEvent" type="submit" value="Create" class="save button buttonblue" runat="server" onclick="return validatePoll();">
                <input name="Add Event" type="button" id="btnNeverMindPoll" value="Never mind" class="button buttonblack fancyboxclose">
            </div>
        </li>
    </ul>
</div>
<input type="hidden" id="hdAwards" runat="server" />
