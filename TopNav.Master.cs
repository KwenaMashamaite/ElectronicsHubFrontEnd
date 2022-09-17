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
                User user = sr.GetUser((int) Session["UserId"]);

                DisplayAuthenticationInfo(user.FirstName, user.Role);
                DisplayMyAccountDropdown(user.Role);
            }
            else
            {
                MyAccountDiv.Visible = false;
            }
        }

        private void DisplayAuthenticationInfo(string userFirstName, string userType)
        {
            string display = "<li><i class='icon-user'></i>Hi " + userFirstName + "</li>"
                           + "<li><a runat='server' id='LogoutButton' href='/Logout.aspx'>Logout</a></li>";

            if (userType.Equals("Mananger"))
            {
                display += "<li><a runat='server' href='/Register.aspx'>Register Manager</a></li>";
            }

            LoginLinks.InnerHtml = display;
        }

        private void DisplayMyAccountDropdown(string userType)
        {
            string display = "<li><a href='/Account.aspx'>Personal details</a></li>";

            if (userType.Equals("Manager"))
            {
                display += "<li><a href='/AddProduct.aspx'>Add new product</a></li>";
                display += "<li><a href='/Register.aspx'>Register new manager</a></li>";
                display += "<li><a href='#'>View Reports</a></li>";
            } 
            else if (userType.Equals("Customer"))
            {
                display += "<li><a href='/Account.aspx#tab-orders'>Invoices</a></li>";
                display += "<li><a href='#'>Track order</a></li>";
            }

            MyAccountDropdown.InnerHtml = display;
        }
    }
}