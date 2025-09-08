using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2LAyer_Pro
{
    public partial class Registeraspx : System.Web.UI.Page
    {
        Concls obj=new Concls();
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
                reg_id ++;
            }
            string ins = "insert into Login values("+reg_id+",'"+TextBox10.Text+"','"+TextBox11.Text+ "','User', GETDATE())";
            int sta=obj.fn_Nonquery(ins);
            if (sta > 0)
            {
                string insun = "insert into Users_Registration values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','"+ TextBox3.Text+ "','"+ TextBox4.Text+ "','"+TextBox5.Text+ "','"+TextBox6.Text+ "','"+ TextBox7.Text+ "','"+TextBox8.Text+ "','"+TextBox9.Text+"','Active')";
                int stu = obj.fn_Nonquery(insun);
                if (stu > 0)
                {
                    Label10.Text = "Suceess";
                    Response.Redirect("Login.aspx");
                }
                
            }
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Regi.aspx");
        }
    }
}