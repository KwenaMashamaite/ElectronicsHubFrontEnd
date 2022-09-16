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
                        int orderId = PlaceOrder();

                        // We don't collect payment info from user for cash payments
                        Response.Redirect("~/Order.aspx?Id=" + orderId);
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
            int orderId = PlaceOrder();
            Response.Redirect("~/Order.aspx?Id=" + orderId);
        }

        private int PlaceOrder()
        {
            // Populated by Login page
            int userId = Int32.Parse(Session["UserId"].ToString());
            int cartId = Int32.Parse(Session["UserCartId"].ToString());
            
            // Populated by Checkout page
            string deliveryType = Session["DeliveryType"].ToString();
            
            decimal deliveryFee = GetDeliveryFee(deliveryType);
            decimal subtotal = (decimal) Helper.GetCartItemsTotal(sr.GetCartItems(cartId).ToList());
            decimal totalAmount = subtotal + deliveryFee;
            ElectronicsHubBackendService.Order order = sr.CreateOrder(userId, subtotal, totalAmount, "Pending Payment");

            InsertOrderDetailsFromCart(order.OrderId, cartId);
            InsertPaymentDetails(order.OrderId, totalAmount);
            InsertOrderDeliveryDetails(order.OrderId, deliveryType, deliveryFee);
            DeleteCartDetails(cartId);
            GenerateInvoice(order);

            return order.OrderId;
        }

        private void InsertOrderDetailsFromCart(int orderId, int cartId)
        {
            var cartItems = sr.GetCartItems(cartId).ToList();

            foreach (CartItem item in cartItems)
            {
                sr.CreateOrderItem(orderId, item.ProductId, item.Quantity, sr.GetProductById(item.ProductId).Price);
            }
        }

        private void GenerateInvoice(ElectronicsHubBackendService.Order order)
        {
            // Create Invoice
            int discountRate = sr.GetDefaultDiscountRate();
            int vatRate = sr.GetVATRate();
            string status = (Session["PaymentMethod"].Equals("Cash")) ? "Pending" : "Paid";

            decimal subtotal = order.Subtotal;
            decimal discount = (discountRate / 100.0m) * order.Subtotal;
            decimal vat = (vatRate / 100.0m) * subtotal;
            decimal total = subtotal - discount + vat;

            if (total < 0)
                total = 0;

            Invoice invoice = sr.CreateInvoice(order.OrderId, status, subtotal, discountRate, discount, vatRate, vat, total);

            // Create invoice items
            List<OrderItem> orderItems = sr.GetOrderDetails(order.OrderId).ToList();

            foreach (OrderItem oI in orderItems)
            {
                sr.CreateInvoiceItem(invoice.InvoiceId, sr.GetProductById(oI.ProductId).Name, oI.Quantity, oI.SalePrice, oI.Quantity * oI.SalePrice);
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