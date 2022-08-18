<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="ElectonicsHub._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="error-content text-center" style="background-image: url(assets/images/backgrounds/404-error-bg.jpg)">
        <div class="container">
    		<h1 class="error-title">Error 404</h1><!-- End .error-title -->
      		<p>We are sorry, the page you've requested is not available.</p>
    		<a href="index.html" class="btn btn-outline-primary-2 btn-minwidth-lg">
     			<span>BACK TO HOMEPAGE</span>
       			<i class="icon-long-arrow-right"></i>
      		</a>
       	</div><!-- End .container -->
	</div><!-- End .error-content text-center -->
</asp:Content>
