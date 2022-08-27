using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicsHub_FrontEnd
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged in users can access this page
            if (Session["UserId"] != null) {
                Session["UserId"] = null;
                Session["UserRole"] = "Guest";

                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.Redirect("~/404.aspx");
            }
        }
    }
}