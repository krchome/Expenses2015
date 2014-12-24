<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactInformation.aspx.cs" Inherits="Expenses.ContactInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <! DOCTYPE HTML>

      <div>
          <table>
              <tr><td style="height:20px;width:20%"></td></tr>
              <tr>
                  <td>
                            <asp:Label ID="Label1" runat="server" Text= "Full Name"></asp:Label>
                  </td>
                  <td style="width:15px"></td>
                  <td class="">
                        <asp:TextBox ID="tbContactName" runat="server" Style="padding-right:20px;"></asp:TextBox>
                  </td>

                </tr>
               <tr><td style="height:10px;"></td></tr>
                <tr>
                  <td>
                            <asp:Label ID="Label2" runat="server" Text="Phone No.(Home)"></asp:Label>
                  </td>
                  <td style="width:15px"></td>
                  <td class="">
                        <asp:TextBox ID="tbPhone" runat="server" Style="padding-right:20px;" TextMode="Phone"></asp:TextBox>
                  </td>
                    
                </tr>
              <tr><td style="height:10px;"></td></tr>
               <tr>
                  <td>
                            <asp:Label ID="Label3" runat="server" Text="Mobile"></asp:Label>
                  </td>
                  <td style="width:15px"></td>
                  <td class="">
                        <asp:TextBox ID="tbMobilePhone" runat="server" Style="padding-right:20px;" TextMode="Phone"></asp:TextBox>
                  </td>

                </tr>
              <tr><td style="height:10px;"></td></tr>
               <tr>
                  <td>
                            <asp:Label ID="Label4" runat="server" Text="Email Address"></asp:Label>
                  </td>
                  <td style="width:15px"></td>
                  <td class="">
                        <asp:TextBox ID="tbEmailAddress" runat="server" Style="padding-right:20px;" TextMode="Email"></asp:TextBox>
                  </td>

                </tr>
              <tr><td style="height:10px;"></td></tr>
              <tr>
                  <td>
                            <asp:Label ID="Label5" runat="server" Text="Physical Address"></asp:Label>
                  </td>
                  <td style="width:15px"></td>
                  <td class="">
                        <asp:TextBox ID="tbAddress" runat="server" Style="padding-right:20px;" TextMode="MultiLine"></asp:TextBox>
                  </td>

                </tr>
          </table>




      </div>














    

</asp:Content>
