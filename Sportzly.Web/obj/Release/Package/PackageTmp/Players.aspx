<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Players.aspx.cs" Inherits="Sportzly.Web.Players" %>

<%@ Register Src="Controls/ProfileHeaderControl.ascx" TagName="ProfileHeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/PlayersFilterControl.ascx" TagName="PlayersFilterControl" TagPrefix="uc2" %>

<%@ Register src="Controls/PlayerListControl.ascx" tagname="PlayerListControl" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <link type="text/css" href="Common/styles/css/base.css" rel="stylesheet" />
    <section id="wrapper">
            <uc1:ProfileHeaderControl ID="profileHeader" runat="server" />    
    <section id="content">
        <uc2:PlayersFilterControl ID="PlayersFilterControl1" runat="server" />
             <article class="schedule">
  <uc3:PlayerListControl ID="PlayerListControl1" runat="server" />
                    </article><!--End-article-schedule-->

                      <div class="clear">
                        
        </div>

                     <div class="footer-content" style="display:none;">

                    	<select>

                        	<option><img alt="" src="images/$.png" />SHOW MORE </option>

                        </select>

                    </div>
        </section>
        </section>
</asp:Content>
