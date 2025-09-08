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
    public partial class WebForm3 : System.Web.UI.Page
    {
        Concls obj = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedCatId"] != null)
                {
                    string catId = Session["SelectedCatId"].ToString();
                    string selpro = "select * from Products where Cat_id="+catId+"";
                    DataSet da = obj.Fn_Dataset(selpro);
                    DataList1.DataSource = da;
                    DataList1.DataBind();
                }
                else
                {
                    Response.Redirect("WebForm1.aspx");
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "SelectProduct")
            {
                
                string productId = e.CommandArgument.ToString();

              
                Session["ProductId"] = productId;

                
                Response.Redirect("ProductDetails.aspx");
            }
        }

    }
}
