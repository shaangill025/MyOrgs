<%@ Page Title="Event Wizard - Review" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventWizard_Final.aspx.cs" Inherits="MyOrgs.EventWizard_5" %>

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
                                <a href="EventWizard_Costs.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 3</h4>
                                <p class="list-group-item-text">Transportation & Costs</p>
                                </a>
                                <a href="EventWizard_Comments.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 4</h4>
                                <p class="list-group-item-text">Comments</p>
                                </a>
                                <a href="EventWizard_Checklist.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 5</h4>
                                <p class="list-group-item-text">Checklist</p>
                                </a>
                                <a href="EventWizard_Final.aspx" class="list-group-item">
                                <h4 class="list-group-item-heading">Step 6</h4>
                                <p class="list-group-item-text">Confirmation</p>
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
                                                    <asp:TableCell><asp:Label runat="server">Description</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="desc_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Off Campus?</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="Offcampus_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Location</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="loc_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Date</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="date_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Start Time</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="time_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Attendance</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="attendance_label"></asp:Label></asp:TableCell>
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
                                                    <asp:TableCell><asp:Label runat="server"># of Buses</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="bus_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server"># of Vans</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="van_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Driver 1</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="driver1_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Driver 2</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="driver2_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Cost spent by Organization</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="orgcost_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Cost spent by Community Partner</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="partnercost_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Reserved room(s)/space(s)?</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="room_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Emailed marketing materials to Duplication?</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="marketing_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Will Chartwells be catering?</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="catering_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Does event require a sign-up form?</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="event_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server">Does event require an activity waiver?</asp:Label></asp:TableCell>
                                                    <asp:TableCell><asp:Label runat="server" ID="activity_label"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server">Is this a CU@Night event?</asp:Label></asp:TableCell>
                                                    <asp:TableCell Style="background-color:lightslategray; color:snow;"><asp:Label runat="server" ID="cunight_label"></asp:Label></asp:TableCell>
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
                            <asp:Button runat="server" ID="submitButton" class="btn btn-default" Text="Confirm Event" OnClick="submitButton_Click" />
                            <!--- ------------------------- Main Form -------------------------------------------------------------------------------------------------------------------------- --->
                        </div><!--- col-xs-12 --->
                    </div> <!--- row --->
                </div> <!--- col-sm-9 blog-main --->

                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">Please review event details that you have entered. If all information appears to be correct, please submit your proposed event.</asp:Label>
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