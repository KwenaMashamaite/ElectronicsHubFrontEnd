using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Login : System.Web.UI.Page
    {
        BackendServiceClient sr = new BackendServiceClient();  

        protected void Page_Load(object sender, EventArgs e)
        {
            // A user is already signed in
            if (!Session["UserRole"].Equals("Guest"))
            {
                Response.Redirect("~/Index.aspx");
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            int userId = sr.LoginUser(Email.Text, Password.Text);

            if (userId != -1)
            {
                string userRole = sr.GetUser(userId).Role;
                Session["UserId"] = userId;
                Session["UserRole"] = userRole;

                if (userRole.Equals("Customer"))
                {
                    // By default all registered customers have a cart associated with them
                    Session["UserCartId"] = sr.GetCart(userId).CartId;
                }

                // Redirect to previous page after login
                if (Request.QueryString["redi"] != null)
                {
                    Response.Redirect(Request.QueryString["redi"].ToString());
                } 
                else
                {
                    Response.Redirect("~/Index.aspx");
                }
            } 
            else
            {
                Error.InnerHtml = "Login failed: email or password is incorrect.";
            }
        }
    }
}