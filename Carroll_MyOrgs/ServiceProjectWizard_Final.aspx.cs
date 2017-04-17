using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ServiceProjectWizard_Final : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int serviceID = getSessionService();

                var Service = dbcontext.sp_GetServiceProject(serviceID).First();
                if (Service != null)
                {
                    if (Service.Title == null)
                    {
                        title_label.Text = "";
                    }
                    else
                    {
                        title_label.Text = Service.Title.Trim();
                    }

                    string desc = Service.Description.Trim();
                    if (desc == null)
                    {
                        comimpact_label.Text = "";
                    }
                    else
                    {
                        comimpact_label.Text = desc;
                    }

                    if (Service.OnGoing == true)
                    {
                        ongoing_label.Text = "True";
                    }
                    else
                    {
                        ongoing_label.Text = "False";
                    }

                    if (Service.StartDate == null)
                    {
                        date_label.Text = "";
                    }
                    else
                    {
                        date_label.Text = Convert.ToDateTime(Service.StartDate).ToShortDateString();
                    }

                    if (Service.TimeFrom == null)
                    {
                        stime_label.Text = "";
                    }
                    else
                    {
                        stime_label.Text = Service.TimeFrom.Trim();
                    }

                    if (Service.TimeTo == null)
                    {
                        etime_label.Text = "";
                    }
                    else
                    {
                        etime_label.Text = Service.TimeTo.Trim();
                    }
                    if (Service.Location == null)
                    {
                        loc_label.Text = "";
                    }
                    else
                    {
                        loc_label.Text = Service.Location.Trim();
                    }

                    if (Service.Title == null)
                    {
                        partner_label.Text = "";
                    }
                    else
                    {
                        partner_label.Text = Service.CommunityPartner.Trim();
                    }

                    if (Service.ContactName == null)
                    {
                        name_label.Text = "";
                    }
                    else
                    {
                        name_label.Text = Service.ContactName.Trim();
                    }

                    if (Service.ContactEmail == null)
                    {
                        email_label.Text = "";
                    }
                    else
                    {
                        email_label.Text = Service.ContactEmail.Trim();
                    }

                    string ph_format, ph;

                    if (Service.ContactPhone == null)
                    {
                        ph = "";
                    }
                    else
                    {
                        ph = Service.ContactPhone.Trim();
                    }
                    if (ph.Equals(string.Empty))
                    {
                        ph = null;
                        ph_format = "";
                    }
                    else
                    {
                        ph_format = String.Format("{0:(###) ###-####}", Convert.ToInt64(ph));
                    }
                    phone_label.Text = ph_format;

                    pvol_label.Text = Service.Planned_NoOfVolunteers.ToString();
                    phrs_label.Text = Service.Planned_HoursVolunteered.ToString();
                    pitems_label.Text = Service.Planned_Funds.Trim();
                    avol_label.Text = Service.NoOfVolunteers.ToString();
                    ahrs_label.Text = Service.HoursVolunteered.ToString();
                    aitems_label.Text = Service.Funds.Trim();
                }

                loadComments(serviceID);
            }
        }

        private void loadComments(int serviceID)
        {
            grdComments.DataSource = dbcontext.sp_GetCommentsByServiceProjectID(serviceID);
            grdComments.DataBind();
        }

        private int getSessionService()
        {
            return Session["service_id"] == null ? 0 : Int32.Parse(Session["service_id"].ToString());
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

        private string getSessionServiceMode()
        {
            string Mode = Session["service_mode"] == null ? "" : Session["service_mode"].ToString();
            return Mode;
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            String OrgName = getSessionOrgName();

            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            message.To.Add("piosvolunteer@gmail.com");

            string mode = getSessionServiceMode();
            if (mode.Equals("Edit"))
            {
                message.Subject = OrgName + ": " + " Service Project Edited";
            }
            else
            {
                message.Subject = OrgName + ": " + " Service Project Created";
            }
            message.From = new System.Net.Mail.MailAddress("automated@myorgs.carrollu.edu");

            string service_title = title_label.Text.Trim();
            if (service_title == null || service_title.Equals(string.Empty))
            {
                service_title = "unnamed";
            }

            string service_date = date_label.Text.Trim();
            if (service_date == null || service_date.Equals(string.Empty))
            {
                service_date = "TBD";
            }

            if (mode.Equals("Edit"))
            {
                message.Body = "The " + OrgName + " has edited their <" + service_title + "> service project, scheduled for " + service_date + ".";
            }
            else
            {
                message.Body = "The " + OrgName + " has created a new service project (" + service_title + "), scheduled for " + service_date + ".";
            }

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("imail.carrollu.edu");
            try
            {
                smtp.UseDefaultCredentials = true;
                smtp.Send(message);
            }
            catch (Exception er)
            { }

            Response.Redirect("~/ServiceProjectsMain.aspx");
        }
    }
}