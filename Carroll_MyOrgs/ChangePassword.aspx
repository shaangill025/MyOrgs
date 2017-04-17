<%@ Page Language="C#" Title="Change Password" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MyOrgs.ChangePassword" %>

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
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon-save.png" /> <asp:Label ID="LoginLabel" runat="server" Text="  Change Password"></asp:Label>
                            </div>

                            <div class="panel-body">
                                <asp:Table style="align-self:center" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label class="label-checklist" runat="server">First name</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="fname" class="label-checklist" runat="server"></asp:Label></asp:TableCell>
                                     </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label class="label-checklist" runat="server">Last name</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="lname" class="label-checklist" runat="server"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label class="label-checklist" runat="server">Email</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="email" class="label-checklist" runat="server"></asp:Label></asp:TableCell>
                                     </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><asp:Label class="label-checklist" runat="server">Phone</asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label ID="phone" class="label-checklist" runat="server"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>

                            <div class="panel-body">
                                <div class="form-group">
                                    <asp:Table style="align-self:center" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell columnspan="3" ><asp:Label ID="PwdError" runat="server" ForeColor="Red" Visible="true"></asp:Label></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server" AssociatedControlID="CurrentPassword">Current Password</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox runat="server" class="form-control" ID="CurrentPassword" MaxLength="20" TextMode="Password"/></asp:TableCell>
                                            <asp:TableCell><asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword" CssClass="field-validation-error" ErrorMessage="Your current password is required." /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server" AssociatedControlID="NewPassword">New Password</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox runat="server" class="form-control" ID="NewPassword" MaxLength="20" TextMode="Password"/></asp:TableCell>
                                            <asp:TableCell><asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword" CssClass="field-validation-error" ErrorMessage="A new password is required." /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><asp:Label runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password</asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:TextBox runat="server" class="form-control" ID="ConfirmNewPassword" MaxLength="20" TextMode="Password"/></asp:TableCell>
                                            <asp:TableCell><asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword" CssClass="field-validation-error" ErrorMessage="You must confirm your new password." /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                    <br />
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <asp:Button runat="server" ID="save" class="btn btn-default" CommandName="Save" Text="Save" OnClick="save_Click"/><asp:Button runat="server" ID="cancel" class="btn btn-default" CommandName="Cancel" Text="Cancel" OnClick="cancel_Click" CausesValidation="false"/>
                                    </div>
                                </div> <!--- form-group --->
                            </div> <!--- panel body --->
                        </div> <!--- panel primary--->
                    </div> <!--- col xs-12 --->
                </div> <!--- col-sm-9 blog-main --->

                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                        <div style="font-size:94%;">
                            <asp:Label runat="server">Use this page to update your MyOrgs password. Be sure to make it at least 6 characters long and use a number, letter, and symbol. Remember to securely document your information for future access.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Need to change your email address or phone number? Email Student Activities at <a target="_blank" href="mailto:carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a>.</asp:Label>
                        </div>
                    </div>
                </div>
            </div><!--- row --->
        </div><!--- container --->
    </asp:Panel>
</asp:Content>