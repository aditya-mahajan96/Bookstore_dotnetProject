<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site_8921.Master" CodeBehind="Checkout_8921.aspx.cs" Inherits="Mahajan_BookStore_921.Checkout_8921" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
  
    <main>
           
                <h1>Check Out Page </h1>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert-danger" HeaderText="Please correct these entries:" />
                <h3>Contact Information</h3>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Your Email:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ErrorMessage="Email"
                            ControlToValidate="txtEmail1"
                            CssClass="text-danger"
                            Display="Dynamic"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"> Enter a valid email address</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ErrorMessage="Email Address"
                            ControlToValidate="txtEmail1" CssClass="text-danger" Display="Dynamic" Text="Email f">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Email Re-entry:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:CompareValidator ID="cvEmail2" runat="server" ErrorMessage="Email Re-entery" ControlToCompare="txtEmail1" ControlToValidate="txtEmail2" CssClass="text-danger" Display="Dynamic">Must match first email address</asp:CompareValidator>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmailreentry" runat="server" ControlToValidate="txtEmail2" CssClass="text-danger" ErrorMessage="Email Re-entery ">Email re-entry is required</asp:RequiredFieldValidator>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Your First Name:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="firstname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="refFirstName" runat="server" ControlToValidate="firstname" CssClass="text-danger" ErrorMessage="First name">First name is required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Your Last Name:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="lastname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="refLastname" runat="server" ControlToValidate="lastname" CssClass="text-danger" ErrorMessage="Last name">Last name is required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3">Phone Number:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="cellphone" runat="server" CssClass="form-control" TextMode="phone"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RegularExpressionValidator ID="revCellphone" runat="server" ErrorMessage="Phone number" ControlToValidate="cellphone" CssClass="text-danger" Display="Dynamic" ForeColor="#CC3300" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Use this pattern: 123-456-7890</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="refCellphone" runat="server" ErrorMessage="Phone number" Text="Phone number is required" ControlToValidate="cellphone" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <h3>Billing Address</h3>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3">Your Address:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="Address" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="refAddress" runat="server" ErrorMessage="Address feild" Text="Address field is required" ControlToValidate="Address" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3">City:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="City" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="refCity" runat="server" ErrorMessage="Billing City" Text="City is required" ControlToValidate="City" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">State:</label>
                    <div class="col-md-5">
                        <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="StateCode"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" SelectCommand="SELECT DISTINCT [StateCode], [StateName] FROM [States] ORDER BY [StateName]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="refState" runat="server" ErrorMessage="Billing State" ControlToValidate="ddlState" CssClass="text-danger">State is required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <label class="control-label col-md-3 ">Zip Code:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="Zip" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RegularExpressionValidator ID="revZip" runat="server" ErrorMessage="Billing Zip Code" ControlToValidate="Zip" CssClass="text-danger" Display="Dynamic" ValidationExpression="\d{5}(-\d{4})?">You need to Use this format: 99999 or 99999-9999</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="refZip" runat="server" ErrorMessage="Billing Zip Code" CssClass="text-danger" ControlToValidate="Zip">Zip code is required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <h3>Optional data</h3>
                <div class="clearfix form-group">
                    <div class="col-md-offset-3 col-md-12 col-lg-12">
                        <label>Please let me know about:</label>
                        <div class="checkbox-list">
                            <asp:CheckBoxList ID="cblAboutList" runat="server" RepeatColumns="2">
                                <asp:ListItem Selected="True" Value="New">New products</asp:ListItem>
                                <asp:ListItem Value="Special">Special offers</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Revisions">New editions</asp:ListItem>
                                <asp:ListItem Value="Local ">Local events</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>
                </div>
                <div class="clearfix form-group">
                    <div class="col-md-offset-3 col-md-12 col-lg-12">
                        <label>Please reach us via:</label>
                        <div class="radio-list">
                            <asp:RadioButtonList ID="rblContactVia" runat="server" RepeatDirection="Horizontal" RepeatColumns="0">

                                <asp:ListItem>Facebook</asp:ListItem>
                                <asp:ListItem>Twitter</asp:ListItem>

                                <asp:ListItem Selected="True">Email</asp:ListItem>
                                <asp:ListItem Value="Text">SMS</asp:ListItem>

                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-3 col-md-6">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-success" Visible="False"></asp:Label>
                    </div>
                </div>



                <div class="clearfix form-group">
                    <div class="col-md-offset-3 col-md-12">

                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn btn-primary" OnClick="btnPlaceOrderButton" />
                        <asp:Button ID="btnBackToCart" runat="server" Text="Go back to Cart" CausesValidation="False" CssClass="btn btn-primary" OnClick="btnGoBack" />
                        <asp:LinkButton ID="lbtnContinueShopping" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClick="ContinueShopping">Continue Shopping</asp:LinkButton>


                    </div>
                </div>

      
       
       </main>
</asp:Content>

