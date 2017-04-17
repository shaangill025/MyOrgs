using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOrgs
{
    public partial class EventWizard_4 : System.Web.UI.Page
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int eventID = getSessionEvent();

                loadComments(eventID);
            }
        }

        private void loadComments(int eventID)
        {
            grdComments.DataSource = dbcontext.sp_GetCommentsByEventID(eventID);
            grdComments.DataBind();
        }

        private int getSessionEvent()
        {
            return Session["event_id"] == null ? 0 : Int32.Parse(Session["event_id"].ToString());
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EventWizard_Checklist.aspx");
        }

        protected void grdComments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //I need the value in Cell2 (EventComment_ID), but I don't want it visible. So, I have to hide it programmatically.
            e.Row.Cells[2].Visible = false;
        }

        private string getSessionUser()
        {
            return Session["usrname"] == null ? "" : Session["usrname"].ToString();
        }

        protected void AddNew_Click(object sender, EventArgs e)
        {
            //add an empty blank row that they can then edit.
            int eventID = getSessionEvent();
            string today, user, empty;

            empty = string.Empty;
            user = getSessionUser();

            dbcontext.sp_NewEventComments(eventID, empty, empty, user);

            loadComments(eventID);
        }

        protected void grdComments_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int eventID = getSessionEvent();

            //Set the edit index.
            grdComments.EditIndex = e.NewEditIndex;
            loadComments(eventID);
        }

        protected void grdComments_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventID = getSessionEvent();

            int comment_ID = Convert.ToInt32(grdComments.DataKeys[e.RowIndex].Value.ToString());

            dbcontext.sp_DeleteEventComment(comment_ID);
            loadComments(eventID);
        }

        protected void grdComments_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int eventID = getSessionEvent();
            int commentid = Convert.ToInt32(grdComments.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)grdComments.Rows[e.RowIndex];

            TextBox newcomment = (TextBox)row.FindControl("CommentText");
            if (newcomment != null)
            {
                string new_text = newcomment.Text.Trim();
                dbcontext.sp_UpdateEventComment(commentid, new_text);
            }

            grdComments.EditIndex = -1;

            loadComments(eventID);
        }

        protected void grdComments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdComments.EditIndex = -1;

            int eventID = getSessionEvent();
            loadComments(eventID);
        }
    }
}