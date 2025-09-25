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
            if (!IsPostBack)  // ✅ Only bind on first load
            {
                BindCartData();
            }
        }

        private void BindCartData()
        {
            int uid = Convert.ToInt32(Session["uid"]);

            string strdis = "select * from Products where Product_Id in (select Product_Id from Cart where User_id=" + uid + ")";
            DataSet ds = obj.Fn_Dataset(strdis);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
        {
            if (e.CommandName == "SelectProduct")
            {

                string productId = e.CommandArgument.ToString();
                Session["selectedProductId"] = productId;
                // ✅ Redirect to ProductDetails.aspx with ProductId in query string
                Response.Redirect("ProductbuyPage.aspx");
            }
        }
    }
}
