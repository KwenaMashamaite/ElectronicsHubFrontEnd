using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicsHub_FrontEnd
{
    public partial class MainNav : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"].Equals("Guest") || Session["UserRole"].Equals("Customer"))
            {
                HyperLink logoAnchor = (HyperLink) Master.FindControl("LgAnchor");
                logoAnchor.Visible = false;
            }
        }
    }
}