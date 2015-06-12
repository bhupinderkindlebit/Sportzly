<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StreamProfileUpdate.ascx.cs" Inherits="Sportzly.Web.Controls.StreamProfileUpdate" %>
<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />
<link href="Common/Styles/css/form.css" rel="stylesheet" />
<script src="Common/Styles/jquery.form.js"></script>
<style type="text/css">
    #uploadProfileImageBox-button {
        width: 144px !important;
        height: 36px !important;
        margin-top: 5px !important;
    }

    #uploadProfileImageBox {
        margin-left: 5px !important;
    }

    .uploadlogo1 {
        background-image: url('../images/profile_photo.png')!important;
        border: none!important;
        border-radius: 0px!important;
        background-color: white!important;
        margin-left: 10px!important;
    }

    .uploadifive-queue-item {
        width: 200px;
        margin-left: 10px;
    }

    #uploadifive-uploadProfileImageBoxFive input {
        top: 5px !important;
    }
    /*.chosen-container {
        float: left !important;
    }*/
</style>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="Scripts/jquery.geocomplete.js"></script>

<div id="pnlStream" style="background-color: white; padding: 10px; margin-bottom: 10px; border-radius: 7px;" runat="server" visible="false">
    <section id="wrapper" class="form profile" style="width: 625px;">
        <div class="form">
            <div class="row row-field" id="divPhoto" runat="server" visible="false">
                <label for="logo" class="narrow fixed">Profile Logo </label>
                <img id="imgProfile" src="" width="120" height="120" runat="server" style="margin: 5px 0" />
            </div>
            <div class="row row-field" id="divPhoto1" runat="server" visible="false">
                <label for="logo1" class="narrow fixed">&nbsp;</label>
                <input id="uploadProfileImageBoxFive" type="file" />
                <input id="uploadProfileImageBox" type="file" style="display: none;" />
                <input type="hidden" id="imageHidden" runat="server" />
            </div>
            <div class="row row-field" id="div1" runat="server" visible="false">
                <label for="logo1" class="narrow fixed" style="height: 70px;">&nbsp;</label>
                <p>
                    <b>
                        <asp:Literal ID="ltrName" runat="server" />
                    </b>
                    <br />
                    <asp:HyperLink ID="hlkProfile" runat="server" Text="Edit Profile" Font-Underline="true" />
                    <br />
                    <asp:Literal ID="ltrMessage" runat="server" />
                </p>
            </div>
            <div class="row row-field" id="div2" runat="server" visible="false">
                <label class="narrow fixed">Country</label>
                <asp:DropDownList ID="ddlCountry" runat="server" data-placeholder="Choose a Country" CssClass="field field-text narrow">
                   
                </asp:DropDownList>
            </div>
            <div class="row row-field" id="divMobile" runat="server" visible="false">
                <label class="narrow fixed">Mobile Phone</label>

                <input id="txtPhone" type="text" runat="server" lengthtxt="10" class="field field-text narrow valid-num valid-length" placeholder="Ex:8885553333" />
            </div>
            <div class="row row-field" id="divcarrier" runat="server" style="display: none;">
                <label class="narrow fixed">Carrier</label>
                <asp:DropDownList ID="ddlCarrier" runat="server" class="field field-text narrow"></asp:DropDownList>
            </div>
            <div class="row row-field" id="divcity" runat="server" visible="false">
                <label class="narrow fixed">City</label>
                <input id="txtCity" type="text" class="field field-text narrow" runat="server" />
            </div>
            <div class="row row-field">
                <label for="logo1" class="narrow fixed">&nbsp;</label>
                <input class="signup-submit-btn" type="submit" value="Update" style="width: 18%;">
            </div>
        </div>
    </section>
</div>


