using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class admin_editcategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string category_id = Request.QueryString["cid"];
            if(category_id == null)
            {
                Response.Redirect("~/admin/category.aspx");
            }
            txt_categoryedit.Focus();
            categoryedit_fill(Convert.ToInt32(category_id)); //calling method with parametres
            
        }

    }

    //for update the category
    protected void btn_editcategory_Click(object sender, EventArgs e)
    {
        string category_id = Request.QueryString["cid"];
        if (IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update category set category_name= @category_name where category_id = @categoryid", con);
                cmd.Parameters.AddWithValue("@categoryid", Convert.ToInt32(category_id));
                cmd.Parameters.AddWithValue("@category_name", txt_categoryedit.Text);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/category.aspx");
                    }
                    else
                    {
                        txt_categoryedit.Focus();
                        panel_editcategory_warning.Visible = true;
                        lbl_categoryeditwarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                    }
                }
                catch (Exception ex)
                {
                    txt_categoryedit.Focus();
                    panel_editcategory_warning.Visible = true;
                    lbl_categoryeditwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            } // end of using 
        }
        else
        {
            txt_categoryedit.Focus();
            panel_editcategory_warning.Visible = true;
            lbl_categoryeditwarning.Text = "You must fill all the requirements";
        }

    }
    //edit fill method
    public void categoryedit_fill(int id)
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select * from category where category_id = @cid", con);
            cmd.Parameters.AddWithValue("@cid", id);
            try
            {
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    txt_categoryedit.Text = rd["category_name"].ToString();
                }
            }
            catch (Exception ex)
            {
                panel_editcategory_warning.Visible = true;
                lbl_categoryeditwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
            }
        }
    }
}