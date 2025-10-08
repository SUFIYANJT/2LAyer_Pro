using System;
using System.Data;
using System.Web.UI;

namespace _2LAyer_Pro
{
    public partial class ProductbuyPage : System.Web.UI.Page
    {
        Concls obj = new Concls(); // ✅ Your connection class

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["selectedProductId"] != null)
                {
                    int productId = Convert.ToInt32(Session["selectedProductId"]);
                    LoadProductDetails(productId);
                }
                else
                {
                    Response.Redirect("CartPage.aspx"); // If no product selected
                }
            }
        }

        private void LoadProductDetails(int productId)
        {
            string query = "SELECT * FROM Products WHERE Product_Id = " + productId;
            DataSet ds = obj.Fn_Dataset(query);
            int userId = Convert.ToInt32(Session["uid"]);
            Label1.Text = userId.ToString();
            if (ds.Tables[0].Rows.Count > 0)
            {
                var row = ds.Tables[0].Rows[0];

                // ✅ Set values to labels and image
                
                Label2.Text = row["Product_Details"].ToString();
                Label3.Text = "₹" + row["Product_Price"].ToString();
                Image1.ImageUrl = row["Product_Image"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                // ✅ You should have this userId in your session
                
            
            
            int productId = Convert.ToInt32(Session["selectedProductId"]);
                int quantity = Convert.ToInt32(TextBox1.Text);

                // ✅ Get product price
                string priceQuery = "SELECT Product_Price FROM Products WHERE Product_Id=" + productId;
                DataSet ds = obj.Fn_Dataset(priceQuery);
            int userId = Convert.ToInt32(Session["uid"]);
            Label1.Text = userId.ToString();
            if (ds.Tables[0].Rows.Count > 0)
                    
                {
                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["Product_Price"]);
                    decimal total = price * quantity;

                    // ✅ Step 1: Insert into Orders (with SCOPE_IDENTITY)
                    string insOrder = "INSERT INTO Orders (User_ID, Order_Date, Total_Amount, Shipping_Address, Order_Status, Payment_Method, Tracking_Number) " +
                                      "VALUES (" + userId + ", GETDATE(), " + total + ", 'Kochi, Kerala', 'Pending', 'Cash on Delivery',  CAST((RAND() * 10000) AS INT));" +
                                      "SELECT SCOPE_IDENTITY();";

                    // Get the inserted Order_ID
                    string orderIdStr = obj.fn_scalar(insOrder);
                    int orderId = Convert.ToInt32(orderIdStr);

                    // ✅ Step 2: Insert into OrderDetails
                    string insOrderDetails = "INSERT INTO OrderDetails (Order_ID, Product_ID, Quantity, Unit_Price) " +
                                             "VALUES (" + orderId + ", " + productId + ", " + quantity + ", " + price + ")";

                    int result = obj.fn_Nonquery(insOrderDetails);

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Order placed successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error: Order details not inserted.');</script>");
                    }
                }
            
        
        }
    }
}
 