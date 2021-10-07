<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ASPDOTNETAPP1.Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 40%;">
              
                <h2> Enter Order details</h2>
                <tr>
                   <td><asp:Label ID="number" runat="server">Order Number :</asp:Label></td> 
                 <td> <asp:TextBox ID="order_no" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                 <td><asp:Label ID="amount" runat="server">Purchase Amount :</asp:Label></td> 
                 <td> <asp:TextBox ID="purch_amt" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                    <td><asp:Label ID="date" runat="server">Date :</asp:Label></td>
                 <td> <asp:TextBox ID="order_date" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                    <td><asp:Label ID="id" runat="server">Customer Id :</asp:Label></td> 
                 <td> <asp:DropDownList ID="Customer_id" runat="server"></asp:DropDownList></td>       
                </tr>

                <tr>
                    <td><asp:Label ID="salesmanid" runat="server">Salesman Id :</asp:Label></td>
                 <td>  <asp:DropDownList ID="Salesman_id" runat="server"></asp:DropDownList> </td>       
                </tr>

                 <tr>
                     <td></td>
                    <td> <asp:Button ID="OrdersSubmit" runat="server" Text="Submit" BorderStyle="Solid" ToolTip="Submit" OnClick="OrdersSubmit_Click" style="height: 35px"/>
                         <asp:Button ID="Update" runat="server" Text="Update" BorderStyle="Solid" OnClick="Update_Click" />
                         <asp:Button ID="Reset" runat="server" Text="Reset" BorderStyle="Solid" />

                    </td>
                </tr>
                
            </table>
        </div>
        <asp:GridView ID="gvOrderDetails" runat="server" AutoGenerateColumns="False" OnRowCommand="gvOrderDetails_RowCommand" OnRowDeleting="gvOrderDetails_RowDeleting" OnRowEditing="gvOrderDetails_RowEditing" >
            <Columns>
                <asp:BoundField DataField="order_no" HeaderText="Order number" />
                <asp:BoundField DataField="purch_amt" HeaderText="Purchase Amount" />
                <asp:BoundField DataField="order_date" HeaderText="Date" />
                <asp:BoundField DataField="customer_id" HeaderText="Customer Id" />
                <asp:BoundField DataField="salesman_id" HeaderText="Salesman Id" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="Edit" runat="server"  CommandName="Edit" CommandArgument='<%# Eval("order_no") %>'>Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" >
                    <ItemTemplate>
                        <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("order_no") %>'>Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
