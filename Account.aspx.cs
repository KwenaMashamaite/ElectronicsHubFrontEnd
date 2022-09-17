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
                int userId = Convert.ToInt32(Session["UserId"]);

                DisplayPersonalDetails(userId);
                
                if (Session["UserRole"].Equals("Customer")) 
                {
                    DisplayInvoices(userId);
                }
            }
        }

        protected void SavePersonalDetButton_Click(object sender, EventArgs e)
        {
            // TODO - Update perosnal details
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            // TODO - Update password
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

            PersFirstName.Value = user.FirstName;
            PersLastName.Value = user.LastName;
            PersPhone.Value = user.Phone;
            PersEmail.Value = user.Email;
        }
    }
}