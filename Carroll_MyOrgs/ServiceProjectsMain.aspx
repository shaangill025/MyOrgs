<%@ Page Language="C#" Title="Service Projects" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceProjectsMain.aspx.cs" Inherits="MyOrgs.ServiceProjects" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid">
            <div class="col-sm-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon_clock.png" /> <asp:Label ID="SvcProjLabel" runat="server" Text="  Upcoming Service Projects"></asp:Label>
                        <asp:Button class="btn btn-default" style="position:relative; float: right;" ID="AddServiceProject" runat="server" Text="Add New Service Project" OnClick="AddServiceProject_Click"/>
                    </div> <!--- panel-heading --->

                    <asp:LinkButton class="btn btn-link" style="align-self:center" ID="InclPast" runat="server" OnClick="InclPast_Click">Include Past Service Projects</asp:LinkButton>
                    <asp:LinkButton class="btn btn-link" style="align-self:center" ID="ShowCurrent" Visible="false" runat="server" OnClick="ShowCurrent_Click">Only Show Current Service Projects</asp:LinkButton>

                    <br />

                    <div class="panel panel-blue">
                        <div class="panel-heading">
                            <asp:GridView ID="grdServiceList" runat="server" AutoGenerateColumns="False" Width="100%" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c" 
                                OnRowDataBound="grdServiceList_RowDataBound" OnRowCommand="grdServiceList_RowCommand" DataKeyNames="ServiceProject_ID">
							    <Columns>
                                    <asp:BoundField DataField="StartDate" Headertext="Date" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:TemplateField HeaderText="Recurring?" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c">
	                                    <ItemTemplate>
		                                    <asp:Checkbox runat="server" Checked='<%# Bind("OnGoing") %>' ID="ongoing_cb" ReadOnly="True" Enabled="false"></asp:Checkbox>
	                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Location" Headertext="Location" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="Title" Headertext="Title" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="Planned_HoursVolunteered" Headertext="Volunteer Hours" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="CommunityPartner" Headertext="Community Partner" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="ServiceProject_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:ButtonField ButtonType="Link" CommandName="EditService" Text="Edit" HeaderStyle-BackColor="#002b5c" HeaderStyle-ForeColor="Snow"/> 
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
                            <asp:Label runat="server">View upcoming (and previous) service projects documented by your Organization.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Use this step by step <i>Wizard</i> to create a new service project documentation by clicking “Add New Service Project” and follow the next steps.</asp:Label>
                        </div>
         	        </div> <!--- well --->
                </div> <!--- col-xs-12 col-sm-3 --->
            </div> <!--- row --->
        </div> <!--- container --->
    </asp:Panel>
</asp:Content>