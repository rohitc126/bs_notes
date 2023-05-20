<%@ Page Title="" Language="C#" MasterPageFile="~/FA_Master.master" AutoEventWireup="true" CodeFile="BalanceSheetData.aspx.cs" Inherits="FAMS_Master_BalanceSheetData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../../css/FA.css" rel="stylesheet" type="text/css" />
    <script src="../../Jquery/jquery-1.7.1.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table  width="100%" style="overflow: scroll;">
  <tr>
    <td colspan="7">
                <asp:Panel ID="ErrorContainer" runat="server">
                    <asp:Label ID="MyMessage" runat="server" Font-Size="10pt"></asp:Label>
                </asp:Panel>
            </td>
            
            </tr>
            <tr>
           <td width="10%">&nbsp;</td>
              <td class="Left" width="10%">
                Company:
            </td> 
            <td class="Left" style="width: 25%">
                <asp:DropDownList ID="DDLCompanyName" runat="server" Style="width: 200px" CssClass="ddlNormal"
                    AutoPostBack="true">
                    <asp:ListItem Text="Select Company" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_ddlCompanyshow" runat="server" ValidationGroup="Show1"
                    Display="Dynamic" ControlToValidate="DDLCompanyName" ErrorMessage="Select Company Name"
                    ToolTip="Select Company Name" SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
            </td>

             <td class="Left" width="10%">
               Financial Year
            </td>
            <td class="Left" width="25%">
                <asp:DropDownList ID="ddlFinanceYear" runat="server" Style="width: 220px" CssClass="ddlNormal"
                   AutoPostBack="True" 
                    onselectedindexchanged="ddlFinanceYear_SelectedIndexChanged">

                    <asp:ListItem  Text="Select Finance Year" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_ddlFinanceYear" runat="server" ValidationGroup="Show1"
                    Display="Dynamic" ControlToValidate="ddlFinanceYear" ErrorMessage="Select Finance Year"
                    ToolTip="Select Finance Year" SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
             <td width="20%">&nbsp;</td>
            </tr>
             <tr>
            <td class="con_header" width="20%">
               Balance Sheet Data: 2 to 3 Notes
            </td>
            <td colspan="3" width="80%">
            </td>
        </tr>
                      <tr>
                        <td colspan="4">
                            <asp:GridView ID="GVBalance" runat="server" AutoGenerateColumns="false" Width="100%"
                                CssClass="grid-view_1" EmptyDataText="Record Not Found" EnableTheming="True"
                                ShowFooter="false" CellPadding="4" CellSpacing="0" Visible="true">
                                <HeaderStyle CssClass="header_1" />
                                <RowStyle CssClass="normal_1" />
                                <FooterStyle CssClass="header_1" />
                                <AlternatingRowStyle CssClass="alternaterow" />
                                <Columns>
                                    <asp:TemplateField HeaderText="BS_ID" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblBS_ID" runat="server" Visible="true" Text='<%#Eval("BS_ID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Note">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNote" runat="server" Text='<%#Eval("NOTE")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="60%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="QTY">
                                        <ItemTemplate>
                                            <asp:TextBox ID="lblQTY" runat="server" Text='<%#Eval("QTY")%>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="RATE" >
                                        
                                        <ItemTemplate>
                                            <asp:TextBox ID="lblRATE" runat="server" Text='<%#Eval("RATE")%>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
             <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="Submit" CausesValidation="true"
                    ValidationGroup="vin" onclick="btnSave_Click1"  />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="Submit" 
                    CausesValidation="false" onclick="btnUpdate_Click1" />
                <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="vin" ShowMessageBox="true"
                    ShowSummary="false" runat="server"/>
            <asp:HiddenField ID="hdnjid" runat="server" />

            </td>
        </tr>
 </table>
</asp:Content>


