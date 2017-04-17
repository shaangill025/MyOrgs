<%@ Page Language="C#" Title="Events" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventsMain.aspx.cs" Inherits="MyOrgs.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid">
            <div class="col-sm-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon_clock.png" /> <asp:Label ID="LoginLabel" runat="server" Text="  Upcoming Events"></asp:Label>
                        <asp:Button class="btn btn-default" style="position:relative; float:right;" ID="AddEvent" runat="server" Text="Add New Event" OnClick="AddEvent_Click"/>
                    </div> <!--- panel-heading --->

                    <asp:LinkButton class="btn btn-link" style="align-self:center" ID="InclPast" runat="server" OnClick="InclPast_Click">Include Past Events</asp:LinkButton>
                    <asp:LinkButton class="btn btn-link" style="align-self:center" ID="ShowCurrent" Visible="false" runat="server" OnClick="ShowCurrent_Click">Only Show Current Events</asp:LinkButton>
                    <br />

                    <div class="panel panel-blue">
                        <div class="panel-heading">
                            <asp:GridView ID="grdEventList" runat="server" AutoGenerateColumns="False" Width="85%" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c" OnRowDataBound="grdEventList_RowDataBound" OnRowCommand="grdEventList_RowCommand" DataKeyNames="Event_ID">
							    <Columns>
                                    <asp:BoundField DataField="EventDate" Headertext="Date" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="EventTime" Headertext="Start Time" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="Title" Headertext="Title" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="OrganizationWorkedWith" Headertext="Community Partner" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="Event_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="Organization_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:ButtonField ButtonType="Link" CommandName="EditEvent" Text="Edit" HeaderStyle-BackColor="#002b5c" HeaderStyle-ForeColor="Snow"/> 
                                </Columns>
                            </asp:GridView>
                        </div> <!--- panel-heading --->
                    </div> <!--- panel-blue --->
                </div> <!--- panel-primary --->
            </div> <!--- col-sm-9 --->

            <div class="row">
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">This page is aimed at documenting your Organization’s event(s) as they take place.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Submit your event information 15 days prior to your event so Student Activities may document, review and/or provide effective feedback to help ensure your event’s success.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Use this step by step <i>Wizard</i> to document all event details.</asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Label runat="server"><b>Greek Chapters</b></asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Note: You will link to a Qualtrix form that differs from non-Greek Organizations.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">To edit an Event form, please contact <a href="mailto:greeklife@carrollu.edu">greeklife@carrollu.edu</a>.</asp:Label>
                        </div>
         	        </div> <!--- well --->
                </div> <!--- col-xs-12 col-sm-3 --->
            </div> <!--- row --->
        </div> <!--- container --->
    </asp:Panel>
</asp:Content>