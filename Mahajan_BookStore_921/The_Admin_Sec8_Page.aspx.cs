//Last Name- Mahajan
//    id- 8921


using System;

using System.Collections.Generic;

using System.Data.SqlClient;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



namespace Mahajan_BookStore_921

{

    public partial class The_Admin_Sec8_Page : System.Web.UI.Page

    {

        protected void Page_Load(object sender, EventArgs e)

        {



        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)

        {



        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)

        {

            //this code will run when we are trying to delete the data but as its colinked sometimes with other table

            if (e.Exception != null)

            {

                lblError.Text = "Database Error : <br/> : " + e.Exception.Message;

                e.ExceptionHandled = true;

            }

            else

            {

                lblError.Text = "";

            }

        }



        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)

        {
            //By default i have kept the label error as empty and its gonna run error if row updated runs into some  error 

            if (e.Exception != null)

            {
                //As per instrutions 6 part Display any error, after RowUpdated, the error message must include your student id. i have added mine

                lblError.Text = "Database Error  =8958921: <br/> : " + e.Exception.Message;

                e.ExceptionHandled = true;

                e.KeepInEditMode = true;

            }

            else

            {

                lblError.Text = "";

            }

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {


        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "Aditya Mahajan's Database error : <br /> " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else
            {
                lblError.Text = "";
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }

}