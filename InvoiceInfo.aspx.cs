using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class InvoiceInfo : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else if (!Session["UserRole"].Equals("Customer"))
            {
                Response.Redirect("~/404.aspx");
            }
            else if (Request.QueryString["Id"] == null)
            {
                Response.Redirect("~/404.apsx");
            }
            else
            {
                Invoice invoice = sr.GetInvoice(Int32.Parse(Request.QueryString["Id"]));
                DisplayBillFromDetails();
                DisplayBillToDetails(invoice.OrderId);
                DisplayInvoiceDetails(invoice);
                DisplayInvoiceItems(invoice.InvoiceId);
                DisplayPricing(invoice);
            }
        }

        private void DisplayInvoiceDetails(Invoice invoice)
        {
            string display = "<h6 class='mb-3'>Details:</h6>";

            display += "<div>Invoice number: " + invoice.InvoiceId + "</div>";
            display += "<div>Invoice Date: " + invoice.IssueDate + "</div>";
            display += "<div>Order number: " + invoice.OrderId + "</div>";

            ElectronicsHubBackendService.Payment payment = sr.GetPayment(invoice.OrderId);
            display += "<div>Payment Method: " + payment.PaymentType + "</div>";

            InvDetails.InnerHtml = display;
        }

        private void DisplayInvoiceItems(int invId)
        {
            List<InvoiceItem> invoiceItems = sr.GetInvoiceItems(invId).ToList();

            string display = "";

            foreach (InvoiceItem invItem in invoiceItems)
            {
                display += "<tr>";
                display += "<th class='right'>" + invItem.InvoiceItemId + "</th>";
                display += "<td class='left'>" + invItem.Description + "</td>";
                display += "<td class='center'>" + invItem.Quantity + "</td>";
                display += "<td class='right'>R " + String.Format("{0:N}", invItem.Price) + "</td>";
                display += "<td class='right'>R " + String.Format("{0:N}", invItem.Subtotal) + "</td>";
                display += "</tr>";
            }

            InvItems.InnerHtml = display;
        }

        private void DisplayBillToDetails(int orderId)
        {
            string display = "<h6 class='mb-3'>Invoice To:</h6>";

            // Display personal details
            User cus = sr.GetUser(Int32.Parse(Session["UserId"].ToString()));
            display += "<div> Name: " + cus.FirstName + " " + cus.LastName + "</div>";
            display += "<div> Email: " + cus.Email + "</div>";
            display += "<div> Phone: " + cus.Phone + "</div>";

            // Display address
            DeliveryAddress delAdd = sr.GetDeliveryAddress(orderId);

            display += "<div> Address: " + delAdd.StreetAddress + "</div>";
            display += "<div>" + delAdd.City + ", " + delAdd.PostCode + "</div>";

            BillToInfo.InnerHtml = display;
        }

        private void DisplayBillFromDetails()
        {
            string display = "";
            display += "<h6 class='mb-3'>Invoice From:</h6>";
            display += "<div><b>ElectronicsHub</b></div>";
            display += "<div>Email: accounts@electronicshub.co.za</div>";
            display += "<div>Phone: 011 256 7845</div>";
            display += "<div>Address: 89 President & Rissik Street</div>";
            display += "<div>Gauteng, Johannesburg, 2001</div>";

            BillFromInfo.InnerHtml = display;
        }

        private void DisplayPricing(Invoice inv)
        {
            Subtotal.InnerHtml = "R " + String.Format("{0:N}", inv.Subtotal);
            DiscountRate.InnerHtml = "Discount (" + inv.DiscoutRate + "%)";
            Discount.InnerHtml = "R " + String.Format("{0:N}", (inv.DiscoutRate / 100.0m) * inv.Subtotal);
            VATRate.InnerHtml = "VAT (" + inv.VATRate + "%)";
            VAT.InnerHtml = "R " + String.Format("{0:N}", (inv.VATRate / 100.0m) * inv.Total);
            Total.InnerHtml = "R " + String.Format("{0:N}", inv.Total);
        }
    }
}