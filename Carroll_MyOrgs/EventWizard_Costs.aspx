<%@ Page Title="Event Wizard - Step 3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventWizard_Costs.aspx.cs" Inherits="MyOrgs.EventWizard_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid" >
            <div class="row">
                <!--- ------------------------- Progress Bar -------------------------------------------------------------------------------------------------------------------------- --->
                <div class="col-xs-12 col-sm-3">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon-steps.png" /> <asp:Label ID="LoginLabel" runat="server" Text="  Steps Completed"></asp:Label>
                        </div> <!--- panel-heading --->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="EventWizard_Details.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 1</h4>
                                <p class="list-group-item-text">Event Details</p>
                                </a>
                                <a href="EventWizard_Partner.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 2</h4>
                                <p class="list-group-item-text">Community Partner</p>
                                </a>
                            </div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width:40%">
                                    <span>40%</span>
                                </div> <!--- progress-bar --->
                            </div> <!--- progress-striped --->
                        </div> <!--- panel-body --->
                    </div> <!--- panel panel-info --->
                </div> <!--- col-xs-12 col-sm-3 --->
                <!--- ------------------------- Progress Bar -------------------------------------------------------------------------------------------------------------------------- --->

                <div class="col-sm-6 blog-main">
                    <div class="row">
                        <div class="col-xs-12">
                            <!--- ------------------------- Main Form -------------------------------------------------------------------------------------------------------------------------- --->
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <asp:Label ID="TransportationLabel" runat="server" Text="  Transportation"></asp:Label>
                                </div>

                                <div class="panel panel-blue">
                                    <div class="panel-heading">
                                        <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell Style="width:20%;"><asp:Label runat="server"># of Buses</asp:Label></asp:TableCell>
                                                <asp:TableCell Style="width:30%;"><asp:TextBox class="form-control" runat="server" ID="NumBuses" MaxLength="2"/></asp:TableCell>
                                                <asp:TableCell Style="width:20%;"><asp:Label runat="server"># of Vans</asp:Label></asp:TableCell>
                                                <asp:TableCell Style="width:30%;"><asp:TextBox class="form-control" runat="server" ID="NumVans" MaxLength="2"/></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div> <!--- panel-heading --->
                                </div> <!--- panel-primary --->
                            </div><!--- panel-blue --->

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <asp:Label ID="Label1" runat="server" Text="  Drivers (max 2)"></asp:Label>
                                </div>
                                <div class="panel-body">
                                    <asp:Label ID="DriverError" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Style="width:30%;"><asp:Label ID="Label2" runat="server" Text="Student Drivers"></asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:50%;">
                                                <asp:DropDownList class="form-control" clientidMode="Static" ID="student_drivers_list" runat="server" name="student_drivers_list" 
                                                     RepeatDirection="Vertical" RepeatLayout="Table" AutoPostBack="True" OnSelectedIndexChanged="student_drivers_list_SelectedIndexChanged">
                                                    <asp:ListItem Text="All Drivers" Value="-1" />
                                                    </asp:DropDownList> 
                                            </asp:TableCell>
                                            <asp:TableCell Style="width:20%;"><asp:Button runat="server" ID="AddDriver" class="btn btn-default" CommandName="AddDriver" Text="Add Driver" OnClick="AddDriver_Click"/></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                    <br />
                                    <asp:GridView ID="grdDriverList" runat="server" AutoGenerateColumns="False" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c" OnRowDataBound="grdDriverList_RowDataBound" OnRowCommand="grdDriverList_RowCommand" DataKeyNames="Student_ID">
							            <Columns>
                                            <asp:ButtonField ButtonType="Link" CommandName="RemoveDriver" Text="Remove" ItemStyle-Width="10%" HeaderStyle-BackColor="#002b5c" HeaderStyle-ForeColor="Snow"/> 
                                            <asp:BoundField DataField="FirstName" Headertext="First Name" ItemStyle-Width="25%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                            <asp:BoundField DataField="LastName" Headertext="Last Name" ItemStyle-Width="25%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                            <asp:BoundField DataField="DriverType" Headertext="Driver Type" ItemStyle-Width="30%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                            <asp:BoundField DataField="Student_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <asp:Label runat="server">Certified Drivers: Students that are Certified Drivers have completed the driver training, test, background check and behind the wheel requirements. Drivers are certified to drive 12 passenger vans, 8 passenger vans and university approved golf carts.</asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label runat="server">Approved Drivers: Students that are Approved Drivers have completed the MVR form and background check. Drivers are approved to drive 8 passenger vans as well as university approved golf carts.</asp:Label>
                                </div> <!--- panel-body --->
                            </div> <!--- panel-primary --->
                            
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <asp:Label ID="CostLabel" runat="server" Text="  Costs"></asp:Label>
                                </div><!--- panel heading--->

                                <div class="panel-body">
                                    <div class="panel panel-blue">
                                        <div class="panel-heading">
                                            <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell Style="width:50%;"><asp:Label runat="server">Spent by Organization</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="width:50%;"><asp:TextBox class="form-control" runat="server" ID="OrgCost" MaxLength="18" /></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Spent by Community Partner</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="PartnerCost" MaxLength="18" /></asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div><!--- panel-heading --->
                                    </div><!--- panel-blue --->
                                </div> <!--- panel body --->
                            </div> <!--- panel primary--->

                            <br />
                            <asp:Button runat="server" ID="saveButton" class="btn btn-default" Text="Save Data & Continue" OnClick="saveButton_Click" />
                        <!--- ------------------------- Main Form -------------------------------------------------------------------------------------------------------------------------- --->

                        </div><!--- col-xs-12 --->
                    </div> <!--- row --->
                </div> <!--- col-sm-6 blog-main --->

                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">Does your event require transportation? If so, Please document how your organization plans to provide transportation and who your drivers will be.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">To become a certified or approved driver, please click on the Departments tab on the portal. On the list of available options, click on General Services. On the General Services page, click on Van Program. Instructions and corresponding forms can be found on this page.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">If available, please document transportation costs.</asp:Label>
                        </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div> <!--- row --->
        </div><!--- container-fluid --->
    </asp:Panel>
</asp:Content>