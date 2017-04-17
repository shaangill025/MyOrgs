<%@ Page Title="Event Wizard - Step 4" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventWizard_Comments.aspx.cs" Inherits="MyOrgs.EventWizard_4" %>

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
                            </div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width:60%">
                                    <span>60%</span>
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
                                    <asp:Label ID="CommentLabel" runat="server" Text="  Comments"></asp:Label>
                                </div>

                                <div class="panel-body">
                                    <div class="panel panel-blue">
                                        <div class="panel-heading">
                                            <asp:GridView ID="grdComments" runat="server" AutoGenerateColumns="False" Font-Bold="False" GridLines="None" BorderWidth="1px" BorderColor="#002b5c" OnRowDataBound="grdComments_RowDataBound" 
                                                OnRowEditing="grdComments_RowEditing" OnRowUpdating="grdComments_RowUpdating" OnRowCancelingEdit="grdComments_RowCancelingEdit" OnRowDeleting="grdComments_RowDeleting" DataKeyNames="EventComment_ID">
							                    <Columns>
                                                    <asp:BoundField DataField="ShortDate" ReadOnly="True" Headertext="Date" ItemStyle-Width="15%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                    <asp:TemplateField HeaderText="Comment" ItemStyle-Width="65%" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="CommentText" class="form-control" runat="server" Text='<%# Bind("Text") %>' MaxLength="150"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("Text") %>' ID="Label3"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="EventComment_ID" Headertext="" HeaderStyle-ForeColor="Snow" HeaderStyle-BackColor="#002b5c"/>
                                                    <asp:CommandField ShowEditButton="True" ItemStyle-Width="10%" HeaderStyle-BackColor="#002b5c" HeaderStyle-ForeColor="Snow"></asp:CommandField>
                                                    <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="10%" HeaderStyle-BackColor="#002b5c" HeaderStyle-ForeColor="Snow"></asp:CommandField>
                                                </Columns>
                                            </asp:GridView>
                                        </div><!--- panel-heading --->
                                    </div><!--- panel-blue --->
                                    <asp:Button runat="server" ID="AddNew" class="btn btn-default" CommandName="AddNew" Text="Add New Comment" OnClick="AddNew_Click"/>
                                </div> <!--- panel body --->

                            </div>
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
                            <asp:Label runat="server">If you have any additional details to provide, please enter here.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">This may include questions you have for Student Activities, items yet to be determined that you are currently working on, supplies or items you may need that you wish to inform Student Activities about, etc.</asp:Label>
                        </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div> <!--- row --->
        </div><!--- container-fluid --->
    </asp:Panel>
</asp:Content>