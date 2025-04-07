//  Mahajan-8921

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mahajan_BookStore_921
{
    public partial class Checkout_8921 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {



        }
        //Connect your button(Click event) with this method when users presses place order 
        protected void btnPlaceOrderButton(object sender, EventArgs e)
        {
            //No errors
            if (IsValid)
            {
                //Get customer data
                GetCustomerData();
                //Redirect to Confirmation page

                lblMessage.Text = "Order Placed Successfully by the user!";
                lblMessage.Visible = true;
                ClearCheckoutForm();
                Session["Cart"] = null;
            }

        }
        //Connect your button(Click event) with this method when user click on go back
        protected void btnGoBack(object sender, EventArgs e)
        {
            //remove cart [user selection] from session
            Session.Remove("Cart");
            //remove customer information from session
            Session.Remove("Customer");
            //go back to order
            Response.Redirect("~/BookStore/Cart");
        }

        //load the Customer data when we load the page again
        private void LoadCustomerData()
        {

        }

        //add data to user object and save it in the session
        private void GetCustomerData()
        {
            //Create Customer Object, if we don't have

        }

        protected void ContinueShopping(object sender, EventArgs e)
        {
            Response.Redirect("~/BookStore/Products");
        }


   

        //To clear the items from the cart as per instructions and setting the radio to clear and clearing checkbox selected

        private void ClearCheckoutForm()
        {
            txtEmail1.Text = string.Empty;
            txtEmail2.Text = string.Empty;
            firstname.Text = string.Empty;
            lastname.Text = string.Empty;
            cellphone.Text = string.Empty;
            Address.Text = string.Empty;
            City.Text = string.Empty;
            ddlState.SelectedIndex = 0;
            Zip.Text = string.Empty;

            // Clearing the checkbox selected item over here

            foreach (ListItem item in cblAboutList.Items)
            {
                item.Selected = false;
            }

            rblContactVia.ClearSelection();
        
    }
}
}