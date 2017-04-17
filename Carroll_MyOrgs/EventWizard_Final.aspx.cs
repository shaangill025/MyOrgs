using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs  
{
    public partial class EventWizard_5 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int eventID = getSessionEvent();

                //the SP does an OR statement, so send in 0 as the orgID
                var Event = dbcontext.sp_GetOrgEvent(eventID, 0).First();
                if (Event != null)
                {
                    if (Event.Title == null)
                    {
                        title_label.Text = "";
                    }
                    else
                    {
                        title_label.Text = Event.Title.Trim();
                    }

                    if (Event.Description == null)
                    {
                        desc_label.Text = "";
                    }
                    else
                    {
                        desc_label.Text = Event.Description.Trim();
                    }

                    if (Event.OnOffCampus == true)
                    {
                        Offcampus_label.Text = "Yes";
                    }
                    else
                    {
                        Offcampus_label.Text = "No";
                    }

                    if (Event.Location == null)
                    {
                        loc_label.Text = "";
                    }
                    else
                    {
                        loc_label.Text = Event.Location.Trim();
                    }

                    if (Event.Date == null)
                    {
                        date_label.Text = "";
                    }
                    else
                    {
                        date_label.Text = Convert.ToDateTime(Event.Date).ToShortDateString();
                    }

                    if (Event.Time == null)
                    {
                        time_label.Text = "";
                    }
                    else
                    {
                        time_label.Text = Event.Time.Trim();
                    }

                    if (Event.Attendance == null)
                    {
                        attendance_label.Text = "";
                    }
                    else
                    {
                        attendance_label.Text = Event.Attendance.ToString();
                    }

                    if (Event.OrganizationWorkedWith == null)
                    {
                        partner_label.Text = "";
                    }
                    else
                    {
                        partner_label.Text = Event.OrganizationWorkedWith.Trim();
                    }

                    if (Event.ContactName == null)
                    {
                        name_label.Text = "";
                    }
                    else
                    {
                        name_label.Text = Event.ContactName.Trim();
                    }

                    if (Event.ContactEmail == null)
                    {
                        email_label.Text = "";
                    }
                    else
                    {
                        email_label.Text = Event.ContactEmail.Trim();
                    }

                    if (Event.ContactPhone == null)
                    {
                        phone_label.Text = "";
                    }
                    else
                    {
                        phone_label.Text = Event.ContactPhone.Trim();
                    }

                    if (Event.BusRental == null)
                    {
                        bus_label.Text = "";
                    }
                    else
                    {
                        bus_label.Text = Event.BusRental.ToString();
                    }

                    if (Event.VanRental == null)
                    {
                        van_label.Text = "";
                    }
                    else
                    {
                        van_label.Text = Event.VanRental.ToString();
                    }

                    if (Event.Driver1Name == null)
                    {
                        driver1_label.Text = "";
                    }
                    else
                    {
                        driver1_label.Text = Event.Driver1Name.Trim();
                    }

                    if (Event.Driver2Name == null)
                    {
                        driver2_label.Text = "";
                    }
                    else
                    {
                        driver2_label.Text = Event.Driver2Name.Trim();
                    }

                    if (Event.DollarsSpentByOrg == null)
                    {
                        orgcost_label.Text = "";
                    }
                    else
                    {
                        orgcost_label.Text = Event.DollarsSpentByOrg.ToString();
                    }

                    if (Event.DollarsSpentByPartner == null)
                    {
                        partner_label.Text = "";
                    }
                    else
                    {
                        partner_label.Text = Event.DollarsSpentByPartner.ToString();
                    }

                    if (Event.RoomReserved == true)
                    {
                        room_label.Text = "Yes";
                    }
                    else
                    {
                        room_label.Text = "No";
                    }
                    if (Event.Marketing == true)
                    {
                        marketing_label.Text = "Yes";
                    }
                    else
                    {
                        marketing_label.Text = "No";
                    }
                    if (Event.Catering == true)
                    {
                        catering_label.Text = "Yes";
                    }
                    else
                    {
                        catering_label.Text = "No";
                    }
                    if (Event.SignupForm == true)
                    {
                        event_label.Text = "Yes";
                    }
                    else
                    {
                        event_label.Text = "No";
                    }
                    if (Event.ActivityWaiver == true)
                    {
                        activity_label.Text = "Yes";
                    }
                    else
                    {
                        activity_label.Text = "No";
                    }
                    if (Event.CUNight == true)
                    {
                        cunight_label.Text = "Yes";
                    }
                    else
                    {
                        cunight_label.Text = "No";
                    }
                }

                loadComments(eventID);
            }
        }

        private void loadComments(int eventID)
        {
            grdComments.DataSource = dbcontext.sp_GetCommentsByEventID(eventID);
            grdComments.DataBind();
        }

        private int getSessionEvent()
        {
            return Session["event_id"] == null ? 0 : Int32.Parse(Session["event_id"].ToString());
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        private string getSessionOrgName()
        {
            //323 is the Chemistry Club, for debugging purposes
            string Name = Session["org_name"] == null ? "" : Session["org_name"].ToString();
            Name = Name.Replace("(", "");
            Name = Name.Replace(")", "");
            return Name.Trim();
        }

        private string getSessionEventMode()
        {
            string Mode = Session["event_mode"] == null ? "" : Session["event_mode"].ToString();
            return Mode;
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            //Look to see if this is a Greek Org or not.
            Boolean Greek = false;
            Greek = getGreekOrg();

            String OrgName = getSessionOrgName();

            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            if (Greek)
            {
                message.To.Add("greeklife@carrollu.edu");
            }
            else
            {
                message.To.Add("carrolluniversitysa@gmail.com");
            }

            string mode = getSessionEventMode();
            if (mode.Equals("Edit"))
            {
                message.Subject = OrgName + ": " + " Event Edited";
            }
            else
            {
                message.Subject = OrgName + ": " + " Event Created";
            }
            message.From = new System.Net.Mail.MailAddress("automated@myorgs.carrollu.edu");

            string event_title = title_label.Text.Trim();
            if (event_title == null || event_title.Equals(string.Empty))
            {
                event_title = "unnamed";
            }

            string event_date = date_label.Text.Trim();
            if (event_date == null || event_date.Equals(string.Empty))
            {
                event_date = "TBD";
            }

            if (mode.Equals("Edit"))
            {
                message.Body = "The " + OrgName + " has edited their <" + event_title + "> event, scheduled for " + event_date + ".";
            }
            else
            {
                message.Body = "The " + OrgName + " has created a new event (" + event_title + "), scheduled for " + event_date + ".";
            }

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("imail.carrollu.edu");
            try
            {
                smtp.UseDefaultCredentials = true;
                smtp.Send(message);
            }
            catch (Exception er)
            { }

            Response.Redirect("~/EventsMain.aspx");
        }

        private Boolean getGreekOrg()
        {
            Boolean Greek = false;
            int org_ID = Int32.Parse(getSessionOrg());

            var Org = dbcontext.sp_GetMyOrgs_OrgByID(org_ID);
            foreach (var x in Org)
            {
                if (x.GreekOrg == true)
                    Greek = true;
            }

            return Greek;
        }
    }
}