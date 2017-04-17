using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace MyOrgs
{
    public partial class EventWizard_2 : System.Web.UI.Page
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

                    if (Event.BusRental == null)
                    {
                        NumBuses.Text = "";
                    }
                    else
                    {
                        NumBuses.Text = Event.BusRental.ToString();
                    }

                    if (Event.VanRental == null)
                    {
                        NumVans.Text = "";
                    }
                    else
                    {
                        NumVans.Text = Event.VanRental.ToString();
                    }

                    if (Event.DollarsSpentByOrg == null)
                    {
                        OrgCost.Text = "";
                    }
                    else
                    {
                        OrgCost.Text = Event.DollarsSpentByOrg.ToString();
                    }

                    if (Event.DollarsSpentByPartner == null)
                    {
                        PartnerCost.Text = "";
                    }
                    else
                    {
                        PartnerCost.Text = Event.DollarsSpentByPartner.ToString();
                    }
                }

                student_drivers_list.DataSource = dbcontext.sp_GetDrivers();
                student_drivers_list.DataTextField = "Name";
                student_drivers_list.DataValueField = "Student_ID";
                student_drivers_list.DataBind();

                //add in the All Drivers option to the list
                ListItem select = new ListItem("All Drivers", "-1");
                student_drivers_list.Items.Add(select);
                student_drivers_list.SelectedValue = "-1";

                loadDrivers(eventID);
            }
        }

        private void loadDrivers(int eventID)
        {
            grdDriverList.DataSource = dbcontext.sp_GetEventDrivers_byEvent(eventID);
            grdDriverList.DataBind();
        }

        private int getSessionEvent()
        {
            return Session["event_id"] == null ? 0 : Int32.Parse(Session["event_id"].ToString());
        }

        protected void student_drivers_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            DriverError.Visible = false;
            DriverError.Text = "";
        }

        protected void AddDriver_Click(object sender, EventArgs e)
        {
            int eventID = getSessionEvent();
            int rowcount = grdDriverList.Rows.Count;

            DriverError.Visible = false;
            DriverError.Text = "";

            if (rowcount < 2)
            {
                string driver = student_drivers_list.SelectedValue;
                int driverID = Int32.Parse(driver);

                if (driverID == -1)
                {
                    return;
                }
                
                dbcontext.sp_UpdateMyOrgEventDriver(eventID, driverID, "A");
                loadDrivers(eventID);
            }
            else
            {
                DriverError.Visible = true;
                DriverError.Text = "There is a max driver limit of 2.";
            }
        }

        protected void grdDriverList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell4 (student_id), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[4].Visible = false;
        }

        protected void grdDriverList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DriverError.Visible = false;
            DriverError.Text = "";

            string CommandName = e.CommandName;
            if (CommandName.CompareTo("RemoveDriver") == 0)
            {
                Object commandarg = e.CommandArgument;
                var Obj = grdDriverList.DataKeys[Convert.ToInt32(commandarg)];
                string student_ID = Obj.Value.ToString();
                int driverID = Int32.Parse(student_ID);
                int eventID = getSessionEvent();

                dbcontext.sp_UpdateMyOrgEventDriver(eventID, driverID, "D");
                loadDrivers(eventID);
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string buses, vans, orgcost, partnercost, tempOrgCost, tempPartnercost;
            int eventID = getSessionEvent();

            buses = NumBuses.Text.Trim();
            vans = NumVans.Text.Trim();
            tempOrgCost = OrgCost.Text.Trim();
            tempPartnercost = PartnerCost.Text.Trim();
            Regex reg = new Regex(@"[^\d]");
            orgcost = reg.Replace(tempOrgCost,String.Empty);
            partnercost = reg.Replace(tempPartnercost, String.Empty);

            if (buses.Equals(string.Empty))
            {
                buses = null;
            }

            if (vans.Equals(string.Empty))
            {
                vans = null;
            }

            if (orgcost.Equals(string.Empty))
            {
                orgcost = null;
            }

            if (partnercost.Equals(string.Empty))
            {
                partnercost = null;
            } 
            
            dbcontext.sp_UpdateMyOrgEventCosts(eventID, buses, vans, orgcost, partnercost);

            Response.Redirect("~/EventWizard_Comments.aspx");
        }
    }
}