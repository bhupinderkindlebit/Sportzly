<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserDetailsControl.ascx.cs" Inherits="Sportzly.Web.Controls.UpdateUserDetailsControl" %>
<style>
    .dk-select, .dk-select-multi
    {
        width: 100%;
    }

    .dk-selected
    {
        height: 35px;
    }

    .form-row ul
    {
        padding: 0 20px;
    }

    .form-row .input
    {
        height: 35px;
    }

    .button-row1
    {
        margin-top: 10px;
        text-align: center;
    }

    .formbg
    {
        clear: both;
        background: none repeat scroll 0 0 #eceded;
        border: 1px solid #e4e5e5;
        border-radius: 4px;
    }


    .cell-error .field-text
    {
        border-color: #f00 !important;
        margin: 0 !important;
        width: 100% !important;
    }

    .cell-error .field-text
    {
        border-color: #ff0000 !important;
        margin: 0 !important;
        width: 100% !important;
    }
</style>
<div class="form-row formbg" id="mainDiv" runat="server">
    <ul>
        <li id="div3" runat="server" visible="false">
            <div class="left-lable1">
                <label class="lable1">
                    Country</label>
            </div>
            <div class="right-lable1">
                <asp:DropDownList ID="ddlCountry" runat="server" data-placeholder="Choose a Country" CssClass="chosen-select search_select search-select">
                </asp:DropDownList>
            </div>
        </li>
        <li id="div1" runat="server">
            <p style="font-size: 9px;">
                Enter your phone number and carrier to receive text messages from team bulletin board
            </p>
        </li>
        <li id="divMobile" runat="server">
            <div class="left-lable1">
                <label class="lable1">
                    Mobile Phone</label>
            </div>
            <div class="right-lable1">
                <input id="txtPhone" type="text" runat="server" lengthtxt="10" class="input valid-num valid-length valid-required" placeholder="Ex:8885553333" />
            </div>
        </li>
        <li id="divcarrier" runat="server" style="display: none;">
            <div class="left-lable1">
                <label class="lable1">
                    Carrier</label>
            </div>
            <div class="right-lable1">
                <asp:DropDownList ID="ddlCarrier" runat="server" class="chosen-select search_select search-select"></asp:DropDownList>
            </div>
        </li>
        <li id="divcity" runat="server" visible="false">
            <div class="left-lable1">
                <label class="lable1">
                    City</label>
            </div>
            <div class="right-lable1">
                <input id="txtCity" type="text" class="input" runat="server" />
            </div>
        </li>
        <li id="div2" runat="server" visible="false">
            <div class="button-row1">
                <input class="save button buttonblue" type="submit" value="Update">
            </div>
        </li>
    </ul>
</div>
