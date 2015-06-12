<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCalendar.aspx.cs" Inherits="Sportzly.Web.CreateCalendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/css/dropdown.css" rel="stylesheet" />
    <link href="Content/css/dp.css" rel="stylesheet" />
    <link href="Content/css/colorselect.css" rel="stylesheet" />
    <style type="text/css">
        .calpick {
            width: 16px;
            height: 16px;
            border: none;
            cursor: pointer;
            background: url("Content/sample-css/cal.gif") no-repeat center 2px;
            margin-left: -22px;
        }

        .mask {
            width: 100%;
            height: 100%;
            position: absolute;
            background-color: grey;
            z-index: 1;
            filter: alpha(opacity=80);
            opacity: .8;
        }

            .mask div {
                width: 50%;
                text-align: center;
                position: absolute;
                top: 50%;
                left: 25%;
                color: white;
            }
    </style>
</head>
<body>
        <script type='text/javascript' src='Scripts/wdCalendar/jquery.js'></script>
    
    <script src="Scripts/wdCalendar/Plugins/jquery.form.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/jquery.validate.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/jquery.dropdown.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/datepicker_lang_US.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/jquery.datepicker.js" type="text/javascript"></script>
    
    <script src="Scripts/wdCalendar/Plugins/jquery.colorselect.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/Common.js" type="text/javascript"></script>    
    <script src="Scripts/Edit.js" type="text/javascript"></script>

    <div>
        <div>
            <div class="toolBotton">
                <a id="Savebtn" class="imgbtn" href="javascript:void(0);">
                    <span class="Save" title="Save the calendar">Save(<u>S</u>)</span>
                </a>
                
                <% if (Model.calendarId != 0)
                   { %>
                &nbsp;
                <a id="Deletebtn" class="imgbtn" href="javascript:void(0);" data-value="<%= Model.calendarId %>">
                    <span class="Delete" title="Cancel the calendar">Delete(<u>D</u>) </span>
                </a>
                <% } %>
                &nbsp;
                <a id="Closebtn" class="imgbtn" href="javascript:void(0);">
                    <span class="Close" title="Close the window">Close </span>
                </a>
            </div>
            <div style="clear: both"></div>
            <div class="infocontainer">
                <form action="Calendar/Create.aspx" class="fform" id="fmEdit" method="POST">
                    <input type="hidden" name="calendarId" value="<%= Model.calendarId %>" />
                    <input type="hidden" name="typeId" value="<%= Info.typeId %>" />
                    <input type="hidden" name="ctype" value="<%= Info.ctype %>" />
                        <label>
                            <span>*Subject: </span>
                            <div id="calendarcolor"></div>
                            <input maxlength="200" class="required safe" id="Subject" name="Subject" style="width: 85%;" type="text" value="<%= Model.Subject %>" />
                            <input id="colorvalue" name="Color" type="hidden" value="<%= Model.Color %>" />
                        </label>
                        <label>
                            <span>*Time: </span>
                            <div>
                                <input maxlength="10" class="required date" id="stpartdate" name="stpartdate" style="padding-left: 2px; width: 90px;"
                                    type="text" value="<%= Model.StartTime.ToShortDateString() %>"
                                    readonly="readonly" />
                                <input maxlength="5" class="required time" id="stparttime" name="stparttime" style="width: 40px;"
                                    type="text" value="<%= Model.StartTime.ToString("HH:mm") %>" readonly="readonly" />To
                    <input maxlength="10" class="required date" id="etpartdate" name="etpartdate" style="padding-left: 2px; width: 90px;"
                        type="text" value="<%= Model.EndTime.ToShortDateString() %>" readonly="readonly" />
                                <input maxlength="50" class="required time" id="etparttime" name="etparttime" style="width: 40px;"
                                    type="text" value="<%= Model.EndTime.ToString("HH:mm") %>" readonly="readonly" />
                                <label class="checkp">
                                    <input id="IsAllDayEvent" name="IsAllDayEvent" type="checkbox" value="1" <% if (Model.IsAllDayEvent == 1)
                                                                                                                {%>checked<%} %> />
                                    All Day Event
                                </label>
                            </div>
                        </label>
                        <label>
                            <span>Location: </span>
                            <input maxlength="200" id="Location" name="Location" style="width: 95%;" type="text" value="<%= Model.Location %>" />
                        </label>
                        <label>
                            <span>Description: </span>
                            <textarea cols="20" id="Description" name="Description" rows="2" style="width: 95%; height: 70px"><%= Model.Description %></textarea>
                        </label>
                        <input id="timezone" name="timezone" type="hidden" value="" />
                    </form>
            </div>
        </div>

    </div>

</body>
</html>
