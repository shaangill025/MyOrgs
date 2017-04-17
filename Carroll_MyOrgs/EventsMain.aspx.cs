using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class Events : System.Web.UI.Page
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

            grdEventList.DataSource = dbcontext.sp_GetMyOrgsEventList(orgID,"N");
            grdEventList.DataBind();
        }

        protected void grdEventList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell4 (Event_id), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[5].Visible = false;

            //hide the Edit button, if this is a Greek Org. 
            Boolean Greek = false;
            Greek = getGreekOrg();

            if (Greek)
            {
                e.Row.Cells[6].Visible = false;
            }
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

        protected void AddEvent_Click(object sender, EventArgs e)
        {
            Boolean Greek = false;
            Greek = getGreekOrg();

            if (Greek)
            {
                //for now, link off to a different Greek form, in a new window. 
                //This is because they need additional fields that we didn't anticipate adding at the time that this site was created.
                string pageurl="https://carrollu.co1.qualtrics.com/SE/?SID=SV_6f0ebpHOhAWoWk5";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('"+pageurl+"','_blank');", true);
            }
            else
            {
                Session.Add("event_id", 0);
                Session.Add("event_mode", "Add");
                Response.Redirect("~/EventWizard_Details.aspx");
            }
        }

        protected void InclPast_Click(object sender, EventArgs e)
        {
            InclPast.Visible = false;
            ShowCurrent.Visible = true;

            string orgID = getSessionOrg();

            grdEventList.DataSource = dbcontext.sp_GetMyOrgsEventList(orgID, "Y");
            grdEventList.DataBind();
        }

        protected void ShowCurrent_Click(object sender, EventArgs e)
        {
            InclPast.Visible = true;
            ShowCurrent.Visible = false;

            loadDefaultEventList();
        }

        protected void grdEventList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string CommandName = e.CommandName;
            if (CommandName.CompareTo("EditEvent") == 0)
            {
                Object commandarg = e.CommandArgument;
                var Obj = grdEventList.DataKeys[Convert.ToInt32(commandarg)];
                string eventID = Obj.Value.ToString();

                Session.Add("event_id", eventID);
                Session.Add("event_mode", "Edit");
                Response.Redirect("~/EventWizard_Details.aspx");
            }
        }
    }
}