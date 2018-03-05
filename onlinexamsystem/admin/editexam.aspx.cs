using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class editexam : System.Web.UI.Page
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
            get_editexamfill(Convert.ToInt32(eid));
            get_editcategorydrp();
            get_editsubjectdrp();
        }
    }

    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
    //edit button to edit exam
    protected void btn_editexam_Click(object sender, EventArgs e)
    {
        string eid = Request.QueryString["eid"];
        if (IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spEditexam", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@examid", Convert.ToInt32(eid));
                cmd.Parameters.AddWithValue("@examname", txt_editexamname.Text);
                cmd.Parameters.AddWithValue("@examdiscription",txt_editexamdis.Text);
                cmd.Parameters.AddWithValue("@examdate",txt_editexamdate.Text);
                cmd.Parameters.AddWithValue("@examduration", txt_editexamduration.Text);
                cmd.Parameters.AddWithValue("@exampassmarks", txt_editpassexammarks.Text);
                cmd.Parameters.AddWithValue("@examnmarks", txt_editexamtotalmarks.Text);
                cmd.Parameters.AddWithValue("@categoryfid", drp_editcategoryexam.SelectedValue);
                cmd.Parameters.AddWithValue("@subjectfid", drp_editsubjectexam.SelectedValue);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/exam.aspx");
                    }
                    else
                    {
                        txt_editexamname.Focus();
                        panel_editexam_warning.Visible = true;
                        lbl_exameditwarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                    }
                }
                catch (Exception ex)
                {
                    txt_editexamname.Focus();
                    panel_editexam_warning.Visible = true;
                    lbl_exameditwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            } // end of using 
        }
        else
        {
            txt_editexamname.Focus();
            panel_editexam_warning.Visible = true;
            lbl_exameditwarning.Text = "You must fill all the requirements";
        }

    }

    //method for editfill
    public void get_editexamfill(int id)
    {

        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("spEditexamfill", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@examid", id);
            try
            {
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    txt_editexamname.Text = rd["exam_name"].ToString();
                    txt_editexamdis.Text = rd["exam_description"].ToString();
                    txt_editexamduration.Text = rd["exam_duration"].ToString();
                    txt_editpassexammarks.Text = rd["exampass_marks"].ToString();
                    txt_editexamtotalmarks.Text = rd["exam_marks"].ToString();
                }
            }
            catch (Exception ex)
            {
                panel_editexam_warning.Visible = true;
                lbl_exameditwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
            }
        }
    }

    //method for category dropdown
    public void get_editcategorydrp()
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select * from category", con);
            try
            {
                con.Open();
                drp_editcategoryexam.DataSource = cmd.ExecuteReader();
                drp_editcategoryexam.DataBind();
                ListItem li = new ListItem("Select category", "-1");
                drp_editcategoryexam.Items.Insert(0, li);
            }
            catch (Exception ex)
            {
                txt_editexamname.Focus();
                panel_editexam_warning.Visible = true;
                lbl_exameditwarning.Text = "Something went wrong. Try again </br>" + ex.Message;
            }
        }
    }

    //method for subject dropdown
    public void get_editsubjectdrp()
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select subject_id, subject_name from subject", con);
            try
            {
                con.Open();
                drp_editsubjectexam.DataSource = cmd.ExecuteReader();
                drp_editsubjectexam.DataBind();
                ListItem li = new ListItem("Select subject", "-1");
                drp_editsubjectexam.Items.Insert(0, li);
            }
            catch (Exception ex)
            {
                txt_editexamname.Focus();
                panel_editexam_warning.Visible = true;
                lbl_exameditwarning.Text = "Something went wrong. Try again </br>" + ex.Message;
            }
        }
    }
}