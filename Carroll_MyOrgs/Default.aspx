<%@ Page Title="Please Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyOrgs._Default" %>

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
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon-login.png" /> <asp:Label ID="LoginLabel" runat="server" Text="  Login"></asp:Label>
                            </div>

                            <div class="panel-body">
                                <div class="form-group">
                                    <asp:Label class="col-xs-12" id="ErrorLabel" runat="Server" ForeColor="Red" Visible="False" Font-Size="Small"/>

                                    <asp:Table runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label class="col-xs-12" runat="server" AssociatedControlID="UserName">Username</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="UserName" MaxLength="20" /></asp:TableCell><asp:TableCell><asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label class="col-xs-12" runat="server" AssociatedControlID="Password">Password</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox class="form-control" runat="server" ID="Password" TextMode="Password" MaxLength="20" /></asp:TableCell>
                                            <asp:TableCell><asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div><!--- form group --->
                                <br />
                                <div class="col-sm-offset-2 col-sm-10">
                                    <asp:Button runat="server" class="btn btn-default" CommandName="Login" Text="Log in" OnClick="Login_Click" />
                                </div>
                            </div> <!--- panel body --->
                        </div> <!--- panel primary--->
                    </div> <!--- col xs-12 --->
                </div> <!--- col-sm-9 blog-main --->

                <div class="col-xs-12 col-sm-3">
         	        <div class="well">
                        <h3>Information</h3>
                         <div style="font-size:94%;">
                            <asp:Label runat="server">Welcome! Log in to MyOrgs to input your roster, add your event/service project information, or upload org related documents.</asp:Label>
                             <br />
                             <br />
                            <asp:Label runat="server">If you do not have a login, please contact Student Activities at <a target="_blank" href="mailto:carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a>.</asp:Label>
                        </div>
         	        </div>
                </div>
            </div> <!--- row --->
        </div> <!--- container --->
    </asp:Panel>
</asp:Content>