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
            

        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string CFPath = "~/Phs/" + fuCategoryImage.FileName;
            fuCategoryImage.SaveAs(MapPath(CFPath));
           
            string strins = "insert into Categories values('" + txtCategoryName.Text + "','"+txtCategoryDesc.Text+ "','"+CFPath+ "','Available')";
            int i = obj2.fn_Nonquery(strins);
            if (i > 0)
            {
                Label10.Visible = true;
                Label10.Text = "Succefully Added";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProducTAdd.aspx");
        }
    }
}