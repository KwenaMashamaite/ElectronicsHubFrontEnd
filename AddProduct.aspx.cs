using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Manager"))
            {
                Response.Redirect("~/404.aspx");
            }
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            Product prod = sr.CreateProduct(Name.Value, Description.Value, Category.Value, Subcategory.Value, Decimal.Parse(Price.Value), Int32.Parse(Quantity.Value), Brand.Value, Status.Value, ImageUrl.Value);

            if (prod != null)
            {
                SuccessMsg.Visible = true;
                SuccessMsg.InnerText = "Product added successfully";
            }
            else
            {
                ErrorMsg.Visible = true;
                ErrorMsg.InnerText = "Failed to add product";
            }
        }
    }
}