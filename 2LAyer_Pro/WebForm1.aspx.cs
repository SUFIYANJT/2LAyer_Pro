using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2LAyer_Pro
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Concls pobj = new Concls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)   // ✅ bind only first time
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {

            string selpro = "select * from  Categories";
            DataSet da = pobj.Fn_Dataset(selpro);
            DataList1.DataSource = da;
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
