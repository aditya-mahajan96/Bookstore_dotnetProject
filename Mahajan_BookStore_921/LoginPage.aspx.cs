//Last Name- Mahajan
//    id- 8921

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mahajan_BookStore_921
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelLogin(object sender, EventArgs e)
        {
          
            //go back to default page
            Response.Redirect("~/BookStore/Default");
        }
        protected void btnToProductsPage(object sender, EventArgs e)
        {

          //Saving the value of first name and family name user have set in the session id  and passing it to products page
            Session["refFirstName"] = firstname.Text;
            Session["refFamilyName"] = familyName.Text;

           //Using page route to move to new screen
            Response.Redirect("~/BookStore/Products");
        }
    }
}