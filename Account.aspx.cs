using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class Account : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/404.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    int userId = Convert.ToInt32(Session["UserId"]);

                    DisplayPersonalDetails(userId);

                    if (Session["UserRole"].Equals("Customer"))
                    {
                        DisplayInvoices(userId);
                    }
                }
            }
        }

        protected void SavePersonalDetButton_Click(object sender, EventArgs e)
        {
            bool success = sr.UpdateUserDetails(Convert.ToInt32(Session["UserId"]), UFName.Value, ULName.Value, UPhone.Value, UEmail.Value);

            if (success)
            {
                PerDetailsError.Visible = false;
                PerDetailsSuccess.Visible = true;
            }
            else
            {
                PerDetailsSuccess.Visible = false;
                PerDetailsError.Visible = true;
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (UPass.Value.Equals("") || Upass2.Value.Equals(""))
            {
                PassSuccess.Visible = false;
                PassError.Visible = true;
                PassError.InnerText = "Failed to update password: At least one of the password inputs is empty";

                return;
            }
            else if (UPass.Value.Equals(Upass2.Value))
            {
                PassSuccess.Visible = false;
                PassError.Visible = true;
                PassError.InnerText = "Failed to update password: Current password is the same as the new password";

                return;
            }

            bool success = sr.UpdateUserPassword(Convert.ToInt32(Session["UserId"]), UPass.Value, Upass2.Value);

            if (success)
            {
                PassError.Visible = false;
                PassSuccess.Visible = true;
            }
            else
            {
                PassSuccess.Visible = false;
                PassError.Visible = true;
                PassError.InnerText = "Failed to update password: incorrect current password";
            }
        }

        private void DisplayInvoices(int userId)
        {
            List<Invoice> invoices = sr.GetInvoicesByUser(userId).ToList();

            if (invoices.Count == 0)
            {
                Invoices.InnerHtml = "<p> No order has been made yet.</p>"
                                   + "<a href='Shop.aspx' class='btn btn-outline-primary-2'><span>GO SHOP</span><i class='icon-long-arrow-right'></i></a>";
            } 
            else
            {
                string display = "";

                foreach (Invoice inv in invoices)
                {
                    display += "<tr>";
                    display += "<td class='left'>" + inv.InvoiceId + "</td>";
                    display += "<td class='center'>" + inv.OrderId + "</td>";
                    display += "<td class='right'>" + inv.IssueDate + "</td>";
                    display += "<td class='centre'><a href='/InvoiceInfo.aspx?Id=" + inv.InvoiceId + "'> View Details</a></td>";
                    display += "</tr>";
                }

                InvItems.InnerHtml = display;
            }
        }

        private void DisplayPersonalDetails(int userId)
        {
            User user = sr.GetUser(userId);

            UFName.Value = user.FirstName;
            ULName.Value = user.LastName;
            UPhone.Value = user.Phone;
            UEmail.Value = user.Email;
        }
    }
}