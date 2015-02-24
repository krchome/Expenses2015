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
    public partial class Expenses : System.Web.UI.Page
    {
        int ResourceTypeId = 0;
        int InsuranceTypeId = 0;
        int MaintenanceTypeId = 0;
        string ReferenceNo = string.Empty;
        string CustomerNo = string.Empty;
        decimal InvoiceAmount = 0.0M;
        DateTime InvoiceDate = DateTime.MinValue;
        string Bank = string.Empty;
        string paymentMethod = string.Empty;
        string PolicyNo = string.Empty;
        string PolicyType = string.Empty;
        DateTime StartDate = DateTime.MinValue;
        DateTime ExpiryDate = DateTime.MaxValue;
        string InsuredName = string.Empty;
        string Premium = string.Empty;
        string PaymentType = string.Empty;
        string Comments = string.Empty;
        string WorkDescription = string.Empty;
				
		string InvoiceDetails = string.Empty;
		string Provider = string.Empty;
				
		DateTime DateDone = DateTime.MinValue;
        DateTime NextDue = DateTime.MaxValue;
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
               // ddlMaintenance.AutoPostBack = false;
                PopulateMaintenanceDropDown();
                
            }
        }

        protected void btnSaveResources_Click(object sender, EventArgs e)
        {
            //lblMessage.Text = "You have clicked me!!";

            if (!String.IsNullOrEmpty(tbElectricityCustomerNo.Text))
            {
                ResourceTypeId = 1;
                InsertResource(ResourceTypeId);
               
            }
            if (!String.IsNullOrEmpty(tbTelephoneCustomerNo.Text))
            {
                ResourceTypeId = 2;
                InsertResource(ResourceTypeId);
            }
            if (!String.IsNullOrEmpty(tbWaterCustomerNo.Text))
            {
                ResourceTypeId = 3;
                InsertResource(ResourceTypeId);
            }
            //now clear some fields
            tbInvoiceAmount.Text = string.Empty;
            tbInvoiceAmountTelephone.Text = string.Empty;
            tbInvoiceAmountWater.Text = string.Empty;
            tbInvoiceDate.Text = string.Empty;
            tbInvoiceDateTelephone.Text = string.Empty;
            tbInvoiceDateWater.Text = string.Empty;
           
        }

        private void InsertResource(int resourcetypeID)
        {
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString))
            {
                cn.Open();
                SqlCommand cmdCaseInsert = new SqlCommand("spResourcesDetailsInsert", cn);
                cmdCaseInsert.CommandType = CommandType.StoredProcedure;
                //string ReferenceNo = string.Empty;
               
                switch (resourcetypeID)
                {
                    case 1 ://Electricity
                        ReferenceNo = tbElectricityCustomerNo.Text;
                        InvoiceAmount = (decimal.Parse)(tbInvoiceAmount.Text);
                        InvoiceDate= Convert.ToDateTime(tbInvoiceDate.Text);
                        Bank = rbPayeeBank.SelectedItem.Text;
                        paymentMethod = rbPaymentMethod.SelectedItem.Text;
                        break;
                    case 2://Telephone
                        ReferenceNo = tbTelephoneCustomerNo.Text;
                        InvoiceAmount = (decimal.Parse)(tbInvoiceAmountTelephone.Text);
                        InvoiceDate= Convert.ToDateTime(tbInvoiceDateTelephone.Text);
                        Bank = rbPayeeBankTelephone.SelectedItem.Text;
                        paymentMethod = rbPaymentMethodTelephone.SelectedItem.Text;
                        break;
                    case 3://Water
                        ReferenceNo = tbWaterCustomerNo.Text;
                        InvoiceAmount = (decimal.Parse)(tbInvoiceAmountWater.Text);
                        InvoiceDate= Convert.ToDateTime(tbInvoiceDateWater.Text);
                        Bank = rbPayeeBankWater.SelectedItem.Text;
                        paymentMethod = rbPaymentMethodWater.SelectedItem.Text;
                        break;
                    default:
                        break;
                }
               
                //string PaymentMethod = rbPaymentMethod.SelectedItem.Text;
                cmdCaseInsert.Parameters.AddWithValue("ResourceTypeId", resourcetypeID);
                cmdCaseInsert.Parameters.AddWithValue("ReferenceNo", String.IsNullOrEmpty(ReferenceNo) ? String.Empty : ReferenceNo);
                cmdCaseInsert.Parameters.AddWithValue("InvoiceAmount", String.IsNullOrEmpty(InvoiceAmount.ToString()) ? (object)DBNull.Value : InvoiceAmount);

                cmdCaseInsert.Parameters.AddWithValue("InvoiceDate", String.IsNullOrEmpty(InvoiceDate.ToString()) ? (object)DBNull.Value : (InvoiceDate));
                cmdCaseInsert.Parameters.AddWithValue("Bank", String.IsNullOrEmpty(Bank) ? String.Empty : Bank);
                cmdCaseInsert.Parameters.AddWithValue("PaymentMethod", String.IsNullOrEmpty(paymentMethod) ? String.Empty : paymentMethod);
                cmdCaseInsert.Parameters.Add("ResourceId", SqlDbType.Int);
                cmdCaseInsert.Parameters["ResourceId"].Direction = ParameterDirection.Output;
                cmdCaseInsert.ExecuteNonQuery();
                lblMessage.Text = "Saved to database successfully!";
               
                cn.Close();
               // return Convert.ToInt32(cmdCaseInsert.Parameters["ResourceId"].Value.ToString());
                
            }

        }

        private void InsertInsurance(int insuranceTypeID)
        {
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString))
            {
                cn.Open();
                SqlCommand cmdCaseInsert = new SqlCommand("spInsuranceDetailsInsert", cn);
                cmdCaseInsert.CommandType = CommandType.StoredProcedure;
                //string ReferenceNo = string.Empty;
           
                switch (insuranceTypeID)
                {
                    case 1://Medical 
                            PolicyNo = tbMedicalInsurancePolicyNo.Text;
                          //PolicyNo = tbPo.Empty;
                             PolicyType = tbPolicyTypeMedicalInsurance.Text;
                             StartDate = Convert.ToDateTime(tbStartDateMedicalInsurance.Text);
                             if (!String.IsNullOrEmpty(tbExpiryDateMedicalInsurance.Text))
                             {
                                 ExpiryDate = Convert.ToDateTime(tbExpiryDateMedicalInsurance.Text);
                             }
                             InsuredName = tbInsuredNameMedicalInsurance.Text;
                             Premium = tbPremiumAmountMedicalInsurance.Text;
                             PaymentType = rbPaymentTypeMedicalInsurance.SelectedItem.Text;
                             paymentMethod = rbPaymentMethodMedicalInsurance.SelectedItem.Text;
                             Bank = rbPayeeBankMedicalInsurance.SelectedItem.Text;
                             Comments = tbCommentsMedicalInsurance.Text;
                             //InsertInsurance(insuranceTypeID, cmdCaseInsert); uncomment this line and uncomment InsertInsurance(int insuranceTypeID, SqlCommand cmdCaseInsert) method if it doesnt inserts

                        break;
                    case 2://Life
                            PolicyNo = tbLifeInsurancePolicyNo.Text;
                          //PolicyNo = tbPo.Empty;
                             PolicyType = tbPolicyTypeLifeInsurance.Text;
                             StartDate = Convert.ToDateTime(tbStartDateLifeInsurance.Text);
                             if (!String.IsNullOrEmpty(tbExpiryDateLifeInsurance.Text))
                             {
                                 ExpiryDate = Convert.ToDateTime(tbExpiryDateLifeInsurance.Text);
                             }
                             InsuredName = tbInsuredNameLifeInsurance.Text;
                             Premium = tbPremiumAmountLifeInsurance.Text;
                             PaymentType = rbPaymentTypeLifeInsurance.SelectedItem.Text;
                             paymentMethod = rbPaymentMethodLifeInsurance.SelectedItem.Text;
                             Bank = rbPayeeBankLifeInsurance.SelectedItem.Text;
                             Comments = tbCommentsLifeInsurance.Text;
                             //InsertInsurance(insuranceTypeID, cmdCaseInsert); uncomment this line and uncomment InsertInsurance(int insuranceTypeID, SqlCommand cmdCaseInsert) method if it doesnt inserts
                        break;
                    case 3://Car
                            CustomerNo = tbCarInsuranceCustomerNo.Text;
                            PolicyNo = tbPolicyNoCarInsurance.Text;
                             PolicyType = tbPolicyTypeCarInsurance.Text;
                             StartDate = Convert.ToDateTime(tbStartDateCarInsurance.Text);
                             if (!String.IsNullOrEmpty(tbExpiryDateCarInsurance.Text))
                             {
                                 ExpiryDate = Convert.ToDateTime(tbExpiryDateCarInsurance.Text);
                             }
                             //InsuredName = tbInsuredNameCarInsurance.Text;
                             Premium = tbPremiumAmountCarInsurance.Text;
                             PaymentType = rbPaymentTypeCarInsurance.SelectedItem.Text;
                             paymentMethod = rbPaymentMethodCarInsurance.SelectedItem.Text;
                             Bank = rbPayeeBankCarInsurance.SelectedItem.Text;
                             Comments = tbCommentsCarInsurance.Text;
                             //InsertInsurance(insuranceTypeID, cmdCaseInsert); uncomment this line and uncomment InsertInsurance(int insuranceTypeID, SqlCommand cmdCaseInsert) method if it doesnt inserts
                        break;
                    case 4://House 
                            CustomerNo = tbHouseInsuranceCustomerNo.Text;
                            PolicyNo = tbPolicyNoHouseInsurance.Text;
                            PolicyType = tbPolicyTypeHouseInsurance.Text;
                            StartDate = Convert.ToDateTime(tbStartDateHouseInsurance.Text);
                            if (!String.IsNullOrEmpty(tbExpiryDateHouseInsurance.Text))
                            {
                                ExpiryDate = Convert.ToDateTime(tbExpiryDateHouseInsurance.Text);
                            }
                            //InsuredName = tbInsuredNameHouseInsurance.Text;
                            Premium = tbPremiumAmountHouseInsurance.Text;
                            PaymentType = rbPaymentTypeHouseInsurance.SelectedItem.Text;
                            paymentMethod = rbPaymentMethodHouseInsurance.SelectedItem.Text;
                            Bank = rbPayeeBankHouseInsurance.SelectedItem.Text;
                            Comments = tbCommentsHouseInsurance.Text;
                            // InsertInsurance(insuranceTypeID, cmdCaseInsert); uncomment this line and uncomment InsertInsurance(int insuranceTypeID, SqlCommand cmdCaseInsert) method if it doesnt inserts
                            break;
                    case 5://Content 
                            CustomerNo = tbContentInsuranceCustomerNo.Text;
                            PolicyNo = tbPolicyNoContentInsurance.Text;
                            PolicyType = tbPolicyTypeContentInsurance.Text;
                            StartDate = Convert.ToDateTime(tbStartDateContentInsurance.Text);
                            if (!String.IsNullOrEmpty(tbExpiryDateContentInsurance.Text))
                            {
                                ExpiryDate = Convert.ToDateTime(tbExpiryDateContentInsurance.Text);
                            }
                            //InsuredName = tbInsuredNameContentInsurance.Text;
                            Premium = tbPremiumAmountContentInsurance.Text;
                            PaymentType = rbPaymentTypeContentInsurance.SelectedItem.Text;
                            paymentMethod = rbPaymentMethodContentInsurance.SelectedItem.Text;
                            Bank = rbPayeeBankContentInsurance.SelectedItem.Text;
                            Comments = tbCommentsContentInsurance.Text;
                            // InsertInsurance(insuranceTypeID, cmdCaseInsert); uncomment this line and uncomment InsertInsurance(int insuranceTypeID, SqlCommand cmdCaseInsert) method if it doesnt inserts
                        break;
                    default:
                        break;
                }

                cmdCaseInsert.Parameters.AddWithValue("InsuranceTypeId", insuranceTypeID);
                cmdCaseInsert.Parameters.AddWithValue("CustomerNo", String.IsNullOrEmpty(CustomerNo) ? String.Empty : CustomerNo);
                cmdCaseInsert.Parameters.AddWithValue("PolicyNo", String.IsNullOrEmpty(PolicyNo) ? String.Empty : PolicyNo);
                cmdCaseInsert.Parameters.AddWithValue("PolicyType", String.IsNullOrEmpty(PolicyType) ? String.Empty : PolicyType);
                cmdCaseInsert.Parameters.AddWithValue("StartDate", String.IsNullOrEmpty(StartDate.ToString()) ? (object)DBNull.Value : (StartDate));
                cmdCaseInsert.Parameters.AddWithValue("ExpiryDate", String.IsNullOrEmpty(ExpiryDate.ToString()) ? (object)DBNull.Value : (ExpiryDate));
                cmdCaseInsert.Parameters.AddWithValue("InsuredName", String.IsNullOrEmpty(InsuredName) ? String.Empty : InsuredName);
                cmdCaseInsert.Parameters.AddWithValue("PremiumAmount", String.IsNullOrEmpty(Premium) ? String.Empty : Premium);
                cmdCaseInsert.Parameters.AddWithValue("PaymentType", String.IsNullOrEmpty(PaymentType) ? String.Empty : PaymentType);
                cmdCaseInsert.Parameters.AddWithValue("PaymentMethod", String.IsNullOrEmpty(paymentMethod) ? String.Empty : paymentMethod);
                cmdCaseInsert.Parameters.AddWithValue("Bank", String.IsNullOrEmpty(Bank) ? String.Empty : Bank);
                cmdCaseInsert.Parameters.AddWithValue("Comments", String.IsNullOrEmpty(Comments) ? String.Empty : Comments);
                cmdCaseInsert.Parameters.Add("InsuranceId", SqlDbType.Int);
                cmdCaseInsert.Parameters["InsuranceId"].Direction = ParameterDirection.Output;
                cmdCaseInsert.ExecuteNonQuery();

                lblSaveInsurance.Text = "Saved to database successfully!";

                cn.Close();
                
                // return Convert.ToInt32(cmdCaseInsert.Parameters["ResourceId"].Value.ToString());

            }

        }
        // Uncomment the following method if existing code for insert doesn't work
        //private void InsertInsurance(int insuranceTypeID, SqlCommand cmdCaseInsert)
        //{
        //    cmdCaseInsert.Parameters.AddWithValue("InsuranceTypeId", insuranceTypeID);
        //    cmdCaseInsert.Parameters.AddWithValue("CustomerNo", String.IsNullOrEmpty(CustomerNo) ? String.Empty : CustomerNo);
        //    cmdCaseInsert.Parameters.AddWithValue("PolicyNo", String.IsNullOrEmpty(PolicyNo) ? String.Empty : PolicyNo);
        //    cmdCaseInsert.Parameters.AddWithValue("PolicyType", String.IsNullOrEmpty(PolicyType) ? String.Empty : PolicyType);
        //    cmdCaseInsert.Parameters.AddWithValue("StartDate", String.IsNullOrEmpty(StartDate.ToString()) ? (object)DBNull.Value : (StartDate));
        //    cmdCaseInsert.Parameters.AddWithValue("ExpiryDate", String.IsNullOrEmpty(ExpiryDate.ToString()) ? (object)DBNull.Value : (ExpiryDate));
        //    cmdCaseInsert.Parameters.AddWithValue("InsuredName", String.IsNullOrEmpty(InsuredName) ? String.Empty : InsuredName);
        //    cmdCaseInsert.Parameters.AddWithValue("PremiumAmount", String.IsNullOrEmpty(Premium) ? String.Empty : Premium);
        //    cmdCaseInsert.Parameters.AddWithValue("PaymentType", String.IsNullOrEmpty(PaymentType) ? String.Empty : PaymentType);
        //    cmdCaseInsert.Parameters.AddWithValue("PaymentMethod", String.IsNullOrEmpty(paymentMethod) ? String.Empty : paymentMethod);
        //    cmdCaseInsert.Parameters.AddWithValue("Bank", String.IsNullOrEmpty(Bank) ? String.Empty : Bank);
        //    cmdCaseInsert.Parameters.AddWithValue("Comments", String.IsNullOrEmpty(Comments) ? String.Empty : Comments);
        //    cmdCaseInsert.Parameters.Add("InsuranceId", SqlDbType.Int);
        //    cmdCaseInsert.Parameters["InsuranceId"].Direction = ParameterDirection.Output;
        //    cmdCaseInsert.ExecuteNonQuery();
        //}

        // now insert maintenance 
        private void InsertMaintenance(int maintenancetypeID)
        {
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString))
            {
                cn.Open();
                SqlCommand cmdCaseInsert = new SqlCommand("spMaintenanceDetailsInsert", cn);
                cmdCaseInsert.CommandType = CommandType.StoredProcedure;
               
                        WorkDescription = tbWorkDone.Text;
                        if (!String.IsNullOrEmpty(tbMaintenanceInvoiceAmount.Text))
                        {
                            InvoiceAmount = decimal.Parse(tbMaintenanceInvoiceAmount.Text);
                        }
                        InvoiceDetails = tbMaintenanceInvoiceDetails.Text;
                        Provider = tbProviderAddress.Text;
                        Comments = tbComments.Text;
                        if (!String.IsNullOrEmpty(tbDateDone.Text))
                        {
                            DateDone = Convert.ToDateTime(tbDateDone.Text);
                        }
                        if (!String.IsNullOrEmpty(tbDateDue.Text))
                        {
                            NextDue = Convert.ToDateTime(tbDateDue.Text);
                        }
                cmdCaseInsert.Parameters.AddWithValue("MaintenanceTypeId", maintenancetypeID);
                cmdCaseInsert.Parameters.AddWithValue("WorkDescription", String.IsNullOrEmpty(WorkDescription) ? String.Empty : WorkDescription);
                cmdCaseInsert.Parameters.AddWithValue("InvoiceAmount", String.IsNullOrEmpty(InvoiceAmount.ToString()) ? (object)DBNull.Value : InvoiceAmount);

                cmdCaseInsert.Parameters.AddWithValue("InvoiceDetails", String.IsNullOrEmpty(InvoiceDetails.ToString()) ? String.Empty : InvoiceDetails);
                cmdCaseInsert.Parameters.AddWithValue("Provider", String.IsNullOrEmpty(Provider) ? String.Empty : Provider);
                cmdCaseInsert.Parameters.AddWithValue("Comments", String.IsNullOrEmpty(Comments) ? String.Empty : Comments);
               // cmdCaseInsert.Parameters.AddWithValue("ExpiryDate", String.IsNullOrEmpty(ExpiryDate.ToString()) ? (object)DBNull.Value : (ExpiryDate));
                cmdCaseInsert.Parameters.AddWithValue("DateDone", String.IsNullOrEmpty(DateDone.ToString()) ? (object)DBNull.Value : DateDone);
                cmdCaseInsert.Parameters.AddWithValue("NextDue", String.IsNullOrEmpty(NextDue.ToString()) ? (object)DBNull.Value : NextDue);
                cmdCaseInsert.Parameters.Add("MaintenanceId", SqlDbType.Int);
                cmdCaseInsert.Parameters["MaintenanceId"].Direction = ParameterDirection.Output;
                cmdCaseInsert.ExecuteNonQuery();
                lblMaintMessage.Text = "Saved to database successfully!";

                cn.Close();
                // return Convert.ToInt32(cmdCaseInsert.Parameters["ResourceId"].Value.ToString());

            }

        }



        //end insert maintenance 

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //write code to get the search outputs
            //if (!Page.IsPostBack)
            ExpenseSearch();
        }

        private void ExpenseSearch()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString);
            cn.Open();
            SqlCommand cmdGetExpenses = new SqlCommand("spResourceSearch", cn);
            cmdGetExpenses.CommandType = CommandType.StoredProcedure;
            DateTime startDate = Convert.ToDateTime(String.IsNullOrEmpty(tbStartDate.Text) ? null : tbStartDate.Text);
            string start = String.Format("{0:MM/dd/yyyy}", startDate);
            DateTime endDate = Convert.ToDateTime(String.IsNullOrEmpty(tbEndDate.Text) ? null : tbEndDate.Text); ;
            string end = String.Format("{0:MM/dd/yyyy}", endDate);
            string resource = tbResourceTypeDescription.Text;
            switch (resource)
            {
                case "Electricity":
                    ResourceTypeId = 1;
                    break;
                case "Telephone":
                    ResourceTypeId = 2;
                    break;
                case "Water":
                    ResourceTypeId = 3;
                    break;
                case "":
                    ResourceTypeId = 0;
                    break;
            }
            cmdGetExpenses.Parameters.AddWithValue("ResourceTypeId", ResourceTypeId);
           
            cmdGetExpenses.Parameters.AddWithValue("StartDate", String.IsNullOrEmpty(tbStartDate.Text) ? (object)DBNull.Value : start);
            cmdGetExpenses.Parameters.AddWithValue("EndDate", String.IsNullOrEmpty(tbEndDate.Text) ? (object)DBNull.Value : end);
            
            GridViewSearches.Visible = true;
            SqlDataReader rdrS = cmdGetExpenses.ExecuteReader();
            
            GridViewSearches.DataSource = rdrS;

            GridViewSearches.DataBind();

            cn.Close();
        }

        private void InsuranceSearch()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString);
            cn.Open();
            SqlCommand cmdGetExpenses = new SqlCommand("spInsuranceSearch", cn);
            cmdGetExpenses.CommandType = CommandType.StoredProcedure;
            DateTime startDate = Convert.ToDateTime(String.IsNullOrEmpty(tbStartDate.Text) ? null : tbStartDate.Text);
            string start = String.Format("{0:MM/dd/yyyy}", startDate);
            DateTime endDate = Convert.ToDateTime(String.IsNullOrEmpty(tbEndDate.Text) ? null : tbEndDate.Text); ;
            string end = String.Format("{0:MM/dd/yyyy}", endDate);
            string insurance = tbInsuranceTypeDescription.Text;
            switch (insurance)
            {
                case "Medical":
                    InsuranceTypeId = 1;
                    break;
                case "Life":
                    InsuranceTypeId = 2;
                    break;
                case "Car":
                    InsuranceTypeId = 3;
                    break;
                case "House":
                    InsuranceTypeId = 4;
                    break;
                case "Content":
                    InsuranceTypeId = 5;
                    break;
            }
            cmdGetExpenses.Parameters.AddWithValue("InsuranceTypeId", InsuranceTypeId);

            cmdGetExpenses.Parameters.AddWithValue("StartDate", String.IsNullOrEmpty(tbStartDate.Text) ? (object)DBNull.Value : start);
            cmdGetExpenses.Parameters.AddWithValue("EndDate", String.IsNullOrEmpty(tbEndDate.Text) ? (object)DBNull.Value : end);

            GridViewInsuranceSearches.Visible = true;
            SqlDataReader rdrS = cmdGetExpenses.ExecuteReader();

            GridViewInsuranceSearches.DataSource = rdrS;

            GridViewInsuranceSearches.DataBind();

            cn.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            DataTable ds = new DataTable();
            ds = null;
            GridViewSearches.DataSource = ds;
            GridViewSearches.DataBind();
            lblMessage.Text = string.Empty;
        }

        protected void btnClearInsurance_Click(object sender, EventArgs e)
        {
            DataTable ds = new DataTable();
            ds = null;
            GridViewInsuranceSearches.DataSource = ds;
            GridViewInsuranceSearches.DataBind();
            lblMessage.Text = string.Empty;
        }
        protected void btnSaveInsurance_Click(object sender, EventArgs e)
        {
           
            if(!String.IsNullOrEmpty(tbMedicalInsurancePolicyNo.Text))
            {
                InsuranceTypeId = 1;
                InsertInsurance(InsuranceTypeId);
            }
            if (!String.IsNullOrEmpty(tbLifeInsurancePolicyNo.Text))
            {
                InsuranceTypeId = 2;
                InsertInsurance(InsuranceTypeId);
            } 
            if (!String.IsNullOrEmpty(tbCarInsuranceCustomerNo.Text))
            {
                InsuranceTypeId = 3;
                InsertInsurance(InsuranceTypeId);
            } 
            if (!String.IsNullOrEmpty(tbHouseInsuranceCustomerNo.Text))
            {
                InsuranceTypeId = 4;
                InsertInsurance(InsuranceTypeId);
            } 
            if (!String.IsNullOrEmpty(tbContentInsuranceCustomerNo.Text))
            {
                InsuranceTypeId = 5;
                InsertInsurance(InsuranceTypeId);
            }

        }

        protected void btnSearchInsurance_Click(object sender, EventArgs e)
        {
            InsuranceSearch();
        }

        private void PopulateMaintenanceDropDown()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString);
            cn.Open();
            SqlCommand cmdGetExpenses = new SqlCommand("spGetMaintenanceTypes", cn);
            cmdGetExpenses.CommandType = CommandType.StoredProcedure;
            SqlDataReader rdrS = cmdGetExpenses.ExecuteReader();
            ddlMaintenance.DataSource = rdrS;
            ddlMaintenance.DataValueField = "MaintenanceTypeId";
            ddlMaintenance.DataTextField = "Description";
            ddlMaintenance.DataBind();
            //int id = ddlMaintenance.DataValueField.First();

        }

       

        protected void btnSaveMaintenance_Click(object sender, EventArgs e)
        {
            //MaintenanceTypeId = Convert.ToInt16(ddlMaintenance.SelectedItem.Value);
            Session["MaintenanceTypeId"] = ddlMaintenance.SelectedItem.Value;
            int maintid = Convert.ToInt16(Session["MaintenanceTypeId"].ToString());
            InsertMaintenance(maintid);
        }

        protected void btnSearchMaintenance_Click(object sender, EventArgs e)
        {
            MaintenanceSearch();
        }

        private void MaintenanceSearch()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Expenses"].ConnectionString);
            cn.Open();
            SqlCommand cmdGetExpenses = new SqlCommand("spMaintenanceSearch", cn);
            cmdGetExpenses.CommandType = CommandType.StoredProcedure;
            DateTime startDate = Convert.ToDateTime(String.IsNullOrEmpty(tbStartDate.Text) ? null : tbStartDate.Text);
            string start = String.Format("{0:MM/dd/yyyy}", startDate);
            DateTime endDate = Convert.ToDateTime(String.IsNullOrEmpty(tbEndDate.Text) ? null : tbEndDate.Text); ;
            string end = String.Format("{0:MM/dd/yyyy}", endDate);
            if (tbMaintenanceType.Text == "0")
            {
                MaintenanceTypeId = 0;
            }
            else
            {
                MaintenanceTypeId = Convert.ToInt16(ddlMaintenance.SelectedItem.Value);
            }

            cmdGetExpenses.Parameters.AddWithValue("MaintenanceTypeId", MaintenanceTypeId);

            cmdGetExpenses.Parameters.AddWithValue("StartDate", String.IsNullOrEmpty(tbStartDateMaintenance.Text) ? (object)DBNull.Value : start);
            cmdGetExpenses.Parameters.AddWithValue("EndDate", String.IsNullOrEmpty(tbEndDateMaintenance.Text) ? (object)DBNull.Value : end);

            GridViewMaintenanceSearches.Visible = true;
            SqlDataReader rdrS = cmdGetExpenses.ExecuteReader();

            GridViewMaintenanceSearches.DataSource = rdrS;

            GridViewMaintenanceSearches.DataBind();

            cn.Close();
        }

        


        protected void btnClearMaintenance_Click(object sender, EventArgs e)
        {
            DataTable ds = new DataTable();
            ds = null;
            GridViewMaintenanceSearches.DataSource = ds;
            GridViewMaintenanceSearches.DataBind();
            //lblMessage.Text = string.Empty;
        }


       
    }
}