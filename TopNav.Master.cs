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
            if (Session["UserId"] != null)
            {
                string firstName = sr.GetUser((int) Session["UserId"]).FirstName;

                if (Session["UserRole"].Equals("Manager"))
                {
                    LoginLinks.InnerHtml = "<li><a runat='server' id='LogoutButton' href='/Logout.aspx'>Logout</a></li>" +
                                           "<li><a runat='server' href='/Register.aspx'>Register Manager</a></li>" +
                                           "<li><a runat='server' href=#><i class='icon-user'></i>" + firstName + "</a></li>";
                }
                else
                {
                    LoginLinks.InnerHtml = "<li><a runat='server' id='LogoutButton' href='/Logout.aspx'>Logout</a></li>" +
                                           "<li><a runat='server' href=#><i class='icon-user'></i>" + firstName + "</a></li>";
                }
            }
        }
    }
}