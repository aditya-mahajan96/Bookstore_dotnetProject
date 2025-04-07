<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_8921.Master" CodeBehind="The_Admin_Sec8_Page.aspx.cs" Inherits="Mahajan_BookStore_921.The_Admin_Sec8_Page" %>


<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <main>
        <div>
            <label><b>Select the genre:  </b></label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ShortName" DataValueField="CategoryID" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" SelectCommand="SELECT DISTINCT [CategoryID], [ShortName], [LongName] FROM [TheGenre_921] ORDER BY [ShortName]"></asp:SqlDataSource>





            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" SelectCommand="SELECT  [ProductID], [Name], [UnitPrice], [OnHand], [CategoryID] FROM [Books] WHERE ([CategoryID] = @CategoryID) ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CategoryID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList CssClass="table table-bordered table-responsive table-condensed" ID="DataList1" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderTemplate>
                    <span class="col-xs-3">ID</span>
                    <span class="col-xs-3">Name921</span>
                    <span class="col-xs-3">Price</span>
                    <span class="col-xs-2 text-right">On Hand</span>

                </HeaderTemplate>
                <ItemStyle BackColor="#EFF3FB" />
                <ItemTemplate>

                    <asp:Label ID="ProductIDLabel" CssClass="col-xs-3" runat="server" Text='<%# Eval("ProductID") %>' />


                    <asp:Label ID="NameLabel" CssClass="col-xs-3" runat="server" Text='<%# Eval("Name") %>' />


                    <asp:Label ID="UnitPriceLabel" CssClass="col-xs-3" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>' />

                    <asp:Label ID="OnHandLabel" CssClass="col-xs-2 text-right" runat="server" Text='<%# Eval("OnHand") %>' />


                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
        </div>
    </main>

           <label><b>Maintance of Genre:  </b></label>
    <asp:SqlDataSource ID="SqlDataSource58921" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" DeleteCommand="DELETE FROM [TheGenre_921] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [TheGenre_921] ([ShortName], [CategoryID], [LongName]) VALUES (@ShortName, @CategoryID, @LongName)" SelectCommand="SELECT [ShortName], [CategoryID], [LongName] FROM [TheGenre_921]" UpdateCommand="UPDATE [TheGenre_921] SET [ShortName] = @ShortName, [LongName] = @LongName WHERE [CategoryID] = @CategoryID">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ShortName" Type="String" />
            <asp:Parameter Name="CategoryID" Type="String" />
            <asp:Parameter Name="LongName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShortName" Type="String" />
            <asp:Parameter Name="LongName" Type="String" />
            <asp:Parameter Name="CategoryID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource58921"
        CellPadding="4" ForeColor="#333333" GridLines="None"
        AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="CategoryID"
        CssClass="table table-bordered table-condensed table-responsive table-striped"
        OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
             
        <AlternatingRowStyle BackColor="White" />
        <Columns>
   
            <asp:BoundField DataField="CategoryID" HeaderText="ID" SortExpression="CategoryID" ReadOnly="True" />
        
            <asp:BoundField DataField="ShortName" HeaderText="Short Name" SortExpression="ShortName" />
   
            <asp:BoundField DataField="LongName" HeaderText="Long Name" SortExpression="LongName" />
       
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"  CancelText="Cancel21" />
       
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>


         <label><b>To create new genre:</b></label>
    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource58921" DataKeyNames="CategoryID" DefaultMode="Insert" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
               ID:
   <asp:Label ID="CategoryIDLabel1" runat="server" Text='<%# Eval("CategoryID") %>' />
   <br />
            Short Name:
            <asp:TextBox ID="ShortNameTextBox" runat="server" Text='<%# Bind("ShortName") %>' />
            <br />
         
            Long Name:
            <asp:TextBox ID="LongNameTextBox" runat="server" Text='<%# Bind("LongName") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
                    ID:
   <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
   <br />
            Short Name:
            <asp:TextBox ID="ShortNameTextBox" runat="server" Text='<%# Bind("ShortName") %>' />
            <br />
         
            Long Name:
            <asp:TextBox ID="LongNameTextBox" runat="server" Text='<%# Bind("LongName") %>' />
            <br />
            <asp:LinkButton ID="InsertButton"  CssClass="btn btn-primary " style="margin-top: 13px;" runat="server" CausesValidation="True" CommandName="Insert" Text="Add a Genre" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
             ID:
 <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
 <br />
            Short Name:
            <asp:Label ID="ShortNameLabel" runat="server" Text='<%# Bind("ShortName") %>' />
            <br />
           
            Long Name:
            <asp:Label ID="LongNameLabel" runat="server" Text='<%# Bind("LongName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>


    </asp:FormView>

    <br />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource58922" CellPadding="4" ForeColor="#333333" GridLines="None"   CssClass="table table-bordered table-condensed table-responsive table-striped">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="CategoryID" HeaderText="Category" SortExpression="CategoryID" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource58922" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" SelectCommand="SELECT DISTINCT [Name], [ProductID], [CategoryID] FROM [Books]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource58923" runat="server" ConnectionString="<%$ ConnectionStrings:Mahajan_bookstore_8921usedConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Books] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID],[ImageFile] ,[UnitPrice], [OnHand]) VALUES (@ProductID, @Name, @ShortDescription, @LongDescription, @CategoryID,@ImageFile, @UnitPrice, @OnHand)" SelectCommand="SELECT [ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID],[ImageFile], [UnitPrice], [OnHand] FROM [Books] WHERE ([ProductID] = @ProductID) ORDER BY [Name]" UpdateCommand="UPDATE [Books] SET [Name] = @Name, [ShortDescription] = @ShortDescription, [LongDescription] = @LongDescription, [CategoryID] = @CategoryID,[ImageFile] = @ImageFile, [UnitPrice] = @UnitPrice, [OnHand] = @OnHand WHERE [ProductID] = @ProductID">
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ShortDescription" Type="String" />
            <asp:Parameter Name="LongDescription" Type="String" />
            <asp:Parameter Name="CategoryID" Type="String" />
             <asp:Parameter Name="ImageFile" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="OnHand" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
               <asp:Parameter Name="ProductID" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ShortDescription" Type="String" />
            <asp:Parameter Name="LongDescription" Type="String" />
            <asp:Parameter Name="CategoryID" Type="String" />
             <asp:Parameter Name="ImageFile" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="OnHand" Type="Int32" />
         
        </UpdateParameters>
        <SelectParameters>
    <asp:ControlParameter ControlID="GridView2" Name="ProductID" PropertyName="SelectedValue" Type="String" />
</SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server"  AutoGenerateRows="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource58923" Height="50px" Width="125px" OnItemInserted="DetailsView1_ItemInserted" OnPageIndexChanging="DetailsView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None"   CssClass="table table-bordered table-condensed table-responsive table-striped">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="ShortDescription" HeaderText="Short Description" SortExpression="ShortDescription" />
            <asp:BoundField DataField="LongDescription" HeaderText="Long Description" SortExpression="LongDescription" />
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" AutoPostBack="True" runat="server" Text='<%# Bind("CategoryID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1"  runat="server" Text='<%# Bind("CategoryID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
             <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />
            
            <asp:TemplateField HeaderText="Unit Price" SortExpression="UnitPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnitPrice", "{0:C}") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OnHand" HeaderText="On Hand" SortExpression="OnHand" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <br />

</asp:Content>