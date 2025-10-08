using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace _2LAyer_Pro
{
    public class Concls
    {
        SqlConnection con;
        SqlCommand cmd;
        public Concls()
        {
            con = new SqlConnection(@"server=DESKTOP-D5LISN2\SQLEXPRESS;database=2layer;integrated security=True");
        }

        public int fn_Nonquery(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        public string fn_scalar(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
                con.Close();

            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            object result = cmd.ExecuteScalar();
            con.Close();

            if (result == null || result == DBNull.Value)
                return "0";
            else
                return result.ToString();
        }

        public SqlDataReader Fn_Reader(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }
        public DataSet Fn_Dataset(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataTable Fn_DataTAble(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}