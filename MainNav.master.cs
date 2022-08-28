using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class MainNav : System.Web.UI.MasterPage
    {
        BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Remove logo from top nav bar
            if (Session["UserRole"].Equals("Guest") || Session["UserRole"].Equals("Customer"))
            {
                HyperLink logoAnchor = (HyperLink) Master.FindControl("LgAnchor");
                logoAnchor.Visible = false;
            }

            // Remove cart if user is not a customer
            if (Session["UserRole"].Equals("Customer"))
            {
                DisplayCartDetails(Int32.Parse(Session["UserCartId"].ToString()));
            }
            else
            {
                CartDropdown.Visible = false;
            }

            // Dynamically display categories
            var prodCategories = sr.GetProductCategories().ToList();

            // Dynamically display product categories in 'Search product' section
            DisplaySearchCategories(prodCategories);

            // Dynamically display categories in 'Browse Categories' section
            DisplayBrowseCategories(prodCategories);
        }

        private void DisplayCartDetails(int cartId)
        {
            List<CartItem> cartItems = sr.GetCartItems(cartId).ToList();
            int numItems = cartItems.Count();

            CartCount.InnerHtml = cartItems.Sum(cI => cI.Quantity).ToString();

            if (numItems > 0)
            {
                string display = "<div class='dropdown-cart-products' style='overflow-y:auto; max-height: 50vh'>"; 

                foreach(CartItem item in cartItems)
                {
                    Product prod = sr.GetProductById(item.ProductId);

                    display += "<div class='product'>";
                    display += "<div class='product-cart-details'>";
                    display += "<h4 class='product-title'>";
                    display += "<a href='/ProductInfo.aspx?ProdId=" + prod.ProductId + "'>" + prod.Name + "</a></h4>";
                    display += "<span class='cart-product-info'><span class='cart-product-qty'>" + item.Quantity + "</span>" + " x R " + String.Format("{0:N}", prod.Price) + "</span>";
                    display += "</div>"; //<!-- End.product-cart-details -->

                    // Product image
                    ProductImage prodImg = sr.GetProductImage(prod.ProductId);

                    display += "<figure class='product-image-container'>";
                    display += "<a href='/ProductInfo.aspx?ProdId=" + prod.ProductId + "' class='product-image'>";
                    display += "<img src='/" + prodImg.ThumbnailUrl + "' alt='product'></a></figure>";
                    display += "<a href='/Cart.aspx?RemCartItemId=" + item.CartItemId + "' class='btn-remove' title='Remove Product'><i class='icon-close'></i></a></div>";   
                }
                
                display += "</div>"; //End.dropdown-cart-products

                //Display view cart and checkout buttons
                display += "<div class='dropdown-cart-total'>";
                display += "<span>Total</span>";

                display += "<span class='cart-total-price'> R" + String.Format("{0:N}", Helper.GetCartItemsTotal(cartItems)) + "</span>";
                display += "</div>"; // End.dropdown-cart-total

                display += "<div class='dropdown-cart-action'>";
                display += "<a href='/Cart.aspx?CartId=" + cartId + "' class='btn btn-primary'>View Cart</a>";
                display += "<a href='/Checkout.aspx?CartId=" + cartId + "' class='btn btn-outline-primary-2'><span>Checkout</span><i class='icon-long-arrow-right'></i></a>";
                display += "</div>"; // End.dropdown-cart-total

                CartDropdownMenu.InnerHtml = display;
            }
            else
            {
                CartDropdownMenu.InnerHtml = "Cart is empty";
            }
        }

        private void DisplayBrowseCategories(List<ProductCategory> prodCategories)
        {
            string display = String.Empty;

            foreach (ProductCategory pCat in prodCategories)
            {
                var productSubcategories = sr.GetProductSubcategories(pCat.ProductCategoryId).ToList();

                if (productSubcategories.Count == 0)
                {
                    display += "<li><a href='/Shop.aspx?ProdCatId=" + pCat.ProductCategoryId + "'>" + pCat.Name + "</a>";
                }
                else
                {
                    display += "<li class='megamenu-container'>"
                         + "<a class='sf-with-ul' href='#'>" + pCat.Name + "</a>";

                    display += "<ul><li><a  class='menu-title' href='/Shop.aspx?ProdCatId=" + pCat.ProductCategoryId + "'> All " + pCat.Name + "</a>";

                    foreach (ProductSubcategory prodSubcat in productSubcategories)
                    {
                        display += "<li><a href='/Shop.aspx?ProdSubcatId=" + prodSubcat.ProductSubcategoryId + "'>" + prodSubcat.Name + "</a></li>";
                    }

                    display += "</ul>";
                }

                display += "</li>";
            }

            ProdCategory.InnerHtml = display;
        }

        private void DisplaySearchCategories(List<ProductCategory> prodCategories)
        {
            string display = "<select id='cat' name = 'cat'>"
                    + "<option value='all'> All Departments </option>";

            foreach (ProductCategory pCat in prodCategories)
            {
                display += "<option value='" + pCat.ProductCategoryId + "'>" + pCat.Name + "</option>";
            }

            display += "</select>";

            ProdCatSearch.InnerHtml = display;
        }
    }
}