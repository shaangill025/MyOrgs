<%@ Page Title="Service Project Wizard - Review" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceProjectWizard_Final.aspx.cs" Inherits="MyOrgs.ServiceProjectWizard_Final" %>

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
                                <a href="ServiceProjectWizard_Results.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 3</h4>
                                <p class="list-group-item-text">Service Project Results</p>
                                </a>
                                <a href="ServiceProjectWizard_Comments.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 4</h4>
                                <p class="list-group-item-text">Comments</p>
                                </a>
                                <a href="ServiceProjectWizard_Final.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 5</h4>
                                <p class="list-group-item-text">Review & Submit</p>
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
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <asp:Label ID="CommentLabel" runat="server" Text="  Review Event Details"></asp:Label>
                                </div>

                                <div class="panel-body">
                                    <div class="panel panel-blue">
                                        <div class="panel-heading">
											<asp:Table style="align-self:center" GridLines="Both" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell Style="width:50%; background-color:lightslategray; color:snow;"><asp:Label runat="server">Title</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="width:50%; background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="title_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Community Impact</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="comimpact_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Recurring?</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="ongoing_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Date</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="date_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Start Time</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="stime_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">End Time</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="etime_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Location</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="loc_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Community Partner</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="partner_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Contact Name</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="name_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Contact Email</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="email_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Contact Phone</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="phone_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Planned # of volunteers</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="pvol_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Planned # of volunteer hours</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="phrs_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Planned # of Funds/Items Raised</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="pitems_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Actual # of volunteers</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="avol_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Actual # of volunteer hours</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="ahrs_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Actual # of Funds/Items Raised</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="aitems_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
											</asp:Table>
                                        </div><!--- panel-heading --->

                                        <div class="panel-heading">
                                            <asp:GridView ID="grdComments" runat="server" AutoGenerateColumns="False" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c">
							                    <Columns>
                                                    <asp:BoundField DataField="ShortDate" Headertext="Date" ItemStyle-Width="15%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                    <asp:BoundField DataField="Text" Headertext="Comment" ItemStyle-Width="65%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                </Columns>
                                            </asp:GridView>
                                        </div><!--- panel-heading --->

                                    </div><!--- panel-blue --->
                                </div> <!--- panel body --->

                            </div>
                            <br />
                            <asp:Button runat="server" ID="submitButton" class="btn btn-default" Text="Submit Service Project" OnClick="submitButton_Click" />
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