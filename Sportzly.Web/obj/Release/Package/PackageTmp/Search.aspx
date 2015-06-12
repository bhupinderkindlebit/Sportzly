<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Sportzly.Web.Search" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <style>
        .itemStyle
        {
            width: 100px;
            float: left;
        }
    </style>
    <section id="wrapper" style="background-color: #fff; padding: 20px">
        <br />
        <h2>Users</h2>
        <hr />
        <asp:DataList ID="usersLists" runat="server"  RepeatLayout="Flow" ItemStyle-CssClass="itemStyle" GridLines="Both" HorizontalAlign="Center" RepeatDirection="Horizontal" >
            <ItemTemplate>
                <a href='<%# "profile.aspx?" +  DataBinder.Eval(Container.DataItem, "EmailId") %>'>
                <asp:Image ID="userImage" Height="60"
                    ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ProfileFoto") %>'
                    runat="server" />
                <br />
                
                    <%# DataBinder.Eval(Container.DataItem, "DisplayName") %></a>
                
            </ItemTemplate>
        </asp:DataList>
        <div style="clear:both" />
        <br /><br />
                <h2>Teams</h2>
        <hr />
        <asp:DataList ID="teamsLists" runat="server" RepeatLayout="Flow" ItemStyle-CssClass="itemStyle" HorizontalAlign="Center" RepeatDirection="Horizontal">
           
            <ItemTemplate>
                <a href='<%# "team.aspx?" +  DataBinder.Eval(Container.DataItem, "Id") %>'>
                <asp:Image ID="teamImage" Height="60"
                    ImageUrl='<%# DataBinder.Eval(Container.DataItem, "Photo") %>'
                    runat="server" />
                <br />
                
                    <%# DataBinder.Eval(Container.DataItem, "TeamName") %></a>
                    
            </ItemTemplate>
        </asp:DataList>
    </section>
</asp:Content>
