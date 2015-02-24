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
              <tr>
                    <td>
                        <asp:Button ID="btnSaveContact" runat="server" Text="Save" style="margin-left:50%" OnClick="btnSaveContact_Click" />
                    </td>

                    <td>
                            <asp:Label ID ="lblSaveContact" runat="server"></asp:Label>
                    </td>
             </tr>              
          </table>

          <!-- Now the display contact details grid view -->
                  
                    <table>
                    <tr>
                        <td id="Td2" runat="server" class="" colspan="5">
                        <h4>Please enter search criteria:<asp:Label ID="Label51" runat="server"></asp:Label></h4>
                        </td>

                    </tr>
                    <tr>

                        <td >
                         <label class="">Contact Search</label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <label class="" >Find contacts by typing names and parts thereof</label>
                        <td>
                         <td style="">             
                             <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                        </td>                 
                    </tr>
                     <tr>
                           <td colspan="2" class="auto-style1" >
                                        <asp:Button ID="btnSearchContacts" runat="server" Text="Search By Filter" style="margin-left:35%" OnClick="btnSearchContacts_Click" />
                            </td>
                         
                            <td colspan="2" class="auto-style1" >
                                        <asp:Button ID="btnClearContacts" runat="server" Text="Clear Results" style="margin-left:50%" OnClick="btnClearContacts_Click" />
                            </td>
                       </tr>
                        <tr>
                            <td colspan="5">
                                    <asp:GridView ID="GridViewContactSearches" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" BorderColor="WhiteSmoke" BorderWidth="0px" Style="margin: 0 auto;">
                                        <Columns>
                                            <asp:BoundField DataField="FullName" HeaderText="Contact Name" ReadOnly="True" />
                                            <asp:BoundField DataField="HomePhone" HeaderText="Home Phone No." ReadOnly="True" />
                                            <asp:BoundField DataField="Mobile" HeaderText="Mobile Phone No." ReadOnly="True" />
                                            <asp:BoundField DataField="Email" HeaderText="Email Address" ReadOnly="True" />
                                            <asp:BoundField DataField="PhysicalAddress" HeaderText="Physical Address" ReadOnly="True" />     
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                            </td>
                        </tr>                                      
                        </table> 
    </div>














    

</asp:Content>
