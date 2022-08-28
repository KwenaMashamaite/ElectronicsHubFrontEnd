<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderRight" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<br>
	<div class="page-content">
        <div class="cart">
	        <div class="container">
	            <div class="row">
	                <div runat="server" id="CartTable" class="col-lg-9">
	                	<table class="table table-cart table-mobile">
							<thead>
								<tr>
									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th></th>
								</tr>
							</thead>

							<tbody runat="server" id="CartItems">
								<tr>
									<td class="product-col">
										<div class="product">
											<figure class="product-media">
												<a href="#">
													<img src="assets/images/products/table/product-1.jpg" alt="Product image">
												</a>
											</figure>

											<h3 class="product-title">
												<a href="#">Beige knitted elastic runner shoes</a>
											</h3><!-- End .product-title -->
										</div><!-- End .product -->
									</td>
									<td class="price-col">$84.00</td>
									<td class="quantity-col">
                                        <div class="cart-product-quantity">
                                            <input type="number" class="form-control" value="1" min="1" max="10" step="1" data-decimals="0" required>
                                        </div><!-- End .cart-product-quantity -->
                                    </td>
									<td class="total-col">$84.00</td>
									<td class="remove-col"><button class="btn-remove"><i class="icon-close"></i></button></td>
								</tr>
								<tr>
									<td class="product-col">
										<div class="product">
											<figure class="product-media">
												<a href="#">
													<img src="assets/images/products/table/product-2.jpg" alt="Product image">
												</a>
											</figure>

											<h3 class="product-title">
												<a href="#">Blue utility pinafore denim dress</a>
											</h3><!-- End .product-title -->
										</div><!-- End .product -->
									</td>
									<td class="price-col">$76.00</td>
									<td class="quantity-col">
                                        <div class="cart-product-quantity">
                                            <input type="number" class="form-control" value="1" min="1" max="10" step="1" data-decimals="0" required>
                                        </div><!-- End .cart-product-quantity -->                                 
                                    </td>
									<td class="total-col">$76.00</td>
									<td class="remove-col"><button class="btn-remove"><i class="icon-close"></i></button></td>
								</tr>
							</tbody>
						</table><!-- End .table table-wishlist -->

	                	<div class="cart-bottom">
			            	<asp:LinkButton runat="server" id="UpdateCart" class="btn btn-outline-dark-2"><span>UPDATE CART</span><i class="icon-refresh"></i></asp:LinkButton>
		            	</div><!-- End .cart-bottom -->
	                </div><!-- End .col-lg-9 -->
	                <aside runat="server" id="CartTotalContainer" class="col-lg-3">
	                	<div class="summary summary-cart">
	                		<h3 class="summary-title">Cart Total</h3><!-- End .summary-title -->

	                		<table class="table table-summary">
	                			<tbody>
	                				<tr class="summary-total">
	                					<td>Total:</td>
	                					<td runat="server" id="CartSubtotal">$160.00</td>
	                				</tr><!-- End .summary-total -->
	                			</tbody>
	                		</table><!-- End .table table-summary -->

	                		<a href="checkout.html" class="btn btn-outline-primary-2 btn-order btn-block">PROCEED TO CHECKOUT</a>
	                	</div><!-- End .summary -->
	                </aside><!-- End .col-lg-3 -->
	            </div><!-- End .row -->
	        </div><!-- End .container -->
        </div><!-- End .cart -->
    </div><!-- End .page-content -->
</asp:Content>
