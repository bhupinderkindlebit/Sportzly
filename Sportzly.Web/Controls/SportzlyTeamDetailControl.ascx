<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SportzlyTeamDetailControl.ascx.cs" Inherits="Sportzly.Web.Controls.SportzlyTeamDetailControl" %>
<div class="teamEntity">
    <div class="profile-pic">
        <div class="dropdown">
            <a class="btn nopaddingbtn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="drop-box"><span class="caret"></span></span>Germantown Cricket Club</a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" class="dropactive">Germantown Cricket Club </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Germantown Wrestling Team</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Grizz</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Basketjunkies</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">University of Memphis Rugby</a></li>
            </ul>
        </div>
        <div class="team_secbottom-text">
            <img data-bind="attr: { src: Photo() }" alt="team">
            <div class="edit_team-box"><a href="#" id="ancEditTeamNew" data-bind="attr: { logo: teamModel.isMyTeam(), visible: teamModel.isMyTeam() }">Edit Team</a></div>
        </div>
    </div>
    <div class="about-sports">
        <div class="detail-row"><span class="label">SPORTS</span> <span class="label-name" data-bind="text: SportsName()"></span></div>
        <div class="detail-row"><span class="label">SEASON</span> <span class="label-name" data-bind="text: Season()"></span></div>
        <div class="detail-row"><span class="label">LEVEL</span> <span class="label-name" data-bind="text: TeamCategory()"></span></div>
        <div class="detail-row"><span class="label">CITY</span> <span class="label-name" data-bind="text: City()"></span></div>
        <div class="detail-row"><span class="label">COUNTRY</span> <span class="label-name" data-bind="text: Country()"></span></div>

    </div>
    <div class="about">
        <h2>ABOUT</h2>
        <p data-bind="text: Description()"></p>
    </div>
    <div class="team-members">
        <h3>Members</h3>
        <ul class="gallery" data-bind="foreach: Members()">
            <li><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                <img data-bind="attr: { src: Photo() }" alt="img">
                <span class="icon-phone" data-bind="visible: Phone()"></span></a></li>          
        </ul>
        <button type="button" class="btn btn-primary blue">VIEW ALL MEMBERS</button>
    </div>
    <div class="fans">
        <h3>fans</h3>
        <ul class="gallery" data-bind="foreach: Fans()">
            <li><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                <img data-bind="attr: { src: Photo() }"  alt="img"></a></li>            
        </ul>
        <button type="button" class="btn btn-primary blue">SEE ALL 386 FANS</button>
    </div>
    <div class="team-admin">
        <h3>team aDMIN</h3>
        <ul class="gallery nopadding" data-bind="foreach: TeamAdmins()">
            <li><a data-bind="attr: { href: 'profile.aspx?' + EmailId(), title: Name() }">
                <img data-bind="attr: { src: Photo() }" alt="img"></a></li>            
        </ul>
    </div>
    <div class="team-admin">
        <h3>External Team URL</h3>
        <div data-bind="foreach: TeamUrl()">
            <a data-bind="attr: { href: Url() }" target="_blank"> <span data-bind=" text: Url()"></span> </a>
        </div>        
    </div>
    <div class="team-docs">
        <h3>team docs</h3>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <div class="detail-row"><span class="label">Tornado Cup</span> <span class="label-name">08.31.2012</span> </div>
        <button type="button" class="btn btn-primary blue mrg-t10">VIEW ALL DOCS</button>
    </div>
</div>
