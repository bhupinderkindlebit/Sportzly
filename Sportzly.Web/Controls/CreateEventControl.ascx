﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateEventControl.ascx.cs" Inherits="Sportzly.Web.Controls.CreateEventControl" %>

<script src="Scripts/jquery.ui.timepicker.js"></script>
<link href="Common/Styles/css/jquery.ui.timepicker.css" rel="stylesheet" />
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="Scripts/jquery.geocomplete.js"></script>
<link href="Content/validationEngine.jquery.css" rel="stylesheet" />
<script type='text/javascript' src='Scripts/jquery.validate.min.js'></script>
<script src="Scripts/jquery.validationEngine.js"></script>
<script src="Scripts/jquery.validationEngine-en.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#ContentPlaceHolder1_CreateEventControl_dateFrom").change(function () {
            $("#ContentPlaceHolder1_CreateEventControl_dateTo").val($("#ContentPlaceHolder1_CreateEventControl_dateFrom").val());
        });
        var id = GetQueryStringByParam("id");

        if (id == null || $.trim(id) == "") {
            $("#btnDelete").hide();
        }
    });
</script>
<div class="form-row">
    <h3>New Event</h3>
    <div class="md677">
    <ul>
        <li>  
            <p class="successMsg" id="successPanel" runat="server">
            </p>          
            <p class="errorMsg1" id="errorPanel" runat="server">
            </p>
        </li>
        <li>
            <div class="left-lable md800">
                <label class="lable">
                    Create a new</label>
            </div>
            <div class="right-lable md801">
                <select id="eventType" data-validate="required" class="eventType" style="display: none;" runat="server" onchange="showHideOpp()">
                    <option value="1">Event</option>
                    <option value="2">Game</option>
                    <option value="3">Practice</option>
                </select>
                <asp:RadioButton ID="rdEvent" runat="server" Text="Event" Checked="true" CssClass="rd" GroupName="e" onclick="showHideOppNew(1);" />
                <asp:RadioButton ID="rdGame" runat="server" Text="Game" CssClass="rd" GroupName="e" onclick="showHideOppNew(2);" />
                <asp:RadioButton ID="rdPratice" runat="server" Text="Practice" CssClass="rd" GroupName="e" onclick="showHideOppNew(3);" />
            </div>
        </li>
        <li style="display: none;" id="seasonblock">
            <div class="left-lable md800">
                <label class="lable">
                    Season*</label>
            </div>
            <div class="right-lable md801">
                <input id="season" type="text" data-validate="required" class="season input" runat="server" />
            </div>
        </li>
        <li id="homeGameBlock" style="display: none;">
            <div class="left-lable md800">
                <label class="lable">Home Game</label>
            </div>
            <div class="right-lable md801">
                <input type="checkbox" value="IsHomeGame" runat="server" id="IsHomeGame" class="checkbox-new" style="margin-top: 13px;" />
            </div>
        </li>
        <li id="titleBlock">
            <div class="left-lable md800">
                <label class="lable">Title*</label>
            </div>
            <div class="right-lable md801">
                <input id="eventTitle" type="text" data-validate="required" class="input eventTitle validate[required]" runat="server" placeholder="Enter Event Name" />
            </div>
        </li>
        <li>
            <div class="left-lable md800">
                <label class="lable">From*</label>
            </div>
            <div class="right-lable md801">
                <div class="from">
                    <span class="input-row input">
                        <input id="dateFrom" type="text" data-validate="required" class="dateFrom validate[required] text-input datepicker" runat="server" />
                        <i class="fa fa-fw"></i></span><span class="input-row input nomargin-r">
                            <input id="timefromt" type="text" data-validate="required" class="timeFromT txt2 validate[required] text-input timepicker" runat="server" />
                            <i class="fa fa-fw"></i></span>
                    &nbsp;&nbsp;<select id="timeFrom" data-validate="required" class="timeFrom" runat="server" style="display: none;">
                        <option value="12:00 AM">12:00 AM</option>
                        <option value="12:30 AM">12:30 AM</option>
                        <option value="01:00 AM">01:00 AM</option>
                        <option value="01:30 AM">01:30 AM</option>
                        <option value="02:00 AM">02:00 AM</option>
                        <option value="02:30 AM">02:30 AM</option>
                        <option value="03:00 AM">03:00 AM</option>
                        <option value="03:30 AM">03:30 AM</option>
                        <option value="04:00 AM">04:00 AM</option>
                        <option value="04:30 AM">04:30 AM</option>
                        <option value="05:00 AM">05:00 AM</option>
                        <option value="05:30 AM">05:30 AM</option>
                        <option value="06:00 AM">06:00 AM</option>
                        <option value="06:30 AM">06:30 AM</option>
                        <option value="07:00 AM">07:00 AM</option>
                        <option value="07:30 AM">07:30 AM</option>
                        <option value="08:00 AM">08:00 AM</option>
                        <option value="08:30 AM">08:30 AM</option>
                        <option value="09:00 AM">09:00 AM</option>
                        <option value="09:30 AM">09:30 AM</option>
                        <option value="10:00 AM" selected="selected">10:00 AM</option>
                        <option value="10:30 AM">10:30 AM</option>
                        <option value="11:00 AM">11:00 AM</option>
                        <option value="11:30 AM">11:30 AM</option>
                        <option value="12:00 PM">12:00 PM</option>
                        <option value="12:30 PM">12:30 PM</option>
                        <option value="01:00 PM">01:00 PM</option>
                        <option value="01:30 PM">01:30 PM</option>
                        <option value="02:00 PM">02:00 PM</option>
                        <option value="02:30 PM">02:30 PM</option>
                        <option value="03:00 PM">03:00 PM</option>
                        <option value="03:30 PM">03:30 PM</option>
                        <option value="04:00 PM">04:00 PM</option>
                        <option value="04:30 PM">04:30 PM</option>
                        <option value="05:00 PM">05:00 PM</option>
                        <option value="05:30 PM">05:30 PM</option>
                        <option value="06:00 PM">06:00 PM</option>
                        <option value="06:30 PM">06:30 PM</option>
                        <option value="07:00 PM">07:00 PM</option>
                        <option value="07:30 PM">07:30 PM</option>
                        <option value="08:00 PM">08:00 PM</option>
                        <option value="08:30 PM">08:30 PM</option>
                        <option value="09:00 PM">09:00 PM</option>
                        <option value="09:30 PM">09:30 PM</option>
                        <option value="10:00 PM">10:00 PM</option>
                        <option value="10:30 PM">10:30 PM</option>
                        <option value="11:00 PM">11:00 PM</option>
                        <option value="11:30 PM">11:30 PM</option>
                    </select>
                </div>
                <div class="to-row">
                    <label class="lable2">To*</label>
                    <span class="input-row input ">
                        <input id="dateTo" type="text" data-validate="required" class="dateTo validate[required] text-input datepicker" runat="server" />
                        <i class="fa fa-fw"></i></span><span class="input-row input nomargin-r"><input id="timetot" type="text" data-validate="required" class="timeToT txt2 validate[required] text-input timepicker" runat="server" />
                            <i class="fa fa-fw"></i></span>
                    &nbsp;&nbsp;<select id="timeTo" type="text" data-validate="required" class="timeTo" runat="server" style="width: 100px; display: none;">
                        <option value="12:00 AM">12:00 AM</option>
                        <option value="12:30 AM">12:30 AM</option>
                        <option value="01:00 AM">01:00 AM</option>
                        <option value="01:30 AM">01:30 AM</option>
                        <option value="02:00 AM">02:00 AM</option>
                        <option value="02:30 AM">02:30 AM</option>
                        <option value="03:00 AM">03:00 AM</option>
                        <option value="03:30 AM">03:30 AM</option>
                        <option value="04:00 AM">04:00 AM</option>
                        <option value="04:30 AM">04:30 AM</option>
                        <option value="05:00 AM">05:00 AM</option>
                        <option value="05:30 AM">05:30 AM</option>
                        <option value="06:00 AM">06:00 AM</option>
                        <option value="06:30 AM">06:30 AM</option>
                        <option value="07:00 AM">07:00 AM</option>
                        <option value="07:30 AM">07:30 AM</option>
                        <option value="08:00 AM">08:00 AM</option>
                        <option value="08:30 AM">08:30 AM</option>
                        <option value="09:00 AM">09:00 AM</option>
                        <option value="09:30 AM">09:30 AM</option>
                        <option value="10:00 AM">10:00 AM</option>
                        <option value="10:30 AM" selected="selected">10:30 AM</option>
                        <option value="11:00 AM">11:00 AM</option>
                        <option value="11:30 AM">11:30 AM</option>
                        <option value="12:00 PM">12:00 PM</option>
                        <option value="12:30 PM">12:30 PM</option>
                        <option value="01:00 PM">01:00 PM</option>
                        <option value="01:30 PM">01:30 PM</option>
                        <option value="02:00 PM">02:00 PM</option>
                        <option value="02:30 PM">02:30 PM</option>
                        <option value="03:00 PM">03:00 PM</option>
                        <option value="03:30 PM">03:30 PM</option>
                        <option value="04:00 PM">04:00 PM</option>
                        <option value="04:30 PM">04:30 PM</option>
                        <option value="05:00 PM">05:00 PM</option>
                        <option value="05:30 PM">05:30 PM</option>
                        <option value="06:00 PM">06:00 PM</option>
                        <option value="06:30 PM">06:30 PM</option>
                        <option value="07:00 PM">07:00 PM</option>
                        <option value="07:30 PM">07:30 PM</option>
                        <option value="08:00 PM">08:00 PM</option>
                        <option value="08:30 PM">08:30 PM</option>
                        <option value="09:00 PM">09:00 PM</option>
                        <option value="09:30 PM">09:30 PM</option>
                        <option value="10:00 PM">10:00 PM</option>
                        <option value="10:30 PM">10:30 PM</option>
                        <option value="11:00 PM">11:00 PM</option>
                        <option value="11:30 PM">11:30 PM</option>
                    </select>
                </div>
            </div>
        </li>
        <li>
            <div class="left-lable md800">
                <label class="lable">Team</label>
            </div>
            <div class="right-lable md801">
                <select id="teamList" data-validate="required" class="teamList chosen-select search_select search-select" runat="server">
         
                </select>
            </div>
        </li>
        <li>
            <div class="left-lable md800">
                <label class="lable">Time Zone</label>
            </div>
            <div class="right-lable md801">
                <asp:DropDownList ID="ddlTimeZone" data-validate="required" class="teamList chosen-select search_select search-select" runat="server">
                </asp:DropDownList>
            </div>
        </li>
        <li style="display: none;">
            <div class="left-lable md800">
                <label class="lable">Frequency*</label>
            </div>
            <div class="right-lable md801">
                <select id="frequency" data-validate="required" class="frequency teamList chosen-select search_select search-select" runat="server" onchange="showHideOption()" name="D1">
                    <option value="1">One Time</option>
                    <option value="2">Daily</option>
                    <option value="3">Weekly</option>
                    <option value="4">Monthly</option>
                </select>
            </div>
        </li>
        <li id="WeekDays">
            <div class="left-lable md800">
                <label class="lable"></label>
            </div>
            <div class="right-lable md801">
                <label class="Weekdays">S</label>
                <input type="checkbox" id="day1" value="1" runat="server" style="margin:-2px 10px 0px 0px;" />
                <label class="Weekdays">M</label>
                <input type="checkbox" id="day2" value="2" runat="server" style="margin:-2px 10px 0px 0px;" />
                <label class="Weekdays">T</label>
                <input type="checkbox" id="day3" value="3" runat="server" style="margin:-2px 10px 0px 0px;" />
                <label class="Weekdays">W</label>
                <input type="checkbox" id="day4" value="4" runat="server" style="margin:-2px 10px 0px 0px;" />
                <label class="Weekdays">T</label>
                <input type="checkbox" id="day5" value="5" runat="server" style="margin:-2px 10px 0px 0px;" />
                <label class="Weekdays">F</label>
                <input type="checkbox" id="day6" value="6" runat="server" style="margin:-2px 10px 0px 0px;" />
                <label class="Weekdays">S</label>
                <input type="checkbox" id="day7" value="7" runat="server" style="margin:-2px 10px 0px 0px;" />
            </div>
        </li>
        <li style="display: none;">
            <div class="left-lable md800">
                <label class="lable">Invite*</label>
            </div>
            <div class="right-lable md801">
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Team" CssClass="rd" GroupName="i" Checked="true" onclick="showHide(1);" />
                <asp:RadioButton ID="RadioButton4" runat="server" Text="Individual" CssClass="rd" GroupName="i" onclick="showHide(2);" />
            </div>
        </li>
        <li style="display: none;">
            <div class="left-lable md800">
                <label class="lable">Enter Email Addresses</label>
            </div>
            <div class="right-lable md801">
                <textarea id="addInvitees" style="height: 80px" data-validate="required" class="addInvitees input" runat="server"></textarea>
                <br />
                (Email addresses seperated by commas)
            </div>
        </li>
        <li id="oppIndBlock" style="display: none;">
            <div class="left-lable md800">
                <label class="lable">Opponent*</label>
            </div>
            <div class="right-lable md801">
                <input type="text" id="oppName" class="oppName input" runat="server" placeholder="Enter Opponent" />
            </div>
        </li>
        <li>
            <div class="left-lable md800">
                <label class="lable">Location</label>
            </div>
            <div class="right-lable md801">
                <input id="addressLine" type="text" placeholder="Enter Location" data-validate="required" class="input addressLine txt1 validate[required]" runat="server"></input>
            </div>
        </li>
        <li>
            <div class="left-lable md800">
                <label class="lable">
                    Description/<br>
                    Comments</label>
            </div>
            <div class="right-lable md801">
                <textarea id="Comments" class="input txt1" runat="server" rows="10" style="height: 70px;"></textarea>
            </div>
        </li>
        <li>
            <label class="required">*Required</label>
        </li>
        <li>
            <div class="button-row">
                <input id="saveEvent" type="submit" class="saveEvent save button buttonblue" runat="server" value="Add Event" onclick="return validateEvent();" />
                <input id="btnDelete" type="button" class="saveEvent save button buttonblue" value="Delete" onclick="DeleteEvent()" />
                <input type="button" id="btnNeverMindEvent" value="Never mind" class="buttonblack fancyboxclose" />
            </div>

        </li>
    </ul>
        </div>
