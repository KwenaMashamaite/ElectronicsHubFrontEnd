using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class TopNav : System.Web.UI.MasterPage
    {
        BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["UserRole"].Equals("Guest"))
            {
                LgAnchor.NavigateUrl = "~/Account/" + Session["UserRole"] + "/Index.aspx";

                string firstName = sr.GetUser((int) Session["UserId"]).FirstName;

                LoginLinks.InnerHtml = "<li><a runat='server' id='LogoutButton' href='/Logout.aspx'>Logout</a></li>" +
                                       "<li><a runat='server' href=#><i class='icon-user'></i>" + firstName + "</a></li>";
            }
            else
            {
                LgAnchor.NavigateUrl = "~/Index.aspx";
            }
        }
    }
}