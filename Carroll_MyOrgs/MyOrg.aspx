<%@ Page Language="C#" Title="My Organization" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyOrg.aspx.cs" Inherits="MyOrgs.MyOrg" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid" >
            <div class="row">
                <div class="col-sm-9 blog-main">
                    <div class="col-xs-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon_org.png" /> <asp:Label ID="DetailsLabel" runat="server" Text="  Organization Details"></asp:Label>
                            </div>

                            <div class="panel-body">
                                <asp:Table style="align-self:center" BorderWidth="0" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell Style="width:20%;"><asp:Label runat="server">Name</asp:Label></asp:TableCell>
                                        <asp:TableCell Style="width:80%;"><asp:Label ID="OrganizationName" runat="server" Text=""></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label runat="server">Description</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Textbox id="OrgDescription" class="form-control" clientidMode="Static" runat="server" AutoPostBack="True" Rows="3" Height="100px" OnTextChanged="OrgDescription_TextChanged" TextMode="MultiLine" Width="700px"></asp:Textbox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label runat="server">Advisor</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="Advisor" runat="server" Text=""></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label runat="server">Project Code</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="ProjectCode" runat="server" Text=""></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label runat="server">O Account</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="OAccount" runat="server" Text=""></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div><!--- panel body --->
                        </div> <!--- panel-heading2 --->

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/icon_wrench.png" /><asp:Label ID="Label1" runat="server" Text="  Meetings"></asp:Label>
                            </div>
                            <div class="panel-body">
                                <asp:Table style="align-self:center" BorderColor="#002B5C" BorderWidth="0" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell Style="width:10%;"><asp:Label runat="server">Day</asp:Label></asp:TableCell>
                                        <asp:TableCell Style="width:20%;">
                                            <asp:DropDownList class="form-control" clientidMode="Static" ID="orgmeetingday_list" runat="server" RepeatDirection="Vertical" RepeatLayout="Table" AutoPostBack="true" OnTextChanged="orgmeetingday_list_TextChanged">
                                                <asp:ListItem Text="Select Meeting Day" Value="-1" />
                                                <asp:ListItem Text="Monday" Value="0" />
                                                <asp:ListItem Text="Tuesday" Value="1" />
                                                <asp:ListItem Text="Wednesday" Value="2" />
                                                <asp:ListItem Text="Thursday" Value="3" />
                                                <asp:ListItem Text="Friday" Value="4" />
                                                <asp:ListItem Text="Saturday" Value="5" />
                                                <asp:ListItem Text="Sunday" Value="6" />
                                            </asp:DropDownList>
                                        </asp:TableCell>
                                        <asp:TableCell Style="width:10%;"><asp:Label runat="server">Time</asp:Label></asp:TableCell>
                                        <asp:TableCell Style="width:20%;"><asp:TextBox class="form-control" clientidMode="Static" runat="server" ID="OrgMeetingTime" AutoPostBack="True" OnTextChanged="OrgMeetingTime_TextChanged" MaxLength="20" /></asp:TableCell>
                                        <asp:TableCell Style="width:10%;"><asp:Label runat="server">Frequency</asp:Label></asp:TableCell>
                                        <asp:TableCell Style="width:20%;">
                                            <asp:DropDownList class="form-control" clientidMode="Static" ID="OrgFrequency" runat="server" RepeatDirection="Vertical" RepeatLayout="Table" AutoPostBack="True" OnSelectedIndexChanged="OrgFrequency_SelectedIndexChanged">
                                                <asp:ListItem Text="Select Meeting Frequency" Value="-1" />
                                                <asp:ListItem Text="Weekly" Value="0" />
                                                <asp:ListItem Text="Every Other Week" Value="1" />
                                                <asp:ListItem Text="First Week of the month" Value="2" />
                                                <asp:ListItem Text="Second Week of the month" Value="3" />
                                                <asp:ListItem Text="Third Week of the month" Value="4" />
                                                <asp:ListItem Text="Fourth Week of the month" Value="5" />
                                                <asp:ListItem Text="Fifth Week of the month" Value="6" />
                                            </asp:DropDownList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label runat="server">Building</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:TextBox class="form-control" clientidMode="Static" runat="server" ID="OrgMeetingBldg" AutoPostBack="True" OnTextChanged="OrgMeetingBldg_TextChanged"/></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server">Room</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server"> </asp:Label><asp:TextBox class="form-control" clientidMode="Static" runat="server" ID="OrgMeetingRoom" AutoPostBack="True" OnTextChanged="OrgMeetingRoom_TextChanged"/></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server"> </asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div><!--- panel-heading --->

                        </div><!--- panel-primary --->

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icon_org_fileupload.png" /> <asp:Label ID="FilesLabel" runat="server" Text="  Files (max 20MB file limit)"></asp:Label>
                            </div>
                            <div class="panel-body">
                                <div class="panel panel-blue">
                                    <div class="panel-heading">
                                        <asp:GridView ID="grdFiles" runat="server" AutoGenerateColumns="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c"  Width="100%" OnRowDataBound="grdFiles_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="file_number" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                <asp:BoundField DataField="name_of_file" Headertext="Filename" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                <asp:BoundField DataField="description_of_file" Headertext="Description" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                <asp:BoundField DataField="upload_date" Headertext="Uploaded On" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                <asp:CommandField ButtonType="Link" HeaderText="" ShowHeader="False" SelectText="View" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c" ShowSelectButton="True" />
                                            </Columns>
                                        </asp:GridView>
                                    </div><!--- panel-heading --->
                                </div><!--- panel-blue --->
                                <!--- <input type="file" class="fileLoader" id="fileLoader" name="files"  title="Load File" /> --->
                                <asp:Button runat="server" class="btn btn-default" ID="Upload" CommandName="Upload" Text="Upload" Visible="false" OnClick="Upload_Click" MaxLength="250"/>
                            </div> <!--- panel body --->
                        </div> <!--- panel primary--->
                    </div> <!--- col xs-12 --->
                </div> <!--- col-sm-9 blog-main --->

                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">Use this page to update the basic details about your organization.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Note: Please ensure that your meeting time, location and frequency are up to date. This is important, should Student Activities make a referral to your meeting.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Has your advisor changed? Email Student Activities at <a target="_blank" href="mailto:carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a> to notify us of the advisor change.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Upload files (Word, Image, Excel, etc) with additional details about your org, as needed. Want to delete a file? Contact Student Activities.</asp:Label>
                            <br />
                            <asp:Label runat="server"><b>Suggested documents to upload:</b> Your Organization's constitution, an up to date roster, your budget, your Organization’s logo (if you have one) etc.</asp:Label>
                         </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
            </div><!--- row --->
        </div><!--- container --->
    </asp:Panel>
</asp:Content>