﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Account.Customer.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderRight" runat="server">
    <div class="dropdown cart-dropdown">
        <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
            <i class="icon-shopping-cart"></i>
            <span class="cart-count">2</span>
        </a>

        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-cart-products">
                <div class="product">
                    <div class="product-cart-details">
                        <h4 class="product-title">
                            <a href="product.html">Beige knitted elastic runner shoes</a>
                        </h4>

                        <span class="cart-product-info">
                            <span class="cart-product-qty">1</span>
                            x $84.00
                        </span>
                    </div><!-- End .product-cart-details -->

                    <figure class="product-image-container">
                        <a href="product.html" class="product-image">
                            <img src="assets/images/products/cart/product-1.jpg" alt="product">
                        </a>
                    </figure>
                    <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                </div><!-- End .product -->

                <div class="product">
                    <div class="product-cart-details">
                        <h4 class="product-title">
                            <a href="product.html">Blue utility pinafore denim dress</a>
                        </h4>

                        <span class="cart-product-info">
                            <span class="cart-product-qty">1</span>
                            x $76.00
                        </span>
                    </div><!-- End .product-cart-details -->

                    <figure class="product-image-container">
                        <a href="product.html" class="product-image">
                            <img src="assets/images/products/cart/product-2.jpg" alt="product">
                        </a>
                    </figure>
                    <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                </div><!-- End .product -->
            </div><!-- End .cart-product -->

            <div class="dropdown-cart-total">
                <span>Total</span>

                <span class="cart-total-price">$160.00</span>
            </div><!-- End .dropdown-cart-total -->

            <div class="dropdown-cart-action">
                <a href="cart.html" class="btn btn-primary">View Cart</a>
                <a href="checkout.html" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
            </div><!-- End .dropdown-cart-total -->
        </div><!-- End .dropdown-menu -->
    </div><!-- End .cart-dropdown -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
