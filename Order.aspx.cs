using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Order : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Customer"))
            {
                Response.Redirect("~/404.aspx");
            }
            else
            {
                int orderId = Int32.Parse(Request.QueryString["Id"]);
                Invoice inv = sr.GetInvoiceByOrder(orderId);
                
                InvLink.HRef = "/InvoiceInfo.aspx?Id=" + inv.InvoiceId;
            }
        }
    }
}