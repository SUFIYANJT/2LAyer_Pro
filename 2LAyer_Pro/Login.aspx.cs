using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2LAyer_Pro
{
    public partial class Login : System.Web.UI.Page
    {
        Concls obj1 = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Response.Redirect("Register.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string che = "select Count(Login_i) from  Login where Username='" + TextBox1.Text+"' AND Password='"+TextBox2.Text+"'";
            string no_id = obj1.fn_scalar(che);
            int c_id = Convert.ToInt32(no_id);
            if (c_id ==1)
            {
                string chid = "select Login_i from Login where Username='" + TextBox1.Text + "' AND Password='" + TextBox2.Text + "'";
                string id = obj1.fn_scalar(chid);
                Session["uid"] = id;
                string cid = "select UserType from Login  where Username='" + TextBox1.Text + "' AND Password='" + TextBox2.Text + "'";
                string User_Status = obj1.fn_scalar(cid);
                if (User_Status == "Admin")
                {
                    Response.Redirect("Admin_Dash.aspx");
                }
                else
                {
                    Response.Redirect("Webform1.aspx");
                }
            }
        }
    }
}