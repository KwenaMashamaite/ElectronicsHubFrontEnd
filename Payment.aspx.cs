using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Payment : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Method"] == null || Session["UserId"] == null || !Session["UserRole"].Equals("Customer"))
            {
                Response.Redirect("~/404.aspx");
            }
            else
            {
                List<CartItem> cartItems = sr.GetCartItems(Int32.Parse(Session["UserCartId"].ToString())).ToList();

                // Can't make any payment with an empty cart
                if (cartItems.Count() == 0)
                {
                    Response.Redirect("~/Cart.aspx");
                }
                else
                {
                    if (Request.QueryString["Method"].Equals("Cash"))
                    {
                        Response.Redirect("~/Order.aspx");
                    }

                    TotalPrice.InnerHtml = "R " + String.Format("{0:N}", Helper.GetCartItemsTotal(cartItems));
                }
            }
        }

        protected void PlaceOrderBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Order.aspx");
        }
    }
}