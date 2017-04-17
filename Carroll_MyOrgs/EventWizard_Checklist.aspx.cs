using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class EventWizard_Checklist : System.Web.UI.Page
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
                    if (Event.RoomReserved)
                    {
                        location_reserved.Checked = true;
                    }
                    else
                    { 
                        location_reserved.Checked = false;
                    }

                    if (Event.Marketing)
                    {
                        marketing_materials.Checked = true;
                    }
                    else
                    { 
                        marketing_materials.Checked = false;
                    }

                    if (Event.Catering)
                    {
                        catering.Checked = true;
                    }
                    else
                    { 
                        catering.Checked = false;
                    }


                    if (Event.SignupForm)
                    {
                        event_signup.Checked = true;
                    }
                    else
                    { 
                        event_signup.Checked = false;
                    }


                    if (Event.ActivityWaiver)
                    {
                        activity_waiver.Checked = true;
                    }
                    else
                    { 
                        activity_waiver.Checked = false;
                    }

                    if (Event.CUNight)
                    {
                        cunight_event.Checked = true;
                    }
                    else
                    {
                        cunight_event.Checked = false;
                    }
                }
            }
        }

        private int getSessionEvent()
        {
            return Session["event_id"] == null ? 0 : Int32.Parse(Session["event_id"].ToString());
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            int eventID = getSessionEvent();
            bool loc, mark, cat, evnt, act, cun;

            loc = location_reserved.Checked;
            mark = marketing_materials.Checked;
            cat = catering.Checked;
            evnt = event_signup.Checked;
            act = activity_waiver.Checked;
            cun = cunight_event.Checked;

            dbcontext.sp_UpdateMyOrgEventChecklist(eventID, loc, mark, cat, evnt, act, cun);

            Response.Redirect("~/EventWizard_Final.aspx");
        }
    }
}