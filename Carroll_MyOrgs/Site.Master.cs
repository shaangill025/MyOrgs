using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class SiteMaster : MasterPage
    {
        //private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        //private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        //private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            //// The code below helps to protect against XSRF attacks
            //var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            //Guid requestCookieGuidValue;
            //if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            //{
            //    // Use the Anti-XSRF token from the cookie
            //    _antiXsrfTokenValue = requestCookie.Value;
            //    Page.ViewStateUserKey = _antiXsrfTokenValue;
            //}
            //else
            //{
            //    // Generate a new Anti-XSRF token and save to the cookie
            //    _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            //    Page.ViewStateUserKey = _antiXsrfTokenValue;

            //    var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            //    {
            //        HttpOnly = true,
            //        Value = _antiXsrfTokenValue
            //    };
            //    if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            //    {
            //        responseCookie.Secure = true;
            //    }
            //    Response.Cookies.Set(responseCookie);
            //}

            //Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Set Anti-XSRF token
            //    ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            //    ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            //}
            //else
            //{
            //    // Validate the Anti-XSRF token
            //    if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
            //        || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            //    {
            //        throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            //    }
            //}
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!HttpContext.Current.User.Identity.IsAuthenticated)
            //{
            //    Response.Redirect("~/Login.aspx?ReturnUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
            //}

            string org = Session["org_name"] == null ? "" : Session["org_name"].ToString();
            Set_MyOrg_Header(org);
            string user = Session["usrname"] == null ? "" : Session["usrname"].ToString();
            MyLogin_Header(user);
        }

        public void Set_MyOrg_Header(string organization)
        {
            if (organization == null)
            {
                organization = "       ";
            }
            home.Text = "MyOrgs" + organization;
        }

        public void MyLogin_Header(string username)
        {
            if (username != "" && username != null)
            {
                username_header.Text = "Logged in as: " + username;
                username_header.Visible = true;
                logout_header.Visible = true;
            }
            else
            {
                username_header.Text = "";
                username_header.Visible = false;
                logout_header.Visible = false;
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            //Context.GetOwinContext().Authentication.SignOut();
        }

        protected void logout_header_Click(object sender, EventArgs e)
        {
            Session.Remove("usrname");
            Session.Remove("org_name");
            Session.Remove("org_id");
            MyLogin_Header("");

            Session.Remove("event_id");
            Session.Remove("event_mode");

            Session.Remove("service_id");
            Session.Remove("service_mode");

            Response.Redirect("~/Default.aspx");
        }

        protected void home_Click(object sender, EventArgs e)
        {
            string user = Session["usrname"] == null ? "" : Session["usrname"].ToString();
            if (user != "" && user != null)
            {
                //if we were in the middle of editing/adding an event, then we need to purge out the 
                //session variable before going home.
                Session.Remove("event_id");
                Session.Remove("event_mode");

                //if we were in the middle of editing/adding a service project, then we need to purge out the 
                //session variable before going home.
                Session.Remove("service_id");
                Session.Remove("service_mode");

                Response.Redirect("~/MainMenu.aspx");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }
    }
}