using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Index : System.Web.UI.Page
    {
        private static Random random = new Random();
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Session["UserRole"] = "Guest";
            }

            DisplayFeaturedProducts();
            DisplaySaleProducts();
            DiplayTopRatedProducts();
            DisplayPopulerCategories();
        }

        private string PopulateByStatus(string status)
        {
            List<Product> products = sr.GetProductByStatus(status).ToList();

            string display = "";

            foreach (Product p in products)
            {
                display += "<div class='product product-2'>";
                display += "<figure class='product-media'>";

                if (p.Discount > 0)
                {
                    display += "<span class='product-label label-sale'>" + p.Discount + "% OFF</span>";
                }

                display += "<a href='ProductInfo.aspx?ProdId=" + p.ProductId + "'>";

                //Product Image
                ProductImage pImg = sr.GetProductImage(p.ProductId);

                display += "<img src='" + pImg.LargePhotoUrl + "' alt='Product image' class='product-image'>";
                display += "</a>";
                display += "</figure>"; // <!-- End.product-media -->


                display += "<div class='product-body'>";

                // Produc category
                ProductCategory pCat = sr.GetProductCategory(p.ProductCategoryId);

                // Display add t cart button
                if (!Session["UserRole"].Equals("Manager"))
                {
                    display += "<div >";
                    display += "<a href='/Cart.aspx?AddProdId=" + p.ProductId + "' class='btn-product btn-cart' title='Add to cart'><span>add to cart</span></a>";
                    display += "</div>";
                }

                display += "<br />";
                display += "<div class='product-cat'>";
                display += "<a href='/Shop.aspx?ProdCatId=" + pCat.ProductCategoryId + "'>" + pCat.Name + "</a>";
                display += "</div>"; // End.product-cat
                display += "<h3 class='product-title'><a href='ProductInfo.aspx?ProdId=" + p.ProductId + "'>" + p.Name + "</a></h3>"; //<!-- End.product-title -->

                if (p.Discount > 0)
                {
                    display += "<div class='product-price'>";
                    display += "<span class='new-price'> R " + String.Format("{0:N}", p.Price - p.Price * (p.Discount / 100.0M)) + "</span>";
                    display += "<span class='old-price'>Was R " + String.Format("{0:N}", p.Price) + "</span>";
                    display += "</div>"; //<!-- End.product-price -->
                }
                else 
                {
                    display += "<div class='product-price'>R " + String.Format("{0:N}", p.Price) + "</div>"; //< !--End.product - price-- >;
                }

                display += "</div>"; // End.product-body
                display += "</div>"; // End.product
            }

            return display;
        }

        private void DisplayFeaturedProducts()
        {
            FeaturedProducts.InnerHtml = PopulateByStatus("Featured");
        }

        private void DisplaySaleProducts()
        {
            SaleProducts.InnerHtml = PopulateByStatus("Sale");
        }

        private void DiplayTopRatedProducts()
        {
            // Todo - Select and order by rating (min = 4)
            TopRatedProducts.InnerHtml = PopulateByStatus("Top Rated");
        }

        private void DisplayPopulerCategories()
        {
            List<ProductCategory> categories = sr.GetProductCategories().ToList();

            string display = "";
            int displayedCategories = 0;

            foreach(ProductCategory category in categories)
            {
                if (displayedCategories > 5)
                {
                    break;
                }
                else if (category.ImageUrl != null)
                {
                    displayedCategories++;

                    display += "<div class='col-6 col-sm-4 col-lg-2'>";
                    display += "<a href='/Shop.aspx?ProdCatId=" + category.ProductCategoryId + "' class='cat-block'>";
                    display += "<figure>";
                    display += "<span>";
                    display += "<img src='" + category.ImageUrl + "' alt='Category image'>";
                    display += "</span>";
                    display += "</figure>";

                    display += "<h3 class='cat-block-title'>" + category.Name + "</h3>"; // <!-- End.cat-block-title -->
                    display += "</a>";
                    display += "</div>"; //<!-- End.col-sm-4 col-lg-2 -->
                }
            }

            PopulerCategories.InnerHtml = display;
        }
    }
}