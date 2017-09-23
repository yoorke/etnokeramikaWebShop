<%@ Page Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="orderSuccessful.aspx.cs" Inherits="etnokeramikaWebShop.orderSuccessful" Title="Narudžbina uspešno prosleđena | Webshop" %>
<%@ Register Src="userControls/Banner.ascx" TagName="Banner" TagPrefix="banner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%=ResolveUrl("~/css/mainMenuVerticalV1.min.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--<div class="bannerColumn">
        <div class="banner"></div>
    </div>
    <div class="checkout">
        <div class="heading">Narudžbina uspešno prosleđena</div>
        <p class="description">
            Vaša narudžbina je uspešno prosleđena. Uskoro ćete primiti potvrdu na Vašu e-mail adresu sa detaljnim informacijama.
        </p>
    </div>
    <div class="bannerColumn">
        <div class="banner"></div>
    </div>-->
    
    <%--<div class="col-xs-2 left-column visible-md visible-lg">
        <banner:Banner ID="banner1" runat="server" Position="FP1" />
        <banner:Banner ID="banner2" runat="server" Position="FP2" />
    </div><!--col-->--%>
    
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center margin-top-1 margin-bottom-1 alert alert-success">
        <span>Vaša narudžbina je uspešno prosleđena. Uskoro ćete primiti potvrdu na Vašu email adresu sa detaljnim informacijama.</span>
    </div>

</asp:Content>
