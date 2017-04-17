using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace MyOrgs
{
    public partial class EventWizard_1 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int eventID = getSessionEvent();

                if (eventID == 0)
                {
                    //we are adding, if there is no eventID supplied.
                    int org_ID = Int32.Parse(getSessionOrg());
                    string user = getSessionUser();
                    //create an empty template of an event for them to fill out.
                    eventID = dbcontext.sp_NewMyOrgsEvent(org_ID, user);

                    //remove the 0 value, and add in the new one
                    Session.Remove("event_id");
                    Session.Add("event_id", eventID);

                    fillForm(eventID);
                }
                else
                {
                    //we are editing an existing event.
                    fillForm(eventID);
                }
            }
        }

        private void fillForm(int eventID)
        {
            //the SP does an OR statement, so send in 0 as the orgID
            var Event = dbcontext.sp_GetOrgEvent(eventID, 0).First();
            if (Event != null)
            {
                if (Event.Title == null)
                {
                    EventTitle.Text = "";
                }
                else
                {
                    EventTitle.Text = Event.Title.Trim();
                }
                
                if (Event.Description == null)
                {
                    EventDescription.Text = "";
                }
                else
                {
                    EventDescription.Text = Event.Description.Trim();
                }                

                if (Event.OnOffCampus == true)
                {
                    EventOffCampus.Checked = true;
                }
                else
                {
                    EventOffCampus.Checked = false;
                }

                if (Event.Location == null)
                {
                    EventLocation.Text = "";
                }
                else
                {
                    EventLocation.Text = Event.Location.Trim();
                }
                
                if (Event.Date == null)
                {
                    EventDate.Text = "";
                }
                else
                {
                    EventDate.Text = Convert.ToDateTime(Event.Date).ToShortDateString();
                }
                
                if (Event.Time == null)
                {
                    EventTime.Text = "";
                }
                else
                {
                    EventTime.Text = Event.Time.Trim();
                }
                
                if (Event.Attendance == null)
                {
                    EventAttendance.Text = "";
                }
                else if (Event.Attendance.ToString().Equals("-1"))
                {
                    EventAttendance.Text = "N/A";
                }
                else
                {
                    EventAttendance.Text = Event.Attendance.ToString();
                }
                
                if (Event.CreatedByUser == null)
                {
                    createdby.Text = "";
                }
                else
                {
                    createdby.Text = Event.CreatedByUser.Trim();
                }
            }
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        private int getSessionEvent()
        {
            return Session["event_id"] == null ? 0 : Int32.Parse(Session["event_id"].ToString());
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        private Boolean validateAttendance(String attend)
        {
            Regex regex = new Regex("^[0-9]+$");
            Match match = regex.Match(attend);
            if (match.Success||(attend.Equals("N/A")))
            {
                return true;
            }
            else return false;
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string title, desc, loc, date, time, attend;
            bool onoffcampus;
            int eventID = getSessionEvent();

            title = EventTitle.Text.Trim();
            if (title == null || title.Equals(string.Empty))
            {
                title = null;
            }

            desc = EventDescription.Text.Trim();
            if (desc == null || desc.Equals(string.Empty))
            {
                desc = null;
            }

            onoffcampus = EventOffCampus.Checked;

            loc = EventLocation.Text.Trim();
            if (loc == null || loc.Equals(string.Empty))
            {
                loc = null;
            }

            date = EventDate.Text.Trim();
            if (date == null || date.Equals(string.Empty))
            {
                date = null;
            }

            time = EventTime.Text.Trim();
            if (time == null || time.Equals(string.Empty))
            {
                time = null;
            }

            attend = EventAttendance.Text.Trim();

            if (attend == null || attend.Equals(string.Empty))
            {
                attend = null;
                
            }
            else if (attend.Equals("N/A"))
            {
                attend = "-1";
            }

            if (validateAttendance(EventAttendance.Text))
            {
                AttendValError.Visible = false;
                dbcontext.sp_UpdateMyOrgEventDetails(eventID, title, desc, onoffcampus, loc, date, time, attend);
                Response.Redirect("~/EventWizard_Partner.aspx");
            }
            else
            {
                AttendValError.Text = "Input Error! Use only numeric or N/A as input";
                AttendValError.Visible = true;
            }
        }
    }
}