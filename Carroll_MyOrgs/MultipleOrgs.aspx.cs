using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyOrgs.Data_Access;

namespace MyOrgs
{
    public partial class MultipleOrgs : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*get the user that we are currently working with from the Session variables*/
                string user = getSessionUser();

                /*load the various Org values that the current user has access to into a control for them to select a choice from.*/

                multorg_list.DataSource = dbcontext.sp_GetUserOrgsByID(user);
                multorg_list.DataTextField = "OrganizationName";
                multorg_list.DataValueField = "Organization_ID";
                multorg_list.DataBind();
            }
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        protected void continueButton_Click(object sender, EventArgs e)
        {
            /*access the selected choice from the list.*/
            string org = this.multorg_list.SelectedValue;
            string org_display = " (" + this.multorg_list.SelectedItem + ")";

            /*as long as a choice was made, set the appropriate Session variable and move on.*/
            if (org != "" && org != null)
            {
                Session.Add("org_id", org);
                Session.Add("org_name", org_display);

                Response.Redirect("~/MainMenu.aspx");
            }
        }
    }
}