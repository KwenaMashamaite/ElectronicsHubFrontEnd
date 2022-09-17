﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Account" %>
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
								<a class="nav-link" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Invoices</a>
							</li>
						</ul>
	                </aside><!-- End .col-lg-3 -->

	                <div class="col-md-8 col-lg-9">
	                	<div class="tab-content">
							<asp:ScriptManager runat="server"></asp:ScriptManager>

							<div class="tab-pane fade show active" id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
								<asp:UpdatePanel runat="server">
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="SavePersonalDetButton" EventName="Click" />
									</Triggers>
									<ContentTemplate>
										<div>
											<label runat="server" id="PerDetailsSuccess" style="color: green;" visible="false">Details updated successfully</label>
			                				<label runat="server" id="PerDetailsError" style="color: red;" visible="false">Failed to update details: Email address is in use by another account</label>
										</div>
									
										<br />
										<h6> Personal Information </h6>
								
										<div class="row">
			                				<div class="col-sm-6">
			                					<label>First Name *</label>
			                					<input runat="server" id="UFName" type="text" class="form-control" required>
			                				</div><!-- End .col-sm-6 -->

			                				<div class="col-sm-6">
			                					<label>Last Name *</label>
			                					<input runat="server" id="ULName" type="text" class="form-control" required>
			                				</div><!-- End .col-sm-6 -->
			                			</div><!-- End .row -->

		            					<label>Phone *</label>
		            					<input runat="server" id="UPhone" type="text" class="form-control" required
											title="10 digit phone number" pattern="[0-9]{10}">

										<label>Email *</label>
		            					<input runat="server" id="UEmail" type="email" class="form-control" required>
			                		
		                				<asp:Button runat="server" id="SavePersonalDetButton" type="submit" class="btn btn-outline-primary-2" Text="SAVE CHANGES"
											OnClick="SavePersonalDetButton_Click">
			                			</asp:Button>
									</ContentTemplate>
								</asp:UpdatePanel>

								<div>
									<hr />
									<h6>Change Password</h6>

									<asp:UpdatePanel runat="server">
										<Triggers>
											<asp:AsyncPostBackTrigger ControlID="ChangePassword" EventName="Click" />
										</Triggers>
										<ContentTemplate>
											<div>
												<label runat="server" id="PassError" style="color: red;" visible="false">Failed to update password: incorrect current password</label>
												<label runat="server" id="PassSuccess" style="color: green;" visible="false">Password updated successfully</label>
											</div>

											<label>Current Password</label>
		            						<input runat="server" id="UPass" type="password" class="form-control">

											<label>New Password</label>
		            						<input runat="server" id="Upass2" type="password" class="form-control"
												pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,255}$" 
                                                title="Password must be at least 8 characters long and contain at least 1 uppercase, 1 lowercase, and 1 special character">

											<asp:Button runat="server" id="ChangePassword" type="submit" class="btn btn-outline-primary-2" Text="Change Password"
												OnClick="ChangePassword_Click">
			                				</asp:Button>
										</ContentTemplate>
									</asp:UpdatePanel>
								</div>
							</div><!-- .End .tab-pane -->
								

							<div class="tab-pane fade" id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
								<div runat="server" id="Invoices" class="table-responsive-sm">
									<table class="table table-striped itable-summary">
										<thead>
											<tr>
												<th class="center">Invoice #</th>
												<th class="centre">Order #</th>
												<th class="center">Invoice Date</th>
											</tr>
										</thead>
										<tbody runat="server" id="InvItems">
											<tr>
												<td class="left">1011</td>
												<td class="center">125656</td>
												<td class="right">2022-02-05</td>
												<td class='centre'><a href='#' >View Details</a></td>
											</tr>
											<tr>
												<td class="left">1041</td>
												<td class="center">1256</td>
												<td class="right">2021-02-05</td>
												<td class='centre'><a href='#' >View Details</a></td>
											</tr>
										</tbody>
									</table>
								</div>
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
