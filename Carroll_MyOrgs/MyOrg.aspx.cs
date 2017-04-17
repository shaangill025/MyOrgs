using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class MyOrg : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadForm();
            }
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        private void loadForm()
        {
            int orgid = Int32.Parse(getSessionOrg());
            string AdvisorName = string.Empty;

            var Org = dbcontext.sp_GetMyOrgs_OrgByID(orgid).First();
            if (Org != null)
            {
                if (Org.OrganizationName == null)
                {
                    OrganizationName.Text = "";
                }
                else
                {
                    OrganizationName.Text = Org.OrganizationName.Trim();
                }
                
                if (Org.Description == null)
                {
                    OrgDescription.Text = "";
                }
                else
                {
                    OrgDescription.Text = Org.Description.Trim();
                }
                
                if (Org.AdvisorName == null)
                {
                    Advisor.Text = "";
                }
                else
                {
                    Advisor.Text = Org.AdvisorName.Trim();
                }

                if (Org.ProjectCode == null)
                {
                    ProjectCode.Text = "";
                }
                else
                {
                    ProjectCode.Text = Org.ProjectCode.Trim();
                }

                if (Org.OAccount == null)
                {
                    OAccount.Text = "";
                }
                else
                {
                    OAccount.Text = Org.OAccount.Trim();
                }                

                string value = "-1";
                if (Org.MeetingDay == null)
                {
                    orgmeetingday_list.Items.FindByValue("-1").Selected = true;
                }
                else
                {
                    value = orgmeetingday_list.Items.FindByText(Org.MeetingDay).Value;
                    orgmeetingday_list.SelectedValue = value;
                }

                if (Org.MeetingTime == null)
                {
                    OrgMeetingTime.Text = "";
                }
                else
                {
                    OrgMeetingTime.Text = Org.MeetingTime.Trim();
                }

                string frequency = Org.MeetingFrequency;
                if (frequency == null)
                {
                    OrgFrequency.Items.FindByValue("-1").Selected = true;
                }
                else
                {
                    //value = OrgFrequency.Items.FindByText(frequency).Value;
                    OrgFrequency.SelectedValue = frequency;
                }

                if (Org.MeetingBuilding == null)
                {
                    OrgMeetingBldg.Text = "";
                }
                else
                {
                    OrgMeetingBldg.Text = Org.MeetingBuilding.Trim();
                }
                
                if (Org.MeetingRoom == null)
                {
                    OrgMeetingRoom.Text = "";
                }
                else
                {
                    OrgMeetingRoom.Text = Org.MeetingRoom.Trim();
                }

                loadFiles(orgid);
            }
        }

        private void loadFiles(int orgid)
        {
            grdFiles.DataSource = dbcontext.sp_GetOrgFiles(orgid);
            grdFiles.DataBind();
        }

        protected void OrgDescription_TextChanged(object sender, EventArgs e)
        {
            string empty = string.Empty;
            int orgid = Int32.Parse(getSessionOrg());

            string desc = OrgDescription.Text.Trim();

            dbcontext.sp_UpdateMyOrgs_Organization(orgid, "1", desc, empty, empty, empty, empty, empty);
        }

        protected void orgmeetingday_list_TextChanged(object sender, EventArgs e)
        {
             //we want to save data to the database when a change is made.
            string empty = string.Empty;
            int orgid = Int32.Parse(getSessionOrg());

            string day;
            if (orgmeetingday_list.SelectedValue.Equals("-1"))
            {
                day = null;
            }
            else
            {
                day = orgmeetingday_list.SelectedItem.Text;
            }

            dbcontext.sp_UpdateMyOrgs_Organization(orgid, "2", empty, day, empty, empty, empty, empty);
        }

        protected void OrgMeetingTime_TextChanged(object sender, EventArgs e)
        {
            string empty = string.Empty;
            int orgid = Int32.Parse(getSessionOrg());

            string time = OrgMeetingTime.Text.Trim();

            dbcontext.sp_UpdateMyOrgs_Organization(orgid, "3", empty, empty, time, empty, empty, empty);
        }

        protected void OrgFrequency_SelectedIndexChanged(object sender, EventArgs e)
        {
            //we want to save data to the database when a change is made.
            string empty = string.Empty;
            int orgid = Int32.Parse(getSessionOrg());

            string freq;
            if (OrgFrequency.SelectedValue.Equals("-1"))
            {
                freq = null;
            }
            else
            {
                freq = OrgFrequency.SelectedItem.Text;
            }

            dbcontext.sp_UpdateMyOrgs_Organization(orgid, "4", empty, empty, empty, freq, empty, empty);
        }

        protected void OrgMeetingBldg_TextChanged(object sender, System.EventArgs e)
        {
            //we want to save data to the database when a change is made.
            string empty = string.Empty;
            int orgid = Int32.Parse(getSessionOrg());

            string bldg = OrgMeetingBldg.Text.Trim();

            dbcontext.sp_UpdateMyOrgs_Organization(orgid, "5", empty, empty, empty, empty, bldg, empty);
        }

        protected void OrgMeetingRoom_TextChanged(object sender, System.EventArgs e)
        {
            //we want to save data to the database when a change is made.
            string empty = string.Empty;
            int orgid = Int32.Parse(getSessionOrg());

            string room = OrgMeetingRoom.Text.Trim();

            dbcontext.sp_UpdateMyOrgs_Organization(orgid, "6", empty, empty, empty, empty, empty, room);
        }

        protected void grdFiles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell0 (file_number), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[0].Visible = false;
        }

        private byte[] StreamFile(string fileName)
        {
            // Open file
            FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);

            // ByteArray
            byte[] ImageData = new byte[fs.Length];

            // Read block of bytes
            fs.Read(ImageData, 0, System.Convert.ToInt32(fs.Length));

            // Close it
            fs.Close();

            // Return the byte data
            return ImageData;
        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            string usr = getSessionUser();
            int orgid = Int32.Parse(getSessionOrg());

            // Process input if the user clicked OK.
            if (true)
            {
                string filename = "";
                byte[] bytes = StreamFile(filename);

                if (bytes != null)
                {
                    dbcontext.sp_NewOrgFile(orgid, filename, usr, bytes);
                }
            }
        }
    }
}