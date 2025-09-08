using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace _2LAyer_Pro
{
    public partial class ProducTAdd : System.Web.UI.Page
    {
        Concls obj2 = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {
            string ddls = "select Cat_id,Cat_Name from Categories";
            DataSet da = obj2.Fn_Dataset(ddls);
            ddlCategory.DataSource = da;
            ddlCategory.DataTextField = "Cat_Name";
            ddlCategory.DataValueField = "Cat_id";
            ddlCategory.DataBind();
        }
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string PFPath = "~/Phs/" + fuProductImage.FileName;
            fuProductImage.SaveAs(MapPath(PFPath));
            string strinspro = "insert into Products values('"+ddlCategory.SelectedItem.Value + "','"+txtProductName.Text + "','" + PFPath + "','" + txtProductDetails.Text + "','" + txtProductPrice.Text + "','" + txtProductStock.Text +"','Avilable')";
            int i = obj2.fn_Nonquery(strinspro);
            if (i > 0)
            {
                Label11.Visible = true;
                Label11.Text = "Succefully Added";
            }
        }
    }
}