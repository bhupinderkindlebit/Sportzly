<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormControl.ascx.cs" Inherits="Sportzly.Web.Controls.FormControl" %>

<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />

<style>
    .uploadifive-button.btn.btn-primary.blue.fontphoto.uploadlogo
    {
        padding: 0;
    }
</style>
<div id="uploadDocumentBoxConatiner" class="form-row">
    <h3>ADD DOCUMENT</h3>
    <div class="md899">
    <ul>
        <li>
            <div class="spl901">
                <div class="left-lable">
                </div>
                <div class="right-lable photoadd-row fileupload-row">
                    <div id="uploadDocumentBoxFive"></div>
                    <div id="uploadDocumentBox" style="display: none;"></div>
                </div>
            </div>
        </li>
        <li id="uploadDocumentBoxConatinerInner"></li>
        <li>
            <div class="spl901">
                <div class="left-lable">
                </div>
                <div class="right-lable photoadd-row button-row">
                    <input type="hidden" id="hdFileName" value="" />
                    <input type="hidden" id="hdFilePath" value="" />
                    <input type="button" id="btnDocumentUpload" value="Add" class="btnDocumentUpload buttonblue add10">
                    <input type="button" id="btnNeverDocumentUpload" value="Never mind" class="submit-member buttonblack fancyboxclose">
                </div>
            </div>
        </li>
    </ul>
        </div>
</div>
