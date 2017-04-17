<%@ Page Language="C#" Title="Student Roster Report" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="MyOrgs.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid">
            <div class="col-sm-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon_report.png" /> <asp:Label ID="LoginLabel" runat="server" Text="  Student Roster Report"></asp:Label>
                    </div> <!--- panel-heading --->

                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label1" runat="server" class="col-xs-12 control-label" Text="Classification"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList class="form-control" clientidMode="Static" ID="cl_list" runat="server" name="cl_list" AutoPostBack="true"
                                RepeatDirection="Vertical" RepeatLayout="Table" OnSelectedIndexChanged="cl_list_SelectedIndexChanged">
                                    <asp:ListItem Value="FR">Freshmen</asp:ListItem>
                                    <asp:ListItem Value="SO">Sophomores</asp:ListItem>
                                    <asp:ListItem Value="JR">Juniors</asp:ListItem>
                                    <asp:ListItem Value="SR">Seniors</asp:ListItem>
                                    <asp:ListItem Value="GR">Graduate Students</asp:ListItem>
                                    <asp:ListItem Value="S">Special</asp:ListItem>
                                    <asp:ListItem Value="UN">Unknown</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="**">All</asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button class="btn btn-default" style="position:relative; float: right;" ID="btnExport" runat="server" 
                                        Text="Export to Excel" OnClick="btnExport_OnClick"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <div class="panel panel-blue">
                        <div class="panel-heading">
                            <asp:GridView ID="grdMember" runat="server" AutoGenerateColumns="False" Width="85%" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c">
							    <Columns>
                                    <asp:BoundField DataField="Term" Headertext="Term" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="OrganizationName" Headertext="Organization" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="MemberName" Headertext="Member Type" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="FirstName" Headertext="First Name" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="LastName" Headertext="Last Name" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="classification" Headertext="Classification" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                </Columns>
                            </asp:GridView>
                        </div> <!--- panel-heading --->
                    </div> <!--- panel-blue --->
                </div> <!--- col-sm-9 --->
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">This page lists the current active members of the organization.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Need to update executive board members? Email Student Activities at <a target="_blank" href="mailto:carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a>.</asp:Label>
                        </div>
         	        </div> <!--- well --->
                </div> <!--- col-xs-12 col-sm-3 --->
            </div> <!--- row --->
        </div> <!--- container --->
    </asp:Panel>
</asp:Content>