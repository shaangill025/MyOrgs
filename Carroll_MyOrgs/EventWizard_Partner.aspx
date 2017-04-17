<%@ Page Title="Event Wizard - Step 2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventWizard_Partner.aspx.cs" Inherits="MyOrgs.EventWizard_3" %>

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
                            </div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width:20%">
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
                                    <asp:Label ID="PartnerLabel" runat="server" Text="  Community Partner"></asp:Label>
                                </div>

                                <div class="panel-body">
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Style="width:35%;"><asp:Label runat="server">Community Partner</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:40%;"><asp:TextBox class="form-control" runat="server" ID="OrgPartner" MaxLength="50" /></asp:TableCell>
                                            <asp:TableCell Style="width:25%;"><asp:Label runat="server"></asp:Label></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Contact Name</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="OrgContactName" MaxLength="50" /></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server"></asp:Label></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Contact Email</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="OrgContactEmail" MaxLength="50"/></asp:TableCell>
                                            <asp:TableCell><asp:RegularExpressionValidator ID="revemail" runat="server" 
                                                ControlToValidate="OrgContactEmail" ErrorMessage="Please enter a valid e-mail." 
                                                ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Invalid Email</asp:RegularExpressionValidator></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Contact Phone</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="OrgContactPhone" MaxLength="15"/></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server"></asp:Label></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div><!--- panel body --->
                            </div><!--- panel-primary --->
                            <br />
                            <asp:Button runat="server" ID="saveButton" class="btn btn-default" Text="Save Data & Continue" OnClick="saveButton_Click" />
                            <!--- ------------------------- Main Form -------------------------------------------------------------------------------------------------------------------------- --->
                        </div><!--- col-xs-12 --->
                    </div> <!--- row --->
                </div> <!--- col-sm-9 blog-main --->

                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3><div style="font-size:94%;">
                            <asp:Label runat="server">If your event is in partnership with a community partner organization (ie. Relay for Life, Dance Marathon, etc.) please document your partner and contact information.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Note: This is different than your volunteer requirement documentation. To document your Service Project requirement, please see the Service Project page on the main menu.</asp:Label>
                        </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div><!--- row --->
        </div><!--- container-fluid --->
   </asp:Panel>
</asp:Content>