﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ElectonicsHub.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="main">
        <div class="intro-slider-container mb-5">
            <div class="intro-slider owl-carousel owl-theme owl-nav-inside owl-light" data-toggle="owl" 
                data-owl-options='{
                    "dots": true,
                    "nav": false, 
                    "responsive": {
                        "1200": {
                            "nav": true,
                            "dots": false
                        }
                    }
                }'>
                <div class="intro-slide" style="background-image: url(assets/images/demos/demo-4/slider/slide-1.png);">
                    <div class="container intro-content">
                        <div class="row justify-content-end">
                            <div class="col-auto col-sm-7 col-md-6 col-lg-5">
                                <h3 class="intro-subtitle text-third">Deals and Promotions</h3><!-- End .h3 intro-subtitle -->
                                <h1 class="intro-title">Beats by</h1>
                                <h1 class="intro-title">Dre Studio 3</h1><!-- End .intro-title -->

                                <div class="intro-price">
                                    <sup class="intro-old-price">R349,95</sup>
                                    <span class="text-third">
                                        R279<sup>.99</sup>
                                    </span>
                                </div><!-- End .intro-price -->

                                <a href="category.html" class="btn btn-primary btn-round">
                                    <span>Shop More</span>
                                    <i class="icon-long-arrow-right"></i>
                                </a>
                            </div><!-- End .col-lg-11 offset-lg-1 -->
                        </div><!-- End .row -->
                    </div><!-- End .intro-content -->
                </div><!-- End .intro-slide -->

                <div class="intro-slide" style="background-image: url(assets/images/demos/demo-4/slider/slide-2.png);">
                    <div class="container intro-content">
                        <div class="row justify-content-end">
                            <div class="col-auto col-sm-7 col-md-6 col-lg-5">
                                <h3 class="intro-subtitle text-primary">New Arrival</h3><!-- End .h3 intro-subtitle -->
                                <h1 class="intro-title">Apple iPad Pro <br>12.9 Inch, 64GB </h1><!-- End .intro-title -->

                                <div class="intro-price">
                                    <sup>Today:</sup>
                                    <span class="text-primary">
                                        R999<sup>.99</sup>
                                    </span>
                                </div><!-- End .intro-price -->

                                <a href="category.html" class="btn btn-primary btn-round">
                                    <span>Shop More</span>
                                    <i class="icon-long-arrow-right"></i>
                                </a>
                            </div><!-- End .col-md-6 offset-md-6 -->
                        </div><!-- End .row -->
                    </div><!-- End .intro-content -->
                </div><!-- End .intro-slide -->
            </div><!-- End .intro-slider owl-carousel owl-simple -->

            <span class="slider-loader"></span><!-- End .slider-loader -->
        </div><!-- End .intro-slider-container -->

        <div class="container">
            <h2 class="title text-center mb-4">Explore Popular Categories</h2><!-- End .title text-center -->
                
            <div class="cat-blocks-container">
                <div class="row">
                    <div class="col-6 col-sm-4 col-lg-2">
                        <a href="category.html" class="cat-block">
                            <figure>
                                <span>
                                    <img src="assets/images/demos/demo-4/cats/1.png" alt="Category image">
                                </span>
                            </figure>

                            <h3 class="cat-block-title">Computer & Laptop</h3><!-- End .cat-block-title -->
                        </a>
                    </div><!-- End .col-sm-4 col-lg-2 -->

                    <div class="col-6 col-sm-4 col-lg-2">
                        <a href="category.html" class="cat-block">
                            <figure>
                                <span>
                                    <img src="assets/images/demos/demo-4/cats/2.png" alt="Category image">
                                </span>
                            </figure>

                            <h3 class="cat-block-title">Digital Cameras</h3><!-- End .cat-block-title -->
                        </a>
                    </div><!-- End .col-sm-4 col-lg-2 -->

                    <div class="col-6 col-sm-4 col-lg-2">
                        <a href="category.html" class="cat-block">
                            <figure>
                                <span>
                                    <img src="assets/images/demos/demo-4/cats/3.png" alt="Category image">
                                </span>
                            </figure>

                            <h3 class="cat-block-title">Smart Phones</h3><!-- End .cat-block-title -->
                        </a>
                    </div><!-- End .col-sm-4 col-lg-2 -->

                    <div class="col-6 col-sm-4 col-lg-2">
                        <a href="category.html" class="cat-block">
                            <figure>
                                <span>
                                    <img src="assets/images/demos/demo-4/cats/4.png" alt="Category image">
                                </span>
                            </figure>

                            <h3 class="cat-block-title">Televisions</h3><!-- End .cat-block-title -->
                        </a>
                    </div><!-- End .col-sm-4 col-lg-2 -->

                    <div class="col-6 col-sm-4 col-lg-2">
                        <a href="category.html" class="cat-block">
                            <figure>
                                <span>
                                    <img src="assets/images/demos/demo-4/cats/5.png" alt="Category image">
                                </span>
                            </figure>

                            <h3 class="cat-block-title">Audio</h3><!-- End .cat-block-title -->
                        </a>
                    </div><!-- End .col-sm-4 col-lg-2 -->

                    <div class="col-6 col-sm-4 col-lg-2">
                        <a href="category.html" class="cat-block">
                            <figure>
                                <span>
                                    <img src="assets/images/demos/demo-4/cats/6.png" alt="Category image">
                                </span>
                            </figure>

                            <h3 class="cat-block-title">Smart Watches</h3><!-- End .cat-block-title -->
                        </a>
                    </div><!-- End .col-sm-4 col-lg-2 -->
                </div><!-- End .row -->
            </div><!-- End .cat-blocks-container -->
        </div><!-- End .container -->

        <div class="mb-4"></div><!-- End .mb-4 -->

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="banner banner-overlay banner-overlay-light">
                        <a href="#">
                            <img src="assets/images/demos/demo-4/banners/banner-1.png" alt="Banner">
                        </a>

                        <div class="banner-content">
                            <h4 class="banner-subtitle"><a href="#">Smart Offer</a></h4><!-- End .banner-subtitle -->
                            <h3 class="banner-title"><a href="#">Save R150 <strong>on Samsung <br>Galaxy Note9</strong></a></h3><!-- End .banner-title -->
                            <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                        </div><!-- End .banner-content -->
                    </div><!-- End .banner -->
                </div><!-- End .col-md-4 -->

                <div class="col-md-6 col-lg-4">
                    <div class="banner banner-overlay banner-overlay-light">
                        <a href="#">
                            <img src="assets/images/demos/demo-4/banners/banner-2.jpg" alt="Banner">
                        </a>

                        <div class="banner-content">
                            <h4 class="banner-subtitle"><a href="#">Time Deals</a></h4><!-- End .banner-subtitle -->
                            <h3 class="banner-title"><a href="#"><strong>Bose SoundSport</strong> <br>Time Deal -30%</a></h3><!-- End .banner-title -->
                            <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                        </div><!-- End .banner-content -->
                    </div><!-- End .banner -->
                </div><!-- End .col-md-4 -->

                <div class="col-md-6 col-lg-4">
                    <div class="banner banner-overlay banner-overlay-light">
                        <a href="#">
                            <img src="assets/images/demos/demo-4/banners/banner-3.png" alt="Banner">
                        </a>

                        <div class="banner-content">
                            <h4 class="banner-subtitle"><a href="#">Clearance</a></h4><!-- End .banner-subtitle -->
                            <h3 class="banner-title"><a href="#"><strong>GoPro - Fusion 360</strong> <br>Save R70</a></h3><!-- End .banner-title -->
                            <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                        </div><!-- End .banner-content -->
                    </div><!-- End .banner -->
                </div><!-- End .col-lg-4 -->
            </div><!-- End .row -->
        </div><!-- End .container -->

        <div class="mb-3"></div><!-- End .mb-5 -->

        <div class="container new-arrivals">
            <div class="heading heading-flex mb-3">
                <div class="heading-left">
                    <h2 class="title">New Arrivals</h2><!-- End .title -->
                </div><!-- End .heading-left -->

                <div class="heading-right">
                    <ul class="nav nav-pills nav-border-anim justify-content-center" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="new-all-link" data-toggle="tab" href="#new-all-tab" role="tab" aria-controls="new-all-tab" aria-selected="true">All</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="new-tv-link" data-toggle="tab" href="#new-tv-tab" role="tab" aria-controls="new-tv-tab" aria-selected="false">TV</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="new-computers-link" data-toggle="tab" href="#new-computers-tab" role="tab" aria-controls="new-computers-tab" aria-selected="false">Computers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="new-phones-link" data-toggle="tab" href="#new-phones-tab" role="tab" aria-controls="new-phones-tab" aria-selected="false">Tablets & Cell Phones</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="new-watches-link" data-toggle="tab" href="#new-watches-tab" role="tab" aria-controls="new-watches-tab" aria-selected="false">Smartwatches</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="new-acc-link" data-toggle="tab" href="#new-acc-tab" role="tab" aria-controls="new-acc-tab" aria-selected="false">Accessories</a>
                        </li>
                    </ul>
                </div><!-- End .heading-right -->
            </div><!-- End .heading -->

            <div class="tab-content tab-content-carousel just-action-icons-sm">
                <div class="tab-pane p-0 fade show active" id="new-all-tab" role="tabpanel" aria-labelledby="new-all-link">
                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": true, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":2
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":5
                                }
                            }
                        }'>
                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Audio</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R79.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 6 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-new">New</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Tablets</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <span class="product-label label-circle label-sale">Sale</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-4.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Cell Phone</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Google - Pixel 3 XL  128GB</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    <span class="new-price">R35.41</span>
                                    <span class="old-price">Was R41.67</span>
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 10 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" class="active" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-5.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">TV & Home Theater</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Samsung - 55" Class  LED 2160p Smart</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 5 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
                    </div><!-- End .owl-carousel -->
                </div><!-- .End .tab-pane -->
                <div class="tab-pane p-0 fade" id="new-tv-tab" role="tabpanel" aria-labelledby="new-tv-link">
                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": true, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":2
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":5
                                }
                            }
                        }'>
                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-new">New</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Tablets</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Audio</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R79.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 6 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <span class="product-label label-circle label-sale">Sale</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-4.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Cell Phone</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Google - Pixel 3 XL  128GB</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    <span class="new-price">R35.41</span>
                                    <span class="old-price">Was R41.67</span>
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 10 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" class="active" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-5.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">TV & Home Theater</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Samsung - 55" Class  LED 2160p Smart</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 5 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
                    </div><!-- End .owl-carousel -->
                </div><!-- .End .tab-pane -->
                <div class="tab-pane p-0 fade" id="new-computers-tab" role="tabpanel" aria-labelledby="new-computers-link">
                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": true, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":2
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":5
                                }
                            }
                        }'>
                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-5.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">TV & Home Theater</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Samsung - 55" Class  LED 2160p Smart</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 5 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-new">New</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Tablets</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Audio</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R79.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 6 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <span class="product-label label-circle label-sale">Sale</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-4.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Cell Phone</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Google - Pixel 3 XL  128GB</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    <span class="new-price">R35.41</span>
                                    <span class="old-price">Was R41.67</span>
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 10 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" class="active" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
                    </div><!-- End .owl-carousel -->
                </div><!-- .End .tab-pane -->
                <div class="tab-pane p-0 fade" id="new-phones-tab" role="tabpanel" aria-labelledby="new-phones-link">
                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": true, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":2
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":5
                                }
                            }
                        }'>
                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Audio</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R79.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 6 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-new">New</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Tablets</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-5.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">TV & Home Theater</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Samsung - 55" Class  LED 2160p Smart</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 5 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <span class="product-label label-circle label-sale">Sale</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-4.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Cell Phone</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Google - Pixel 3 XL  128GB</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    <span class="new-price">R35.41</span>
                                    <span class="old-price">Was R41.67</span>
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 10 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" class="active" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
                    </div><!-- End .owl-carousel -->
                </div><!-- .End .tab-pane -->
                <div class="tab-pane p-0 fade" id="new-watches-tab" role="tabpanel" aria-labelledby="new-watches-link">
                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": true, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":2
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":5
                                }
                            }
                        }'>
                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <span class="product-label label-circle label-sale">Sale</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-4.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Cell Phone</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Google - Pixel 3 XL  128GB</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    <span class="new-price">R35.41</span>
                                    <span class="old-price">Was R41.67</span>
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 10 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" class="active" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Audio</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R79.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 6 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-new">New</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Tablets</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
                    </div><!-- End .owl-carousel -->
                </div><!-- .End .tab-pane -->
                <div class="tab-pane p-0 fade" id="new-acc-tab" role="tabpanel" aria-labelledby="new-acc-link">
                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": true, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":2
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":5
                                }
                            }
                        }'>
                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-5.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">TV & Home Theater</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Samsung - 55" Class  LED 2160p Smart</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 5 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-top">Top</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Laptops</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R1,199.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Audio</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R79.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 60%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 6 Reviews )</span>
                                </div><!-- End .rating-container -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->

                        <div class="product product-2">
                            <figure class="product-media">
                                <span class="product-label label-circle label-new">New</span>
                                <a href="product.html">
                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                </div><!-- End .product-action -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="#">Tablets</a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    R899.99
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( 4 Reviews )</span>
                                </div><!-- End .rating-container -->

                                <div class="product-nav product-nav-dots">
                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                </div><!-- End .product-nav -->
                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
                    </div><!-- End .owl-carousel -->
                </div><!-- .End .tab-pane -->
            </div><!-- End .tab-content -->
        </div><!-- End .container -->

        <div class="mb-6"></div><!-- End .mb-6 -->        
    </main><!-- End .main -->
</asp:Content>
