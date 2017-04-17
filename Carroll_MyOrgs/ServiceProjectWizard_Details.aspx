<%@ Page Title="Service Project Wizard - Step 1" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceProjectWizard_Details.aspx.cs" Inherits="MyOrgs.ServiceProjectWizard_1" %>

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
                                    <asp:Label ID="DetailsLabel" runat="server" Text="  Service Project Details"></asp:Label>
                                </div> <!--- panel heading --->

                                <div class="panel-body">
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            
                                            <asp:TableCell Style="width:15%;"><asp:Label runat="server">Title</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:85%;"><asp:TextBox class="form-control" runat="server" ID="ProjectTitle" Width="450px" MaxLength="150"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Community Impact</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox ID="CommunityImpact" class="form-control" clientidMode="Static" runat="server" AutoPostBack="True" 
                                                    Rows="3" Height="100px" TextMode="MultiLine" Width="450px"></asp:TextBox></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>

                                    <br />
                                    <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Style="width:16%;"><asp:Label runat="server">Recurring?</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:35%;"><asp:CheckBox ID="OngoingProject" runat="server" /></asp:TableCell>
                                            <asp:TableCell Style="width:14%;"><asp:Label runat="server">Location</asp:Label></asp:TableCell>
                                            <asp:TableCell Style="width:35%;"><asp:TextBox class="form-control" runat="server" ID="ProjectLocation" MaxLength="50"/></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Date</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="ProjectDate" /></asp:TableCell>
                                            <asp:TableCell></asp:TableCell>
                                            <asp:TableCell></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server">Start Time</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="StartTime" MaxLength="10"/></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server">End Time</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="EndTime" MaxLength="10" /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
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
                            <asp:Label runat="server">Please document the identified basic details of your Service Project.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">In the description, please include logistical information that describes your project, its purpose, who your target audience is and anything else that would help Student Activities understand your project.</asp:Label>
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