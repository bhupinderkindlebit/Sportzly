<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TeamHomeControl.ascx.cs" Inherits="Sportzly.Web.Controls.TeamHomeControl" %>
<div class="carousel slide" id="myCarousel">
    <div class="carousel-inner">
        <div class="item active">
            <ul data-bind="foreach: Result().slice(0, 4), visible: Result().length > 0" class="thumbnails featured-teams-container">
                <li class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img alt="" data-bind="attr: { src: Photo, alt: TeamName }">
                    </div>
                    <div class="detail">
                        <a href="javascript:;" onclick="showalert();" class="icon"><i class="fa fa-plus"></i></a>
                        <h2 data-bind="text: TeamName()"></h2>
                        <p>Lorem ipsum dolor sit amet velum, consectetur adipiscing volutpat rutrum</p>
                    </div>
                </li>
                <%-- <div class="user-tile">
        <div class="user-tile-bg">
            <a href="javascript:;" onclick="showalert();" class="user-tile-avatar">
                <img width="116" height="124" alt="" data-bind="attr: { src: Photo, alt: TeamName }">
            </a>
        </div>
        <a href="javascript:;" onclick="showalert();" class="user-tile-username" data-bind="text: TeamName()"></a>
    </div>--%>
            </ul>
        </div>
        <div class="item">
            <ul data-bind="foreach: Result().slice(4, Result().length), visible: Result().length > 0" class="thumbnails featured-teams-container1">
                <li class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img alt="" data-bind="attr: { src: Photo, alt: TeamName }">
                    </div>
                    <div class="detail">
                        <a href="javascript:;" onclick="showalert();" class="icon"><i class="fa fa-plus"></i></a>
                        <h2 data-bind="text: TeamName()"></h2>
                        <p>Lorem ipsum dolor sit amet velum, consectetur adipiscing volutpat rutrum</p>
                    </div>
                </li>
                
            </ul>
        </div>
    </div>
    <a data-slide="prev" href="#myCarousel" class="left carousel-control">‹</a>
    <a data-slide="next" href="#myCarousel" class="right carousel-control">›</a>
</div>


<!--End-schedule-list-->

