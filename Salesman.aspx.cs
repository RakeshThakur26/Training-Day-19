using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Data;

namespace ASPDOTNETAPP1
{
    public partial class Salesman : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();
            DataTable dtSalesmanResult = db.GetSalesmans();
            gvSalesmanDetails.DataSource = dtSalesmanResult;
            gvSalesmanDetails.DataBind();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
           // Sales.Text = "Thank you " + name.Text;
            DBConnection db = new DBConnection();
            db.InsertDataIntoSalesman(salesman_id.Text,name.Text, city.Text, commission.Text);

            DataTable dtSalesmanResult = db.GetSalesmans();
            gvSalesmanDetails.DataSource = dtSalesmanResult;
            gvSalesmanDetails.DataBind();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();

            db.UpdateSalesman(Convert.ToInt32(salesman_id.Text), name.Text, city.Text, commission.Text);
            
            DataTable Result = db.GetSalesmans();
            gvSalesmanDetails.DataSource = Result;
            gvSalesmanDetails.DataBind();
        }

        protected void gvSalesmanDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int salesmanid = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {
                DBConnection db = new DBConnection();
                DataTable dt = db.GetSalesmanById(salesmanid);
                name.Text = dt.Rows[0][1].ToString();
                city.Text = dt.Rows[0][2].ToString();
                commission.Text = dt.Rows[0][3].ToString();
                salesman_id.Text = dt.Rows[0][0].ToString();
            }
            else if(e.CommandName == "Delete")
            {
                DBConnection db = new DBConnection();
                db.DeleteSalesman(salesmanid);

                DataTable dtSalesmanResult = db.GetSalesmans();
                gvSalesmanDetails.DataSource = dtSalesmanResult;
                gvSalesmanDetails.DataBind();

            }
        }

        protected void gvSalesmanDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {


        }

        protected void gvSalesmanDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}