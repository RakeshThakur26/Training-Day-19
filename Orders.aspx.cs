using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace ASPDOTNETAPP1
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();
            DataTable Result = db.GetOrders();
            gvOrderDetails.DataSource = Result;
            gvOrderDetails.DataBind();
            if (!IsPostBack)
            {
                DataTable dt = db.GetSalesmanIds();
                Salesman_id.Items.Add("-- Choose --");
                DataTable dt2 = db.GetCustomerIds();
                Customer_id.Items.Add("-- Choose --");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Salesman_id.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " - " + dt.Rows[i][1], dt.Rows[i][0].ToString()));
                    Customer_id.Items.Add(new ListItem(dt2.Rows[i][0].ToString() + " - " + dt2.Rows[i][1], dt2.Rows[i][0].ToString()));
                }
            }
        }

        protected void OrdersSubmit_Click(object sender, EventArgs e)
        {

            DBConnection db = new DBConnection();
            db.InsertDataIntoOrders(order_no.Text, purch_amt.Text, order_date.Text, Customer_id.Text, Salesman_id.Text);
           
            DataTable dtSalesmanResult = db.GetOrders();
            gvOrderDetails.DataSource = dtSalesmanResult;
            gvOrderDetails.DataBind();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();


            SqlConnection Conn = new SqlConnection("Data Source=LAPTOP-TD5N63QB;Initial Catalog=SQLHandsON;Integrated Security=True");

            string sql = "update Orders set purch_amt=" + purch_amt.Text + " , order_date='" + order_date.Text + "' , customer_id=" + Customer_id.Text + ", salesman_id=" + Salesman_id.Text + "where order_no=" + order_no.Text + "";

            SqlCommand Command = new SqlCommand(sql, Conn);
            Conn.Open();
            Command.ExecuteNonQuery();
            Conn.Close();
           

            // db.UpdateOrders(Convert.ToInt32(order_no.Text), Convert.ToDouble(purch_amt.Text), order_date.Text, Convert.ToInt32( Customer_id.Text), Convert.ToInt32(Salesman_id.Text));
            DataTable dtSalesmanResult = db.GetOrders();
            gvOrderDetails.DataSource = dtSalesmanResult;
            gvOrderDetails.DataBind();
        
        }

        protected void gvOrderDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int number = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {
                DBConnection db = new DBConnection();
                DataTable dt = db.GetOrdersByNumber(number);

                order_no.Text = dt.Rows[0][0].ToString();
                purch_amt.Text = dt.Rows[0][1].ToString();
                order_date.Text = dt.Rows[0][2].ToString();
                Customer_id.Text = dt.Rows[0][3].ToString();
                Salesman_id.Text = dt.Rows[0][4].ToString();

            }
            else if (e.CommandName == "Delete")
            {
                DBConnection db = new DBConnection();
                db.DeleteOrder(number);
              
                DataTable dtSalesmanResult = db.GetOrders();
                gvOrderDetails.DataSource = dtSalesmanResult;
                gvOrderDetails.DataBind();

            }
        }

        protected void gvOrderDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvOrderDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}