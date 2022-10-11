using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class EditProduct : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Manager"))
            {
                Response.Redirect("~/404.aspx");
            }
            else if (Request.QueryString["ProdId"] == null)
            {
                ProdDetails.InnerHtml = "<h5>No product selected</h5>";
            }
            else if (!IsPostBack)
            {
                Product prod = sr.GetProductById(Int32.Parse(Request.QueryString["ProdId"].ToString()));

                if (prod != null)
                {
                    PageTitle.InnerText = "Update Product " + prod.ProductId + " Details:";
                    Name.Value = prod.Name;
                    Description.Value = prod.Description;
                    Cat.Value = sr.GetProductCategory(prod.ProductCategoryId).Name;

                    if (prod.ProductSubcategoryId != null)
                    {
                        Subcat.Value = sr.GetProductSubcategory((int)prod.ProductSubcategoryId).Name;
                    }

                    Price.Value = prod.Price.ToString();
                    Discount.Value = prod.Discount.ToString();
                    Quantity.Value = prod.Quantity.ToString();
                    Brand.Value = prod.Brand;
                    Status.Value = prod.Status;

                    ProductImage prodImg = sr.GetProductImage(prod.ProductId);
                    ImgUrl.Value = prodImg.LargePhotoUrl;
                    ProdImg.Src = prodImg.LargePhotoUrl;
                }
                else
                {
                    ProdDetails.InnerHtml = "<h5>Specified product does not exist</h5>";
                    ProdImg.Visible = false;
                }
            }
        }

        protected void UpdateProductButton_Click(object sender, EventArgs e)
        {
            int prodId = Int32.Parse(Request.QueryString["ProdId"].ToString());

            bool updated = sr.UpdateProduct(prodId, Name.Value, Description.Value, Cat.Value, 
                Subcat.Value, Decimal.Parse(Price.Value), Int32.Parse(Discount.Value), Int32.Parse(Quantity.Value), Brand.Value, Status.Value, ImgUrl.Value);

            if (updated)
            {
                SuccessMsg.Visible = true;
                SuccessMsg.InnerText = "Product details updated successfully";
            }
            else
            {
                ErrorMsg.Visible = true;
                ErrorMsg.InnerText = "Failed to update product, unknown category";
            }
        }
    }
}