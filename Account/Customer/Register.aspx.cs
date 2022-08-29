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
            if (!Session["UserRole"].Equals("Guest"))
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Password.Text.Equals(Password2.Text))
            {
                bool registered = sr.RegisterUser(FirstName.Text, Surname.Text, Email.Text, Phone.Text, Password.Text, "Customer");

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