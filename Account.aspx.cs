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
                PrefillPersonalDetails();
            }
        }

        protected void SavePersonalDetButton_Click(object sender, EventArgs e)
        {

        }

        private void PrefillPersonalDetails()
        {
            User user = sr.GetUser((int)Session["UserId"]);

            PersFirstName.Value = user.FirstName;
            PersLastName.Value = user.LastName;
            PersPhone.Value = user.Phone;
        }
    }
}