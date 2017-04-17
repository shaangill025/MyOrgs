<%@ Page Title="Event Wizard - Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventWizard_Checklist.aspx.cs" Inherits="MyOrgs.EventWizard_Checklist" %>

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
                            </div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width:80%">
                                    <span>80%</span>
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
                                    <asp:Label ID="CommentLabel" runat="server" Text="  Checklist"></asp:Label>
                                </div>

                                <div class="panel-body">
                                    <div class="panel panel-blue">
                                        <div class="panel-body">
                                            <asp:CheckBox ID="location_reserved" class="form-control" runat="server" Text="  Has your org reserved the desired space for the event?" />
                                            <asp:Label ID="location_reminder" class="label-checklist" runat="server">Any room/space reservation should be reserved at least four weeks prior to event. To reserve spaces on campus or to see available options, visit the Carroll University Portal (<a target="_blank" href="https://my.carrollu.edu/ICS/Departments/Campus_Services/Reservations_and_Event_Services.jnz">Departments>Campus Services>Reservations and Events Services</a>) and follow the instructions. </asp:Label>
                                            <p></p>
                                            <asp:Label ID="reservation_reminder" class="label-checklist" runat="server">For any reservation needs, Astra is the source (<a target="_blank" href="https://astra.carrollu.edu" >astra.carrollu.edu</a>).</asp:Label>
                                            <p></p>
                                            <asp:Label ID="reservation_reminder2" class="label-checklist" runat="server">For any reservation and set up questions, contact events (<a target="_blank" href="mailto:events@carrollu.edu">events@carrollu.edu</a>). Late fees are assessed if reservation information is not submitted 96 hours prior to event.</asp:Label>
                                        </div><!--- panel-heading --->

                                        <div class="panel-body">
                                            <asp:CheckBox ID="marketing_materials" class="form-control" runat="server" Text="  Has your org emailed marketing materials to duplication?" />
                                            <asp:Label ID="marketing_reminder" class="label-checklist" runat="server">All publicity materials, fliers, posters, table tents, sidewalk chalking, etc., should be submitted and approved at least two weeks prior to event. Plan to have materials printed prior to approval. </asp:Label>
                                            <p></p>
                                            <asp:Label ID="duplication_reminder" class="label-checklist" runat="server"> To print materials, you can send marketing materials via email to <a target="_blank" href="mailto:duplication@carrollu.edu">duplication@carrollu.edu</a>. For approval, you can submit materials to Student Affairs (Kilgour).</asp:Label>
                                        </div>

                                        <div class="panel-body">
                                            <asp:CheckBox ID="catering" class="form-control" runat="server" Text="  Will Chartwells be catering?" />
                                            <asp:Label ID="catering_reminder" class="label-checklist" runat="server">Any catering requests must be made through Chartwells. Catering orders are due at least two weeks prior to event. For any catering needs/questions, contact Kevin Slowik (<a target="_blank" href="mailto:kslowik@carrollu.edu">kslowik@carrollu.edu</a>).</asp:Label>
                                        </div>

                                        <div class="panel-body">
                                            <asp:CheckBox ID="event_signup" class="form-control" runat="server" Text="  Does your event require an event sign-up form?" />
                                            <asp:Label ID="event_reminder" class="label-checklist" runat="server">If so, form must be signed by Jake Eisch and given to the Info Desk one week prior to event with sample flyer for event attached.</asp:Label>
                                        </div>

                                        <div class="panel-body">
                                            <asp:CheckBox ID="activity_waiver" class="form-control" runat="server" Text="  Does your event require an activity waiver?" />
                                            <asp:Label ID="activity_reminder" class="label-checklist" runat="server">If so, contact Student Activities for activity waiver.</asp:Label>
                                        </div>

                                        <div class="panel-body">
                                            <asp:CheckBox ID="cunight_event" class="form-control" runat="server" Text="  Is this a CU@Night event?" />
                                        </div>
                                    </div><!--- panel-blue --->
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
                            <asp:Label runat="server">This page is a checklist to make sure that your Organization has considered important factors prior to your event’s execution.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">Please look through all the noted tasks and check all that apply.</asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server">If you have any questions on the items in the list, please contact the identified contact or <a target="_blank" href="mailto:carrolluniversitysa@gmail.com">carrolluniversitysa@gmail.com</a></asp:Label>
                        </div>
         	        </div><!--- well --->
                </div><!--- col-xs-12 col-sm-3 --->
                <!--- ------------------------- Information Box -------------------------------------------------------------------------------------------------------------------------- --->
            </div> <!--- row --->
        </div><!--- container-fluid --->
    </asp:Panel>
</asp:Content>