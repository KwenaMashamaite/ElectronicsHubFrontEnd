using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Checkout : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();
        private double subtotal = 0;
        private double vat = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else if (Session["UserRole"].ToString().Equals("Customer"))
            {
                List<CartItem> cartItems = sr.GetCartItems(Int32.Parse(Session["UserCartId"].ToString())).ToList();
                
                // Can't checkout with an empty cart
                if (cartItems.Count() == 0)
                {
                    Response.Redirect("~/Cart.aspx");
                }
                else
                {
                    PrefillDeliveryDetails();
                    DisplayOrderSummary(cartItems);
                }
            } 
            else
            {
                // Only logged in users who are customers can access this page
                Response.Redirect("~/404.aspx");
            }
        }

        protected void ProceedToPaymentButton_Click(object sender, EventArgs e)
        {
            var deliveryDetails = new OrderDelivery
            {
                RecipientFirstName = FirstName.Value,
                RecipientLastName = LastName.Value,
                RecipientPhone = Phone.Value,
            };

            // TODO - Give user option to choose delivery type
            Session["DeliveryDetails"] = deliveryDetails;

            var deliveryAddress = new DeliveryAddress();
            deliveryAddress.StreetAddress = StreetAddress.Value;
            deliveryAddress.City = City.Value;
            deliveryAddress.Province = Province.Value;
            deliveryAddress.PostCode = PostCode.Value;

            Session["DeliveryAddress"] = deliveryAddress;

            if (ExpressRadioButton.Checked)
            {
                Session["DeliveryType"] = "Express";
            }
            else
            {
                Session["DeliveryType"] = "Standard";
            }

            Response.Redirect("~/Payment.aspx");
        }

        void PrefillDeliveryDetails()
        {
            User user = sr.GetUser(Int32.Parse(Session["UserId"].ToString()));

            FirstName.Value = user.FirstName;
            LastName.Value = user.LastName;
            Phone.Value = user.Phone;
        }

        void DisplayOrderSummary(List<CartItem> cartItems)
        {
            string display = "";

            foreach(CartItem cItem in cartItems)
            {
                Product prod = sr.GetProductById(cItem.ProductId);

                display += "<tr>";
                display += "<td><a href='/ProductInfo.aspx?ProdId=" + prod.ProductId + "'>" + cItem.Quantity + " x " + prod.Name + "</a></td>";
                display += "<td>R " + String.Format("{0:N}", cItem.Quantity * (prod.Price - (prod.Price * (prod.Discount / 100M)))) + "</td>";
                display += "</tr>";
            }

            // Display products total price
            subtotal = Helper.GetCartItemsTotal(cartItems);

            display += "<tr class='summary-subtotal'>";
            display += "<td>Subtotal:</td>";
            display += "<td>R " + String.Format("{0:N}", subtotal) + "</td>";
            display += "</tr>"; //<!-- End.summary-subtotal -->
            display += "<tr>";

            // Display tax
            vat = subtotal * (sr.GetVATRate() / 100.0);
            display += "<td>VAT ("+ sr.GetVATRate() + "%) :</td><td>R " + String.Format("{0:N}", vat) + "</td></tr>";
            
            // Display total cost
            display += "<tr class='summary-total'>";
            display += "</tr>";

            OrderSummary.InnerHtml = display;

            // By default standard delivery is checked
            Total.InnerHtml = "Total: R " + String.Format("{0:N}", subtotal + vat + 100);
        }

        protected void StandardRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            Total.InnerHtml = "Total: R " + String.Format("{0:N}", subtotal + vat + 100);
        }

        protected void ExpressRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            Total.InnerHtml = "Total: R " + String.Format("{0:N}", subtotal + vat + 200);
        }
    }
}