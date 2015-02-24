using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expenses
{
    public partial class ContactInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveContact_Click(object sender, EventArgs e)
        {
            InsertContact();
        }

        protected void btnSearchContacts_Click(object sender, EventArgs e)
        {
            ContactSearch();
        }

        protected void btnClearContacts_Click(object sender, EventArgs e)
        {

        }

        private void ContactSearch()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString);
            cn.Open();
            SqlCommand cmdGetContacts = new SqlCommand("spContactSearch", cn);
            cmdGetContacts.CommandType = CommandType.StoredProcedure;
            string FullName = tbName.Text;
            

            //cmdGetExpenses.Parameters.AddWithValue("StartDate", String.IsNullOrEmpty(tbStartDateMaintenance.Text) ? (object)DBNull.Value : start);
            //cmdGetExpenses.Parameters.AddWithValue("EndDate", String.IsNullOrEmpty(tbEndDateMaintenance.Text) ? (object)DBNull.Value : end);
            cmdGetContacts.Parameters.AddWithValue("FullName",string.IsNullOrEmpty(FullName)?string.Empty:FullName);
            GridViewContactSearches.Visible = true;
            SqlDataReader rdrS = cmdGetContacts.ExecuteReader();

            GridViewContactSearches.DataSource = rdrS;

            GridViewContactSearches.DataBind();

            cn.Close();
        }

        private void InsertContact()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString);
            cn.Open();
            SqlCommand cmdGetContacts = new SqlCommand("spContactInformationInsert", cn);
            cmdGetContacts.CommandType = CommandType.StoredProcedure;
            string fullName = tbContactName.Text;
            string homePhone = tbPhone.Text;
            string Mobile = tbMobilePhone.Text;
            string Email = tbEmailAddress.Text;
            string physicalAddress = tbAddress.Text;
            cmdGetContacts.Parameters.AddWithValue("FullName", string.IsNullOrEmpty(fullName)? String.Empty:fullName);
            cmdGetContacts.Parameters.AddWithValue("HomePhone", string.IsNullOrEmpty(homePhone) ? String.Empty : homePhone);
            cmdGetContacts.Parameters.AddWithValue("Mobile", string.IsNullOrEmpty(Mobile) ? String.Empty : Mobile);
            cmdGetContacts.Parameters.AddWithValue("Email", string.IsNullOrEmpty(Email) ? String.Empty : Email);
            cmdGetContacts.Parameters.AddWithValue("PhysicalAddress", string.IsNullOrEmpty(physicalAddress) ? String.Empty : physicalAddress);
            cmdGetContacts.Parameters.Add("ContactId", SqlDbType.Int);
            cmdGetContacts.Parameters["ContactId"].Direction = ParameterDirection.Output;
            cmdGetContacts.ExecuteNonQuery();
            lblSaveContact.Text = "Saved";
            cn.Close();
            

        }

        
    }
}