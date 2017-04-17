using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyOrgs.Data_Access;

namespace MyOrgs
{
    public partial class CurrentRoster : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            TermLabel.Text = getSessionLabel() + " Roster";
            emsg.Visible = false;
            
            if(!IsPostBack)
            {
                loadRoster();
            }
        }

        private string getSessionLabel()
        {
            /*determine the current term by checking to see what the Administrative site is using.*/
            string thisTerm = "";

            //there should only ever be one active row in this table.
            Term firstTerm = dbcontext.Terms.First();

            thisTerm = firstTerm.Session.Trim().ToUpper() + firstTerm.Year.ToString();

            return thisTerm;
        }

        private string getSessionOrg()
        {
            //323 is the Chemistry Club, for debugging purposes
            return Session["org_id"] == null ? "" : Session["org_id"].ToString();
        }

        private string getSessionOrgName()
        {
            //323 is the Chemistry Club, for debugging purposes
            string Name = Session["org_name"] == null ? "" : Session["org_name"].ToString();
            Name = Name.Replace("(","");
            Name = Name.Replace(")","");
            return Name;
        }

        private void loadRoster()
        {
            int orgID = Int32.Parse(getSessionOrg());

            grdMember.DataSource = dbcontext.sp_GetMyOrgsRoster(orgID);
            grdMember.DataBind();

            //if there aren't any members, hide the email button.
            if (grdMember.Rows.Count < 1)
            {
                emlButton.Visible = false;
            }
        }

        protected Boolean IsExecutiveBoardMember(string sort_order)
        {
            Boolean result = true;

            //1 = Pres, 2 = Vice Pres, 3 = Treasurer, 4 = Secretary, 5 = Other Exec.
            //999 = Standard member
            if (sort_order.Equals("999"))
            {
                result = false;
            }

            return result;
        }


        protected void grdMember_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell3 (sort_order), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[3].Visible = true;
            //I need the value in Cell4 (Student_ID), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[4].Visible = false;

            string sort_order = e.Row.Cells[3].Text;


            Boolean flag = IsExecutiveBoardMember(sort_order);
            if (!flag)
            {
                //it starts counting at 0
                LinkButton btnRemove = (LinkButton)e.Row.Cells[5].Controls[0];
                btnRemove.Visible = true;
            }
        }

        protected void grdMember_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int orgID = Int32.Parse(getSessionOrg());
            int studentid = Int32.Parse(grdMember.Rows[e.RowIndex].Cells[4].Text);

            dbcontext.sp_UpdateStudentRosterRow(studentid, orgID);
            
            loadRoster();
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

        protected void emlButton_Click(object sender, EventArgs e)
        {
            //Look to see if this is a Greek Org or not.
            Boolean Greek = false;
            Greek = getGreekOrg();

            String OrgName = getSessionOrgName();
            String Term = getSessionLabel();

            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            if (Greek)
            {
               message.To.Add("greeklife@carrollu.edu");
               // message.To.Add("rlaiacon@carrollu.edu");

            }
            else
            {
                message.To.Add("carrolluniversitysa@gmail.com");
                //message.To.Add("rlaiacon@carrollu.edu");
            }
            message.Subject = OrgName + ": " + Term + " Roster Completed";
            message.From = new System.Net.Mail.MailAddress("automated@myorgs.carrollu.edu");
            message.Body = OrgName + " has indicated that they have completed their " + Term + " roster." ;
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("imail.carrollu.edu");
            try
            {
                smtp.UseDefaultCredentials = true;
                smtp.Send(message);

                if (Greek)
                {
                    emsg.Text = "Greek Life has been notified that your current roster is complete.";
                    emsg.Visible = true;
                }
                else
                {
                    emsg.Text = "Student Activities has been notified that your current roster is complete.";
                    emsg.Visible = true;
                }
            }
            catch (Exception er)
            {
                emsg.Text = "Your email could not be sent: " + er.ToString();
                emsg.Visible = true;
            }
        }

        protected void grdSearchStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //Don't show it. (Carroll_ID)
            e.Row.Cells[3].Visible = false;
            //I need the value in Cell4 (Student_ID), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[4].Visible = false;
        }

        protected void grdSearchStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            int orgID = Int32.Parse(getSessionOrg());

            GridViewRow row = grdSearchStudents.SelectedRow;

            string stuID = row.Cells[4].Text;
            int stu_ID = Int32.Parse(stuID);
            
            dbcontext.sp_NewStudentRosterRow(orgID, stu_ID);

            loadRoster();

            LName.Text = string.Empty;
            FName.Text = string.Empty;

            NameSearchError.Visible = false;
            grdSearchStudents.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string lname = string.Empty;
            string fname = string.Empty;

            lname = LName.Text.Trim();
            fname = FName.Text.Trim();

            if (lname != string.Empty || fname != string.Empty)
            {
                NameSearchError.Visible = false;
                int count = 0;
                List<Student> students = new List<Student>();
                var Student = dbcontext.sp_GetStudentByName(lname, fname);
                foreach (var x in Student)
                {
                    Student stu = new Student();
                    stu.LastName = x.LastName;
                    stu.FirstName = x.FirstName;
                    stu.Carroll_ID = x.Carroll_ID;
                    stu.Email = x.Email;
                    stu.Student_ID = x.Student_ID;

                    students.Add(stu);

                    count++;
                }

                if (count < 1)
                {
                    grdSearchStudents.Visible = false;
                    NameSearchError.Visible = true;
                    NameSearchError.Text = "There are no students that match your criteria.";
                }
                else
                {
                    grdSearchStudents.Visible = true;
                    grdSearchStudents.DataSource = students;
                    grdSearchStudents.DataBind();
                }
            }
            else
            {
                grdSearchStudents.Visible = false;
                NameSearchError.Visible = true;
                NameSearchError.Text = "Please enter all or part of a student's name as search criteria.";
            }
        }
    }
}