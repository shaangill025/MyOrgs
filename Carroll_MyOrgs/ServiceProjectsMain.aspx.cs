using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ServiceProjects : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDefaultEventList();
            }
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        private void loadDefaultEventList()
        {
            string orgID = getSessionOrg();

            grdServiceList.DataSource = dbcontext.sp_GetMyOrgsServiceList(orgID, "N");
            grdServiceList.DataBind();
        }

        protected void grdServiceList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string CommandName = e.CommandName;
            if (CommandName.CompareTo("EditService") == 0)
            {
                Object commandarg = e.CommandArgument;
                var Obj = grdServiceList.DataKeys[Convert.ToInt32(commandarg)];
                string eventID = Obj.Value.ToString();

                Session.Add("service_id", eventID);
                Session.Add("service_mode", "Edit");
                Response.Redirect("~/ServiceProjectWizard_Details.aspx");
            }
        }

        protected void grdServiceList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell6 (Event_id), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[6].Visible = false;
        }

        protected void InclPast_Click(object sender, EventArgs e)
        {
            InclPast.Visible = false;
            ShowCurrent.Visible = true;

            string orgID = getSessionOrg();

            grdServiceList.DataSource = dbcontext.sp_GetMyOrgsServiceList(orgID, "Y");
            grdServiceList.DataBind();
        }

        protected void ShowCurrent_Click(object sender, EventArgs e)
        {
            InclPast.Visible = true;
            ShowCurrent.Visible = false;

            loadDefaultEventList();
        }

        protected void AddServiceProject_Click(object sender, EventArgs e)
        {
            Session.Add("service_id", 0);
            Session.Add("service_mode", "Add");

            Response.Redirect("~/ServiceProjectWizard_Details.aspx");
        }
    }
}