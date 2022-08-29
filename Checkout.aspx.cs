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
            if (DebitRadioButton.Checked)
                Response.Redirect("~/Payment.aspx?method=DebitCard");
            else
                Response.Redirect("~/Payment.aspx?method=Cash");
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
                display += "<td>R " + String.Format("{0:N}", prod.Price * cItem.Quantity) + "</td>";
                display += "</tr>";
            }

            // Display products total price
            double subtotal = Helper.GetCartItemsTotal(cartItems);
            const double MAX_CASH_ON_DELIVERY_AMOUNT = 5000;

            if (subtotal > MAX_CASH_ON_DELIVERY_AMOUNT)
            {
                CashRadioButton.Visible = false;
                DebitRadioButton.Checked = true;
            }
            else
            {
                CashRadioButton.Checked = true;
            }

            display += "<tr class='summary-subtotal'>";
            display += "<td>Subtotal:</td>";
            display += "<td>R " + String.Format("{0:N}", subtotal) + "</td>";
            display += "</tr>"; //<!-- End.summary-subtotal -->
            display += "<tr>";

            // Display delivery fee
            double deliveryFee = 0; // TODO - Get value from db
            display += "<td>Delivery Fee:</td><td>R " + String.Format("{0:N}", deliveryFee) + "</td></tr>";
            
            // Display total cost
            display += "<tr class='summary-total'>";
            display += "<td>Total:</td><td>R " + String.Format("{0:N}", subtotal + deliveryFee) + "</td>";
            display += "</tr>";

            OrderSummary.InnerHtml = display;
        }
    }
}