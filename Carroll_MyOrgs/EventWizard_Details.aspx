<%@ Page Title="Event Wizard - Step 1" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventWizard_Details.aspx.cs" Inherits="MyOrgs.EventWizard_1" %>

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
                            <p>(none)</p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="5" style="width:1%">
                                    <span>0%</span>
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
                                    <asp:Label ID="DetailsLabel" runat="server" Text="  Event Details"></asp:Label>
                                </div> <!--- panel heading --->

                                <div class="panel-body">
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Style="width:15%;"><asp:Label runat="server">Title</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:85%;"><asp:TextBox class="form-control" runat="server" ID="EventTitle" Width="450px" MaxLength="50" /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Description (include all activities)</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox ID="EventDescription" class="form-control" clientidMode="Static" runat="server" AutoPostBack="True" 
                                                    Rows="3" Height="100px" TextMode="MultiLine" Width="450px"></asp:TextBox></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>

                                    <br />
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Style="width:18%;"><asp:Label runat="server">Off Campus?</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:35%;"><asp:CheckBox ID="EventOffCampus" runat="server" /></asp:TableCell>
                                            <asp:TableCell Style="width:15%;"><asp:Label runat="server">Location</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:32%;"><asp:TextBox class="form-control" runat="server" ID="EventLocation" MaxLength="50"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Date</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="EventDate" /></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server">Start Time</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="EventTime" MaxLength="10"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Attendance</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="EventAttendance" MaxLength="4"/></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server">Created By</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server" ID="createdby"></asp:Label></asp:TableCell>
                                        </asp:TableRow>                                   
                                    </asp:Table>
                                     <asp:Label ID="AttendValError" runat="server"></asp:Label>     
                                </div><!--- panel body --->
                            </div><!--- panel-primary --->
                        
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <asp:Label ID="FilesLabel" runat="server" Text="  Files (max 20MB file limit)"></asp:Label>
                                </div><!--- panel heading--->

                                <div class="panel-body">
                                    <div class="panel panel-blue">
                                        <div class="panel-heading">
                                            <asp:GridView ID="grdFiles" runat="server" AutoGenerateColumns="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c"  Width="100%">
                                                <Columns>
                                                    <asp:BoundField DataField="Filename" Headertext="Filename" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                    <asp:BoundField DataField="Description" Headertext="Description" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                    <asp:BoundField DataField="UploadedOn" Headertext="Uploaded On" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                
                                                    <asp:CommandField ButtonType="Link" HeaderText="" ShowHeader="False" SelectText="View" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c" ShowSelectButton="True" />
                                                </Columns>
                                            </asp:GridView>
                                        </div><!--- panel-heading --->
                                    </div><!--- panel-blue --->
                                    <asp:Button runat="server" class="btn btn-default" CommandName="Upload" Text="Upload" Visible="false"/>
                                </div> <!--- panel body --->
                            </div> <!--- panel primary--->
                            <br />
                            <asp:Button runat="server" ID="saveButton" class="btn btn-default" Text="Save Data & Continue" OnClick="saveButton_Click" />
                            <!--- ------------------------- Main Form -------------------------------------------------------------------------------------------------------------------------- --->
                        </div> <!--- col-xs-12 --->
                    </div> <!--- row --->
                </div> <!--- col-sm-6 blog-main --->

                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                         <div style="font-size:94%;">
                            <asp:Label runat="server">Please document the identified basic details of your event.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">In the description, please include logistical information that describes your event, its purpose, who your target audience is and anything else that would help Student Activities understand your event.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">You may upload files (budgets, task lists, flyers, etc.) that will help keep historical record for your organization.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">If you have any questions, please contact <a target="_blank" href="carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a>.</asp:Label>
                         </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div><!--- row --->
        </div><!--- container-fluid --->
    </asp:Panel>
</asp:Content>