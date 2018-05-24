<%@ Page Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="etnokeramikaWebShop.product" Title="Untitled Page" %>
<%@ Register Src="userControls/ProductImages.ascx" TagName="ProductImages" TagPrefix="uc1" %>
<%@ Register Src="userControls/Banner.ascx" TagName="Banner" TagPrefix="banner" %>
<%@ Register Src="userControls/product_slider.ascx" TagName="productSlider" TagPrefix="productSlider" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--<script type="text/javascript" src="/js/jquery-1.10.1.min.js"></script>-->
    <link rel="stylesheet" type="text/css" media="all" href="<%=ResolveUrl("/css/lightbox.min.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/css/mainMenuVerticalV1.min.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--BANNER-->
    <%--<div class="col-xs-2 left-column visible-lg visible-md">
        <banner:Banner ID="banner1" runat="server" Position="FP1" />
        <banner:Banner ID="banner2" runat="server" Position="FP2" />
    </div><!--col-banner-->--%>
            
    <!--MAIN CONTENT-->
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 product">
        <!--images, name, price-->
        <div class="row">
            <div class="col-sm-5">
                <div class="nis-cont" id="divNis" runat="server" style="display:none">
                    <span class="nis-label">Nema na stanju</span>
                </div>
                <uc1:ProductImages ID="priProductImages" runat="server" />
                <asp:Image ID="imgPromotion" runat="server" Visible="false" CssClass="imgPromotion" />
            </div><!--col-->
            <div class="col-sm-7">
                <div id="imgZoom" class="img-zoom"></div>
                <asp:HiddenField ID="lblProductID" runat="server" />
                <h1><asp:Literal ID="lblBrand" runat="server"></asp:Literal></h1>
                <h2><asp:Literal ID="lblName" runat="server"></asp:Literal></h2>
                <p>Pogledajte i ostale proizvode iz kategorije <asp:HyperLink ID="lnkCategory" runat="server" CssClass="underline"></asp:HyperLink></p>
                
                <!--Kredit i rate-->
                <div class="row box-content box-content-primary" id="loanBox" runat="server">
                    <div class="col-sm-1">
                        <img src='<%=Page.ResolveUrl("~/images/loan.gif") %>' />
                    </div>
                    <div class="col-sm-4">
                        
                        <span><label onclick="loan()" class="cursor-pointer bold-none">Prijavite se za beskamatni kredit</label></span>
                    </div>
                    <div class="col-sm-1">
                        <img src='<%=Page.ResolveUrl("~/images/calculator.gif") %>' />
                    </div>
                    <div class="col-sm-3">
                        <span><label onclick="calculateLoan()" class="cursor-pointer bold-none">Izračunajte vašu ratu</label></span>
                    </div>
                    <div class="col-sm-3">
                        Rata već od <span class="color-red">3.688,55</span> din
                    </div>
                </div><!--row-kredit-i-rate-->
                
                <div class="row box-content box-content-secondary">
                    <div class="col-sm-6">
                        <p>Šifra: <asp:Label ID="lblCode" runat="server"></asp:Label></p>
                        <p>Dostupnost:</p>
                        <p class="bold uppercase"><asp:Literal ID="txtAvailability" runat="server" Text="Na stanju"></asp:Literal></p>
                        <p class="margin-top-2">Očekivani rok isporuke:</p>
                        <p class="bold"><asp:Literal ID="txtDelivery" runat="server" Text="do 2 dana"></asp:Literal></p>
                    </div>
                    <div class="col-sm-6 text-right">
                        <div class="price-div"><p class="margin-bottom-0" id="priceDiv" runat="server"><asp:Label ID="lblPrice" runat="server" Text="MP 110.989 din"></asp:Label><span class="price-label"></span></p></div>
                        <div class="web-price-div"><p class="web-price margin-bottom-0" id="webPriceDiv" runat="server"><asp:Label ID="lblWebPrice" runat="server" Text="99.890 din"></asp:Label><span class="web-price-label"> RSD</span></p></div>
                        <div class="saving-div"><p id="savingDiv" runat="server"><asp:Label ID="lblSaving" runat="server" Text="Ušteda: 2.548,00 din"></asp:Label><span class="saving-label"></span></p></div>
                        <!--<asp:Button ID="btnCart" runat="server" CssClass="btnAddToCart" Text="Dodaj u korpu" OnClick="btnCart_Click" />-->
                        <button type="button" id="btnCartAjax" class="ws-btn btn-cart" runat="server"><span class="fa fa-fw fa-shopping-cart"></span><span>Dodaj u korpu</span></button>
                    </div>
                </div><!--row-->
                <div class="row icons margin-top-05">
                    <%--<div class="col-xs-1">--%>
                        <%--<img src='<%=Page.ResolveUrl("~/images/compare.gif") %>' />--%>
                        
                    <%--</div>--%>
                    <div class="col-xs-4 text-center"><!--<asp:LinkButton ID="btnCompare" runat="server" Text="Uporedi" OnClientClick="btnCompare_Click('<%=lblProductID.ClientID %>')"></asp:LinkButton>-->
                        <!--<button type="button" id="btnCompare" onclick="btnCompare_Click('<%=lblProductID.ClientID %>')">Uporedi</button>-->
                        <button type="button" onclick="AddToCompare(event, '<%=lblProductID.ClientID %>')" class="ws-btn btn-icon"><span class="fa fa-fw fa-balance-scale"></span></button>

                    </div>
                    <%--<div class="col-xs-1">--%>
                        <%--<img src='<%=Page.ResolveUrl("~/images/wishlist.gif") %>' />--%>
                        
                    <%--</div>--%>
                    <div class="col-xs-4 text-center">
                        <button type="button" onclick="AddToWishList()" class="ws-btn btn-icon"><span class="fa fa-fw fa-heart"></span></button>
                    </div>
                    <%--<div class="col-xs-1">--%>
                        <%--<img src='<%=Page.ResolveUrl("~/images/recommend.gif") %>' />--%>
                        
                    <%--</div>--%>
                    <div class="col-xs-4 text-center"><label onclick="recommend()" class="cursor-pointer bold-none"><span class="fa fa-fw fa-envelope"></span></label></div>
                </div><!--row-->
                <div class="row margin-top-2">
                    <div class="col-lg-12 text-right">
                        <div id="lblProductFacebookLike" runat="server"></div>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-lg-12">
                        Redovna cena: <asp:Label ID="lblPrice1" runat="server" CssClass="regular"></asp:Label> din<br />
                        Web cena: <asp:Label ID="lblWebPrice1" runat="server" CssClass="web"></asp:Label> din<br />
                        Ušteda: <asp:Label ID="lblSaving1" runat="server" CssClass="saving"></asp:Label> din
                
                    </div><!--col-->
                </div><!--row-->
        <div class="row">
            <asp:LinkButton ID="btnCart" runat="server" CssClass="button" OnClick="btnCart_Click">Ubaci u korpu</asp:LinkButton>
        </div>--%>
            </div><!--col-->
        </div><!--row-->
        
        
        <!--description-->
        <div class="row">
            <div class="col-lg-12">
                <h3>Opis</h3>
                <asp:Literal ID="lblDescription" runat="server"></asp:Literal>
            </div><!--col-->
        </div><!--row-->

        <div class="row margin-top-1" id="divUputstvo" runat="server">
            <div class="col-md-12">
                <span class="fa fa-fw fa-newspaper-o"></span>
                <a href="/uputstvo-za-koriscenje-posudja">Uputstvo za korišćenje.</a>
            </div>
        </div>
        
        <!--specification-->
        <div class="row">
            <div class="col-lg-8 specification">
                <h3>Specifikacije i detalji</h3>
                <asp:Literal ID="lblSpecification" runat="server"></asp:Literal>
            </div><!--col-->
            <div class="col-lg-4" style="background-color:#eee">

            </div>
        </div><!--row-->
        <div class="row product_slider">
            <div class="col-lg-12">
                <productSlider:productSlider ID="sliderCategory" runat="server" />
            </div>
        </div>
    </div><!--col main-->
    <div class="messageBoxWrapper" id="wishListMessageBox" style="display:none">
        <div class="messageBox" id="wishListMessageBoxText">
            <span>Proizvod dodat u listu želja</span>
            <div>
                <button type="button" id="btnWishListMessageBoxOk" onclick="WishListMessageBoxOk_Click()">Zatvori</button>
                <button type="button" id="btnWishListShowList" onclick="window.location='/wishList.aspx'">Prikaži listu</button>
            </div>
        </div>
        
    </div><!--messageBox-->
    
    
    <%--<div class="bannerColumn">
        <div class="banner"></div>    
    </div>
    
    <div class="productColumn">
        <div class="productBox">
            <div class="images">
                
            </div>
            
            <div class="description"></asp:Literal></div>
            <div class="prices">
                
            </div>
            <div class="cartButton">
                
            </div>
        </div>
        
        
        <div id="tabsContainer">
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1">Specifikacija</li>
                <li class="tab-link" data-tab="tab-2">Opis</li>
            </ul>
            
            <div id="tab-1" class="tab-content current">
                <div class="specification">
                    <h2>Specifikacija</h2>
                    
                </div>
            </div>
            <div id="tab-2" class="tab-content">
                
            </div>
        </div>--%>
        <%--<ajaxtoolkit:ToolkitScriptManager ID="toolkitScriptManager1" runat="server" EnablePartialRendering="true"></ajaxtoolkit:ToolkitScriptManager>
        <ajaxtoolkit:TabContainer ID="tabContainer1" runat="server" Width="640px">
            <ajaxtoolkit:TabPanel ID="tbpSpecification" runat="server" HeaderText="Specifikacija">
                <ContentTemplate>
                    
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
            <ajaxtoolkit:TabPanel ID="tbpDescription" runat="server" HeaderText="Opis">
                <ContentTemplate>
                    <asp:Literal runat="server"></asp:Literal>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
        </ajaxtoolkit:TabContainer>--%>
        
    <%--</div>--%>
    
    <%--<div class="bannerColumn">
        <div class="banner"></div>
    </div>--%>
    
    
    

    <%--<script type="text/javascript">
        $(document).ready(function() {
            $('ul.tabs li').click(function(){
                                        var tab_id=$(this).attr('data-tab');
                                        $('ul.tabs li').removeClass('current');
                                        $('.tab-content').removeClass('current');
                                        $(this).addClass('current');
                                        $("#"+tab_id).addClass('current');
                                    })
        });
    </script>--%>
    <%--</span>
    </label>--%>
</asp:Content>

    <asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolderFooter">
    <script type="text/javascript" src="/js/lightbox.min.js"></script>
    <script src="/js/productImageZoom.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        //jQuery(function() {
            //jQuery('#thumbnails a').lightBox();
        //});
</script>
</asp:Content>