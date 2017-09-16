using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopBL;

namespace etnokeramikaWebShop
{
    public partial class eshop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadFooter();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != string.Empty)
                Response.Redirect("~/pretraga?a=" + txtSearch.Text);
        }

        private void loadFooter()
        {
            CustomPageBL customPageBL = new CustomPageBL();

            rptFt1.DataSource = customPageBL.GetCustomPagesForCustomPageCategory(1);
            rptFt1.DataBind();

            rptFt2.DataSource = customPageBL.GetCustomPagesForCustomPageCategory(2);
            rptFt2.DataBind();

            rptFt3.DataSource = customPageBL.GetCustomPagesForCustomPageCategory(3);
            rptFt3.DataBind();

            rptCategories.DataSource = new CategoryBL().GetCategoriesForFooter();
            rptCategories.DataBind();
        }
    }
}