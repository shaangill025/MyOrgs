<%@ Page Language="C#" Title="Main Menu" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="MyOrgs.MainMenu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:table runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center"><asp:ImageButton ID="MyOrgs" runat="server" Height="100" Width="150" ImageUrl="~/images/myorg-icon.png" OnClick="MyOrgs_Click" /></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Bottom"><asp:ImageButton ID="Roster" runat="server" Height="150" Width="150" ImageUrl="~/images/roster-icon.png" OnClick="Roster_Click" /></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Bottom"><asp:ImageButton ID="Reports" runat="server" Height="125" Width="125" ImageUrl="~/images/report-icon.png" OnClick="Reports_Click" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center"><asp:Label runat="server">My Organization</asp:Label></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:Label runat="server">Current Roster</asp:Label></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:Label runat="server">Reports</asp:Label></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center"><asp:ImageButton ID="EventsButton" runat="server" Height="125" Width="150" ImageUrl="~/images/event-icon.png" OnClick="Events_Click" /></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:ImageButton ID="ServiceProjs" runat="server" Height="100" Width="150" ImageUrl="~/images/serviceproject-icon.png" OnClick="ServiceProjs_Click" /></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:ImageButton ID="ChangePwd" runat="server" Height="125" Width="125" ImageUrl="~/images/changepwd-icon.png" OnClick="ChangePwd_Click" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center"><asp:Label runat="server">Events</asp:Label></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:Label runat="server">Service Projects</asp:Label></asp:TableCell>
            <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:Label runat="server">Change Password</asp:Label></asp:TableCell>
        </asp:TableRow>
        </asp:table>
</asp:Content>