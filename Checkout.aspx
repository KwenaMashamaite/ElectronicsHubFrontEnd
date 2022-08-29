<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderRight" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<br>
	<div class="page-content">
		<div class="checkout">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<h2 class="checkout-title">Enter Recipient Delivery Details</h2><!-- End .checkout-title -->
		                <label>First Name *</label>
		                <input runat="server" id="FirstName" type="text" class="form-control" required>

		            	<label>Last Name *</label>
		            	<input runat="server" id="LastName" type="text" class="form-control" required>

		                <label>Phone *</label>
		                <input runat="server" id="Phone" type="tel" class="form-control" required>

	            		<label>Street address *</label>
	            		<input runat="server" id="StreetAddress" type="text" class="form-control" required>

		                <label>Town / City *</label>
		                <input runat="server" id="City" type="text" class="form-control" required>
							
		            	<label>Province *</label>
		                <input runat="server" id="Province" type="text" class="form-control" required>
		                
		        		<label>Postcode / ZIP *</label>
		        		<input runat="server" id="PostCode" type="text" class="form-control" required>
					</div><!-- End .col-lg-9 -->
					<aside class="col-lg-3">
						<div class="summary">
							<h3 class="summary-title">Your Order</h3><!-- End .summary-title -->

							<table class="table table-summary">
		                		<thead>
		                			<tr>
		                				<th>Product</th>
		                				<th>Total</th>
		                			</tr>
		                		</thead>

		                		<tbody runat="server" id="OrderSummary">
		                			<tr>
		                				<td><a href="#">Beige knitted elastic runner shoes</a></td>
		                				<td>$84.00</td>
		                			</tr>

		                			<tr>
		                				<td><a href="#">Blue utility pinafore denimdress</a></td>
		                				<td>$76,00</td>
		                			</tr>
		                			<tr class="summary-subtotal">
		                				<td>Subtotal:</td>
		                				<td>$160.00</td>
		                			</tr><!-- End .summary-subtotal -->
		                			<tr>
		                				<td>Shipping:</td>
		                				<td>Free shipping</td>
		                			</tr>
		                			<tr class="summary-total">
		                				<td>Total:</td>
		                				<td>$160.00</td>
		                			</tr><!-- End .summary-total -->
		                		</tbody>
							</table><!-- End .table table-summary -->

							<div>
								<p>Payment Options:</p>
							</div>
							<br>

							<div class="accordion-summary" id="accordion-payment">
								<div class="card">
									<div class="card-header" id="heading-3">
										<h2 class="card-title">
											<asp:RadioButton runat="server" id="CashRadioButton" groupname="PaymentOptions" Text="Cash on delivery" class="collapsed" role="button" data-toggle="collapse" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3" required="required">
											</asp:RadioButton>
										</h2>
									</div><!-- End .card-header -->
									<div id="collapse-3" class="collapse" aria-labelledby="heading-3" data-parent="#accordion-payment">
										<div class="card-body">Drivers don't carry change, have the exact amount as displayed above ready.
										</div><!-- End .card-body -->
									</div><!-- End .collapse -->
								</div><!-- End .card -->

								<br>

								<div class="card">
									<div class="card-header" id="heading-5">
										<h2 class="card-title">
											<asp:RadioButton runat="server" id="DebitRadioButton" Text="Debit Card" groupname="PaymentOptions" class="collapsed" role="button" data-toggle="collapse" href="#collapse-5" aria-expanded="false" aria-controls="collapse-5" required="required">
											</asp:RadioButton>
										</h2>
									</div><!-- End .card-header -->
									<div id="collapse-5" class="collapse" aria-labelledby="heading-5" data-parent="#accordion-payment">
										<div class="card-body"> Currently we only take visa and mastercard (support for other payment options is in the works).
										</div><!-- End .card-body -->
									</div><!-- End .collapse -->
								</div><!-- End .card -->
							</div><!-- End .accordion -->

							<asp:Button runat="server" id="ProceedToPaymentButton" type="submit" class="btn btn-outline-primary-2 btn-order btn-block" 
								Text="Proceed to Payment" onclick="ProceedToPaymentButton_Click">
							</asp:Button>
						</div><!-- End .summary -->
					</aside><!-- End .col-lg-3 -->
				</div><!-- End .row -->
			</div><!-- End .container -->
        </div><!-- End .checkout -->
    </div><!-- End .page-content -->
</asp:Content>
