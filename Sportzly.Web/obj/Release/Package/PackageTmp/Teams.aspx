<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="Sportzly.Web.Teams" %>

<%@ Register Src="Controls/ProfileHeaderControl.ascx" TagName="ProfileHeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/TeamsFilterControl.ascx" TagPrefix="uc1" TagName="TeamsFilterControl" %>
<%@ Register Src="Controls/TeamListControl.ascx" TagPrefix="uc1" TagName="TeamListControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <link type="text/css" href="Common/styles/css/base.css" rel="stylesheet" />
    

    <section id="wrapper">


    <uc1:ProfileHeaderControl ID="profileHeader" runat="server" />
    
    <section id="content">

                	<uc1:TeamsFilterControl ID="teamsFilter" runat="server" />

                    <article class="schedule">

                    	<uc1:TeamListControl ID="teamList" runat="server" />

                         

                     </article><!--End-article-schedule-->

                      <div class="clear"></div>

                     <div class="footer-content">

                    	<select>

                        	<option><img alt="" src="images/$.png" />SHOW MORE </option>

                        </select>

                    </div>

                </section>
    <!--End-section-content-->
    </section><!--End-wrapper-->
    
</asp:Content>
