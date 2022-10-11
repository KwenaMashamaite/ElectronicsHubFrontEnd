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
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Customer") || Session["DeliveryType"] == null)
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
                    int orderId = PlaceOrder();
                    Response.Redirect("~/Order.aspx?Id=" + orderId);
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
            decimal vat = subtotal * (sr.GetVATRate() / 100.0M);
            decimal totalAmount = subtotal + vat + deliveryFee;
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
                Product prod = sr.GetProductById(item.ProductId);
                sr.CreateOrderItem(orderId, item.ProductId, item.Quantity, prod.Price - prod.Price * (prod.Discount / 100M));
            }
        }

        private void GenerateInvoice(ElectronicsHubBackendService.Order order)
        {
            // Create Invoice
            int discountRate = sr.GetDefaultDiscountRate();
            int vatRate = sr.GetVATRate();
            string status = "Paid";

            decimal subtotal = order.Subtotal;
            decimal vat = (vatRate / 100.0m) * subtotal;
            decimal total = order.Total;

            if (total < 0)
                total = 0;

            Invoice invoice = sr.CreateInvoice(order.OrderId, status, subtotal, discountRate, 0, vatRate, vat, total);

            // Create invoice items
            List<OrderItem> orderItems = sr.GetOrderDetails(order.OrderId).ToList();

            foreach (OrderItem oI in orderItems)
            {
                sr.CreateInvoiceItem(invoice.InvoiceId, sr.GetProductById(oI.ProductId).Name, oI.Quantity, oI.SalePrice, oI.Quantity * oI.SalePrice);
            }
        }

        private void InsertPaymentDetails(int orderId, decimal amount)
        {
            // Since we can't actually charge the users account, we assume that all card payments go through successfully
            sr.CreatePayment(orderId, "DebitCard", amount, "Approved");
            sr.UpdateOrderStatus(orderId, "Paid");
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
                return 200;
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
                return DateTime.Today.AddDays(2);
            }
            else
            {
                return DateTime.Today.AddDays(7);
            }
        }
    }
}