﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class DeleteProduct : System.Web.UI.Page
    {
        private BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            Desc.InnerHtml = "Your about to permanently delete product number <b>" + Request.QueryString["ProdId"].ToString() + "</b>"
                           + " , please enter the product number to proceed <br>";

            
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            int prodId = Int32.Parse(Request.QueryString["ProdId"].ToString());
            int enteredProdId = Int32.Parse(ProductId.Value);

            if (enteredProdId != prodId)
            {
                OutcomeMsg.Style.Add("color", "red");
                OutcomeMsg.InnerText = "Failed to remove product: id's don't match";
            }
            else
            {
                // Remove product

                OutcomeMsg.Style.Add("color", "green");
                OutcomeMsg.InnerText = "Product removed successfully";
            }
        }
    }
}