using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Register : System.Web.UI.Page
    {
        BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            // A signed in customer cannot access this page
            if (Session["UserRole"].Equals("Customer"))
            {
                Response.Redirect("~/Login.aspx");
            } 
            // A signed in manager has the power to create other manager accounts
            else if (Session["UserRole"].Equals("Manager"))
            {
                RegisterTab.InnerText = "Create a manager account";
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Password.Text.Equals(Password2.Text))
            {
                // A manager can register other managers
                string userType = Session["UserRole"].Equals("Manager") ? "Manager" : "Customer";

                bool registered = sr.RegisterUser(FirstName.Text, Surname.Text, Email.Text, Phone.Text, Password.Text, userType);

                if (registered)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    Error.InnerHtml = "Registration failed: Email address is already in use by another account";
                }
            } 
            else
            {
                Error.InnerHtml = "Registration failed: Passwords don't match";
            }
        }
    }
}