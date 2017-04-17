using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class EventWizard_3 : System.Web.UI.Page
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
                    if (Event.OrganizationWorkedWith == null)
                    {
                        OrgPartner.Text = "";
                    }
                    else
                    {
                        OrgPartner.Text = Event.OrganizationWorkedWith.Trim();
                    }
                    
                    if (Event.ContactName == null)
                    {
                        OrgContactName.Text = "";
                    }
                    else
                    {
                        OrgContactName.Text = Event.ContactName.Trim();
                    }
                    
                    if (Event.ContactEmail == null)
                    {
                        OrgContactEmail.Text = "";
                    }
                    else
                    {
                        OrgContactEmail.Text = Event.ContactEmail.Trim();
                    }

                    if (Event.ContactPhone == null)
                    {
                        OrgContactPhone.Text = "";
                    }
                    else
                    {
                        if (Event.ContactPhone.Trim().Equals(string.Empty))
                        {
                            OrgContactPhone.Text = "";
                        }
                        else
                        {
                            string ph_format, ph;

                            ph = Event.ContactPhone.Trim();
                            ph_format = String.Format("{0:(###) ###-####}", Convert.ToInt64(ph));
                            OrgContactPhone.Text = ph_format;
                        }
                    }
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

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string orgpartner, name, email, phone, ph;
            int eventID = getSessionEvent();

            orgpartner = OrgPartner.Text.Trim();
            if (orgpartner == null || orgpartner.Equals(string.Empty))
            {
                orgpartner = null;
            }

            name = OrgContactName.Text.Trim();
            if (name == null || name.Equals(string.Empty))
            {
                name = null;
            }

            email = OrgContactEmail.Text.Trim();
            if (email == null || email.Equals(string.Empty))
            {
                email = null;
            }

            phone = OrgContactPhone.Text.Trim();
            if (phone == null || phone.Equals(string.Empty))
            {
                ph = null;
            }
            else
            {
                //strip out the mask before saving
                ph = new string(phone.Where(char.IsDigit).ToArray());
            }

            dbcontext.sp_UpdateMyOrgEventPartner(eventID, orgpartner, name, email, ph, "0");

            Response.Redirect("~/EventWizard_Costs.aspx");
        }
    }
}