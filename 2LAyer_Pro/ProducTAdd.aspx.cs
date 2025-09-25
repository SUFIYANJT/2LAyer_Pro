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
            Table();
            if (!IsPostBack)
            {
                string ddls = "select Cat_id,Cat_Name from Categories";
                DataSet da = obj2.Fn_Dataset(ddls);
                ddlCategory.DataSource = da;
                ddlCategory.DataTextField = "Cat_Name";
                ddlCategory.DataValueField = "Cat_id";
                ddlCategory.DataBind();
                Table();
            }
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
            Table();
        }
        protected void Table()
        {
            string sel = "SELECT p.Product_Id, p.Product_name, p.Product_Image, p.Product_Details, " +
             "p.Product_Price, p.Product_Stock, p.Product_Status, " +
             "c.Cat_Name " +
             "FROM Products p " +
             "INNER JOIN Categories c ON p.Cat_id = c.Cat_id";

            DataTable dt = obj2.Fn_DataTAble(sel);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Table();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Table();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

            // Find controls from EditItemTemplate
            TextBox txtCatName = (TextBox)GridView1.Rows[rowIndex].FindControl("txtCatName");
            TextBox txtCatDesc = (TextBox)GridView1.Rows[rowIndex].FindControl("txtCatDesc");
            FileUpload fuCatImg = (FileUpload)GridView1.Rows[rowIndex].FindControl("fuCatImg");

            string imagePath = string.Empty;

            if (fuCatImg != null && fuCatImg.HasFile)
            {
                // Save new uploaded file
                imagePath = "~/Phs/" + fuCatImg.FileName;
                fuCatImg.SaveAs(MapPath(imagePath));
            }
            else
            {
                // Keep old image path if no new file uploaded
                string old = "SELECT Cat_disc FROM Categories WHERE Cat_id=" + getid;
                DataTable dt = obj2.Fn_DataTAble(old);
                if (dt.Rows.Count > 0)
                    imagePath = dt.Rows[0]["Cat_disc"].ToString();
            }

            // Update query
            string upd = "UPDATE Categories SET " +
                         "Cat_Name='" + txtCatName.Text.Replace("'", "''") + "', " +   // escape quotes
                         "cat_disc='" + txtCatDesc.Text.Replace("'", "''") + "', " +
                         "Cat_Image='" + imagePath + "' " +
                         "WHERE Cat_id=" + getid;

            obj2.fn_Nonquery(upd);

            GridView1.EditIndex = -1;
            Table();
        }
    }
}