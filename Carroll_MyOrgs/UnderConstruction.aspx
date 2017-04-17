<%@ Page Language="C#" Title="Page Under Construction" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnderConstruction.aspx.cs" Inherits="MyOrgs.UnderConstruction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Visible="true">
        <br />
        <br />
        <div class="container-fluid">
            <div class="col-sm-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Label ID="LoginLabel" runat="server" Text="  Under Construction"></asp:Label>
                    </div> <!--- panel-heading --->

                    

                </div> <!--- col-sm-9 --->
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-3">
         	        <div class="well">            
                        <h3>Information</h3>
                         <div style="font-size:94%;">
                            <p>This page is currently being designed and implemented. Check back later!</p>
                         </div>
         	        </div> <!--- well --->
                </div> <!--- col-xs-12 col-sm-3 --->
            </div> <!--- row --->
        </div> <!--- container --->
    </asp:Panel>
</asp:Content>