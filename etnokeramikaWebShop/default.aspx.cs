﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopBL;
using etnokeramikaWebShop.userControls;
using System.Web.UI.HtmlControls;

namespace etnokeramikaWebShop
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                loadCategories();
                loadPromotions();
                //Page.Header.DataBind();
            }
            insertFacebookTags();
        }

        private void loadCategories()
        {
            rptCategories.DataSource = new CategoryBL().GetCategoriesForFirstPage();
            rptCategories.DataBind();
        }

        private void loadPromotions()
        {
            rptPromotions.DataSource = new PromotionBL().GetPromotions(false, true, false);
            rptPromotions.DataBind();
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

        private void insertFacebookTags()
        {
            List<HtmlMeta> tags = new FacebookHandler().CreateFacebookTags("Etnokeramika - ručno pravljeno keramičko posuđe",
                                                                           "website", "https://www.etnokeramika.com",
                                                                           "https://www.etnokeramika.com/images/etnokeramika.jpg",
                                                                           "Etnokeramika - ručno pravljeno keramičko posuđe",
                                                                           "Na našim stranicama ćete pronaći sve ono što vam je" +
                                                                           " neophodno za pripremanje hrane po starim i tradicionalnim" +
                                                                           " receptima. Osim što je ukus jela pripremljenih u keramičkom" +
                                                                           " posuđu nemerljiv u poređenju sa jelima pripremljenim u" +
                                                                           " posuđu od veštačkih materijala, ne treba zaboraviti činjenicu" +
                                                                           " koliko dugo hrana čuvana u keramici ostaje topla i sveža." +
                                                                           " Naše posuđe osim unikatnih, ručno iscrtanih motiva," +
                                                                           " pleni kvalitetnom glazurom kao važnim momentom" +
                                                                           " koji ovim predmetima i poduđu daje trajnost.",
                                                                           "https://www.etnokeramika.com");

            foreach (HtmlMeta tag in tags)
                Header.Controls.Add(tag);
        }

        protected void rptPromotions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                product_slider productSlider = (product_slider)e.Item.FindControl("psPromotion");
                productSlider.NumberOfProducts = 4;
                productSlider.LgCols = 3;
                productSlider.Products = new ProductBL().GetProductsForPromotion(int.Parse(((HiddenField)e.Item.FindControl("lblPromotionID")).Value));
                ((Literal)productSlider.FindControl("lblPrev")).Text = @"<a id=""prev"" runat=""server"" href=" + "#carousel" + ((HiddenField)e.Item.FindControl("lblPromotionID")).Value + @" data-slide=""prev""><span class='fa fa-fw fa-chevron-circle-left direction-icon'></span></a>";
                ((Literal)productSlider.FindControl("lblNext")).Text = @"<a id=""next"" runat=""server"" href=" + "#carousel" + ((HiddenField)e.Item.FindControl("lblPromotionID")).Value + @" data-slide=""next""><span class='fa fa-fw fa-chevron-circle-right direction-icon'></span></a>";
                ((Literal)productSlider.FindControl("lblCarousel")).Text = @"<div id=" + "carousel" + ((HiddenField)e.Item.FindControl("lblPromotionID")).Value + @" class=""carousel slide"" data-ride="""" runat=""server"">";
                ((Literal)productSlider.FindControl("lblCarouselClose")).Text = "</div>";
            }
        }
    }
}