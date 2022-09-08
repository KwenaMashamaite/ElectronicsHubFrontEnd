<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderRight" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<br>
    <div class="page-content">
        <div class="dashboard">
	        <div class="container">
	            <div class="row">
	                <aside class="col-md-4 col-lg-3">
	                	<ul runat="server" id="NavDashboardAside" class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="tab-account-link" data-toggle="tab" href="#tab-account" role="tab" aria-controls="tab-account" aria-selected="false">Personal Details</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Orders</a>
							</li>
						</ul>
	                </aside><!-- End .col-lg-3 -->

	                <div class="col-md-8 col-lg-9">
	                	<div class="tab-content">
							<div class="tab-pane fade show active" id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
			                	<div class="row">
			                		<div class="col-sm-6">
			                			<label>First Name *</label>
			                			<input runat="server" id="PersFirstName" type="text" class="form-control" required>
			                		</div><!-- End .col-sm-6 -->

			                		<div class="col-sm-6">
			                			<label>Last Name *</label>
			                			<input runat="server" id="PersLastName" type="text" class="form-control" required>
			                		</div><!-- End .col-sm-6 -->
			                	</div><!-- End .row -->

		            			<label>Phone *</label>
		            			<input runat="server" id="PersPhone" type="text" class="form-control" required
									title="10 digit phone number" pattern="[0-9]{10}">

			                		
		                		<asp:Button runat="server" id="SavePersonalDetButton" type="submit" class="btn btn-outline-primary-2" Text="SAVE CHANGES"
									OnClick="SavePersonalDetButton_Click">
			                	</asp:Button>
							</div><!-- .End .tab-pane -->

							<div class="tab-pane fade" id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
								<p>No order has been made yet.</p>
								<a href="Shop.aspx" class="btn btn-outline-primary-2"><span>GO SHOP</span><i class="icon-long-arrow-right"></i></a>
							</div><!-- .End .tab-pane -->

							<div class="tab-pane fade" id="tab-address" role="tabpanel" aria-labelledby="tab-address-link">
								<p>The following addresses will be used on the checkout page by default.</p>

								<div class="row">
								    <div class="col-lg-6">
								    	<div class="card card-dashboard">
								    		<div class="card-body">
								    			<h3 class="card-title">Billing Address</h3><!-- End .card-title -->

												<p>User Name<br>
												User Company<br>
												John str<br>
												New York, NY 10001<br>
												1-234-987-6543<br>
												yourmail@mail.com<br>
												<a href="#">Edit <i class="icon-edit"></i></a></p>
								    		</div><!-- End .card-body -->
								    	</div><!-- End .card-dashboard -->
								    </div><!-- End .col-lg-6 -->

								    <div class="col-lg-6">
								    	<div class="card card-dashboard">
								    		<div class="card-body">
								    			<h3 class="card-title">Shipping Address</h3><!-- End .card-title -->

												<p>You have not set up this type of address yet.<br>
												<a href="#">Edit <i class="icon-edit"></i></a></p>
								    		</div><!-- End .card-body -->
								    	</div><!-- End .card-dashboard -->
								    </div><!-- End .col-lg-6 -->
								</div><!-- End .row -->
							</div><!-- .End .tab-pane -->

						</div>
	                </div><!-- End .col-lg-9 -->
	            </div><!-- End .row -->
	        </div><!-- End .container -->
        </div><!-- End .dashboard -->
    </div><!-- End .page-content -->
</asp:Content>
