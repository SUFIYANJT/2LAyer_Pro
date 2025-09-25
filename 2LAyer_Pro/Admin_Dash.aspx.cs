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
    public partial class WebForm2 : System.Web.UI.Page
    { Concls obj2 = new Concls();
        protected void Page_Load(object sender, EventArgs e)
        {

            Table();
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string CFPath = "~/Phs/" + fuCategoryImage.FileName;
            fuCategoryImage.SaveAs(MapPath(CFPath));
            Table();
            string strins = "insert into Categories values('" + txtCategoryName.Text + "','" + CFPath + "','" + txtCategoryDesc.Text+ "','Available')";
            int i = obj2.fn_Nonquery(strins);
            if (i > 0)
            {
                Label10.Visible = true;
                Label10.Text = "Succefully Added";
                Table();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProducTAdd.aspx");
        }
        protected  void Table()
        {
            string views = "Select * from Categories";
            DataTable dt = obj2.Fn_DataTAble(views);
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
                         "cat_disc='" + imagePath + "' " +
                         "WHERE Cat_id=" + getid;

            obj2.fn_Nonquery(upd);

            GridView1.EditIndex = -1;
            Table();
        }


    }
} 