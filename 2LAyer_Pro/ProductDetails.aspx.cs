using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace _2LAyer_Pro
{
    
    public partial class ProductDetails : System.Web.UI.Page
    {
        Concls obj = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["ProductId"] == null)
                {
                    Response.Redirect("Product1.aspx"); 
                    return;
                }

                int Pid = Convert.ToInt32(Session["ProductId"]);
                string str = "Select * from Products where Product_Id=" + Pid;
                SqlDataReader dr = obj.Fn_Reader(str);

                if (dr.Read())
                {
                    Session["Product_Price"] = dr["Product_Price"].ToString();
                    Label1.Text = dr["Product_name"].ToString();
                    Label2.Text = dr["Product_Details"].ToString();
                    Label3.Text = dr["Product_Price"].ToString();
                    Image1.ImageUrl = dr["Product_Image"].ToString();
                }
                dr.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["ProductId"] == null)
            {
                Response.Redirect("Product1.aspx");
                return;
            }

           
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int Pid = Convert.ToInt32(Session["ProductId"]);
            int uid = Convert.ToInt32(Session["uid"]);
            int price = Convert.ToInt32(Session["Product_Price"]);

            int quantity = 1;
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                quantity = Convert.ToInt32(TextBox1.Text);
            }

            int Sub_Total = quantity * price;

            
            string strcart = "insert into Cart values(" + Pid + "," + uid + "," + quantity + "," + Sub_Total + ",1)";
            int i = obj.fn_Nonquery(strcart);

            if (i > 0)
            {
                Response.Redirect("CartPage.aspx");
            }
            else
            {
                Response.Write("Faild");
            }
        }
    }
}