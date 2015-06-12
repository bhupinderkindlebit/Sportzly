<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunityControl.ascx.cs" Inherits="Sportzly.Web.Controls.CommunityControl" %>
<section class="left-communities teams">

    <h2 class="popular">Teams :
        <asp:Label ID="lblTeamNameHead" runat="server" Text="Label"></asp:Label></h2>
    <br />
    <div>
        <article class="list-communities">
            <div style="float: right; padding-right:20px">
                <asp:Image ID="Image1" runat="server" Height="150" />
            </div>
            <div>
                <asp:Label ID="Label2" runat="server" Text="Label" Width="200">Team Name:</asp:Label>
                <asp:Label ID="lblTeamName" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="Label" Width="200">Owner:</asp:Label>
                <asp:Label ID="lblOwner" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label5" runat="server" Text="Label" Width="200">Created On:</asp:Label>
                <asp:Label ID="lblCreateDate" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label4" runat="server" Text="Label" Width="200">Sports:</asp:Label>
                <asp:Label ID="lblSports" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label6" runat="server" Text="Label" Width="200">Description:</asp:Label>
                <asp:Label ID="lblDescription" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label8" runat="server" Text="Label" Width="200">Team Category:</asp:Label>
                <asp:Label ID="lblTeamCategory" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label10" runat="server" Text="Label" Width="200">Season:</asp:Label>
                <asp:Label ID="lblSeason" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label12" runat="server" Text="Label" Width="200">Practice Ground:</asp:Label>
                <asp:Label ID="lblPracticeGround" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label14" runat="server" Text="Label" Width="200">City:</asp:Label>
                <asp:Label ID="lblCity" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label16" runat="server" Text="Label" Width="200">Country:</asp:Label>
                <asp:Label ID="lblCountry" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label21" runat="server" Text="Label" Width="200">Team Followers:</asp:Label>
                <asp:Label ID="lblFollowersCount" runat="server" Text="Label">Cricket</asp:Label>
            </div>
            <div>
                <asp:Label ID="Label18" runat="server" Text="Label" Width="200">Team Members:</asp:Label>
                <asp:Label ID="lblMembersCount" runat="server" Text="Label">Cricket</asp:Label>
                <br />
                <asp:Label ID="Label20" runat="server" Text="Label">Cricket</asp:Label>
            </div>

        </article>
    </div>
</section>
