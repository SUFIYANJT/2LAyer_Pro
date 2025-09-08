using System;
using System.Data;
using System.Web.UI;

namespace _2LAyer_Pro
{
    public partial class CartPage : System.Web.UI.Page
    {
        Concls obj = new Concls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int uid = Convert.ToInt32(Session["uid"]);

            

            string strcart = "select Product_Id from Cart where User_id=" + uid;

            DataSet dsCart = obj.Fn_Dataset(strcart);

           
                string strdis = "select * from Products where Product_Id in (select Product_Id from Cart where User_id=" + uid + ")";
                DataSet ds = obj.Fn_Dataset(strdis);

                DataList1.DataSource = ds;
                DataList1.DataBind();
            

        }

        protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
        {

        }
    }
}
