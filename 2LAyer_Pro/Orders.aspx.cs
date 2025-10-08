using System;
using System.Data;
using System.Web.UI;

namespace _2LAyer_Pro
{
    public partial class Orders : System.Web.UI.Page
    {
        Concls obj = new Concls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] != null)
                {
                    int userId = Convert.ToInt32(Session["uid"]);
                    LoadUserOrders(userId);
                }
                else
                {
                    Response.Redirect("Login.aspx"); // Redirect if not logged in
                }
            }
        }

        private void LoadUserOrders(int userId)
        {
            try
            {
                string query = "SELECT Order_ID, Order_Date, Total_Amount, Order_Status, Payment_Method, Tracking_Number " +
                               "FROM Orders WHERE User_ID = " + userId + " ORDER BY Order_Date DESC";

                DataSet ds = obj.Fn_Dataset(query);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    GridViewOrders.DataSource = ds;
                    GridViewOrders.DataBind();
                }
                else
                {
                    GridViewOrders.EmptyDataText = "No orders found.";
                    GridViewOrders.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading orders: " + ex.Message + "');</script>");
            }
        }
    }
}
