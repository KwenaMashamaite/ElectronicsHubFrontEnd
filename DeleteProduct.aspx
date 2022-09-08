<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="DeleteProduct.aspx.cs" Inherits="ElectronicsHub_FrontEnd.DeleteProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderRight" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="soon">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-lg-8">
                    <div runat="server" id="ProdDetails" class="soon-content text-center">
                        <div class="soon-content-wrapper">
                            <h1 class="soon-title">Delete Product</h1><!-- End .soon-title -->
                            <label runat="server" id="OutcomeMsg"></label>
                            <hr class="mt-2 mb-3 mt-md-3">
                            
                            <div runat="server" id="ConfirmDelContainer">
                                <p runat="server" id="Desc"></p>

                                <div class="input-group mb-5">
                                    <input runat="server" id="ProductId" type="text" class="form-control bg-transparent" placeholder="Enter product id" 
                                        title="A numeric value" pattern="[0-9]+" required="required">
                                    <div class="input-group-append">
                                        <asp:Button runat="server" id="ConfirmButton" class="btn btn-outline-primary-2" type="submit" Text="CONFIRM" OnClick="ConfirmButton_Click">
                                        
                                        </asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End .soon-content-wrapper -->
                    </div><!-- End .soon-content -->
                </div><!-- End .col-md-9 col-lg-8 -->
            </div><!-- End .row -->
        </div><!-- End .container -->
    </div> <!-- End .soon -->
</asp:Content>
