<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="ElectronicsHub_FrontEnd.EditProduct" %>
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
					<div runat="server" id="ProdDetails" class="col-lg-9">
						<label runat="server" id="SuccessMsg" style="color: green;" visible="false"></label>
						<label runat="server" id="ErrorMsg" style="color: red;" visible="false"></label>

						<h2 runat="server" id="PageTitle" class="checkout-title">Update Product Details</h2><!-- End .checkout-title -->
		                <label>Name *</label>
		                <input runat="server" id="Name" type="text" class="form-control" required>

		            	<label>Description *</label>
		            	<textarea runat="server" id="Description" type="text" class="form-control" required></textarea>

		                <label>Category *</label>
		                <input runat="server" id="Cat" type="tel" class="form-control" required>

	            		<label>Subcategory</label>
	            		<input runat="server" id="Subcat" type="text" class="form-control">

		                <label>Price *</label>
		                <input runat="server" id="Price" type="text" class="form-control" required>
							
		            	<label>Quantity *</label>
		                <input runat="server" id="Quantity" type="text" class="form-control" required>
		                
		        		<label>Brand *</label>
		        		<input runat="server" id="Brand" type="text" class="form-control" required>
						
						<label>Status *</label>
		        		<input runat="server" id="Status" type="text" class="form-control" required>

						<label>Image Url *</label>
		        		<input runat="server" id="ImgUrl" type="text" class="form-control" required>
						
						<br>
						<asp:Button runat="server" id="UpdateProductButton" type="submit" class="btn btn-outline-primary-2 btn-order btn-block" 
							Text="Update Product Details" OnClick="UpdateProductButton_Click">
						</asp:Button>
					</div><!-- End .col-lg-9 -->
					<aside class="col-lg-3">
						<img runat="server" id="ProdImg" src="#" />
					</aside>
				</div><!-- End .row -->
			</div><!-- End .container -->
        </div><!-- End .checkout -->
    </div><!-- End .page-content -->
</asp:Content>
