using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopBL;
using etnokeramikaWebShop.userControls;

namespace etnokeramikaWebShop
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                loadCategories();
            }
        }

        private void loadCategories()
        {
            rptCategories.DataSource = new CategoryBL().GetCategoriesForFirstPage();
            rptCategories.DataBind();
        }

        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                product_slider productSlider = (product_slider)e.Item.FindControl("psCategory");
                productSlider.NumberOfProducts = 4;
                productSlider.LgCols = 3;
                productSlider.Products = new ProductBL().GetProductsForFirstPage(int.Parse(((HiddenField)e.Item.FindControl("lblCategoryID")).Value), -1, int.Parse(((HiddenField)e.Item.FindControl("lblNumberOfProducts")).Value), ((HiddenField)e.Item.FindControl("lblFirstPageOrderBy")).Value);
                ((Literal)productSlider.FindControl("lblPrev")).Text = @"<a id=""prev"" runat=""server"" href=" + "#carousel" + ((HiddenField)e.Item.FindControl("lblCategoryID")).Value + @" data-slide=""prev""><span class='fa fa-fw fa-chevron-circle-left direction-icon'></span></a>";
                ((Literal)productSlider.FindControl("lblNext")).Text = @"<a id=""next"" runat=""server"" href=" + "#carousel" + ((HiddenField)e.Item.FindControl("lblCategoryID")).Value + @" data-slide=""next""><span class='fa fa-fw fa-chevron-circle-right direction-icon'></span></a>";
                ((Literal)productSlider.FindControl("lblCarousel")).Text = @"<div id=" + "carousel" + ((HiddenField)e.Item.FindControl("lblCategoryID")).Value + @" class=""carousel slide"" data-ride="""" runat=""server"">";
                ((Literal)productSlider.FindControl("lblCarouselClose")).Text = "</div>";
            }
        }
    }
}