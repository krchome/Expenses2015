<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="multipage1.aspx.cs" Inherits="Expenses.multipage1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton ID="Expenses" CssClass="test" runat="server">Expenses</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="Rates" CssClass="test" runat="server">Rates</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="CarMaintenance" CssClass="test" runat="server">Car Maintenance</asp:LinkButton>
            </td>
        </tr>
         </table>
        <asp:MultiView ID="MyMultiView" runat="server">
            <asp:View ID="View4" runat="server">
                <table>
                    <tr><td>MISC EXPENSES FORM</td></tr>
                    <tr><td class=".col-xs-1"><asp:Label ID="Label1" runat="server" Text="Label">Insurance</asp:Label></td></tr>
                    <tr><td class=".col-xs-1">Customer</td>
                        <td class=".col-xs-1">
                        <asp:TextBox ID="TextBox1" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class=".col-xs-1" Style="padding-right:20px">Policy Type</td>
                        <td >
                        <asp:TextBox ID="TextBox2" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </asp:View>
            <asp:View ID="View5" runat="server">
                You are in second tab
            </asp:View>
            <asp:View ID="View6" runat="server">
                 You are in third tab
            </asp:View>

        </asp:MultiView>
</asp:Content>

     <%--<table>
        <tr>
            <td>
                <asp:LinkButton ID="Link1" runat="server">Expenses</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="Link2" runat="server">Rates</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="Link3" runat="server">Car Maintenance</asp:LinkButton>
            </td>
        </tr>
         </table>
        <asp:MultiView ID="MyMultiView" runat="server">
            <asp:View ID="View1" runat="server">
                Tab1 - Insert your content here
            </asp:View>
            <asp:View ID="View2" runat="server">
                Tab2 - Insert your content here
            </asp:View>
            <asp:View ID="View3" runat="server">
                Tab3 - Insert your content here
            </asp:View>

        </asp:MultiView>--%>
<%--    </form>
</body>--%>
<%--</html>--%>
