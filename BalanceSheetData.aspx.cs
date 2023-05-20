using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class FAMS_Master_BalanceSheetData : System.Web.UI.Page
{
    BAL_EmployeeLevelAccess EmployeeLevelBAL = new BAL_EmployeeLevelAccess();
    Message msg = new Message();
    BAL_FA_LedgerMapping Notes = new BAL_FA_LedgerMapping();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fill_company();
            fill_Finance_year();
          
        }
    }


    protected void fill_company()
    {
        DDLCompanyName.Items.Clear();
        DataTable dtCompany = EmployeeLevelBAL.LoadEmployeeCompanyAccess(Session["LogIn_Code"].ToString());
        DDLCompanyName.DataSource = dtCompany;
        DDLCompanyName.DataTextField = "Comp_Name";
        DDLCompanyName.DataValueField = "Comp_Code";
        DDLCompanyName.DataBind();
        DDLCompanyName.Items.Insert(0, new ListItem("Select Company Name", "0"));
    }




    protected void fill_Finance_year()
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(DateTime.Now);
        ArrayList Year = new ArrayList();
        Year.Add(Convert.ToString(dtm.Year) + "-" + Convert.ToString(dtm.Year + 1));
        Year.Add(Convert.ToString(dtm.Year + 1) + "-" + Convert.ToString(dtm.Year + 2));
        ddlFinanceYear.DataSource = Year;
        ddlFinanceYear.DataBind();
        ddlFinanceYear.Items.Insert(0, new ListItem("Select Finance Year", "0"));
       
    }


    protected void btnSave_Click1(object sender, EventArgs e)
    {

    }
    protected void btnUpdate_Click1(object sender, EventArgs e)
    {

    }
    protected void fill_note()
    {

        DataTable dt = Notes.SELECT_BS_NOTES(ddlFinanceYear.SelectedValue, DDLCompanyName.SelectedValue);

 
                GVBalance.DataSource = dt;
                GVBalance.DataBind();
                ErrorContainer.Visible = false;
                GVBalance.Visible = true;

        }



    protected void ddlFinanceYear_SelectedIndexChanged(object sender, EventArgs e)
    {
         fill_note();
    }
}