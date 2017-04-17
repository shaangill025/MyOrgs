using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MyOrgs
{
    public partial class Reports : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                RetrieveRoster("**");
            }
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        protected void cl_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cl_filter = "**"; 

            if (cl_list.SelectedIndex != -1)
            {
                cl_filter = cl_list.SelectedValue;
            }

            RetrieveRoster(cl_filter);
        }

        protected void btnExport_OnClick(object sender, EventArgs e)
        {
            string cl_filter = "**";

            if (cl_list.SelectedIndex != -1)
            {
                cl_filter = cl_list.SelectedValue;
            }
            string orgID = getSessionOrg();

            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Term");
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("MemberType");
            dtTemp.Columns.Add("FirstName");
            dtTemp.Columns.Add("LastName");
            dtTemp.Columns.Add("Classification");

            DataRow drAddItem;
            var query = dbcontext.sp_GetMyOrgsReportRoster(orgID, cl_filter);
            int i = 0;

            foreach (var r in query)
            {
                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.Term.Trim();
                drAddItem[1] = r.OrganizationName;
                drAddItem[2] = r.MemberName;
                drAddItem[3] = r.FirstName;
                drAddItem[4] = r.LastName;
                drAddItem[5] = r.classification;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }

            //Don't create an export file if there weren't any records to export.
            if (i >= 1)
            {
                Data_Access.ExportHelper.ExportToExcel(dtTemp, "RosterExport");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("There is nothing to export.");
            }
        }

        protected void RetrieveRoster(string cl_filter)
        {
            string orgID = getSessionOrg();

            grdMember.DataSource = dbcontext.sp_GetMyOrgsReportRoster(orgID, cl_filter);
            grdMember.DataBind();
        }
    }
}