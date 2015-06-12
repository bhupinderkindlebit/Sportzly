<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhotoUploadControl.ascx.cs" Inherits="Sportzly.Web.Controls.PhotoUploadControl" %>

<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />

<div id="uploadImageBoxConatiner" class="form-row">
    <h3>ADD PHOTO</h3>
    <div class="md810">
    <ul>
        <li>
            <div class="spl901">
                <div class="left-lable">
                </div>
                <div class="right-lable photoadd-row fileupload-row">
                    <div id="uploadImageBoxFive"></div>
                    <div id="uploadImageBox" style="display: none;"></div>
                </div>
            </div>
        </li>
        <li id="uploadImageBoxConatinerInner"></li>
        <li>
            <div class="spl901">
                <div class="left-lable">
                </div>
                <div class="right-lable photoadd-row button-row">
                    <input type="button" id="btnImageUpload" value="Add" class="btnImageUpload buttonblue add10">
                    <input type="button" id="btnNeverPhotoUpload" value="Never mind" class="submit-member buttonblack fancyboxclose">
                </div>
            </div>
        </li>
    </ul>
        </div>
</div>