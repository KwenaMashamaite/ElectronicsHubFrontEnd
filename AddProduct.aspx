<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ElectronicsHub_FrontEnd.AddProduct" %>
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
					<div runat="server" id="ProdInfo" class="col-lg-9">
						<label runat="server" id="SuccessMsg" style="color: green;" visible="false"></label>
						<label runat="server" id="ErrorMsg" style="color: red;" visible="false"></label>

						<h2 class="checkout-title">Enter Product Details</h2><!-- End .checkout-title -->
		                
						<label>Name *</label>
		                <input runat="server" id="Name" type="text" class="form-control" required>

		            	<label>Description *</label>
		            	<textarea runat="server" id="Description" type="text" class="form-control" required></textarea>

		                <label>Category *</label>
		                <input runat="server" id="Category" type="tel" class="form-control" required>

	            		<label>Subcategory</label>
	            		<input runat="server" id="Subcategory" type="text" class="form-control" required>

		                <label>Price *</label>
		                <input runat="server" id="Price" type="text" class="form-control" required>
							
		            	<label>Quantity *</label>
		                <input runat="server" id="Quantity" type="text" class="form-control" required>
		                
		        		<label>Brand *</label>
		        		<input runat="server" id="Brand" type="text" class="form-control" required>
						
						<label>Status *</label>
		        		<input runat="server" id="Status" type="text" class="form-control" required>

						<label>Image Url *</label>
		        		<input runat="server" id="ImageUrl" type="text" class="form-control" required>
						
						<br>
						<asp:Button runat="server" id="AddProductButton" type="submit" class="btn btn-outline-primary-2 btn-order btn-block" 
							Text="Add product" OnClick="AddProductButton_Click">
						</asp:Button>
					</div><!-- End .col-lg-9 -->
				</div><!-- End .row -->
			</div><!-- End .container -->
        </div><!-- End .checkout -->
    </div><!-- End .page-content -->
</asp:Content>
