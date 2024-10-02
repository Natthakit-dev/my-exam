using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Xml.Linq;
using System.Collections;

namespace E_Exam
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            var type = workType.Text;
            var name = workName.Text;
            var start = startDate.Text;
            var end = endDate.Text;
            var stat = status.Text;
            var save = saveDate.Text;
            //var update = updateTime.Text;
            //var IsVaid = false;
            //string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
            //string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");

            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string store = "SaveData";
            using (SqlConnection con = new SqlConnection(connectStr))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(store, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@type", type));
                    cmd.Parameters.Add(new SqlParameter("@name", name));
                    cmd.Parameters.Add(new SqlParameter("@start", start));
                    cmd.Parameters.Add(new SqlParameter("@end", end));
                    cmd.Parameters.Add(new SqlParameter("@stat", stat));
                    cmd.Parameters.Add(new SqlParameter("@save", save));
                    //cmd.Parameters.Add(new SqlParameter("@update", update));
                    //using (SqlDataReader reader = cmd.ExecuteReader())
                    //{
                    //    while (reader.Read())
                    //    {
                    //        IsVaid = reader.HasRows;
                    //        //reader.GetSqlValue(0);
                    //    }
                    //}
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw;
                }
                con.Close();
            }
        }
        protected void BtnShow_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string store = "GetData";
            using (SqlConnection con = new SqlConnection(connectStr))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(store, con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // ใช้ SqlDataAdapter เพื่อเติมข้อมูลใน DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dataTable);
                    }

                }
                catch (Exception ex)
                {
                    throw;
                }
                GridView.DataSource = dataTable;
                GridView.DataBind();
                con.Close();
            }
        }
    }
}