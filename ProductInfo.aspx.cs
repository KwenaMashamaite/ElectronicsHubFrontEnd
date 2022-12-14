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
    public partial class ProductInfo : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();
        private int prodQuantity = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page cannot be displayed without a product
            if (Request.QueryString["ProdId"] == null)
            {
                Response.Redirect("~/404.aspx");
            }
            
            Product prod = sr.GetProductById(Int32.Parse(Request.QueryString["ProdId"].ToString()));

            // Page cannot be displayed without a product
            if (prod == null)
            {
                Response.Redirect("~/404.aspx");
            }

            prodQuantity = prod.Quantity;
            
            // Links to next and previous products
            InitLinks(prod.ProductId);

            // Dynamically display product images
            DisplayProductImages(prod);

            // Dynamically display product details
            List<ProductReview> prodReviews = sr.GetProductReviews(prod.ProductId).ToList();
            DisplayProductDetails(prod, prodReviews);

            // Dynamically display product description
            ProdDesc.InnerHtml = prod.Description;

            // Dynamically display product reviews
            DisplayProductReviews(prodReviews);
        }

        private void DisplayProductImages(Product prod)
        {
            ProductImage prodImg = sr.GetProductImage(prod.ProductId);
            string display = "";

            display += "<div class='product-gallery product-gallery-vertical'>";
            display += "<div class='row'>";
            display += "<figure class='product-main-image'>";

            if (prod.Discount > 0)
            {
                display += "<span class='product-label label-sale'>" + prod.Discount + "% OFF</span>";
            }

            display += "<img id='product-zoom' src='" + prodImg.LargePhotoUrl + "' data-zoom-image='" + prodImg.LargePhotoUrl + "' alt='product image'>";
            display += "<a href='#' id='btn-product-gallery' class='btn-product-gallery'>";
            display += "<i class='icon-arrows'></i>";
            display += "</a></figure>";

            // Display additional product images
            var extraProdImgs = sr.GetAdditionalProductImages(prod.ProductId);

            display += "<div id='product-zoom-gallery' class='product-image-gallery'>";

            // First image always main display image
            display += "<a class='product-gallery-item active' href='#' data-image='" + prodImg.LargePhotoUrl + "' data-zoom-image='" + prodImg.LargePhotoUrl + "'>";
            display += "<img src='" + prodImg.LargePhotoUrl + "' alt='product side'>";
            display += "</a>";

            for (int i = 0; i < extraProdImgs.Length; i++)
            {
                // For some reason, the page doesn't display properly if we show more than 4 images
                if (i > 2)
                    break;

                ProductImageExtra prodImgExtra = extraProdImgs[i];
                display += "<a class='product-gallery-item active' href='#' data-image='" + prodImgExtra.ImageUrl + "' data-zoom-image='" + prodImgExtra.ImageUrl + "'>";
                display += "<img src='" + prodImgExtra.ImageUrl + "' alt='product side'>";
                display += "</a>";
            }

            display += "</div></div></div>";

            ProdImages.InnerHtml = display;
        }

        private void DisplayProductDetails(Product prod, List<ProductReview> prodReviews)
        {
            string display = "<h1 class='product-title'>" + prod.Name + "</h1>";
            
            // Only display product rating if it has been reviewed
            if (prodReviews.Count() > 0)
            {
                display += "<div class='ratings-container'>";
                display += "<div class='ratings'>";
                display += "<div class='ratings-val' style='width: " + Helper.ConvRatingToPercentage(Helper.GetReviewsAverage(prodReviews)) + "%;'> </div>";
                display += "</div>"; //End.ratings
                display += "<div> " + Helper.GetReviewsAverage(prodReviews);
                display += "<a class='ratings-text' href='#ProdReviewsLink' id='review-link'> ( " + prodReviews.Count() + " Reviews )</a></div>";
                display += "</div>"; //End.rating-container
            }

            if (prod.Discount > 0)
            {
                display += "<div class='product-price'>";
                display += "<span class='new-price'> R " + String.Format("{0:N}", prod.Price - prod.Price * (prod.Discount / 100.0M)) + "</span>";
                display += "<span class='old-price'>Was R " + String.Format("{0:N}", prod.Price) + "</span>";
                display += "</div>"; //<!-- End.product-price -->
            }
            else
            {
                display += "<div class='product-price'><b>R " + String.Format("{0:N}", prod.Price) + "</b></div>";
            }

            display += "<div class='product-content'>";
            display += "<div class='details-filter-row details-row-size'>";
            display += "<p> Brand: " + prod.Brand + "</p></div>";
            display += "<p>In Stock: " + prod.Quantity + "</p>";
            display += "</div>"; // End.details-filter-row
            display += "<div class='product-details-action'>";

            // Only logged in users can add to cart
            if (Session["UserRole"].Equals("Manager"))
            {
                AddToCartContent.Visible = false;

                display += "<a href='/EditProduct.aspx?ProdId=" + prod.ProductId + "' class='btn-product btn-cart'>Edit</a><br>";
                display += "<a href='/DeleteProduct.aspx?ProdId=" + prod.ProductId + "' class='btn-product btn-cart'>Remove</a>";
            }
            else
            {
                AddToCartContent.Visible = true;

                if (prod.Quantity <= 0)
                {
                    AddToCart.Enabled = false;
                    AddToCart.Text = "Out of stock";
                    ProdQuant.Enabled = false;
                }
            }
            

            display += "</div>";//End.row

            ProdDetails.InnerHtml = display;
        }

        private void InitLinks(int prodId)
        {
            NextProdLink.HRef = (sr.GetProductById(prodId + 1) != null) ? Request.Url.AbsolutePath.ToString() + "?ProdId=" + (prodId + 1) : "#";
            PrevProdLink.HRef = (sr.GetProductById(prodId - 1) != null) ? Request.Url.AbsolutePath.ToString() + "?ProdId=" + (prodId - 1) : "#";
        }

        private void DisplayProductReviews(List<ProductReview> prodReviews)
        {
            int numReviews = prodReviews.Count();

            ProdReviewsLink.InnerHtml = "Reviews( " + numReviews + " )";

            if (numReviews == 0)
            {
                ProdReviews.InnerHtml = "<p>This product has no reviews yet</p>";
            }
            else
            {
                string display = "";

                foreach (var rev in prodReviews)
                {
                    display += "<div class='review'>";
                    display += "<div class='row no-gutters'>";
                    display += "<div class='col-auto'>";
                    display += "<h4>" + rev.ReviewerName + "</h4>";
                    display += "<div class='ratings-container'>";
                    display += "<div class='ratings'>";
                    display += "<div class='ratings-val' style='width: " + Helper.ConvRatingToPercentage(rev.Rating) + "%;'></div>"; // End.ratings-val
                    display += "</div>"; // End.ratings
                    display += "<div> " + rev.Rating + "</div>";
                    display += "</div>"; // End.rating-container
                    display += "<span class='review-date'>" + rev.ReviewDate.ToString().Split(' ')[0] + "</span>";
                    display += "</div>"; // End.col
                    display += "<div class='col'>";
                    display += "<h4>" + rev.Title + "</h4>";
                    display += "<div class='review-content'>";
                    display += "<p>" + rev.Comment + "</p>";
                    display += "</div>"; // End.review-content

                    display += "<div class='review-action'>";
                    display += "<a href='#'><i class='icon-thumbs-up'></i>Helpful (" + sr.GetProductReviewUpvoteCount(rev.ProductReviewId) + ")</a>";
                    display += "</div>"; // End.review-action
                    display += "</div>"; // End.col-auto
                    display += "</div>"; // End.row
                    display += "</div>"; // End.review
                }

                ProdReviews.InnerHtml = display;
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Session["Quantity"] = ProdQuant.Text;

                Response.Redirect("~/Cart.aspx?AddProdId=" + Request.QueryString["ProdId"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx?redi=/ProductInfo.aspx?ProdId=" + Request.QueryString["ProdId"]);
            }
        }

        protected void ProdQuant_TextChanged(object sender, EventArgs e)
        {
            if (Int32.Parse(ProdQuant.Text) > prodQuantity)
            {
                AddToCart.Enabled = false;
            }
            else
            {
                AddToCart.Enabled = true;
            }
        }
    }
}