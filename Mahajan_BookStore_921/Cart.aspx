<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site_8921.Master"  CodeBehind="Cart.aspx.cs" Inherits="Mahajan_BookStore_921.Cart" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
  
    <main>
       
    
            <div class="row"><%-- row 1 --%>
                <div class="col-sm-12"><h1>Your shopping cart</h1></div>
                <div class="col-sm-6"><%-- cart display column --%>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox></div>
                    </div>
                </div>
                <div class="col-sm-6"><%-- cart edit buttons column --%>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Button ID="btnRemove" runat="server" 
                            Text="Remove my Item" CssClass="btn" OnClick="btnRemove_Click" /></div>
                        <div class="col-sm-12"><asp:Button ID="btnEmpty" runat="server" 
                            Text="Empty the Cart" CssClass="btn" OnClick="btnEmpty_Click" /></div>
                    </div>
                </div>
            </div><%-- end of row 1 --%>

            <div class="row"><%-- row 2 --%>
                <div class="col-sm-12">
                    <div class="form-group"><%-- message label --%>
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                            CssClass="text-info col-sm-12"></asp:Label>
                    </div>
                    <div class="form-group"><%-- buttons --%>
                        <div class="col-sm-12">
                            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btn"   PostBackUrl="~/BookStore/Products"  />
                            <asp:Button ID="btnCheckOut" runat="server" Text="My Check Out" CssClass="btn"  PostBackUrl="~/BookStore/Checkout" />
                        </div>
                    </div>
                </div>
            </div><%-- end of row 2 --%>

        </form>
        </main>
 </asp:Content>
