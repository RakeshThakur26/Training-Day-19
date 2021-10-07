<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salesman.aspx.cs" Inherits="ASPDOTNETAPP1.Salesman" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 40%;">
              
                <h2> Enter Salesman details</h2>
                <tr>
                    <td><asp:Label ID="S_id" runat="server">Salesman Id :</asp:Label></td>
                 <td> <asp:TextBox ID="salesman_id" runat="server"> </asp:TextBox> </td>         
                </tr>

                <tr>
                 <td><asp:Label ID="Salesman_Name" runat="server">Salesman Name :</asp:Label></td> 
                 <td> <asp:TextBox ID="name" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                    <td><asp:Label ID="S_city" runat="server">City :</asp:Label></td>
                 <td> <asp:TextBox ID="city" runat="server"> </asp:TextBox> </td>       
                </tr>

                <tr>
                    <td><asp:Label ID="S_commission" runat="server">Commission :</asp:Label></td>
                 <td> <asp:TextBox ID="commission" runat="server"> </asp:TextBox> </td>       
                </tr>
                <tr>
                    <td> </td>
                    <td> <asp:Button ID="Submit" runat="server" Text="Submit" BorderStyle="Solid" ToolTip="Submit" OnClick="Submit_Click"/>
                        <asp:Button ID="Update" runat="server" Text="Update" BorderStyle="Solid" OnClick="Update_Click" />
                        <asp:Button ID="Reset" runat="server" Text="Reset" BorderStyle="Solid" />
                    </td>
                </tr>
                
            </table>
        </div>
       

        <div>
        
            <asp:GridView ID="gvSalesmanDetails" runat="server"  Width="665px" AutoGenerateColumns="False" OnRowCommand="gvSalesmanDetails_RowCommand" OnRowDeleting="gvSalesmanDetails_RowDeleting" OnRowEditing =" gvSalesmanDetails_RowEditing">
                <Columns>
                    <asp:BoundField DataField="salesman_id" HeaderText="Salesman ID" />
                    <asp:BoundField DataField="name" HeaderText="Salesman Name" />
                    <asp:BoundField DataField="city" HeaderText="City" />
                    <asp:BoundField DataField="commission" HeaderText="Commission" />

                     <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("salesman_id") %>'>Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("salesman_id") %>'>Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
     </div>

    </form>
    
</body>
</html>
