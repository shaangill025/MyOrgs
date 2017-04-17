<%@ Page Title="Service Project Wizard - Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceProjectWizard_Results.aspx.cs" Inherits="MyOrgs.ServiceProjectWizard_3" %>

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
                                <a href="ServiceProjectWizard_Details.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 1</h4>
                                <p class="list-group-item-text">Service Project Details</p>
                                </a>
                                <a href="ServiceProjectWizard_Partner.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 2</h4>
                                <p class="list-group-item-text">Community Partner</p>
                                </a>
                            </div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width:100%">
                                    <span>100%</span>
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
                            <asp:Panel runat="server" ID="Add_Panel">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <asp:Label ID="PlannedOutcomeLabel" runat="server" Text="  Planned Outcome"></asp:Label>
                                    </div>

                                    <div class="panel-body">
                                        <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell Style="width:45%;"><asp:Label runat="server"># of volunteers</asp:Label></asp:TableCell>
                                                <asp:TableCell Style="width:55%;"><asp:TextBox class="form-control" runat="server" ID="planned_volunteers" MaxLength="4"/></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell><asp:Label runat="server"># of volunteer hours</asp:Label></asp:TableCell>
                                                <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="planned_hours" MaxLength="20"/></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell><asp:Label runat="server">Funds/Items Raised</asp:Label></asp:TableCell>
                                                <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="planned_items" MaxLength="250"/></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div><!--- panel body --->
                                </div><!--- panel-primary --->
                            </asp:Panel>
                            <br />
                            <asp:Panel runat="server" ID="Edit_Panel">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label2" runat="server" Text="  Planned Outcome"></asp:Label>
                                    </div>

                                    <div class="panel-body">
                                        <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell Style="width:45%;"># of volunteers</asp:TableCell>
                                                <asp:TableCell Style="width:55%;"><asp:Label runat="server" ID="p_volunteers"></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell><asp:Label runat="server"># of volunteer hours</asp:Label></asp:TableCell>
                                                <asp:TableCell><asp:Label runat="server" ID="p_hours"></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>Funds/Items Raised</asp:TableCell>
                                                <asp:TableCell><asp:Label runat="server" ID="p_items"></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div><!--- panel body --->

                                    <div class="panel-heading">
                                        <asp:Label ID="Label1" runat="server" Text="  Final Outcome"></asp:Label>
                                    </div>

                                    <div class="panel-body">
                                        <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell Style="width:45%;"><asp:Label runat="server"># of volunteers</asp:Label></asp:TableCell>
                                                <asp:TableCell Style="width:55%;"><asp:TextBox class="form-control" runat="server" ID="actual_volunteers" MaxLength="4"/></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell><asp:Label runat="server"># of volunteer hours</asp:Label></asp:TableCell>
                                                <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="actual_hours" MaxLength="20"/></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell><asp:Label runat="server">Funds/Items Raised</asp:Label></asp:TableCell>
                                                <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="actual_items" MaxLength="250"/></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div><!--- panel body --->
                                </div><!--- panel-primary --->
                            </asp:Panel>
                            <br />
                            <asp:Button runat="server" ID="saveButton" class="btn btn-default" Text="Save Data & Continue" OnClick="saveButton_Click" />
                            <!--- ------------------------- Main Form -------------------------------------------------------------------------------------------------------------------------- --->
                        </div><!--- col-xs-12 --->
                    </div> <!--- row --->
                </div> <!--- col-sm-9 blog-main --->

                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">Please review service project details that you have entered. If all information appears to be correct, please submit your proposed event.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">If you need to go back and edit information, click on the specific step under the “steps completed” progress box on the left side of the screen.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Student Activities staff will review all information and respond with any appropriate questions, concerns, or approval.</asp:Label>
                        </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div> <!--- row --->
        </div><!--- container-fluid --->
    </asp:Panel>
</asp:Content>