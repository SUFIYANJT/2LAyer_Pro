using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2LAyer_Pro
{
    public partial class Admin_Regi : System.Web.UI.Page
    {
        Concls obj = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "select Max(Ref_id) from Login";
            string i = obj.fn_scalar(str);
            int reg_id = 0;
            if (i == "")
            {
                reg_id = 1;
            }
            else
            {
                reg_id = Convert.ToInt32(i);
                reg_id++;
            }
            string ins = "insert into Login values(" + reg_id + ",'" + TextBox4.Text + "','" + TextBox5.Text + "','Admin', GETDATE())";
            int sta = obj.fn_Nonquery(ins);
            if (sta > 0)
            {
                string insun = "INSERT INTO Users_Registration (User_id, Name, Age, Email, Phone, User_Status) " +
               "VALUES (" + reg_id + ", '" + TextBox1.Text + "', '" + TextBox7.Text + "', '"+TextBox2.Text + "', '" + TextBox3.Text +"', 'Active')";

                int stu = obj.fn_Nonquery(insun);
                if (stu > 0)
                {
                    
                    Response.Redirect("Login.aspx");
                }

            }
        }
    }
}