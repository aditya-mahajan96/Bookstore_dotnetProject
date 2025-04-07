//Last Name- Mahajan
//    id- 8921

using Mahajan_BookStore_921.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Mahajan_BookStore_921
{
    public partial class Products_921 : System.Web.UI.Page
    {


        private Book selectedProduct;
        protected void Page_Load(object sender, EventArgs e)
        {
            //1-if the page didn't post back(first time to use it)
            if (IsPostBack == false)
            {
                //to load and display the data in ddlProducts
                ddlProducts.DataBind();


                //Fethching the firstname and family name user entered and displaying it on screen using blue color

                if (Session["refFirstName"] != null)
                {
                    string userName = Session["refFirstName"].ToString();
                    string userFamilyName = Session["refFamilyName"].ToString();

                    userFirstNameFamilyName.Text = "Welcome "+ userFamilyName+"," + userName;
                }
                else
                {
                    userFirstNameFamilyName.Text = "Welcome to the BookStore!";
                }
            }

            //2-Get and show the selected product on every load
            selectedProduct = this.GetSelectedProduct();

            //3- Display the data 
            lblName.Text = selectedProduct.Name;
            lblShortDescription.Text = selectedProduct.ShortDescription;
            lblLongDescription.Text = selectedProduct.LongDescription;
            lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c") + " each";
            imgProduct.ImageUrl = selectedProduct.ImageFile;

        }


        protected Book GetSelectedProduct()
        {
            //Create DataView to retrieve selected records 
            // A DataView enables you to create different views of the data stored in a DataTable,
            DataView productsTable = (DataView)
                      //Get all the records from data source 
                      SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            //Add Filter:
            //Retrieve a selected row [not all the records]
            productsTable.RowFilter =
                "ProductID = '" + ddlProducts.SelectedValue + "'";
            //get the first row 
            DataRowView row = productsTable[0];
            // -- -----------------------------------------------------
            //Createt Object from product
            Book p = new Book();
            //Get Product ID from row
            p.ProductID = row["ProductID"].ToString();
            //Get Product Name
            p.Name = row["Name"].ToString();

            p.ShortDescription = row["ShortDescription"].ToString();

            p.LongDescription = row["LongDescription"].ToString();

            p.UnitPrice = (decimal)row["UnitPrice"];

            p.ImageFile = "~/Images/Products/" + row["ImageFile"].ToString();

            return p;
            //--------------------------------------------------------- 
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //--------------------------------------------------
                //get cart from session state and selected item 
                //from cart
                //if we don't have it, create Cart in the session
                //retrun it as list 
                CartItemList cart = CartItemList.GetCartOrCreateIt(); //CartItemList.GetCart();
                //--------------------------------------------------
                //find this item in the cart that we have it in session
                CartItem cartItem = cart[selectedProduct.ProductID];
                //--------------------------------------------------
                //if item isn't in cart, add it; 
                //otherwise, increase its quantity
                if (cartItem == null)
                {
                    //add the product to the cart
                    cart.AddItem(selectedProduct,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    //update the quantity
                    cartItem.AddQuantity(
                        Convert.ToInt32(txtQuantity.Text));
                }
                //go to Cart page
                Response.Redirect("~/BookStore/Cart");
            }

        }
    }
}