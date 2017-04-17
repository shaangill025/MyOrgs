using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ServiceProjectWizard_2 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int serviceID = getSessionService();

                //the SP does an OR statement, so send in 0 as the orgID
                var Service = dbcontext.sp_GetServiceProject(serviceID).First();
                if (Service != null)
                {
                    if (Service.CommunityPartner == null)
                    {
                        CommPartner.Text = "";
                    }
                    else
                    {
                        CommPartner.Text = Service.CommunityPartner.Trim();
                    }

                    if (Service.ContactName == null)
                    {
                        ContactName.Text = "";
                    }
                    else
                    {
                        ContactName.Text = Service.ContactName.Trim();
                    }

                    if (Service.ContactEmail == null)
                    {
                        ContactEmail.Text = "";
                    }
                    else
                    {
                        ContactEmail.Text = Service.ContactEmail.Trim();
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
                        ph_format = "";
                    }
                    else
                    {
                        ph_format = String.Format("{0:(###) ###-####}", Convert.ToInt64(ph));
                    }
                    ContactPhone.Text = ph_format;
                }
            }
        }

        private int getSessionService()
        {
            return Session["service_id"] == null ? 0 : Int32.Parse(Session["service_id"].ToString());
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string commpartner, name, email, phone, ph;
            int serviceID = getSessionService();

            commpartner = CommPartner.Text.Trim();
            if (commpartner == null || commpartner.Equals(string.Empty))
            {
                commpartner = null;
            }
            name = ContactName.Text.Trim();
            if (name == null || name.Equals(string.Empty))
            {
                name = null;
            }
            email = ContactEmail.Text.Trim();
            if (email == null || email.Equals(string.Empty))
            {
                email = null;
            }
            phone = ContactPhone.Text.Trim();
            if (phone == null || phone.Equals(string.Empty))
            {
                ph = null;
            }
            else
            {
                //strip out the mask before saving
                ph = new string(phone.Where(char.IsDigit).ToArray());
            }

            dbcontext.sp_UpdateMyOrgServicePartner(serviceID, commpartner, name, email, ph);

            Response.Redirect("~/ServiceProjectWizard_Results.aspx");
        }
    }
}