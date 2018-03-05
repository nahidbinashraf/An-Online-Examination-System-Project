using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class myresult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie usercookie = Request.Cookies["user_cookies"];
        if (Session["Useremail"] != null || usercookie != null)
        {
            if (Session["Useremail"] == null)
            {
                getemail.Text = usercookie["Useremail"];
            }
            else
            {
                getemail.Text = Session["Useremail"].ToString();
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            getmyresults(getemail.Text);
        }
    }
    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
    public void getmyresults(string email)
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("spUserresult", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", email);
            try
            {
                con.Open();
                using(SqlDataAdapter ad = new SqlDataAdapter())
                {
                    ad.SelectCommand = cmd;
                    using (DataTable tb = new DataTable())
                    {
                        ad.Fill(tb);
                        if (tb != null)
                        {
                            gridmyresult.DataSource = tb;
                            gridmyresult.DataBind();
                        }
                        else
                        {
                            panel_myresultshow_warning.Visible = true;
                            lbl_myresultshowwarning.Text = "Sorry! There is no result of your in this application";
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                panel_myresultshow_warning.Visible = true;
                lbl_myresultshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
            }
        }
    }

    protected void gridmyresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridmyresult.PageIndex = e.NewPageIndex;
        getmyresults(getemail.Text);
    }
}