</div>

<div class="oppTeamTypeBlock" style="display: none;">
    <ul>
        <li>
            <label>
                Game Type
                    <span class="rq">&nbsp;</span>
            </label>
            <input runat="server" type="radio" value="team" class="gameType22" name="gameType" id="gameType1" onchange="showHideOppBox()" checked />
            Team
             <input runat="server" type="radio" value="Individual" class="gameType22" name="gameType" id="gameType2" onchange="showHideOppBox()" />
            Individual
            
        </li>
        <li class="oppTeamBlock">
            <label>
                Opponent Team
                    <span class="rq">&nbsp;</span></label><select id="oppTeam" data-validate="required" class="oppTeam chosen-select" style="width: 241px;" runat="server">
                        <option value="0">None</option>
                    </select>

        </li>
    </ul>


</div>

<script type="text/javascript">    
    var autoListConfig = {
        '.chosen-select': {},
        '.chosen-select-nosearch': { disable_search: false },
        '.chosen-select-deselect': { allow_single_deselect: true },
        '.chosen-select-no-single': { disable_search_threshold: 10 },
        '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
        '.chosen-select-width': { width: "95%" }
    }
    for (var selector in autoListConfig) {
        $(selector).chosen(autoListConfig[selector]);
    }
</script>
<script>
    $(function () {
        $(".dateTo").datepicker({ dateFormat: "mm-dd-yy", minDate: 0 });
        $(".dateFrom").datepicker({ dateFormat: "mm-dd-yy", minDate: 0 });
        $('.timeFromT').timepicker({
            showPeriod: true,
            showLeadingZero: true,
            defaultTime: ''
        });
        $('.timeToT').timepicker({
            showPeriod: true,
            showLeadingZero: true,
            defaultTime: ''
        });

    });
</script>
<%--<div class="details">
    <input id="hdLocation" data-geo="location" runat="server" type="hidden" />
</div>--%>

