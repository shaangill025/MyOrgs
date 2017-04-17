<%@ Page Title="Service Project Wizard - Step 2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceProjectWizard_Partner.aspx.cs" Inherits="MyOrgs.ServiceProjectWizard_2" %>

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
                            </div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width:20%">
                                    <span>20%</span>
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
                                    <asp:Label ID="TransportationLabel" runat="server" Text="  Community Partner Details"></asp:Label>
                                </div>

                                <div class="panel-body">
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Style="width:45%;"><asp:Label runat="server">Community Partner</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:55%;"><asp:TextBox class="form-control" runat="server" ID="CommPartner" MaxLength="150"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Contact Name</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="ContactName" MaxLength="50"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Contact Email</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="ContactEmail" MaxLength="50"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Contact Phone</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="ContactPhone" MaxLength="50"/></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div><!--- panel body --->
                            </div><!--- panel-primary --->
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
                            <asp:Label runat="server">Please document the community partner you worked with to complete your service project (ie. Salvation Army, Hebron House, Habitat for Humanity) as well as all contact information.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Note: Student Activities makes occasional follow ups with our community partners to ensure satisfaction with our student groups. Therefore, we need accurate contact information.</asp:Label>
                        </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div> <!--- row --->
        </div><!--- container-fluid --->
    </asp:Panel>
</asp:Content>