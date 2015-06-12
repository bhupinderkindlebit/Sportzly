<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewTeamControl.ascx.cs" Inherits="Sportzly.Web.Controls.NewTeamControl" %>
<%@ Register Src="~/Controls/LightBoxControl.ascx" TagPrefix="uc1" TagName="LightBoxControl" %>
<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />
<uc1:LightBoxControl runat="server" ID="LightBoxControl" />
<style type="text/css">
    #uploadTeamImageBox-button {
        width: 149px !important;
        height: 36px !important;
        margin-top: 5px !important;
    }

    #uploadTeamImageBox {
        margin-left: 5px !important;
    }

    .uploadlogo {
        background-image: url('../images/edit_logo1.png');
        border: none;
        border-radius: 0px;
        background-color: white;
        margin-left: 10px;
    }

    .uploadifive-queue-item {
        width: 200px;
        margin-left: 10px;
    }

    #uploadifive-uploadProfileImageBoxFive input {
        top: 5px !important;
    }
</style>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="Scripts/jquery.geocomplete.js"></script>
<form id="dd" > 
<section id="wrapper" class="form profile">
    <nav class="head_profile">
        <h1>Team Info</h1>
    </nav>
    <h3 class="title">&nbsp;</h3>

    <div class="form">
        <ul class="ulform">
            <li style="width: 700px;">
                <p class="derc">*Required</p>
            </li>
            <li>
                <label for="Team Name">
                    Team Name
                    <span class="rq">* </span>
                </label>
                <input id="txtFirstName" type="text" data-bind="value: Results()[0].FirstName" data-validate="required" class="teamName" runat="server" />
            </li>
            <li>
                <label for="Season">
                    Make team Private
                </label>
                <asp:CheckBox ID="ChPrivate" runat="server" />
            </li>

            <li>
                <label for="Description">
                    Description
                    <span class="rq">* </span>
                </label>
                <textarea id="txtDescription" type="text" data-bind="value: Results()[0].FirstName" data-validate="required" class="teamDesc" runat="server" style="height: 50px;"></textarea>
            </li>
            <li>
                <label for="Sport">
                    Sport
                    <span class="rq">* </span>
                </label>
                <asp:DropDownList ID="ddlSports" runat="server" data-placeholder="Select Sport" class="sport chosen-select-nosearch" Style="width: 241px;" data-validate="required"></asp:DropDownList>
            </li>
            <li>
                <label for="Level">
                    Level
                    <span class="rq">* </span>
                </label>
                <asp:DropDownList ID="ddlLevel" runat="server" data-placeholder="Select Level" class="level chosen-select-nosearch" Style="width: 241px;"></asp:DropDownList>
            </li>
            <li>
                <label for="Season">
                    Season
                </label>
                <input type="text" id="txtSeason" maxlength="16" data-bind="value: Results()[0].OtherSportsTag" runat="server" />
            </li>
            <li>
                <label for="Practice Ground">
                    Practice Ground
                </label>
                <input id="txtGround" maxlength="50" type="text" data-bind="value: Results()[0].Collage" runat="server" />
            </li>
            <li>
                <label for="URL">
                    External Team URL
                </label>
                <select id="ddlUrl" name="ddlUrl" class="dropdown" size="10" multiple="false" runat="server" style="height: 50px" />

                <input type="text" name="awards" id="txtUrl" />
                <label for="add_f" id="liAdd">
                    <img alt="" src="images/add1.png" onclick="addUrl()" title="Add Url">
                </label>
                <label for="add_f" id="liEdit">
                    <img alt="" src="images/editform.png" onclick="EditUrl()" title="Edit Url">
                </label>

                <label for="add_f" id="liUpdate" style="display: none;">
                    <img alt="" src="images/update.png" onclick="UpdateUrl()" title="Update Url">
                </label>
                <label for="add_f" id="liCancel" style="display: none;">
                    <img alt="" src="images/cancelform.png" onclick="CancelUrl()" title="Cancel Url">
                </label>
                <label for="add_f" id="liDelete">
                    <img alt="" src="images/deleteform.png" onclick="DeleteUrl()" title="Delete Url">
                </label>
            </li>
            <li>
                <label for="City">
                    City  <span class="rq">* </span>
                </label>
                <input id="txtCity" type="text" data-bind="value: Results()[0].City" runat="server" class="city" />
            </li>
            <li>
                <label for="Country">
                    Country  <span class="rq">* </span>
                </label>
                <asp:DropDownList ID="ddlCountry" runat="server" data-placeholder="Choose a Country" class="country chosen-select" Style="width: 241px;"></asp:DropDownList>
            </li>
            <li>
                <label for="logo">Team Logo</label>
                <img id="imgProfile" src="" width="120" height="120" runat="server" />
                <input type="hidden" id="imageHidden" runat="server" />
            </li>
            <li>
                <label for="logo2">&nbsp;</label>


                <input id="uploadTeamImageBoxFive" type="file" />
                <input id="uploadTeamImageBox" type="file" style="display: none;" />


            </li>



            <li style="width: 725px;">
                <asp:Button ID="btnTeamSubmit" runat="server" CssClass="btTxt submit" Text="Save" OnClick="btnTeamSubmit_Click" OnClientClick="return validateTeam(); " />
            </li>

        </ul>

    </div>

    <input type="hidden" id="hdUrl" runat="server" />

</section></form>
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
<%--<script type="text/javascript">
    $(document).ready(function () {
        var options = {
            //map: ".map_canvas",
            //details: ".details",
            //detailsAttribute: "data-geo"
        };

        $("#MainContentPlaceHolder_NewTeamControl_txtCity").geocomplete(options).bind("geocode:result", function (event, result) {
            //setTimeout(function () { $(".map_canvas").show(); }, 2000);
        });


    });
</script>--%>
