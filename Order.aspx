<%@ Page Title="" Language="C#" MasterPageFile="~/TopNav.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="error-content text-center" style="background-image: url(assets/images/backgrounds/order-bg.jpg)">
        <div class="container">
    		<h1 class="error-title">YOUR ORDER HAS BEEN RECIEVED </h1><!-- End .error-title -->
      		<p>Thank you for your purchase, please check email for reciept and delivery details.</p>
    		<a href="Index.aspx" class="btn btn-outline-primary-2 btn-minwidth-lg">
     			<span>CONTINUE SHOPPING</span>
       			<i class="icon-long-arrow-right"></i>
      		</a>

            <a runat="server" id="InvLink" href="#" class="btn btn-outline-primary-2 btn-minwidth-lg">
     			<span>View Invoice</span>
       			<i class="icon-long-arrow-right"></i>
      		</a>
       	</div><!-- End .container -->
	</div><!-- End .error-content text-center -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
