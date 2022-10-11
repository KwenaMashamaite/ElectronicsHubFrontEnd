<%@ Page Title="" Language="C#" MasterPageFile="~/MainNav.master" AutoEventWireup="true" CodeBehind="InvoiceInfo.aspx.cs" Inherits="ElectronicsHub_FrontEnd.InvoiceInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderRight" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
    	<div class="container">
        	<h1 class="page-title">INVOICE</h1>
        </div><!-- End .container -->
    </div><!-- End .page-header -->

    <br />
    <br />
    
    <div style="margin: auto; width: 68%;">
        <div id="ui-view" data-select2-id="ui-view"><div><div class="card">
            <br />
            <div class="card-body">
                <div class="row mb-4">
                    <div runat="server" id="BillFromInfo" class="col-sm-4">
                        <h6 class="mb-3">Invoice From:</h6>
                        <div>42, Awesome Enclave</div>
                        <div>New York City, New york, 10394</div>
                        <div>Email: admin@bbbootstrap.com</div>
                        <div>Phone: +48 123 456 789</div>
                    </div>

                    <div runat="server" id="BillToInfo" class="col-sm-4">
                        <h6 class="mb-3">Invoice To:</h6>
                        <div><b>Micheal Braux</b></div>
                        <div>42, Awesome Enclave</div>
                        <div>New York City, New york, 10394</div>
                        <div>Email: admin@bbbootstrap.com</div>
                        <div>Phone: +48 123 456 789</div>
                    </div>

                    <div runat="server" id="InvDetails" class="col-sm-4">
                        <h6 class="mb-3">Details:</h6>
                        <div><b>Invoice number:</b> 10010110101938</div>
                        <div><b>Invoice Date:</b> 30 April 2019</div>
                        <div><b>Order number:</b> 1000955</div>
                        <div><b>Payment Method:</b> Debit Card</div>
                    </div>
                </div>

                <div class="table-responsive-sm">
                    <table class="table table-striped itable-summary">
                        <thead>
                            <tr>
                                <th class="center">Item #</th>
                                <th>Description</th>
                                <th class="center">Quantity</th>
                                <th class="right">Unit Cost</th>
                                <th class="right">Total</th>
                            </tr>
                        </thead>
                        <tbody runat="server" id="InvItems">
                            <tr>
                                <td class="left">Apple iphoe 10 with extended warranty</td>
                                <td class="center">16</td>
                                <td class="right">$999,00</td>
                                <td class="right">$999,00</td>
                            </tr>
                            <tr>
                                <td class="left">Samsung S6 with extended warranty</td>
                                <td class="center">20</td>
                                <td class="right">$150,00</td>
                                <td class="right">$3.000,00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-5 ml-auto">
                        <table class="table itable-summary">
                            <tbody>
                                <tr>
                                    <td class="left">
                                        <strong>Subtotal</strong>
                                    </td>
                                    <td runat="server" id="Subtotal" class="right">$8.497,00</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong runat="server" id="DelType">Delivery (Standard)</strong>
                                    </td>
                                    <td runat="server" id="DelFee" class="right">R 679,76</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong runat="server" id="VATRate">VAT (10%)</strong>
                                    </td>
                                    <td runat="server" id="VAT" class="right">$679,76</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong>Total</strong>
                                    </td>
                                    <td class="right summary-total">
                                        <strong runat="server" id="Total">$7.477,36</strong>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

        </div>
    </div>

</asp:Content>
