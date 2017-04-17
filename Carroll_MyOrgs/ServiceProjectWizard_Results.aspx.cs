using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ServiceProjectWizard_3 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int serviceID = getSessionService();
                fillForm(serviceID);

                string mode = getSessionServiceMode();
                if (mode.Equals("Edit"))
                {
                    //hide the Add Panel.
                    Add_Panel.Visible = false;
                }
                else
                {
                    //hide the Edit Panel.
                    Edit_Panel.Visible = false;
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

        private string getSessionServiceMode()
        {
            string Mode = Session["service_mode"] == null ? "" : Session["service_mode"].ToString();
            return Mode;
        }

        private void fillForm(int serviceID)
        {
            //the SP does an OR statement, so send in 0 as the orgID
            var Service = dbcontext.sp_GetServiceProject(serviceID).First();
            if (Service != null)
            {
                if (Service.Planned_NoOfVolunteers == 0)
                {
                    p_volunteers.Text = "0";
                }
                else
                {
                    p_volunteers.Text = Service.Planned_NoOfVolunteers.ToString();
                }
                if (Service.Planned_HoursVolunteered == 0)
                {
                    p_hours.Text = "0";
                }
                else
                {
                    p_hours.Text = Service.Planned_HoursVolunteered.ToString();
                }

                if (Service.Planned_Funds == null)
                {
                    p_items.Text = "";
                }
                else
                {
                    p_items.Text = Service.Planned_Funds.Trim();
                }

                if (Service.NoOfVolunteers == 0)
                {
                    actual_volunteers.Text = "";
                }
                else
                {
                    actual_volunteers.Text = Service.NoOfVolunteers.ToString();
                }

                if (Service.HoursVolunteered == 0)
                {
                    actual_hours.Text = "";
                }
                else
                {
                    actual_hours.Text = Service.HoursVolunteered.ToString();
                }

                if (Service.Funds == null)
                {
                    actual_items.Text = "";
                }
                else
                {
                    actual_items.Text = Service.Funds.Trim();
                }
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            int pl_hours, pl_volunteers, a_hours, a_volunteers;
            string pl_items, a_items;

            string mode = getSessionServiceMode();
            int serviceID = getSessionService();

            if (mode.Equals("Edit"))
            {
                if (p_volunteers.Text.Trim().Equals(string.Empty))
                {
                    pl_volunteers = 0;
                }
                else
                {
                    pl_volunteers = Int32.Parse(p_volunteers.Text.Trim());
                }

                if (p_hours.Text.Trim().Equals(string.Empty))
                {
                    pl_hours = 0;
                }
                else
                {
                    pl_hours = Int32.Parse(p_hours.Text.Trim());
                }

                if (p_items.Text.Trim().Equals(string.Empty))
                {
                    pl_items = "";
                }
                else
                {
                    pl_items = p_items.Text.Trim();
                }

                if (actual_volunteers.Text.Trim().Equals(string.Empty))
                {
                    a_volunteers = 0;
                }
                else
                {
                    a_volunteers = Int32.Parse(actual_volunteers.Text.Trim());
                }

                if (actual_hours.Text.Trim().Equals(string.Empty))
                {
                    a_hours = 0;
                }
                else
                {
                    a_hours = Int32.Parse(actual_hours.Text.Trim());
                }

                if (actual_items.Text.Trim().Equals(string.Empty))
                {
                    a_items = "";
                }
                else
                {
                    a_items = actual_items.Text.Trim();
                }
            }
            else
            {
                if (planned_volunteers.Text.Trim().Equals(string.Empty))
                {
                    pl_volunteers = 0;
                }
                else
                {
                    pl_volunteers = Int32.Parse(planned_volunteers.Text.Trim());
                }

                if (planned_hours.Text.Trim().Equals(string.Empty))
                {
                    pl_hours = 0;
                }
                else
                {
                    pl_hours = Int32.Parse(planned_hours.Text.Trim());
                }

                if (planned_items.Text.Trim().Equals(string.Empty))
                {
                    pl_items = "";
                }
                else
                {
                    pl_items = planned_items.Text.Trim();
                }

                a_volunteers = 0;
                a_hours = 0;
                a_items = "";
            }

            if (pl_items == null || pl_items.Equals(string.Empty))
            {
                pl_items = "";
            }

            if (a_items == null || a_items.Equals(string.Empty))
            {
                a_items = "";
            }

            dbcontext.sp_UpdateMyOrgServiceResults(serviceID, pl_volunteers, pl_hours, pl_items, a_volunteers, a_hours, a_items);

            Response.Redirect("~/ServiceProjectWizard_Comments.aspx");
        }
    }
}