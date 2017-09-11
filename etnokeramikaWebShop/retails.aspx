<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="retails.aspx.cs" Inherits="etnokeramikaWebShop.frmRetails" %>
<%@ Register Src="~/userControls/Retail.ascx" TagName="Retail" TagPrefix="ws" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 page-content">
        <div class="row">
            <div class="col-md-12">
                <h1 class="heading">Prodajna mesta i distributeri</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!--map-->
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label>Distributer:</label>
                <asp:DropDownList ID="cmbRetail" runat="server" OnSelectedIndexChanged="cmbRetail_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <label>Mesto:</label>
                <asp:DropDownList ID="cmbCity" runat="server" OnSelectedIndexChanged="cmbCity_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="rptRetails" runat="server" OnItemDataBound="rptRetails_ItemDataBound">
                <ItemTemplate>
                        <div class="col-md-3">
                            <ws:Retail runat="server" ID="wsRetail" RetailItem='<%#Container.DataItem %>' />
                        </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceHolderFooter" runat="server">
</asp:Content>
