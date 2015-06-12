<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlbumsListControl.ascx.cs" Inherits="Sportzly.Web.Controls.AlbumsListControl" %>

<div class="resp-tabs-container noborder-bottom">
    <div class="tab1 col-xs-12">
        <div class="documents-sec col-xs-12 col-sm-12 col-md-12">
            <div class="fontphotobtn2">
                <a class="btn btn-primary blue fontphoto" id="ancAlbum"></a>
            </div>
            <div class="section-title">
                <h2 id="ancPhoto"></h2>
            </div>
            <div class="search-sec">
                <div class="documentssearch">
                    <input type="text" class="input search-fans" placeholder="Search for photos" onblur="bindBlur(event)" onfocus="bindFocus(event)">
                    <a href="#"><i class="fa fa-fw"></i></a>
                </div>
                <div class="documentsbtn"><a style="cursor: pointer;" class="view-all" onclick="showPhoto()"><i class="fa fa-fw" style="position: relative; top: 2px; left: 0px; color: #fff"></i> Photos / Videos </a></div>
            </div>
            <div class="photo-sec">
                <div class="bx-wrapper">
                    <ul class="bxslider1">
                    </ul>
                </div>               
            </div>
        </div>
    </div>
</div>
