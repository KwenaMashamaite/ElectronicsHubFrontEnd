using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ServiceReference1;

namespace ElectronicsHub_FrontEnd
{
    public partial class Register : System.Web.UI.Page
    {
        Service1Client sr = new Service1Client();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Password.Text.Equals(Password2.Text))
            {
                int userId = sr.RegisterUser(FirstName.Text, Surname.Text, Email.Text, Phone.Text, Password.Text, "CUSTOMER");

                Response.Write("<script>alert('user id = " + userId + "')</script>");

                if (userId == -1)
                {
                    Response.Write("<script>alert('Email address already in use')</script>");
                }
                else if (userId == 0)
                {
                    Response.Write("<script>alert('Failed to create account')</script>");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            } 
            else
            {
                Response.Write("<script>alert('Passwords dont match')</script>");
            }
        }
    }
}