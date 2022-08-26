using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicsHub_FrontEnd
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged in users can access this page
            if (Session["UserId"] != null) {
                Session["UserId"] = null;
                Session["UserRole"] = "Guest";

                // Replace logout link with login/register links
                //this.Page. FindControl("LoginLinks").InnerHtml = "<li><a runat='server' href = '~/Login.aspx'><i class='icon-user'></i>Login</a></li>" +
                  //                 "<li><a runat='server' href='~/Account/Customer/Register.aspx'>Register</a></li>";

                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.Redirect("~/404.aspx");
            }
        }
    }
}