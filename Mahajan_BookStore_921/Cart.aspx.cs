//  Mahajan-8921

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mahajan_BookStore_921.Models;

namespace Mahajan_BookStore_921
{
    public partial class Cart : System.Web.UI.Page
    {
        //1-Create variable to hold cart address in session
        private CartItemList cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            //2- retrieve cart object from session state 
            //on every postback
            cart = CartItemList.GetCartOrCreateIt();

            // on initial page load, add cart items 
            //to list control (if it is not postBack)
            if (IsPostBack == false) this.DisplayCart();
        }

        private void DisplayCart()
        {
            //3- remove all current items from list control
            lstCart.Items.Clear();
            

                // loop through cart and add each item's 
                // display value to the list
                for (int i = 0; i < cart.Count; i++)
                {
                    lstCart.Items.Add(cart[i].Display());
                }

           
         
            }

            //4-Remove item
            protected void btnRemove_Click(object sender, EventArgs e)
        {
            // if cart contains items and user 
            //has selected an item...
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    // remove selected item from cart 
                    // and re-display cart
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                { //if no item is selected
                    lblMessage.Text =
                      "Please select the item to remove.";
                }
            }

        }

        //5- Clear all the items that user selected in Card/lstCart
        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            // if cart has items, clear both cart
            // and list control
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
                clearCart();
          
          
            }

        }

        //6- will continue working on it later
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Sorry, that function hasn't been " +
                "implemented yet.";

        }
        protected void clearCart()
        {
            btnRemove.Visible = false;
            lstCart.Visible = false;
            btnEmpty.Visible = false;
        }


    }
}