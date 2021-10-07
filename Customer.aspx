<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="ASPDOTNETAPP1.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h2> Enter Customer details</h2>
            <table style="width: 40%;">
              
                <tr>
                   <td><asp:Label ID="id" runat="server">Customer Id :</asp:Label></td> 
                 <td> <asp:TextBox ID="Customer_id" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                 <td><asp:Label ID="Name" runat="server">Customer Name :</asp:Label></td> 
                 <td> <asp:TextBox ID="Customer_Name" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                    <td><asp:Label ID="C_city" runat="server">City :</asp:Label></td>
                 <td> <asp:TextBox ID="City" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                    <td><asp:Label ID="C_grade" runat="server">Grade :</asp:Label></td>
                 <td> <asp:TextBox ID="Grade" runat="server"> </asp:TextBox> </td>       
                </tr>

                 <tr>
                    <td><asp:Label ID="Label1" runat="server">Salesman Id :</asp:Label></td>
                 <td> <asp:DropDownList ID="Salesman_id" runat="server"></asp:DropDownList> </td>       
                </tr>

                <tr>
                    <td></td>
                    <td> <asp:Button ID="CustomerSubmit" runat="server" Text="Submit" BorderStyle="Solid" ToolTip="Submit" OnClick="CustomerSubmit_Click"/>
                        <asp:Button ID="Update" runat="server" Text="Update" BorderStyle="Solid" OnClick="Update_Click" />
                        <asp:Button ID="Reset" runat="server" Text="Reset" BorderStyle="Solid" OnClick="Reset_Click" />
                    </td>
                </tr>

                
            </table>
        </div>
         <div>
        
            <asp:GridView ID="gvCustomerDetails" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCustomerDetails_RowCommand" OnRowDeleting="gvCustomerDetails_RowDeleting" OnRowEditing="gvCustomerDetails_RowEditing" >
                <Columns>
                    <asp:BoundField DataField="customer_id" HeaderText="Customer Id" />
                    <asp:BoundField DataField="cust_name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="city" HeaderText="City" />
                    <asp:BoundField DataField="grade" HeaderText="Grade" />
                    <asp:BoundField DataField="salesman_id" HeaderText="Salesman Id" />
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("customer_id") %>'>Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("customer_id") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
             </asp:GridView>
        </div>

    </form>
</body>
</html>
