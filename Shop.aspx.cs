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
            if (!IsPostBack)
            {
                List<Product> products = GetProducts();

                if (Session["SortCriteria"] == null)
                {
                    Session["SortCriteria"] = "relevant";
                }
                else
                {
                    SortBy.SelectedValue = Session["SortCriteria"].ToString();
                    products = SortProducts(products, Session["SortCriteria"].ToString());
                }

                int curPageNum = GetCurrentPageNum();
                int prodCount = products.Count();

                // Get products for current page only
                products = PartitionProducts(products, curPageNum);

                // Dynamically display number of products displayed thus far
                DisplayProductCountInfo(curPageNum, prodCount);

                // Dynamically display products
                DisplayProducts(products);

                // Dynamically display shopping page navigation
                DisplayPageNavigation(curPageNum, prodCount);
            }
            else
            {
                List<Product> products = SortProducts(GetProducts(), Session["SortCriteria"].ToString());

                int curPageNum = GetCurrentPageNum();
                int prodCount = products.Count();

                // Get products for current page only
                products = PartitionProducts(products, curPageNum);

                // Dynamically display number of products displayed thus far
                DisplayProductCountInfo(curPageNum, prodCount);

                // Dynamically display products
                DisplayProducts(products);

                // Dynamically display shopping page navigation
                DisplayPageNavigation(curPageNum, prodCount);
            }
        }

        public void SortByDropDown_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SortCriteria"] = SortBy.SelectedItem.Value;

            List<Product> products = SortProducts(GetProducts(), SortBy.SelectedItem.Value);

            // Display products
            int curPageNum = GetCurrentPageNum();
            int prodCount = products.Count();

            // Get products for current page only
            products = PartitionProducts(products, curPageNum);

            // Dynamically display number of products displayed thus far
            DisplayProductCountInfo(curPageNum, prodCount);

            // Dynamically display products
            DisplayProducts(products);

            // Dynamically display shopping page navigation
            DisplayPageNavigation(curPageNum, prodCount);
        }

        private List<Product> SortProducts(List<Product> products, string sortCriteria)
        {
            if (sortCriteria.Equals("rating"))
            {
                products = products.OrderByDescending(p => Helper.GetReviewsAverage(sr.GetProductReviews(p.ProductId).ToList())).ToList();
            }
            else if (sortCriteria.Equals("date"))
            {
                products = products.OrderBy(p => p.CreationDate).ToList();
            }
            else if (sortCriteria.Equals("name"))
            {
                products = products.OrderBy(p => p.Name).ToList();
            }
            else if (sortCriteria.Equals("priceLowToHigh"))
            {
                products = products.OrderBy(p => p.Price).ToList();
            } 
            else if (sortCriteria.Equals("priceHighToLow"))
            {
                products = products.OrderByDescending(p => p.Price).ToList();
            }

            return products;
        }

        private int GetCurrentPageNum()
        {
            if (Request.QueryString["Page"] != null)
            {
                return Int32.Parse(Request.QueryString["Page"].ToString());
            }
            else
            {
                return 1;
            }
        }

        private List<Product> GetProducts()
        {
            List<Product> products;

            if (Request.QueryString["ProdCatId"] != null)
            {
                // Products requested by search request in all categories
                if (Request.QueryString["ProdCatId"].Equals("all"))
                {
                    products = sr.GetAllProducts().ToList();
                }
                else
                {
                    products = sr.GetProductsByCategory(Int32.Parse(Request.QueryString["ProdCatId"].ToString())).ToList();
                }

                // Products requested by search
                if (Request.QueryString["SearchQuery"] != null)
                {
                    string searchQuery = Request.QueryString["SearchQuery"].ToLower();

                    products = products.Where(p => p.Name.ToLower().Contains(searchQuery) || p.Brand.ToLower().Contains(searchQuery)).ToList();
                }
            }
            else if (Request.QueryString["ProdSubcatId"] != null)
            {
                products = sr.GetProductsBySubcategory(Int32.Parse(Request.QueryString["ProdSubcatId"].ToString())).ToList();
            }
            else
            {
                products = sr.GetAllProducts().ToList();
            }

            return products.Where(p => !p.Status.Equals("Not Available")).ToList();
        }

        private List<Product> PartitionProducts(List<Product> products, int pageNum)
        {
            return products.Skip(ITEMS_PER_PAGE * (pageNum - 1)).Take(ITEMS_PER_PAGE).ToList();
        }

        private void DisplayProductCountInfo(int curPageNum, int prodCount)
        {
            if (prodCount > ITEMS_PER_PAGE && curPageNum * ITEMS_PER_PAGE < prodCount)
            {
                ProdCount.InnerHtml = "Showing <span>" + (curPageNum * ITEMS_PER_PAGE) + " of " + prodCount + "</span> Products";
            }
            else
            {
                ProdCount.InnerHtml = "Showing <span>" + prodCount + " of " + prodCount + "</span> Products";
            }
        }

        private void DisplayProducts(List<Product> products)
        {
            int numProducts = products.Count();

            if (numProducts > 0)
            {
                string display = "";

                // Dynamically display products
                foreach (Product p in products)
                {
                    ProductImage pImg = sr.GetProductImage(p.ProductId);

                    // Product media
                    display += "<div class='col-6 col-md-4 col-lg-4 col-xl-3'>";
                    display += "<div class='product product-7 text-center'>";
                    display += "<figure class='product-media'>";

                    // Display sale label
                    if (p.Discount > 0)
                    {
                        display += "<span class='product-label label-sale'>" + p.Discount + "% OFF</span>";
                    }

                    display += "<a href='/ProductInfo.aspx?ProdId=" + p.ProductId + "'>";
                    display += "<img src='" + pImg.ThumbnailUrl + "' alt='Product image' class='product-image'></a>";
                    display += "<div class='product-action-vertical'></figure>";

                    // Product details
                    display += "<div class='product-body'>";

                    // Add to cart button
                    if (!Session["UserRole"].Equals("Manager"))
                    {
                        display += "<div >";

                        if (p.Quantity > 0)
                        {
                            display += "<a href='/Cart.aspx?AddProdId=" + p.ProductId + "' class='btn-product btn-cart' title='Add to cart'><span>add to cart</span></a>";
                        }
                        else
                        {
                            display += "<a href='javascript: void(0)' style='outline-color: grey; text-color: grey; opacity: 0.4; pointer-events: none; cursor: default;' class='btn-product btn-cart' title='Out of stock'><span>Out of stock</span></a>";
                        }
                        
                        display += "</div>";
                    }
                    
                    ProductCategory pCat = sr.GetProductCategory(p.ProductCategoryId);
                    display += "<br>";
                    display += "<div class='product-cat'>";
                    display += "<a href='/Shop.aspx?ProdCatId=" + pCat.ProductCategoryId + "'>" + pCat.Name + "</a>";
                    display += "</div>";
                    

                    display += "<h3 class='product-title'><a href='/ProductInfo.aspx?ProdId=" + p.ProductId + "'>" + p.Name + "</a></h3>";

                    // Display discount information
                    if (p.Discount > 0)
                    {            
                        display += "<div class='product-price'>";
                        display += "<span class='new-price'> R " + String.Format("{0:N}", p.Price - p.Price * (p.Discount / 100.0M)) + "</span>";
                        display += "<span class='old-price'>Was R " + String.Format("{0:N}", p.Price) + "</span>";
                        display += "</div>"; //<!-- End.product-price -->
                    }
                    else
                    {
                        display += "<div class='product-price'><b>R " + String.Format("{0:N}", p.Price) + "</b></div>";
                    }

                    // Display product rating
                    var prodReviews = sr.GetProductReviews(p.ProductId).ToList();

                    int prodReviewCount = prodReviews.Count();
                    double prodReviewAverage = Helper.GetReviewsAverage(prodReviews);
                    
                    display += "<div class='ratings-container'>";
                    display += "<div class='ratings'>";
                    display += "<div class='ratings-val' style='width: " + Helper.ConvRatingToPercentage(prodReviewAverage) + "%;'> </div>";
                    display += "</div>"; //End.ratings
                    display += "<div> " + prodReviewAverage;
                    display += "<a class='ratings-text' href='/ProductInfo.aspx?ProdId=" + p.ProductId + "' id='review-link'> ( " + prodReviewCount + " Reviews )</a></div>";
                    display += "</div>"; //End.rating-container
                    

                    display += "</div></div></div>";
                }

                ProdContainer.InnerHtml = display;
            }
            else
            {
                ProdContent.InnerHtml = "<h6>No product(s) not found</h6>";
            }
        }

        private void DisplayPageNavigation(int curPageNum, int prodCount)
        {
            int numPages = GetPageCount(prodCount);

            if (numPages != 0)
            {
                // Dynamically display shopping page navigation
                string display = "";

                for (int i = 1; i <= numPages; i++)
                {
                    if (i == curPageNum)
                    {
                        display += "<li class='page-item active' aria-current='page'><a class='page-link'>" + i + "</a></li>";
                    }
                    else
                    {
                        display += "<li class='page-item'><a class='page-link' href='" + Request.Url.AbsolutePath.ToString() + "?Page=" + i + "'>" + i + "</a></li>";
                    }
                }

                display += "<li class='page-item-total'>of " + numPages + "</li>";

                PageNav.InnerHtml = display;
            }
            else
            {
                PageNav.InnerHtml = "";
            }
        }

        private int GetPageCount(int numProducts)
        {
            if (numProducts == 0)
            {
                return 0;
            }
            else
            {
                double ratio = (double)numProducts / ITEMS_PER_PAGE;

                if (Math.Abs(ratio % 1) <= (Double.Epsilon * 100))
                {
                    // Number is whole
                    return (int)ratio;
                }
                else
                {
                    // We'll have x amount of pages with an additional page that has products < ITEMS_PER_PAGE
                    return ((int)Math.Truncate(ratio)) + 1;
                }
            }
        }
    }
}