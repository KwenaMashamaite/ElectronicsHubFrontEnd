using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicsHub_FrontEnd
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || !Session["UserRole"].Equals("Customer"))
            {
                Response.Redirect("~/404.aspx");
            }
        }
    }
}