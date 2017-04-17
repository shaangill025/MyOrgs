<%@ Page Language="C#" Title="Current Roster" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CurrentRoster.aspx.cs" Inherits="MyOrgs.CurrentRoster" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid">
            <div class="col-sm-9">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon_student_search.png"/> <asp:Label ID="Label1" runat="server" style="font-weight:bold;" Text="Search for a Student"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="panel panel-blue">
                            <div class="panel-heading">
                                <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell Style="width:10%;"><asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></asp:TableCell>
                                        <asp:TableCell Style="width:30%;"><asp:TextBox class="form-control" runat="server" ID="FName" MaxLength="20" /></asp:TableCell><asp:TableCell Style="width:10%;"><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></asp:TableCell><asp:TableCell Style="width:30%;"><asp:TextBox class="form-control" runat="server" ID="LName" MaxLength="20" /></asp:TableCell><asp:TableCell><asp:Label runat="server"></asp:Label></asp:TableCell><asp:TableCell Style="width:20%;"><asp:Button runat="server" class="btn btn-default" CommandName="Search" Text="Search" ID="btnSearch" OnClick="btnSearch_Click" /></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell columnspan="5" ><asp:Label ID="NameSearchError" runat="server" ForeColor="Red" Visible="true"></asp:Label></asp:TableCell></asp:TableRow></asp:Table><br /><asp:GridView ID="grdSearchStudents" runat="server" AutoGenerateColumns="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c"  OnRowDataBound="grdSearchStudents_RowDataBound" onselectedindexchanged="grdSearchStudents_SelectedIndexChanged" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" Headertext="First Name" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                        <asp:BoundField DataField="LastName" Headertext="Last Name" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                        <asp:BoundField DataField="Email" Headertext="Email" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                        <asp:BoundField DataField="Carroll_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                        <asp:BoundField DataField="Student_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                        <asp:CommandField ButtonType="Link" HeaderText="" ShowHeader="False" DeleteText="Select" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div><!--- panel-heading --->
                        </div><!--- panel-blue --->
                    </div> <!--- panel body --->
                </div> <!--- panel primary--->

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icon_student_roster.png" /> <asp:Label ID="TermLabel" runat="server" style="font-weight:bold;" Text="FALL 2016 Roster"></asp:Label></div><!--- panel-heading ---><div class="panel panel-blue">
                        <div class="panel-heading">
                            <asp:Button runat="server" ID="emlButton" class="btn btn-default" CommandName="EmlRoster" Text="Roster Complete!" OnClick="emlButton_Click" UseSubmitBehavior="false"/>
                            <br /><p><asp:Label ID="emsg" runat="server" Text="" ClientIDMode="Static" CssClass="red-text"></asp:Label></p><br /><asp:GridView ID="grdMember" runat="server" AutoGenerateColumns="False" Width="85%" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c" OnRowDataBound="grdMember_RowDataBound" OnRowDeleting="grdMember_RowDeleting">
							    <Columns>
                                    <asp:BoundField DataField="FirstName" Headertext="First Name" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="LastName" Headertext="Last Name" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="MemberName" Headertext="Member Type" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="sort_order" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:BoundField DataField="Student_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                    <asp:CommandField ButtonType="Link" HeaderText="" ShowDeleteButton="True" ShowHeader="False" DeleteText="Remove" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                </Columns>
                            </asp:GridView>
                            
                        </div> <!--- panel heading --->
                    </div> <!--- panel blue --->
                </div> <!--- panel-primary --->
            </div> <!--- col-sm-9 --->

            <div class="row">
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">
                        <h3>Information</h3><div style="font-size:94%;">
                            <asp:Label runat="server">Upload your Organization’s most current roster. The roster should include current students that are <b>active</b> members of the organization (reference your constitution for definition of <i>active</i>).</asp:Label><br /><br /><asp:Label runat="server">Add or remove students as necessary to reflect current membership. When complete, submit your roster to Student Activities by clicking on the “Roster Complete!” button.</asp:Label><br /><br /><asp:Label runat="server">Need to update executive board members? Email Student Activities at <a target="_blank" href="mailto:carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a>.</asp:Label></div></div><!--- well ---></div><!--- col-xs-12 col-sm-3 ---></div><!--- row ---></div><!--- container ---></asp:Panel></asp:Content>