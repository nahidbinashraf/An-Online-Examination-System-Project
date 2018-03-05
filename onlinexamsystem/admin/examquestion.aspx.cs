using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_viewquestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string eid = Request.QueryString["eid"];
        if (!IsPostBack)
        {

            if (eid == null)
            {
                Response.Redirect("~/admin/exam.aspx");
            }
            getexamquestion(Convert.ToInt32(eid));
        }
    }

    protected void gridview_examquestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "deleteexamquestion")
        {
            deletequestion(Convert.ToInt32(e.CommandArgument));
        }
    }
    //for paging
    protected void gridview_examquestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string eid = Request.QueryString["eid"];
        gridview_examquestion.PageIndex = e.NewPageIndex;
        getexamquestion(Convert.ToInt32(eid));
    }
    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
    //method for getting question for the exam id
    public void getexamquestion(int id)
    {

        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("spExamquestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@examfid", id);
            try
            {
                con.Open();
                using(SqlDataAdapter ad = new SqlDataAdapter())
                {
                    ad.SelectCommand = cmd;
                    using (DataTable tb = new DataTable())
                    {
                        ad.Fill(tb);
                        gridview_examquestion.DataSource = tb;
                        gridview_examquestion.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                panel_examquestion_warning.Visible = true;
                lbl_examquestionwarning.Text = "Something went wrong. Pleas contact your provider </br>" + ex.Message;
            }

        }
    }

    //method for deleting question for the question id 
    public void deletequestion(int id)
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("delete question where question_id = @questionid", con);
            cmd.Parameters.AddWithValue("@questionid", id);
            try
            {
                con.Open();
                int i = (int)cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("~/admin/question.aspx");
                    Response.Write("Delete Succesfully");
                }
                else
                {
                    panel_examquestion_warning.Visible = true;
                    lbl_examquestionwarning.Text = "Something went wrong. Can't delete now";
                }
            }
            catch (Exception ex)
            {
                panel_examquestion_warning.Visible = true;
                lbl_examquestionwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
            }

        }
    }
}