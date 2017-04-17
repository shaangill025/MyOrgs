using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ServiceProjectWizard_1 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int serviceID = getSessionService();

                if (serviceID == 0)
                {
                    //we are adding, if there is no serviceID supplied.
                    int org_ID = Int32.Parse(getSessionOrg());
                    string user = getSessionUser();
                    //create an empty template of an service project for them to fill out.
                    serviceID = dbcontext.sp_NewMyOrgsServiceProject(org_ID);

                    //remove the 0 value, and add in the new one
                    Session.Remove("service_id");
                    Session.Add("service_id", serviceID);

                    fillForm(serviceID);
                }
                else
                {
                    //we are editing an existing service project.
                    fillForm(serviceID);
                }
            }
        }

        private void fillForm(int serviceID)
        {
            //the SP does an OR statement, so send in 0 as the orgID
            var Service = dbcontext.sp_GetServiceProject(serviceID).First();
            if (Service != null)
            {
                if (Service.Title == null)
                {
                    ProjectTitle.Text = "";
                }
                else
                {
                    ProjectTitle.Text = Service.Title.Trim();
                }

                if (Service.Description == null)
                {
                    CommunityImpact.Text = "";
                }
                else
                {
                    CommunityImpact.Text = Service.Description.Trim();
                }

                if (Service.OnGoing == true)
                {
                    OngoingProject.Checked = true;
                }
                else
                {
                    OngoingProject.Checked = false;
                }

                if (Service.Location == null)
                {
                    ProjectLocation.Text = "";
                }
                else
                {
                    ProjectLocation.Text = Service.Location.Trim();
                }

                if (Service.StartDate == null)
                {
                    ProjectDate.Text = "";
                }
                else
                {
                    ProjectDate.Text = Convert.ToDateTime(Service.StartDate).ToShortDateString();
                }

                if (Service.TimeFrom == null)
                {
                    StartTime.Text = "";
                }
                else
                {
                    StartTime.Text = Service.TimeFrom.Trim();
                }

                if (Service.TimeTo == null)
                {
                    EndTime.Text = "";
                }
                else
                {
                    EndTime.Text = Service.TimeTo.Trim();
                }
            }
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        private int getSessionService()
        {
            return Session["service_id"] == null ? 0 : Int32.Parse(Session["service_id"].ToString());
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string title, desc, loc, date, stime, etime;
            bool ongoing;
            int serviceID = getSessionService();

            title = ProjectTitle.Text.Trim();
            if (title == null || title.Equals(string.Empty))
            {
                title = null;
            }
            desc = CommunityImpact.Text.Trim();
            if (desc == null || desc.Equals(string.Empty))
            {
                desc = null;
            }
            ongoing = OngoingProject.Checked;

            loc = ProjectLocation.Text.Trim();
            if (loc == null || loc.Equals(string.Empty))
            {
                loc = null;
            }

            date = ProjectDate.Text.Trim();
            if (date == null || date.Equals(string.Empty))
            {
                date = null;
            }

            stime = StartTime.Text.Trim();
            if (stime == null || stime.Equals(string.Empty))
            {
                stime = null;
            }

            etime = EndTime.Text.Trim();
            if (etime == null || etime.Equals(string.Empty))
            {
                etime = null;
            }

            dbcontext.sp_UpdateMyOrgServiceDetails(serviceID, title, desc, ongoing, loc, date, stime, etime);

            Response.Redirect("~/ServiceProjectWizard_Partner.aspx");
        }
    }
}