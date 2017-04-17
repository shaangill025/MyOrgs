using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace MyOrgs
{
    public partial class _Default : Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string user = UserName.Text.Trim();
            string password = Password.Text.Trim();

            FormsAuthentication.Initialize();
            FormsAuthentication.HashPasswordForStoringInConfigFile(password, "md5"); // Or "sha1"

            bool? isActive = false;
            string Role = string.Empty;
            dbcontext.sp_GetRoleOfUser(user, password, ref Role, ref isActive);

            if (Convert.ToBoolean(isActive)) //accounts for unknown users & bad username/password checks
            {
                if (Role == "Admin" || Role == "Limited" || Role == "MyOrgs Only")
                {
                    // Create a new ticket used for authentication
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                       1, // Ticket version
                       user, // Username associated with ticket
                       DateTime.Now, // Date/time issued
                       DateTime.Now.AddMinutes(30), // Date/time to expire
                       true, // "true" for a persistent user cookie
                       Role, // User-data, in this case the role
                       FormsAuthentication.FormsCookiePath);// Path cookie valid for

                    // Encrypt the cookie using the machine key for secure transport
                    string hash = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, // Name of auth cookie
                                        hash); // Hashed ticket

                    // Set the cookie's expiration time to the tickets expiration time
                    if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

                    // Add the cookie to the list for outgoing response
                    Response.Cookies.Add(cookie);

                    // Don't call FormsAuthentication.RedirectFromLoginPage since it
                    // could replace the authentication ticket (cookie) we just added
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (returnUrl == null) returnUrl = "~/MainMenu.aspx";

                    Session.Add("usrname", user);
                    if (multipleOrgsCheck(user, returnUrl) == 0)
                    {
                        //if they have not been assigned an organization yet, do not let them log in.
                        ErrorLabel.Text = "You have not been assigned an organization to work with.";
                        ErrorLabel.Visible = true;

                        Session.Remove("usrname");
                    }
                }
                else
                {
                    ErrorLabel.Text = "Your credentials do not allow for logging into the MyOrgs site.";
                    ErrorLabel.Visible = true;
                }
            }
            else
            {
                // Never tell the user if just the username is password is incorrect.
                // That just gives them a place to start, once they've found one or the other is correct!
                ErrorLabel.Text = "Username and/or password incorrect. Please try again.";
                ErrorLabel.Visible = true;
            }
        }

        private int multipleOrgsCheck(string user, string returnURL)
        {
            int count = 0;
            var Orgs = dbcontext.sp_GetUserOrgsByID(user);
            string first_org = "", first_orgname = "";
            foreach (var x in Orgs)
            {
                if (count == 0)
                {
                    first_org = x.Organization_ID.ToString();
                    first_orgname = x.OrganizationName;
                }
                count++;
            }

            if (count == 1)
            {
                Session.Add("org_name", " (" + first_orgname + ")");
                Session.Add("org_id", first_org);
                Response.Redirect(returnURL);
            }
            if (count > 1)
            {
                Response.Redirect("~/MultipleOrgs.aspx");
            }

            return count;
        }
    }
}