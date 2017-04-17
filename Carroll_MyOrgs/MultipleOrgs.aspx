<%@ Page Language="C#" Title="Multiple Boards" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MultipleOrgs.aspx.cs" Inherits="MyOrgs.MultipleOrgs" %>

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
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon-informational.png" /> <asp:Label ID="LoginLabel" runat="server" Text="  Multiple Organizations Detected"></asp:Label>
                            </div>

                            <div class="panel-body">
                                <div class="form-group">
                                    <asp:table runat="server" style="align-self=center" ID="multipleorgs" Width="738px">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="Explanation" runat="server" Text="You are registered as an Executive Board Member for more than one student organization."></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="Label1" runat="server" Text="For this session, please select which organization you would like to access."></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell> </asp:TableCell>
                                        </asp:TableRow>
        
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:RadioButtonList class="col-xs-12 col-sm-3 col-md-3 control-label" width="100%" clientidMode="Static" ID="multorg_list" runat="server" name="multorg_list" 
                                                    RepeatDirection="Vertical" RepeatLayout="Table">
                                                </asp:RadioButtonList>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:table>

                                    <br />
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <asp:Button clientidMode="Static" class="btn btn-default" ID="addButton" runat="server" Text="Continue" OnClick="continueButton_Click" CausesValidation="true" />
                                        </div>
                                    </div>
                                </div> <!--- panel body --->
                            </div> <!--- panel primary--->
                        </div> <!--- col xs-12 --->
                    </div> <!--- col-sm-9 blog-main --->
                </div>

                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                         <div style="font-size:94%;">
                            <asp:Label runat="server">Select the student org you would like to access. You may only work with one organization per login session.</asp:Label>
                         </div>
         	        </div>
                </div>
            </div><!--- row --->
        </div><!--- container --->
    </asp:Panel>
</asp:Content>