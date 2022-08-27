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
    public partial class Shop : System.Web.UI.Page
    {
        private const int ITEMS_PER_PAGE = 12;
        private static Random random = new Random();
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            int pageNum = 1;

            if (Request.QueryString["Page"] != null)
            {
                pageNum = Int32.Parse(Request.QueryString["Page"].ToString());
            }

            List<Product> products = null;

            if (Request.QueryString["ProdCatId"] != null)
            {
                products = sr.GetProductsByCategory(Int32.Parse(Request.QueryString["ProdCatId"].ToString())).ToList();
            }
            else if (Request.QueryString["ProdSubcatId"] != null)
            {
                products = sr.GetProductsBySubcategory(Int32.Parse(Request.QueryString["ProdSubcatId"].ToString())).ToList();
            }
            else
            {
                products = sr.GetAllProducts().ToList();
                //products = sr.GetAllProducts().OrderBy(p => random.Next()).ToList();
            }

            int prodCount = products.Count();

            if (prodCount > ITEMS_PER_PAGE && pageNum * ITEMS_PER_PAGE < prodCount)
            {
                ProdCount.InnerHtml = "Showing <span>" + (pageNum * ITEMS_PER_PAGE) + " of " + prodCount + "</span> Products";
            }
            else
            {
                ProdCount.InnerHtml = "Showing <span>" + prodCount + " of " + prodCount + "</span> Products";
            }

            // Partition products page
            double ratio = (double) prodCount / ITEMS_PER_PAGE;
            int numPages = GetPageCount(prodCount);

            products = products.Skip(ITEMS_PER_PAGE * (pageNum - 1)).Take(ITEMS_PER_PAGE).ToList();

            string display = "";

            if (prodCount != 0)
            {
                // Dynamically display products
                foreach (Product p in products)
                {
                    ProductImage pImg = sr.GetProductImage(p.ProductId);

                    // Product media
                    display += "<div class='col-6 col-md-4 col-lg-4 col-xl-3'>";
                    display += "<div class='product product-7 text-center'>";
                    display += "<figure class='product-media'>";
                    display += "<a href='/ProductInfo.aspx?ProdId=" + p.ProductId + "'>";
                    display += "<img src='" + pImg.ThumbnailUrl + "' alt='Product image' class='product-image'></a>";
                    display += "<div class='product-action-vertical'></figure>";

                    // Product details
                    display += "<div class='product-body'>";

                    // Only display category if random products are displayed
                    if (Request.QueryString["ProdCatId"] == null && Request.QueryString["ProdSubcatId"] == null)
                    {
                        ProductCategory pCat = sr.GetProductCategory(p.ProductCategoryId);
                        display += "<div class='product-cat'>";
                        display += "<a href='/Shop.aspx?ProdCatId=" + pCat.ProductCategoryId + "'>" + pCat.Name + "</a>";
                        display += "</div>";
                    }

                    display += "<h3 class='product-title'><a href='/ProductInfo.aspx?ProdId=" + p.ProductId + "'>" + p.Name + "</a></h3>";
                    display += "<div class='product-price'>R " + String.Format("{0:0.00}", p.Price) + "</div>";

                    // Only display rating if product has reviews
                    var prodReviews = sr.GetProductReviews(p.ProductId);

                    if (prodReviews.Count() != 0)
                    {
                        display += "<div class='ratings-container'>";
                        display += "<div class='ratings'>";
                        display += "<div class='ratings-val' style='width: " + Helper.ConvRatingToPercentage(Helper.GetReviewsAverage(prodReviews)) + "%;'> </div>";
                        display += "</div>"; //End.ratings
                        display += "<div> " + Helper.GetReviewsAverage(prodReviews);
                        display += "<a class='ratings-text' href='/ProductInfo.aspx?ProdId='" + p.ProductId + "#ProdReviewsLink' id='review-link'> ( " + prodReviews.Count() + " Reviews )</a></div>";
                        display += "</div>"; //End.rating-container
                    }

                    display += "</div></div></div>";
                }

                ProdContainer.InnerHtml = display;

                // Dynamically display shopping page navigation
                string pageNavDisplay = "";

                for (int i = 1; i <= numPages; i++)
                {
                    if (i == pageNum)
                    {
                        pageNavDisplay += "<li class='page-item active' aria-current='page'><a class='page-link' href='#'>" + i + "</a></li>";
                    }
                    else
                    {
                        pageNavDisplay += "<li class='page-item'><a class='page-link' href='" + Request.Url.AbsolutePath.ToString() + "?Page=" + i + "'>" + i + "</a></li>";
                    }
                }

                pageNavDisplay += "<li class='page-item-total'>of " + numPages + "</li>";

                PageNav.InnerHtml = pageNavDisplay;
            } 
            else
            {
                ProdContainer.InnerHtml = "<h5>No products to display</h5>";
                PageNav.InnerHtml = "";
            }
        }

        private int GetPageCount(int numProducts)
        {
            double ratio = (double) numProducts / ITEMS_PER_PAGE;

            if (Math.Abs(ratio % 1) <= (Double.Epsilon * 100))
            {
                // Number is whole
                return (int) ratio;
            }
            else
            {
                // We'll have x amount of pages with an additional page that has products < ITEMS_PER_PAGE
                return ((int) Math.Truncate(ratio)) + 1;
            }
        }
    }
}