using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class categoryitem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cid = Request.QueryString["cid"];
        if(cid == null)
        {
            Response.Redirect("index.aspx");
        }
        subjectlistmethod(Convert.ToInt32(cid));
        categorynamemethod(Convert.ToInt32(cid));
    }


    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

    //method for subjectlist
    public void subjectlistmethod(int id)
    {

        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select * from subject where category_fid = @categoryid", con);
            cmd.Parameters.AddWithValue("@categoryid", id);
            try
            {
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if(rd.HasRows)
                {
                    gridview_categoryitem.DataSource = rd;
                    gridview_categoryitem.DataBind();
                }
                else
                {
                    panel_subjectshow_warning.Visible = true;
                    lbl_subjectshowwarning.Text = "Sorry! There is no subject in this category";
                }
            }
            catch (Exception ex)
            {
                panel_subjectshow_warning.Visible = true;
                lbl_subjectshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
            }
        }
    }
    //method for categorylist
    public void categorynamemethod(int id)
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select * from category where category_id = @categoryid", con);
            cmd.Parameters.AddWithValue("@categoryid", id);
            try
            {
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    lbl_categorysubject.Text = rd["category_name"].ToString();
                }
            }
            catch (Exception ex)
            {
                panel_subjectshow_warning.Visible = true;
                lbl_subjectshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem " + ex.Message;
            }
        }
    }
}