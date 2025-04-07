<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_8921.Master" CodeBehind="Products_921.aspx.cs" Inherits="Mahajan_BookStore_921.Products_921" %>


<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
       

            <div class="row"><%-- row 1 --%>
                <div class="col-sm-8"><%-- product drop down and info column --%>
                    <div class="form-group">

                        <div class="col-md-10" style="margin-bottom: 50px;">
                        <asp:Label ID="userFirstNameFamilyName" runat="server" Style="font-weight: bold; color: #0000FF;"></asp:Label>
                   </div>

                        <label class="col-sm-5">Please select a product:</label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control" AutoPostBack="True" DataTextField="Name" DataValueField="ProductID" DataSourceID="SqlDataSource1">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Books] ORDER BY [Name]"></asp:SqlDataSource>

                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-sm-12"><h4><asp:Label ID="lblName" runat="server" Font-Underline="True" Font-Bold="True"></asp:Label></h4></div></div>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Label ID="lblShortDescription" runat="server"></asp:Label></div></div>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Label ID="lblLongDescription" runat="server"></asp:Label></div></div>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Label ID="lblUnitPrice" runat="server" Font-Size="Medium" Font-Bold="True"></asp:Label></div></div>
                </div>
                <div class="col-sm-4"><%-- product image column --%>
                    <asp:Image ID="imgProduct" Height="250" Width="180" runat="server" />
                </div>
            </div><%-- end of row 1 --%>

            <div class="row"><%-- row 2 --%>
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-1">Quantity:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtQuantity" runat="server" 
                                CssClass="form-control"></asp:TextBox></div>
                        <div class="col-sm-8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                                runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                                ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" 
                                ControlToValidate="txtQuantity" Display="Dynamic" 
                                ErrorMessage="Quantity must range from 5 to 200." ForeColor="purple"
                                MaximumValue="200" MinimumValue="5" Type="Integer"></asp:RangeValidator></div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Button
                                ID="btnAdd"
                                runat="server"
                                Text="Add to the Cart"
                                CssClass="btn"
                                OnClick="btnAdd_Click"
                                Style="background-color: black; color: white;" />
                            <asp:Button ID="btnCart" runat="server" Text="Go to the Cart" 
                                PostBackUrl="~/BookStore/Cart" CausesValidation="False" CssClass="btn"    Style="background-color:black; color:white;"/>
                        </div>
                    </div>
                </div>
            </div><%-- end of row 2 --%>

    
 </asp:Content>