using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ASPDOTNETAPP1
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();
            DataTable Result = db.GetCustomer();
            gvCustomerDetails.DataSource = Result;
            gvCustomerDetails.DataBind();

            if(!IsPostBack)
            {
                DataTable dt = db.GetSalesmanIds();
                Salesman_id.Items.Add("--Choose--");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Salesman_id.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " - " + dt.Rows[i][1], dt.Rows[i][0].ToString()));
                }
            }
           

        }

        protected void CustomerSubmit_Click(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();
            db.InsertDataIntoCustomer(Customer_id.Text, Customer_Name.Text, City.Text,Grade.Text, Salesman_id.Text);

            DataTable Result = db.GetCustomer();
            gvCustomerDetails.DataSource = Result;
            gvCustomerDetails.DataBind();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();

            db.UpdateCustomer(Convert.ToInt32(Customer_id.Text), Customer_Name.Text, City.Text, Grade.Text, Convert.ToInt32(Salesman_id.Text));
            DataTable Result = db.GetCustomer();
            gvCustomerDetails.DataSource = Result;
            gvCustomerDetails.DataBind();
        }

        protected void gvCustomerDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int customerid = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {
                DBConnection db = new DBConnection();
                DataTable dt = db.GetCustomerById(customerid);

                Customer_id.Text = dt.Rows[0][0].ToString();
                Customer_Name.Text = dt.Rows[0][1].ToString();
                City.Text = dt.Rows[0][2].ToString();
                Grade.Text = dt.Rows[0][3].ToString();
                Salesman_id.Text = dt.Rows[0][4].ToString();
               
            }
            else if (e.CommandName == "Delete")
            {
                DBConnection db = new DBConnection();
                db.DeleteCustomer(customerid);

                DataTable Result = db.GetCustomer();
                gvCustomerDetails.DataSource = Result;
                gvCustomerDetails.DataBind();

            }
        }

        protected void gvCustomerDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvCustomerDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            Customer_id.Text = string.Empty;
            Customer_Name.Text = string.Empty;
            Grade.Text = string.Empty;
            City.Text = string.Empty;

        }
    }
}