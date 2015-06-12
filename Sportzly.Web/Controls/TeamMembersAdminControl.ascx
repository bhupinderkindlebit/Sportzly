<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TeamMembersAdminControl.ascx.cs" Inherits="Sportzly.Web.Controls.TeamMembersAdminControl" %>

<%--<div class="form-row membersList md805">
    <h3>Make Admin <strong>(<span class="number-fans" data-bind="text:ResultCount"></span>)</strong></h3>
    <div class="md_new_100">
    <ul>
        <li>
            <p class="successMsg" id="successPanel" runat="server">
            </p>
            <p class="errorMsg1" id="errorPanel" runat="server">
            </p>
        </li>
        <li>Please select team members who would be Team Admins. A team can have up to 4 administrators.
        </li>
        <li>
            <div class="members-list1">
                <div class="search-sec">
                    <input type="text" value="" name="" placeholder="Search for roster" class="input search-fans">
                    <a href="#"><i class="fa fa-fw"></i></a>
                </div>
                <div class="listin-row">
                    <ul class="members" data-bind="foreach: Result()">
                        <li><span class="user-img">
                            <img data-bind="attr:{src:Photo(), alt:Name()}"></span> <span class="user-namerow"><a data-bind="text: Name()"></a>
                            </span>
                            <input class="chklist" type="checkbox" data-bind="attr: { userid: Id(), checked: IsTeamAdmin() }" />
                        </li>
                    </ul>
                </div>
            </div>
        </li>
        <li>
            <div class="button-row">
                <input type="button" id="saveBtn" class="save button buttonblue" runat="server" value="Make Admin" onclick="return ApprovedTeamAdminfn();" />
                <input type="button" id="btnNeverMindAdmin" value="Never mind" class="buttonblack fancyboxclose" />
            </div>
        </li>
        <li style="text-align: center;">Only team founder can make admin
        </li>
    </ul>
        </div>
</div>--%>


<!--=== Popup Main Div Start ===-->
<div class="popup_main_second membersList1  members-list1">
    <%-- <a class="closebtn" href="">
        <img src="popup-close.png" alt="" /></a>--%>
    <h1><b>Make Admin(<span class="number-fans" data-bind="text:ResultCount"></span>)</b></h1>
    <div class="main_bg">
        <p class="successMsg" id="successPanel" runat="server">
        </p>
        <p class="errorMsg1" id="errorPanel" runat="server">
        </p>
        <p>Please select team members who would be Team Admins. A team can have up to 4 administrators.</p>
        <form action="">
            <div class="search_bar">
                <input type="text" placeholder="Search for roster" class="search-fans" /><a href="#"><img src="../images/search-icon.png" alt="" /></a>
            </div>
            <%--<textarea rows="" cols=""></textarea>--%>
            <div class="listin-row">
                <ul class="members" data-bind="foreach: Result()">
                    <li><span class="user-img">
                        <img data-bind="attr:{src:Photo(), alt:Name()}"></span> <span class="user-namerow"><a data-bind="text: Name()"></a>
                        </span>
                        <input class="chklist" type="checkbox" data-bind="attr: { userid: Id(), checked: IsTeamAdmin() }" />
                    </li>
                </ul>
            </div>
            <label>*Required</label>
            <input type="button" value="Make Admin" id="saveBtn" runat="server" onclick="return ApprovedTeamAdminfn();" />
            <input type="reset" value="Never Mind" id="btnNeverMindAdmin" />
            <div class="clear"></div>
            <dd>Only team founder can make admin</dd>
            <div class="clear" style="height: 75px;"></div>
        </form>
    </div>
</div>

<!--=== Popup Main Div End ===-->
