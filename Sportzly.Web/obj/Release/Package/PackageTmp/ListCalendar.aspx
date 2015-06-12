<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MyMaster.Master" CodeBehind="ListCalendar.aspx.cs" Inherits="Sportzly.Web.Calendar.ListCalendar" %>

<%@ Register Src="Controls/MyProfileHeaderControl.ascx" TagName="MyProfileHeaderControl" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link href="Common/Styles/css/base.css" rel="stylesheet" />

    <link href="Content/css/dailog.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/calendar.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/dp.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/alert.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/main.css" rel="stylesheet" type="text/css" />



    <script src="Scripts/wdCalendar/Plugins/Common.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/datepicker_lang_US.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/jquery.datepicker.js" type="text/javascript"></script>

    <script src="Scripts/wdCalendar/Plugins/jquery.alert.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/jquery.ifrmdailog.js" defer="defer" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/wdCalendar_lang_US.js" type="text/javascript"></script>
    <script src="Scripts/wdCalendar/Plugins/jquery.calendar.js" type="text/javascript"></script>

    <link href="Content/Site.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/j.js" type="text/javascript"></script>

    <script>
        $(document).ready(function () {
            $("#lnkListView").attr("href", "events.aspx?" + teamId);
        });
    </script>

    <uc2:MyProfileHeaderControl ID="MyProfileHeaderControl" runat="server" />

    <div class="resp-tabs-container noborder-bottom">
        <div class="tab1 col-xs-12">
            <ul>
                <li><a id="lnkListView" class="btn btn-primary blue">List View</a></li>
            </ul>

            <div id="calhead" style="padding-left: 1px; padding-right: 1px;">
                <div class="cHead">
                    <div class="ftitle">
                        My Calendar
                    </div>
                    <div id="loadingpannel" class="ptogtitle loadicon" style="display: none;">
                        Loading data...
                    </div>
                    <div id="errorpannel" class="ptogtitle loaderror" style="display: none;">
                        Sorry, could not load your data, please try again later
                    </div>
                </div>
                <div id="caltoolbar" class="ctoolbar">
                    <div id="showtodaybtn" class="fbutton">
                        <div>
                            <span title='Click to back to today ' class="showtoday">Today</span>
                        </div>
                    </div>
                    <div class="btnseparator">
                    </div>
                    <div id="showdaybtn" class="fbutton">
                        <div>
                            <span title='Day' class="showdayview">Day</span>
                        </div>
                    </div>
                    <div id="showweekbtn" class="fbutton">
                        <div>
                            <span title='Week' class="showweekview">Week</span>
                        </div>
                    </div>
                    <div id="showmonthbtn" class="fbutton fcurrent">
                        <div>
                            <span title='Month' class="showmonthview">Month</span>
                        </div>
                    </div>
                    <div class="btnseparator">
                    </div>
                    <div id="showreflashbtn" class="fbutton">
                        <div>
                            <span title='Refresh view' class="showdayflash">Refresh</span>
                        </div>
                    </div>
                    <div class="btnseparator">
                    </div>
                    <div id="sfprevbtn" title="Prev" class="fbutton">
                        <span class="fprev"></span>
                    </div>
                    <div id="sfnextbtn" title="Next" class="fbutton">
                        <span class="fnext"></span>
                    </div>
                    <div class="fshowdatep fbutton">
                        <div>
                            <input type="hidden" name="txtshow" id="hdtxtshow" />
                            <span id="txtdatetimeshow">Loading</span>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div style="padding: 1px;">
                <div class="t1 chromeColor">
                    &nbsp;
                </div>
                <div class="t2 chromeColor">
                    &nbsp;
                </div>
                <div id="dvCalMain" class="calmain printborder">
                    <div id="gridcontainer" style="overflow-y: visible;">
                    </div>
                </div>
                <div class="t2 chromeColor">
                    &nbsp;
                </div>
                <div class="t1 chromeColor">
                    &nbsp;
                </div>
            </div>
        </div>
    </div>

</asp:Content>

