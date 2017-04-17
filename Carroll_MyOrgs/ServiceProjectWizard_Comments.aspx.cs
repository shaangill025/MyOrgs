using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class ServiceProjectWizard_4 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int serviceID = getSessionService();

                loadComments(serviceID);
            }
        }

        private void loadComments(int serviceID)
        {
            grdComments.DataSource = dbcontext.sp_GetCommentsByServiceProjectID(serviceID);
            grdComments.DataBind();
        }

        private int getSessionService()
        {
            return Session["service_id"] == null ? 0 : Int32.Parse(Session["service_id"].ToString());
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ServiceProjectWizard_Final.aspx");
        }

        protected void grdComments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell2 (ServiceComment_ID), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[2].Visible = false;
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        protected void AddNew_Click(object sender, EventArgs e)
        {
            //add an empty blank row that they can then edit.
            int serviceID = getSessionService();
            string user, empty;

            empty = string.Empty;
            user = getSessionUser();

            dbcontext.sp_NewServiceProjectComments(serviceID, empty, empty, user);

            loadComments(serviceID);
        }

        protected void grdComments_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int serviceID = getSessionService();

            //Set the edit index.
            grdComments.EditIndex = e.NewEditIndex;
            loadComments(serviceID);
        }

        protected void grdComments_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int serviceID = getSessionService();

            int comment_ID = Convert.ToInt32(grdComments.DataKeys[e.RowIndex].Value.ToString());

            dbcontext.sp_DeleteServiceComment(comment_ID);
            loadComments(serviceID);
        }

        protected void grdComments_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int serviceID = getSessionService();
            int commentid = Convert.ToInt32(grdComments.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)grdComments.Rows[e.RowIndex];

            TextBox newcomment = (TextBox)row.FindControl("CommentText");
            if (newcomment != null)
            {
                string new_text = newcomment.Text.Trim();
                dbcontext.sp_UpdateServiceComment(commentid, new_text);
            }

            grdComments.EditIndex = -1;

            loadComments(serviceID);
        }

        protected void grdComments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdComments.EditIndex = -1;

            int serviceID = getSessionService();
            loadComments(serviceID);
        }
    }
}