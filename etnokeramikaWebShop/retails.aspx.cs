using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopBL;

namespace etnokeramikaWebShop
{
    public partial class frmRetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                loadIntoForm();
                loadRetails();
            }
        }

        protected void cmbRetail_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadRetails();
        }

        protected void cmbCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadRetails();
        }

        private void loadIntoForm()
        {
            cmbRetail.DataSource = new RetailBL().GetDistinct(true);
            //cmbRetail.DataTextField = "Name";
            //cmbRetail.DataValueField = "RetailID";
            cmbRetail.DataBind();

            cmbCity.DataSource = new CityBL().GetCities(true);
            cmbCity.DataTextField = "Name";
            cmbCity.DataValueField = "CityID";
            cmbCity.DataBind();
        }

        private void loadRetails()
        {
            int cityID = cmbCity.SelectedIndex > -1 ? int.Parse(cmbCity.SelectedValue) : -1;
            string retailName = cmbRetail.SelectedIndex > 0 ? cmbRetail.Text : string.Empty;

            rptRetails.DataSource = new RetailBL().GetRetails(cityID, retailName, false);
            rptRetails.DataBind();
        }

        protected void rptRetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ((userControls.Retail)e.Item.FindControl("wsRetail")).ShowRetail();
            }
        }
    }
}