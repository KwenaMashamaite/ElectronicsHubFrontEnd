using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Payment : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Customer") || Session["PaymentMethod"] == null)
            {
                Response.Redirect("~/404.aspx");
            }
            else
            {
                List<CartItem> cartItems = sr.GetCartItems(Int32.Parse(Session["UserCartId"].ToString())).ToList();

                // Can't make any payment with an empty cart
                if (cartItems.Count() == 0)
                {
                    Response.Redirect("~/Cart.aspx");
                }
                else
                {
                    string paymentMethod = Session["PaymentMethod"].ToString();

                    if (paymentMethod.Equals("Cash"))
                    {
                        PlaceOrder();

                        // We don't collect payment info from user for cash payments
                        Response.Redirect("~/Order.aspx");
                    }

                    TotalPrice.InnerHtml = "R " + String.Format("{0:N}", Helper.GetCartItemsTotal(cartItems));
                }
            }
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            //Session["PaymentMethod"] = null;
            //Session["DeliveryType"] = null;
        }

        protected void PlaceOrderBtn_Click(object sender, EventArgs e)
        {
            PlaceOrder();
            Response.Redirect("~/Order.aspx");
        }

        private void PlaceOrder()
        {
            // Populated by Login page
            int userId = Int32.Parse(Session["UserId"].ToString());
            int cartId = Int32.Parse(Session["UserCartId"].ToString());
            
            // Populated by Checkout page
            string deliveryType = Session["DeliveryType"].ToString();
            
            decimal deliveryFee = GetDeliveryFee(deliveryType);
            decimal subtotal = (decimal) Helper.GetCartItemsTotal(sr.GetCartItems(cartId).ToList());
            decimal totalAmount = subtotal + deliveryFee;
            int orderId = sr.CreateOrder(userId, subtotal, totalAmount, "Pending Payment").OrderId;

            InsertOrderDetailsFromCart(orderId, cartId);
            InsertPaymentDetails(orderId, totalAmount);
            InsertOrderDeliveryDetails(orderId, deliveryType, deliveryFee);
            DeleteCartDetails(cartId);
        }

        private void InsertOrderDetailsFromCart(int orderId, int cartId)
        {
            var cartItems = sr.GetCartItems(cartId).ToList();

            foreach (CartItem item in cartItems)
            {
                sr.CreateOrderItem(orderId, item.ProductId, item.Quantity, sr.GetProductById(item.ProductId).Price);
            }
        }

        private void InsertPaymentDetails(int orderId, decimal amount)
        {
            // Populated by Checkout page
            string paymentMethod = Session["PaymentMethod"].ToString();
            ElectronicsHubBackendService.Payment payment;

            if (paymentMethod.Equals("Cash"))
            {
                payment = sr.CreatePayment(orderId, paymentMethod, amount, "COD");
            }
            else // Card payment
            {
                // Since we can't actually charge the users account, we assume that all card payments go through successfully
                payment = sr.CreatePayment(orderId, paymentMethod, amount, "Approved");
                sr.UpdateOrderStatus(orderId, "Paid");

                // Card details
                string cardType = "Unknown";

                // Supported cards
                if (CardNumber.Value.StartsWith("4")) {
                    cardType = "Visa";
                } 
                else if (CardNumber.Value.StartsWith("5"))
                {
                    cardType = "MasterCard";
                }

                sr.CreatePaymentCard(payment.PaymentId, cardType, FirstName.Value, LastName.Value, 
                    CardNumber.Value, Int32.Parse(ExpMonth.Value), Int32.Parse(ExpYear.Value), SecurityCode.Value); 
            }
        }

        private void DeleteCartDetails(int cartId)
        {
            var cartItems = sr.GetCartItems(cartId).ToList();

            foreach (CartItem item in cartItems)
            {
                sr.RemoveCartItem(item.CartItemId);
            }
        }

        private void InsertOrderDeliveryDetails(int orderId, string delType, decimal delFee)
        {
            // Populated by Checkout page
            OrderDelivery delDetails = (OrderDelivery) Session["DeliveryDetails"];
            
            DateTime deliveryDate = GetDeliveryDate(delType);
            OrderDelivery orderDelivery = sr.CreateOrderDelivery(orderId, delType, delFee, delDetails.RecipientFirstName, delDetails.RecipientLastName, delDetails.RecipientPhone, deliveryDate);

            // Order does not have any delivery info associated with it
            if (orderDelivery != null)
            {
                // Populated by Checkout page
                var address = (DeliveryAddress) Session["DeliveryAddress"];
                
                sr.CreateDeliveryAddress(orderDelivery.OrderDeliveryId, address.StreetAddress, address.City, address.Province, address.PostCode);
            }
        }

        private decimal GetDeliveryFee(string deliveryType)
        {
            if (deliveryType.Equals("Standard"))
            {
                return 100;
            }
            else if (deliveryType.Equals("Express"))
            {
                return 150;
            }
            else
            {
                return 0; // Free delivery
            }
        }

        private DateTime GetDeliveryDate(string deliveryType)
        {
            if (deliveryType.Equals("Express"))
            {
                return DateTime.Today.AddDays(1);
            }
            else if (deliveryType.Equals("Standard"))
            {
                return DateTime.Today.AddDays(4);
            }
            else // Free delivery
            {
                return DateTime.Today.AddDays(7);
            }
        }
    }
}