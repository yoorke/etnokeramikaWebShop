﻿<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="etnokeramikaWebShop._default" %>
<%@ Register Src="~/userControls/MainMenuVerticalV2.ascx" TagName="MainMenuVerticalV2" TagPrefix="ws" %>
<%@ Register Src="~/userControls/Slider.ascx" TagName="Slider" TagPrefix="ws" %>
<%@ Register Src="~/userControls/Banner.ascx" TagName="Banner" TagPrefix="ws" %>
<%@ Register Src="~/userControls/product_slider.ascx" TagName="ProductSlider" TagPrefix="ws" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%# ResolveUrl("~/css/mainMenuVerticalV2.min.css") %>" rel="stylesheet" />
    <link href="<%# ResolveUrl("/css/camera_bundle.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-3 padding-left-0 padding-right-0">
            <ws:MainMenuVerticalV2 ID="mainMenuVertical" runat="server" />
        </div>
        <div class="col-md-9">
            <ws:Slider ID="slider" runat="server" SliderID="14" />
        </div>
    </div>
    <div class="row">
        <%--<div class="col-md-4 padding-left-0 padding-right-0">
            <ws:Banner ID="banner1" runat="server" Position="FP1" />
        </div>
        <div class="col-md-4 padding-left-0 padding-right-0">
            <ws:Banner ID="banner2" runat="server" Position="FP2" />
        </div>
        <div class="col-md-4 padding-left-0 padding-right-0">
            <ws:Banner ID="banner3" runat="server" Position="FP3" />
        </div>--%>
    </div>
    <div class="row">
        <%--<div class="col-md-12 padding-left-0 padding-right-0">
            <ws:Banner ID="banner4" runat="server" Position="FP4" />
        </div>--%>
    </div>
    <div class="row fp-description">
        <div class="col-md-12">
            <p>
                Na našim stranicama ćete pronaći sve ono što vam je neophodno za pripremanje hrane po starim i tradicionalnim receptima.
                Osim što je ukus jela pripremljenih u keramičkom posuđu nemerljiv u poređenju sa jelima pripremljenim u posuđu od veštačkih materijala,
                ne treba zaporaviti činjenicu koliko dugo hrana čuvana u keramici ostaje topla i sveža.
                Naše posuđe, osim unikatnih, ručno iscrtanih motiva, pleni kvalitetnom glazurom kao važnim momentom koji ovim predmetima i posuđu daje trajnost.
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Repeater ID="rptPromotions" runat="server" OnItemDataBound="rptPromotions_ItemDataBound">
                <ItemTemplate>
                    <asp:HiddenField ID="lblPromotionID" runat="server" Value='<%#Eval("promotionID") %>' />
                    <%--<asp:HiddenField ID="lblNumberOfProducts" runat="server" Value='<%#Eval("numberOfProducts") %>' />--%>
                    <%--<asp:HiddenField ID="lblFirstPageOrderBy" runat="server" Value='<%#Eval("firstPageOrderBy") %>' />--%>
                    <ws:ProductSlider ID="psPromotion" runat="server" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
                <ItemTemplate>
                    <asp:HiddenField ID="lblCategoryID" runat="server" Value='<%#Eval("categoryID") %>' />
                    <asp:HiddenField ID="lblNumberOfProducts" runat="server" Value='<%#Eval("numberOfProducts") %>' />
                    <asp:HiddenField ID="lblFirstPageOrderBy" runat="server" Value='<%#Eval("firstPageOrderBy") %>' />
                    <ws:ProductSlider ID="psCategory" runat="server" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceHolderFooter" runat="server">
    <script src="<%=ResolveUrl("~/js/mainMenuVerticalV2Start.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/slider.min.js") %>" type="text/javascript"></script>

    <%--<script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        })
    </script>--%>
</asp:Content>
