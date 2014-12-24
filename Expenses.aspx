<%@ Page Title="" Language="C#"  AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Expenses.aspx.cs" Inherits="Expenses.Expenses" EnableViewState="true" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--</body>
        </Form>--%>
    <style type="text/css">
        .MyTabStyle .ajax__tab_header
        {
            font-family: "Helvetica Neue" , Arial, Sans-Serif;
            font-size: 14px;
            font-weight:bold;
            display: block;
 
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_outer
        {
            border-color: #222;
            color: #222;
            padding-left: 10px;
            margin-right: 3px;
            border:solid 1px #d7d7d7;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_inner
        {
            border-color: #666;
            color: #666;
            padding: 3px 10px 2px 0px;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_outer
        {
            background-color:#9c3;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_inner
        {
            color: #fff;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_outer
        {
            border-bottom-color: #ffffff;
            background-color: #d7d7d7;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_inner
        {
            color: #000;
            border-color: #333;
        }
       .MyTabStyle .ajax__tab_body
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            background-color: #fff;
            border-top-width: 0;
            border: solid 1px #d7d7d7;
            border-top-color: #ffffff;
        }
       p{
            font-size : 1.5em;
            font-weight:bold;
            line-height:1.25em;
            margin:1.25em 0;
            text-align:left;
        }
        .auto-style1 {
            height: 28px;
        }
    </style>
<!DOCTYPE html>

    <%--<head runat="server">--%>
<%--<ajaxToolkit:ToolkitScriptManager ID ="ScriptManager1" runat="server">
   
    </ajaxToolkit:ToolkitScriptManager>
        --%>
    <%--</head>
    <body>--%>
    <div>
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" CssClass="MyTabStyle" ActiveTabIndex="0">
            <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="Insurance">
                <ContentTemplate>
                   <table>
                    <tr><td><h3>MISC EXPENSES FORM</h3></td></tr>
                    <tr><td class=""><asp:Label ID="Label1" runat="server" Text="Insurance" Style="font-weight:bold;font-size:medium"></asp:Label></td></tr>
                      <tr><td colspan="5"><hr style=""></hr></td></tr>  
                         <!--Now Med Insurance -->
                    <tr><td class=""><asp:Label ID="Label2" runat="server" Text="Medical" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr>
                        <td class=""><asp:Label ID="Label3" runat="server" Text="PolicyNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbMedicalInsurancePolicyNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label4" runat="server" Text="Policy Type"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPolicyTypeMedicalInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                         <td class=""><asp:Label ID="Label61" runat="server" Text="Start Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbStartDateMedicalInsurance" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                         <td class=""><asp:Label ID="Label65" runat="server" Text="Expiry Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbExpiryDateMedicalInsurance" runat="server" TextMode="Date" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                       
                    </tr>

                    <tr>
                         <td class=""><asp:Label ID="Label5" runat="server" Text="Insured Name"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbInsuredNameMedicalInsurance" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label62" runat="server" Text="Premium Amount"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPremiumAmountMedicalInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label6" runat="server" Text="Payment Type"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPaymentTypeMedicalInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Fortnightly</asp:ListItem>
                                   <asp:ListItem>Monthly</asp:ListItem>
                                   <asp:ListItem>Quarterly</asp:ListItem>
                                   <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td style="width:15px"></td>    
                        <td class=""><asp:Label ID="Label63" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodMedicalInsurance" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem selected="True" >Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                       
                         <td class=""><asp:Label ID="Label64" runat="server" Text="Payee Bank"></asp:Label></td>                         
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankMedicalInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>                       
                        <td style="width:15px"></td> 
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label66" runat="server" Text="Comments"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbCommentsMedicalInsurance" runat="server" Style="padding-left:10px;" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        
                    </tr>


                    <!--Now Life -->
                     <tr><td class=""><asp:Label ID="Label7" runat="server" Text="Life" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr>
                        <td class=""><asp:Label ID="Label8" runat="server" Text="PolicyNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbLifeInsurancePolicyNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label9" runat="server" Text="Policy Type"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPolicyTypeLifeInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                         <td class=""><asp:Label ID="Label10" runat="server" Text="Start Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbStartDateLifeInsurance" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                         <td class=""><asp:Label ID="Label11" runat="server" Text="Expiry Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbExpiryDateLifeInsurance" runat="server" TextMode="Date" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                       
                    </tr>

                    <tr>
                         <td class=""><asp:Label ID="Label67" runat="server" Text="Insured Name"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbInsuredNameLifeInsurance" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label68" runat="server" Text="Premium Amount"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPremiumAmountLifeInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label69" runat="server" Text="Payment Type"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPaymentTypeLifeInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Fortnightly</asp:ListItem>
                                   <asp:ListItem>Monthly</asp:ListItem>
                                   <asp:ListItem>Quarterly</asp:ListItem>
                                   <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td style="width:15px"></td>    
                        <td class=""><asp:Label ID="Label70" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodLifeInsurance" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem selected="True" >Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                       
                         <td class=""><asp:Label ID="Label71" runat="server" Text="Payee Bank"></asp:Label></td>                         
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankLifeInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>                       
                        <td style="width:15px"></td> 
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label72" runat="server" Text="Comments"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbCommentsLifeInsurance" runat="server" Style="padding-left:10px;" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <!--Now Car -->
                    <tr><td class=""><asp:Label ID="Label12" runat="server" Text="Car" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr>
                        <td class=""><asp:Label ID="Label13" runat="server" Text="CustomerNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbCarInsuranceCustomerNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label14" runat="server" Text="Policy Type"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPolicyTypeCarInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                         <td class=""><asp:Label ID="Label15" runat="server" Text="Start Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbStartDateCarInsurance" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                         <td class=""><asp:Label ID="Label16" runat="server" Text="Expiry Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbExpiryDateCarInsurance" runat="server" TextMode="Date" Style="padding-left:10px;" ></asp:TextBox>
                        </td>
                        
                       
                    </tr>

                    <tr>
                         <td class=""><asp:Label ID="Label17" runat="server" Text="Policy Number"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbPolicyNoCarInsurance" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label73" runat="server" Text="Premium Amount"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPremiumAmountCarInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label74" runat="server" Text="Payment Type"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPaymentTypeCarInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Fortnightly</asp:ListItem>
                                   <asp:ListItem>Monthly</asp:ListItem>
                                   <asp:ListItem>Quarterly</asp:ListItem>
                                   <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td style="width:15px"></td>    
                        <td class=""><asp:Label ID="Label75" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodCarInsurance" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem selected="True" >Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                       
                         <td class=""><asp:Label ID="Label76" runat="server" Text="Payee Bank"></asp:Label></td>                         
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankCarInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>                       
                        <td style="width:15px"></td> 
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label77" runat="server" Text="Comments"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbCommentsCarInsurance" runat="server" Style="padding-left:10px;" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        
                    </tr>
                <!--Now House -->
                     <tr><td class=""><asp:Label ID="Label18" runat="server" Text="House" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr>
                        <td class=""><asp:Label ID="Label19" runat="server" Text="CustomerNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbHouseInsuranceCustomerNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label20" runat="server" Text="Policy Type"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPolicyTypeHouseInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                         <td class=""><asp:Label ID="Label21" runat="server" Text="Start Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbStartDateHouseInsurance" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                         <td class=""><asp:Label ID="Label22" runat="server" Text="Expiry Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbExpiryDateHouseInsurance" runat="server" TextMode="Date" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                       
                    </tr>

                    <tr>
                         <td class=""><asp:Label ID="Label23" runat="server" Text="Policy Number"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbPolicyNoHouseInsurance" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label24" runat="server" Text="Premium Amount"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPremiumAmountHouseInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label78" runat="server" Text="Payment Type"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPaymentTypeHouseInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Fortnightly</asp:ListItem>
                                   <asp:ListItem>Monthly</asp:ListItem>
                                   <asp:ListItem>Quarterly</asp:ListItem>
                                   <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td style="width:15px"></td>    
                        <td class=""><asp:Label ID="Label79" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodHouseInsurance" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem selected="True" >Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                       
                         <td class=""><asp:Label ID="Label80" runat="server" Text="Payee Bank"></asp:Label></td>                         
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankHouseInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>                       
                        <td style="width:15px"></td> 
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label81" runat="server" Text="Comments"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbCommentsHouseInsurance" runat="server" Style="padding-left:10px;" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        
                    </tr>
            <!-- Now content -->
                    <tr><td class=""><asp:Label ID="Label82" runat="server" Text="Content" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr>
                        <td class=""><asp:Label ID="Label83" runat="server" Text="CustomerNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbContentInsuranceCustomerNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label84" runat="server" Text="Policy Type"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPolicyTypeContentInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                         <td class=""><asp:Label ID="Label85" runat="server" Text="Start Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbStartDateContentInsurance" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                         <td class=""><asp:Label ID="Label86" runat="server" Text="Expiry Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbExpiryDateContentInsurance" runat="server" TextMode="Date" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                       
                    </tr>

                    <tr>
                         <td class=""><asp:Label ID="Label87" runat="server" Text="Policy Number"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbPolicyNoContentInsurance" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style=""><asp:Label ID="Label88" runat="server" Text="Premium Amount"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbPremiumAmountContentInsurance" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label89" runat="server" Text="Payment Type"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPaymentTypeContentInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Fortnightly</asp:ListItem>
                                   <asp:ListItem>Monthly</asp:ListItem>
                                   <asp:ListItem>Quarterly</asp:ListItem>
                                   <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td style="width:15px"></td>    
                        <td class=""><asp:Label ID="Label90" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodContentInsurance" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem selected="True" >Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                       
                         <td class=""><asp:Label ID="Label91" runat="server" Text="Payee Bank"></asp:Label></td>                         
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankContentInsurance" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>                       
                        <td style="width:15px"></td> 
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label92" runat="server" Text="Comments"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbCommentsContentInsurance" runat="server" Style="padding-left:10px;" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        
                    </tr>
                                    

            <!-- End-->
                    <tr>
                        <td colspan="5">
                        <asp:Button ID="btnSaveInsurance" runat="server" Text="Save" style="margin-left:50%" OnClick="btnSaveInsurance_Click" />
                        </td>
                        <td>
                            <asp:Label ID ="lblSaveInsurance" runat="server"></asp:Label>
                        </td>
                    </tr>
                  </table>
                    </p> 
                    <!-- Now the display insurance grid view -->
                  
                    <table>
                    <tr>
                        <td id="Td1" runat="server" class="" colspan="5">
                        <h4>Please enter search criteria:<asp:Label ID="Label93" runat="server"></asp:Label></h4>
                        </td>

                    </tr>
                    <tr>

                        <td >
                         <label class="">Insurance Type(e.g:Medical, Life)</label>
                        </td>
                        <td style="width:75px"></td>
                        <td>
                         <asp:TextBox ID="tbInsuranceTypeDescription" runat="server" CssClass="form-control input-sm" placeholder="Insurance Type e.g.Medical,Life"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="" >Find cases between dates</label>
                        <td>
                        <td style="">             
                             <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td style="width:200px"></td>
                        <td>
                             <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>                 
                         </td>                      
                    </tr>
                     <tr>
                           <td colspan="2" class="auto-style1" >
                                        <asp:Button ID="btnSearchInsurance" runat="server" Text="Search By Filter" style="margin-left:35%" OnClick="btnSearchInsurance_Click"/>
                            </td>
                            <td colspan="2" class="auto-style1" >
                                        <asp:Button ID="btnClearInsurance" runat="server" Text="Clear Results" style="margin-left:50%" OnClick="btnClearInsurance_Click"/>
                            </td>
                       </tr>
                        <tr>
                            <td colspan="5">
                                    <asp:GridView ID="GridViewInsuranceSearches" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" BorderColor="WhiteSmoke" BorderWidth="0px" Style="margin: 0 auto;">
                                        <Columns>
                                            <asp:BoundField DataField="Description" HeaderText="Insurance Type Description" ReadOnly="True" />
                                            <asp:BoundField DataField="CustomerNo" HeaderText="Customer No" ReadOnly="True" />
                                            <asp:BoundField DataField="PolicyNo" HeaderText="Policy No" ReadOnly="True" />
                                            <asp:BoundField DataField="PolicyType" HeaderText="Policy Type" ReadOnly="True" />
                                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="True" />
                                            <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" ReadOnly="True" />
                                            <asp:BoundField DataField="InsuredName" HeaderText="Insured Name" ReadOnly="True" />
                                            <asp:BoundField DataField="Premium" HeaderText="Premium Amount" ReadOnly="True" />
                                            <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" ReadOnly="True" />
                                            <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" ReadOnly="True" />
                                            <asp:BoundField DataField="Bank" HeaderText="Payee Bank" ReadOnly="True" />
                                            <asp:BoundField DataField="Comments" HeaderText="Comments" ReadOnly="True" />     
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                            </td>
                        </tr>                                      
                        </table>   



                    <!-- Now end of the display grid view -->
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Bills">
                <ContentTemplate>
                <table>
                    <tr>
                        <td><h3>MISC EXPENSES FORM</h3></td>

                    </tr>
                    <tr>
                        <td class=""><asp:Label ID="Label25" runat="server" Text="Bills" Style="font-weight:bold;font-size:medium"></asp:Label></td>

                    </tr>
                    <tr>
                          <td colspan="4"><hr style=""></hr></td>

                    </tr>  
                         <!--Electricity -->
                    <tr>
                        <td class=""><asp:Label ID="Label26" runat="server" Text="Electricity" Style="font-weight:bold;font-size:small"></asp:Label></td>

                    </tr>
                    <tr>
                        <td class="">
                        <asp:Label ID="Label27" runat="server" Text="CustomerNo"></asp:Label>
                        </td>
                        <td class="">
                        <asp:TextBox ID="tbElectricityCustomerNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px" colspan="1"></td>
                        <td class="" Style="padding-right:10px"><asp:Label ID="Label28" runat="server" Text="Invoice Amount($)"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbInvoiceAmount" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>

                    <tr><td class="">
                        <asp:Label ID="Label29" runat="server" Text="Invoice Date"></asp:Label>
                        </td>
                        <td class="">
                        <asp:TextBox ID="tbInvoiceDate" TextMode="Date" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px">
                            <asp:Label ID="Label30" runat="server" Text="PayeeBank"></asp:Label>

                        </td>
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBank" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                        <td class=""><asp:Label ID="Label49" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethod" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                    </tr>
                    <!--Broadband&Telephone -->
                     <tr><td class=""><asp:Label ID="Label31" runat="server" Text="Broadband/Telephone" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr><td class=""><asp:Label ID="Label32" runat="server" Text="CustomerNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbTelephoneCustomerNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label33" runat="server" Text="Invoice Amount($)"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbInvoiceAmountTelephone" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>

                    <tr><td class=""><asp:Label ID="Label34" runat="server" Text="Invoice Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbInvoiceDateTelephone" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label35" runat="server" Text="PayeeBank"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankTelephone" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                        <td class=""><asp:Label ID="Label50" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodTelephone" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                    </tr>
                     <!--Now Water -->
                    <tr><td class=""><asp:Label ID="Label36" runat="server" Text="Water" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                    <tr><td class=""><asp:Label ID="Label37" runat="server" Text="CustomerNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbWaterCustomerNo" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label38" runat="server" Text="Invoice Amount($)"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="tbInvoiceAmountWater" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>

                    <tr><td class=""><asp:Label ID="Label39" runat="server" Text="Invoice Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="tbInvoiceDateWater" runat="server" TextMode="Date" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label40" runat="server" Text="PayeeBank"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="rbPayeeBankWater" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>    
                    </tr>
                    <tr>
                        <td class=""><asp:Label ID="Label41" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="rbPaymentMethodWater" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="True">Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" >
                        <asp:Button ID="btnSaveResources" runat="server" Text="Save To Database" style="margin-left:50%" OnClick="btnSaveResources_Click" />
                        </td>
                        
                        <td>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!--Now results on grid view-->
                    
                    </table>
                    <table>
                    <tr>
                        <td id="searchPanel" runat="server" class="" colspan="5">
                        <h4>Please enter search criteria:<asp:Label ID="lblNotify" runat="server"></asp:Label></h4>
                        </td>

                    </tr>
                    <tr>

                        <td >
                         <label class="">Utility Type(e.g:Electricity)</label>
                        </td>
                        <td style="width:75px"></td>
                        <td>
                         <asp:TextBox ID="tbResourceTypeDescription" runat="server" CssClass="form-control input-sm" placeholder="Resource Type e.g.Water,Telephne"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="" >Find cases between dates</label>
                        <td>
                        <td style="">             
                             <asp:TextBox ID="tbStartDate" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td style="width:200px"></td>
                        <td>
                             <asp:TextBox ID="tbEndDate" runat="server" TextMode="Date"></asp:TextBox>                 
                         </td>                      
                    </tr>
                     <tr>
                           <td colspan="2" >
                                        <asp:Button ID="btnSearch" runat="server" Text="Search By Filter" style="margin-left:35%" OnClick="btnSearch_Click" />
                            </td>
                            <td colspan="2" >
                                        <asp:Button ID="btnClear" runat="server" Text="Clear Results" style="margin-left:50%" OnClick="btnClear_Click" />
                            </td>
                       </tr>
                        <tr>
                            <td colspan="5">
                                    <asp:GridView ID="GridViewSearches" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" BorderColor="WhiteSmoke" BorderWidth="0px" Style="margin: 0 auto;">
                                        <Columns>
                                            <asp:BoundField DataField="ResourceTypeDescription" HeaderText="ResourceType Description" ReadOnly="True"  dataformatstring="{0:dd/MM/yyyy}" htmlencode="False"  />
                                            <asp:BoundField DataField="ReferenceNo" HeaderText="Reference No" ReadOnly="True" />
                                            <asp:BoundField DataField="InvoiceAmount" HeaderText="Invoice Amount" ReadOnly="True" />
                                            <asp:BoundField DataField="InvoiceDate" HeaderText="Invoice Date" ReadOnly="True" />
                                            <asp:BoundField DataField="Bank" HeaderText="Payee Bank" ReadOnly="True" />
                                            <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" ReadOnly="True" />     
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                            </td>
                        </tr>                                      
                        </table>                    
                </ContentTemplate>    
            </ajaxToolkit:TabPanel>              
            <!--Now Rates Tab-->
            <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="Rates">
                <ContentTemplate>
              
                    <table>
                        <tr><td><h3>MISC EXPENSES FORM</h3></td></tr>
                        <tr><td class=""><asp:Label ID="Label42" runat="server" Text="City Council" Style="font-weight:bold;font-size:small"></asp:Label></td></tr>
                        <tr><td class=""><asp:Label ID="Label43" runat="server" Text="CustomerNo"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="TextBox25" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label44" runat="server" Text="Rate Amount($)"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="TextBox26" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height:10px"></tr> 
                    <tr><td class=""><asp:Label ID="Label45" runat="server" Text="Invoice Date"></asp:Label></td>
                        <td class="">
                        <asp:TextBox ID="TextBox27" runat="server" Style="padding-right:20px;"></asp:TextBox>
                        </td>
                         <td style="width:15px"></td>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label48" runat="server" Text="Rateable Value($)"></asp:Label></td>
                        <td >
                        <asp:TextBox ID="TextBox28" runat="server" Style="padding-left:10px;"></asp:TextBox>
                        </td>
                        <td style="width:15px"></td>
                          
                    </tr>
                    <tr>
                        <td class="" Style="padding-right:20px"><asp:Label ID="Label46" runat="server" Text="PayeeBank"></asp:Label></td>
                        <td >
                            <asp:RadioButtonList ID="RadioButtonList8" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="true">ANZ</asp:ListItem>
                                   <asp:ListItem>Westpac</asp:ListItem>
                                   
                            </asp:RadioButtonList>
                        </td>  
                        <td class=""><asp:Label ID="Label47" runat="server" Text="Payment Method"></asp:Label></td>
                        <td class="">
                        <asp:RadioButtonList ID="RadioButtonList12" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
                                <asp:ListItem selected="true">Direct Debit</asp:ListItem>
                                <asp:ListItem>Automatic Payment</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                    </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>

            <!--All Maintenance-->
            <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="Maintenance Jobs">
                <ContentTemplate>
              
                    <table>
                        <tr>
                            <td><h3>MISC EXPENSES FORM</h3></td>

                        </tr>
                        <tr>
                            <td class=""><asp:DropDownList ID="ddlMaintenance" runat="server" AutoPostBack="True"></asp:DropDownList></td>

                        </tr>
                        <tr>
                            <td class=""><asp:Label ID="Label52" runat="server" Text="Work Description"></asp:Label></td>
                             <td class="">
                                <asp:TextBox ID="tbWorkDone" runat="server" Style="padding-right:20px;" TextMode="MultiLine"></asp:TextBox>
                            </td>

                            <td style="width:15px"></td>
                            <td class="" Style="padding-right:20px;"><asp:Label ID="Label53" runat="server" Text="Provider Address"></asp:Label></td>
                            <td >
                            <asp:TextBox ID="tbProviderAddress" runat="server" Style="padding-left:10px;" TextMode="MultiLine"></asp:TextBox>
                            </td>

                            
                        </tr>
                        <tr><td style="height:10px"></td></tr>
                        <tr>
                            
                            <td class="" Style="padding-right:20px"><asp:Label ID="Label94" runat="server" Text="Invoice Amount(incl.GST)"></asp:Label></td>
                            <td >
                            <asp:TextBox ID="tbMaintenanceInvoiceAmount" runat="server" Style="padding-left:10px;"></asp:TextBox>
                            </td>
                             <td style="width:15px"></td>
                            <td class=""><asp:Label ID="Label54" runat="server" Text="Invoice Details"></asp:Label></td>
                             <td class="">
                                <asp:TextBox ID="tbMaintenanceInvoiceDetails" runat="server" Style="padding-right:10px;"></asp:TextBox>
                            </td>
                        </tr>
                        <tr><td style="height:10px"></td></tr>
                        <tr>
                            
                            <td class="" Style="padding-right:20px"><asp:Label ID="Label55" runat="server" Text="Comments"></asp:Label></td>
                            <td >
                            <asp:TextBox ID="tbComments" runat="server" Style="padding-left:10px;"></asp:TextBox>
                            </td>
                            <td style="width:15px"></td>
                            <td class="" Style="padding-right:20px"><asp:Label ID="Label56" runat="server" Text="DateDone"></asp:Label></td>
                            <td >
                            <asp:TextBox ID="tbDateDone" runat="server" Style="padding-left:10px;" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr><td style="height:10px"></td></tr>
                        <tr>
                            
                            <td class="" Style="padding-right:20px"><asp:Label ID="Label95" runat="server" Text="DateDue"></asp:Label></td>
                            <td >
                            <asp:TextBox ID="tbDateDue" runat="server" Style="padding-left:10px;" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            
                           
                            <td >
                            <asp:Button ID="btnSaveMaintenance" Text="Save" runat="server" Style="padding-left:10px;" OnClick="btnSaveMaintenance_Click"></asp:Button>
                            </td>
                            <td >
                            <asp:Label ID="lblMaintMessage" runat="server" Style="padding-left:10px;"></asp:Label>
                            </td>
                        </tr>
                   </table>

                    <!-- Now the display insurance grid view -->
                  
                    <table>
                    <tr>
                        <td id="Td2" runat="server" class="" colspan="5">
                        <h4>Please enter search criteria:<asp:Label ID="Label51" runat="server"></asp:Label></h4>
                        </td>

                    </tr>
                    <tr>

                        <td >
                         <label class="">Maintenance Type(e.g:Car, Electrical)</label>
                        </td>
                        <td style="width:75px"></td>
                        <td>
                         <asp:TextBox ID="tbMaintenanceType" runat="server" CssClass="form-control input-sm" placeholder="Type '0' to get all maintenance work"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="" >Find cases between dates</label>
                        <td>
                        <td style="">             
                             <asp:TextBox ID="tbStartDateMaintenance" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td style="width:200px"></td>
                        <td>
                             <asp:TextBox ID="tbEndDateMaintenance" runat="server" TextMode="Date"></asp:TextBox>                 
                         </td>                      
                    </tr>
                     <tr>
                           <td colspan="2" class="auto-style1" >
                                        <asp:Button ID="btnSearchMaintenance" runat="server" Text="Search By Filter" style="margin-left:35%" OnClick="btnSearchMaintenance_Click" />
                            </td>
                         
                            <td colspan="2" class="auto-style1" >
                                        <asp:Button ID="btnClearMaintenance" runat="server" Text="Clear Results" style="margin-left:50%" OnClick="btnClearMaintenance_Click" />
                            </td>
                       </tr>
                        <tr>
                            <td colspan="5">
                                    <asp:GridView ID="GridViewMaintenanceSearches" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" BorderColor="WhiteSmoke" BorderWidth="0px" Style="margin: 0 auto;">
                                        <Columns>
                                            <asp:BoundField DataField="WorkDescription" HeaderText="Insurance Type Description" ReadOnly="True" />
                                            <asp:BoundField DataField="InvoiceAmount" HeaderText="Customer No" ReadOnly="True" />
                                            <asp:BoundField DataField="InvoiceDetails" HeaderText="Policy No" ReadOnly="True" />
                                            <asp:BoundField DataField="Provider" HeaderText="Policy Type" ReadOnly="True" />
                                            <asp:BoundField DataField="Comments" HeaderText="Comments" ReadOnly="True" />
                                            <asp:BoundField DataField="DateDone" HeaderText="Comments" ReadOnly="True" /> 
                                            <asp:BoundField DataField="NextDue" HeaderText="Comments" ReadOnly="True" />      
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                            </td>
                        </tr>                                      
                        </table>   



                    <!-- Now end of the display grid view -->
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
    </div>
</asp:Content>
        <%--</body>
        </Form>--%>