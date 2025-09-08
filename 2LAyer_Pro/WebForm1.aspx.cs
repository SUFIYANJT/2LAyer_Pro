using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;
using System.Data.SqlClient;
namespace _2LAyer_Pro
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Concls pobj = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                BindCategories();
            
        }
        private void BindCategories()
        {

            string catd="SELECT * FROM Categories";
            DataSet dt = pobj.Fn_Dataset(catd);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                string catId = e.CommandArgument.ToString();
                Session["SelectedCatId"] = catId;
                Response.Redirect("Product1.aspx");
            }
        }
    }
}
  