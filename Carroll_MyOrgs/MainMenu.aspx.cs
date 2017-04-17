using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string getSessionUser()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        protected void MyOrgs_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MyOrg.aspx");
        }

        protected void Roster_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/CurrentRoster.aspx");
        }

        protected void Reports_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Reports.aspx");
        }

        protected void Events_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/EventsMain.aspx");
        }

        protected void ServiceProjs_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ServiceProjectsMain.aspx");
        }

        protected void ChangePwd_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ChangePassword.aspx");
        }
    }
}