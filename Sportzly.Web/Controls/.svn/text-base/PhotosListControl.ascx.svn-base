<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhotosListControl.ascx.cs" Inherits="Sportzly.Web.Controls.PhotosListControl" %>
<section id="content" class="photosList">
    <article class="top-content-fans">
        <div class="fans-2">
        </div>
        <div class="link-2">
            <a href="#" data-bind="text: 'Photos (' + ResultCount +')' "></a>
            <a href="#" data-bind="text: 'Albums (' + albums().length +')' "></a>

        </div>
      Search: <input class="search-fans" type="text" value="Search Photos" onblur="bindBlur(event)" onfocus="bindFocus(event)" />
        <div class="clear"></div>
    </article>
    <!--End-top-content-fans-->
    <article class="list-img-content-fans">
        <article class="top-list-img-content-fans">
            <ul data-bind="foreach: Result" class="phtosListUL">
                <li><a href="#">
                    <img alt="" data-bind="attr:{src:FilePath}" width="137"/></a><br />
                    Album: <span class="name-ct" data-bind="text:AlbumName()"></span><br /><span class="soccerplayer" ></span>
                </li>
        </article>
        <!--End-list-img-content-fans-->


        <div class="clear"></div>
        <div class="footer-content">
        </div>
</section>
<!--End-section-content-->
