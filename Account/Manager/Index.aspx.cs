using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicsHub_FrontEnd.Account.Manager
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["UserRole"].Equals("Manager"))
            {
                Response.Redirect("~/404.aspx");
            }
        }
    }
}