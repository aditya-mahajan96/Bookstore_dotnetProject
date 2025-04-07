<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_8921.Master"  CodeBehind="LoginPage.aspx.cs" Inherits="Mahajan_BookStore_921.LoginPage" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
        <main>
            
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert-danger" HeaderText="Please correct these entries:" />
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Your First Name:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="firstname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="firstNameRequired" runat="server" ControlToValidate="firstname" CssClass="text-danger" ErrorMessage="First name">First name is required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Your Family Name:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="familyName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="familyNameRequired" runat="server" ControlToValidate="familyName" CssClass="text-danger" ErrorMessage="Family Name">Family name is required</asp:RequiredFieldValidator>
                    </div>
                </div>

                     <div class="clearfix form-group">
         <div class="col-md-offset-3 col-md-12">

           
             <asp:Button ID="btnToCancelLogin" runat="server" Text="Cancel Login SE8" CausesValidation="False" CssClass="btn btn-primary" OnClick="btnCancelLogin" />
        
              <asp:Button ID="btnToGoToProducts" runat="server" Text="Login_921"  CssClass="btn btn-primary" OnClick="btnToProductsPage" />
        

         </div>
     </div>
     
          </main>
 </asp:Content>