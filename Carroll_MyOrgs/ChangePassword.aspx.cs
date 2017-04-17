using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadForm();
            }
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        private void loadForm()
        {
            string user = getSessionUser();

            var usr = dbcontext.sp_GetUserByID(user).First();
            if (usr != null)
            {
                if (usr.Firstname == null)
                {
                    fname.Text = "";
                }
                else
                {
                    fname.Text = usr.Firstname.Trim();
                }

                if (usr.Lastname == null)
                {
                    lname.Text = "";
                }
                else
                {
                    lname.Text = usr.Lastname.Trim();
                }

                if (usr.Email == null)
                {
                    email.Text = "";
                }
                else
                {
                    email.Text = usr.Email.Trim();
                }

                if (usr.Phone == null)
                {
                    phone.Text = "";
                }
                else
                {
                    if (usr.Phone.Trim().Equals(string.Empty))
                    {
                        phone.Text = "";
                    }
                    else
                    {
                        string ph, ph_format;

                        ph = usr.Phone.Trim();
                        ph_format = String.Format("{0:(###) ###-####}", Convert.ToInt64(ph));
                        phone.Text = ph_format;
                    }
                }
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MainMenu.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string user = getSessionUser();
            string oldpwd = string.Empty;
            string fname = string.Empty;
            string lname = string.Empty; 
            string phone = string.Empty;
            string email = string.Empty;
            int role = 0;

            var usr = dbcontext.sp_GetUserByID(user).First();
            if (usr != null)
            {
                fname = usr.Firstname;
                lname = usr.Lastname;
                role = usr.Role_ID;
                phone = usr.Phone;
                email = usr.Email;
                oldpwd = usr.Password;
            }
            else
            {
                return;
            }

            if (!oldpwd.Equals(CurrentPassword.Text))
            {
                PwdError.Text = "Your current password does not match what you have typed in.";
                return;
            }

            string newpwd = NewPassword.Text.Trim();
            if (!newpwd.Equals(ConfirmNewPassword.Text.Trim()))
            {
                PwdError.Text = "Your new password and confirmed password do not match.";
                return;
            }
            else
            {
                dbcontext.sp_UpdateUser(fname, lname, newpwd, user, true, role, phone, email);
                PwdError.Text = "Your password has been updated.";
            }

            return;
        }
    }
}