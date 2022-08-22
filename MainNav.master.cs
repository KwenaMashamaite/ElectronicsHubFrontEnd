using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public partial class MainNav : System.Web.UI.MasterPage
    {
        BackendServiceClient sr = new BackendServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Remove logo from top nav bar
            if (Session["UserRole"].Equals("Guest") || Session["UserRole"].Equals("Customer"))
            {
                HyperLink logoAnchor = (HyperLink) Master.FindControl("LgAnchor");
                logoAnchor.Visible = false;
            }

            // Dynamically display categories
            var prodCategories = sr.GetProductCategories();
            string display = "";


            // Dynamically display product categories in 'Search product' section
            display = "<select id='cat' name = 'cat'>"
                    + "<option value='all'> All Departments </option>";

            foreach (ProductCategory pCat in prodCategories)
            {
                display += "<option value='" + pCat.ProductCategoryId + "'>" + pCat.Name + "</option>";
            }

            display += "</select>";

            ProdCatSearch.InnerHtml = display;
            display = String.Empty;

            // Dynamically display categories in 'Browse Categories' section
            foreach (ProductCategory pCat in prodCategories)
            {
                var productSubcategories = sr.GetProductSubcategories(pCat.ProductCategoryId).ToList();

                if (productSubcategories.Count == 0)
                {
                    display += "<li><a href='#'>" + pCat.Name + "</a>";
                }
                else
                {
                    display += "<li class='megamenu-container'>"
                         + "<a class='sf-with-ul' href='#'>" + pCat.Name + "</a>";

                    display += "<ul>";

                    foreach (ProductSubcategory prodSubcat in productSubcategories)
                    {
                        display += "<li><a href='#'>" + prodSubcat.Name + "</a></li>";
                    }

                    display += "</ul>";
                }

                display += "</li>";
            }

            ProdCategory.InnerHtml = display;
        }
    }
}