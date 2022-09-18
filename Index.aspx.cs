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
        }

        private string PopulateByStatus(string status)
        {
            List<Product> products = sr.GetProductByStatus(status).ToList();

            string display = "";

            foreach (Product p in products)
            {
                display += "<div class='product product-2'>";
                display += "<figure class='product-media'>";
                display += "<a href='ProductInfo.aspx?ProdId=" + p.ProductId + "'>";

                //Product Image
                ProductImage pImg = sr.GetProductImage(p.ProductId);

                display += "<img src='" + pImg.LargePhotoUrl + "' alt='Product image' class='product-image'>";
                display += "</a>";
                display += "</figure>"; // <!-- End.product-media -->


                display += "<div class='product-body'>";
                display += "<div class='product-cat'>";

                // Produc category
                ProductCategory pCat = sr.GetProductCategory(p.ProductCategoryId);

                display += "<a href='/Shop.aspx?ProdCatId=" + pCat.ProductCategoryId + "'>" + pCat.Name + "</a>";
                display += "</div>"; // End.product-cat
                display += "<h3 class='product-title'><a href='ProductInfo.aspx?ProdId=" + p.ProductId + "'>" + p.Name + "</a></h3>"; //<!-- End.product-title -->
                display += "<div class='product-price'>R " + String.Format("{0:N}", p.Price) + "</div>"; //< !--End.product - price-- >;
                display += "</div>"; // End.product-body

                if (!Session["UserRole"].Equals("Manager"))
                {
                    // Add to cart button
                    display += "<div >";
                    display += "<a href='/Cart.aspx?AddProdId=" + p.ProductId + "' class='btn-product btn-cart' title='Add to cart'><span>add to cart</span></a>";
                    display += "</div>";
                }

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
    }
}