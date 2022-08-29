<%@ Page Title="" Language="C#" MasterPageFile="~/TopNav.master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br>
	<div class="page-content">
		<div class="checkout">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<h2 class="checkout-title">Enter Payment Details</h2><!-- End .checkout-title -->
		                <label>Cardholder First Name *</label>
		                <input runat="server" id="FirstName" type="text" class="form-control" required>

		            	<label>Cardholder Last Name *</label>
		            	<input runat="server" id="LastName" type="text" class="form-control" required>

		                <label>Card Number *</label>
		                <input runat="server" id="CardNum" type="text" class="form-control" required>

	            		<label>Card Expiration Date *</label>
	            		<input runat="server" id="ExpirationDate" type="date" class="form-control" required>

		                <label>Security Code (CVV) *</label>
		                <input runat="server" id="SecurityCode" type="text" class="form-control" required>
					</div><!-- End .col-lg-9 -->
					<aside class="col-lg-3">
						<div class="summary">
							<h3 class="summary-title">Price to Pay</h3><!-- End .summary-title -->

							<table class="table table-summary">
		                		<thead>
		                		</thead>
								<tbody>
									<tr class="summary-total">
		                				<td>Total:</td>
		                				<td runat="server" id="TotalPrice">$160.00</td>
		                			</tr><!-- End .summary-total -->
								</tbody>
							</table><!-- End .table table-summary -->

							<asp:Button runat="server" id="PlaceOrderBtn" type="submit" Text="Place Order" class="btn btn-outline-primary-2 btn-order btn-block" OnClick="PlaceOrderBtn_Click">
							</asp:Button>
						</div><!-- End .summary -->
					</aside><!-- End .col-lg-3 -->
				</div><!-- End .row -->
			</div><!-- End .container -->
        </div><!-- End .checkout -->
    </div><!-- End .page-content -->
</asp:Content>
