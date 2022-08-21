using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicsHub_FrontEnd
{
    public partial class _404 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userRole = Session["UserRole"].ToString();

            if (userRole.Equals("Guest")) 
            {
                HomepageAnchor.NavigateUrl = "~/Index.aspx";
            }
            else
            {
                HomepageAnchor.NavigateUrl = "~/Account/" + userRole + "/Index.aspx"; ;
            }
        }
    }
}