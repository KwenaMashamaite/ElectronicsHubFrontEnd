using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ServiceReference1;

namespace ElectronicsHub_FrontEnd
{
    
    public partial class Login : System.Web.UI.Page
    {

        Service1Client sr = new Service1Client();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            var userInfo = sr.LoginUser(Email.Text, Password.Text);
            int userId = userInfo.Item1;

            if (userId != -1)
            {
                Session["LoggedInUserId"] = userId;

                string userType = userInfo.Item2;

                if (userType.Equals("CUSTOMER"))
                {
                    //Response.Redirect("CustomerHomePage.aspx");
                    Response.Write("<script>alert('Customer login successful')</script>");
                }
                else if (userInfo.Equals("MANAGER"))
                {
                    //Response.Redirect("ManagerHomePage.aspx");
                    Response.Write("<script>alert('Manager login successful')</script>");
                }
            } 
            else
            {
                Response.Write("<script>alert('Login failed: email or password is incorrect.')</script>");
            }
        }
    }
}