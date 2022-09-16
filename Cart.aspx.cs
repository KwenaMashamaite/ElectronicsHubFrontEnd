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
            if (Session["UserId"] == null) // Only logged in users can accesss this page
            {
                Response.Redirect("~/Login.aspx?redi=~/Cart.aspx");
            }
            else if (!Session["UserRole"].Equals("Customer")) // Only logged users who are customers can access this page
            {
                Response.Redirect("~/404.aspx");
            }
            else
            {
                if (Request.QueryString["RemCartItemId"] != null)
                {
                    sr.RemoveCartItem(Int32.Parse(Request.QueryString["RemCartItemId"].ToString()));

                    // Return to calling page
                    if (Request.UrlReferrer != null)
                    {
                        Response.Redirect(Request.UrlReferrer.AbsoluteUri.ToString());
                    }
                }
                else if(Request.QueryString["AddProdId"] != null)
                {
                    int cartId = Int32.Parse(Session["UserCartId"].ToString());
                    int prodId = Int32.Parse(Request.QueryString["AddProdId"].ToString());
                    sr.CreateCartItem(cartId, prodId);

                    // Return to calling page
                    if (Request.UrlReferrer != null)
                    {
                        Response.Redirect(Request.UrlReferrer.AbsoluteUri.ToString());
                    }
                }

                DisplayCartItems(Int32.Parse(Session["UserCartId"].ToString()));
            }
        }

        private void DisplayCartItems(int cartId)
        {
            string display = "";

            List<CartItem> cartItems = sr.GetCartItems(cartId).ToList();

            if (cartItems.Count() > 0)
            {
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
                    display += "<input type='number' size='1' value='" + item.Quantity + "' min='1' max='" + prod.Quantity + "' step='1' data-decimals='0' required oninput='alert(this.value, " + item.CartItemId + ")'>";
                    display += "</div></td>"; // End.cart-product-quantity

                    display += "<td class='remove-col'><a href='/Cart.aspx?RemCartItemId=" + item.CartItemId + "' class='btn-remove'><i class='icon-close'></i></a></td>";
                }

                CartItems.InnerHtml = display;
                CartSubtotal.InnerHtml = "R " + String.Format("{0:N}", Helper.GetCartItemsTotal(cartItems));
            }
            else
            {
                CartTable.InnerHtml = "<h5>Your cart is empty</h5>";
                CartTotalContainer.Visible = false;
            }
        }

        protected void UpdateCart_Click(object sender, EventArgs e)
        {
            
        }
    }
}