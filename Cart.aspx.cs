using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Cart : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged in users who are customers can access this page
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Customer"))
            {
                Response.Redirect("~/404.aspx");
            }
            else
            {
                DisplayCartItems(Int32.Parse(Session["UserCartId"].ToString()));
            }
        }

        private void DisplayCartItems(int cartId)
        {
            string display = "";

            List<CartItem> cartItems = sr.GetCartItems(cartId).ToList();

            foreach (CartItem item in cartItems)
            {
                display += "<tr>";
                display += "<td class='product-col'>";
                display += "<div class='product'>";

                ProductImage prodImg = sr.GetProductImage(item.ProductId);

                display += "<figure class='product-media'>";
                display += "<a href='/ProductInfo.aspx?ProdId=" + prodImg.ProductId + "'>";
                display += "<img src='/" + prodImg.ThumbnailUrl + "' alt='Product image'></a>";
                display += "</figure>";

                Product prod = sr.GetProductById(item.ProductId);

                display += "<h3 class='product-title'>";
                display += "<a href='/ProductInfo.aspx?ProdId=" + prodImg.ProductId + "'>" + prod.Name + "</a>";
                display += "</h3></div></td>";

                display += "<td class='price-col'><b>R " + String.Format("{0:N}", prod.Price) + "</b></td>";
                display += "<td class='quantity-col'";
                display += "<div class='cart-product-quantity'>";
                display += "<input runat='server' type='number' size='1' value='" + item.Quantity + "' min='1' max='" + prod.Quantity + "' step='1' data-decimals='0' required>";
                display += "</div></td>"; // End.cart-product-quantity
            }

            CartItems.InnerHtml = display;
            CartSubtotal.InnerHtml = "R " + String.Format("{0:N}", Helper.GetCartItemsTotal(cartItems));
        }

        protected void UpdateCart_Click(object sender, EventArgs e)
        {
            foreach (Control control in this.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = String.Empty;
                }
            }
        }
    }
}