using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace LabADO
{
    public partial class Default1 : System.Web.UI.Page
    {
        private const string tbName = "StudentsTable1";
        private static readonly string conStr = @"Data Source=DESKTOP-RHOILB6\SQLEXPRESS;Initial Catalog=School_db;Integrated Security=True";

        // Form an SQL connection
        readonly SqlConnection sqlConn = new SqlConnection(conStr);
        // Life cycle method
        protected void Page_Load(object sender, EventArgs e)
        {
            viewStudents();
        }

        private void viewStudents()
        {
            /*sqlConn.Open();
            string quer = "SELECT * FROM " + tbName;
            SqlDataAdapter sel = new SqlDataAdapter(quer, sqlConn);
            DataSet ds = new DataSet();
            sel.Fill(ds);
            viewStd.DataSource = ds;
            viewStd.DataBind();
            sqlConn.Close();*/
            //SqlDataSource1.Update();
        }

        protected void submitAdd_Click(object sender, EventArgs e)
        {
            string _fname = fname.Text;
            string _lname = lname.Text;
            string _add = address.Text;
            // Reg id is auto incremented
            if (_fname != "" && _lname != "" && _add != "")
            {
                sqlConn.Open();
                string insQ = "INSERT INTO " + tbName + " (first_name, last_name, Address) VALUES ('" +
                _fname + "', '" +
                _lname + "', '" +
                _add + "')";
                SqlCommand sqlCom = new SqlCommand(insQ, sqlConn);
                sqlCom.ExecuteNonQuery();
                sqlConn.Close();
                viewStudents();
            } else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid request. Please provide proper information!')", true);
            }
        }

        protected void submitDel_Click(object sender, EventArgs e)
        {
            int _id = int.Parse(id.Text);
           if (int.TryParse(id.Text, out _))
            {
                sqlConn.Open();
                string delB = "DELETE FROM " + tbName + " WHERE reg_id = " + _id;
                SqlCommand sqlCom = new SqlCommand(delB, sqlConn);
                sqlCom.ExecuteNonQuery();
                sqlConn.Close();
                viewStudents();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid request. Please provide proper information!')", true);
            }

        }

        /*protected void submitUpdate_Click(object sender, EventArgs e)
        {
            int _id = int.Parse(upId.Text);
            string _fname = upFname.Text;
            string _lname = upLname.Text;
            string _add = upAdd.Text;
            if (int.TryParse(upId.Text, out _) && _fname != "" && _lname != "" && _add != "")
            {
                sqlConn.Open();
                string delB = "UPDATE " + tbName + " SET " +
                    "first_name = '" + _fname +
                    "', last_name = '" + _lname +
                    "', Address = '" + _add +
                    "' WHERE SALESID =" + _id;
                SqlCommand sqlCom = new SqlCommand(delB, sqlConn);
                sqlCom.ExecuteNonQuery();
                sqlConn.Close();
                viewStudents();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid request. Please provide proper information!')", true);
            }
        }*/
    }
}