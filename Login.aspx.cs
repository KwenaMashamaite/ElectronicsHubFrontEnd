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

        private void RedirectHome(string userRole)
        {
            Response.Redirect("~/Account/" + userRole + "/Index.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["UserRole"].Equals("Guest"))
            {
                RedirectHome(Session["UserRole"].ToString());
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            int userId = sr.LoginUser(Email.Text, Password.Text);

            if (userId != -1)
            {
                Session["UserId"] = userId;

                string userRole = sr.GetUser(userId).Role;
                Session["UserRole"] = userRole;

                RedirectHome(userRole);
            } 
            else
            {
                Response.Write("<script>alert('Login failed: email or password is incorrect.')</script>");
            }
        }
    }
}