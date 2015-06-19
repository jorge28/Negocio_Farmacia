<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp1.aspx.cs" Inherits="Ventas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>VentasEmp1</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/skel.min.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
    </noscript>
    <!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><script src="js/html5shiv.js"></script><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
    <!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
</head>
<body bgcolor="#58D3F7">
    <form id="form1" method="post" action="#" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <div>
                <article class="container" id="ventas">
                   <header>
                       <div class="4u">
                            <h2 style="text-align:left; font-size:medium">Empleado 1</h2>
                       </div>
                       <div class="4u" style="text-align:center">
                            <asp:Label ID="lblCliente" runat="server" Font-Size="Large" Text="Cliente #" ForeColor="Blue"></asp:Label>
                       </div>
                       <div class="4u" style="text-align:right">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                               <ContentTemplate>
                                 <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
                                 </asp:Timer>
                                 <asp:Label ID="lblFecha" runat="server" Font-Size="Medium" ForeColor="Black"></asp:Label>
                               </ContentTemplate>
                            </asp:UpdatePanel>    
                       </div>  
                       <div class="12u">
                            <div style="height:35px">
                                <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="35px" Width="75%" placeholder="Producto:" BackColor="Beige" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged1"  />
                                      &nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" ForeColor="Black" Height="35px" Text="AGREGAR" OnClick="Button1_Click1" ></asp:Button> 
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false" ></asp:Label>
                           </div>
                           <div></div>   
                           <br />
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                                                          MinimumPrefixLength="2" UseContextKey="True"
                                                          TargetControlID="TextBox1" ServiceMethod="GetCompletionList">

                                </asp:AutoCompleteExtender>  
                           <div class="12u" style="text-align:left">
                               <asp:Panel ID="Panel1" runat="server" Height="250px" >
                                     <asp:GridView ID="gvResBus" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                            <Columns>
                                                <asp:BoundField DataField="Nombre_Producto" HeaderText="Producto" />
                                                <asp:BoundField DataField="Sustancia" HeaderText="Sustancia" />
                                                <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                                <asp:BoundField DataField="Existencia" HeaderText="Existencia" />
                                                <asp:BoundField DataField="Costo" HeaderText="Costo" />
                                                <asp:ButtonField Text="Eliminar" />
                                            </Columns>
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                    </asp:GridView>
                              </asp:Panel>
                               </div> 
                     </div>
                     <div class="row half">
                     </div>                         
                  </header>               
                    
                <footer>
                   <div class="12u" style="text-align:right">
                   <span style="color:Black">Subtotal Medicamento: $</span>
                    <asp:TextBox ID="txtSubtMedi" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />                 
                   <span style="color:Black">Subtotal Farmacia: $</span>
                    <asp:TextBox ID="txtSubtFarm" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />              
                   <span style="color:Black">Subtotal Otros: $</span>
                    <asp:TextBox ID="txtSubtOtro" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />                
                   <span style="color:Black">------------------------------</span><br />
                   <span style="color:Black; font-size:x-large">Total: $</span>
                    <asp:TextBox ID="txtTotal" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" Font-Size="Large"></asp:TextBox><br />     
                   </div>                   
                   <div class="6u" style="text-align:left"><br />
                    <asp:LinkButton ID="lnkTota" runat="server" style="color:Blue; font-size:x-large">Totales</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="lnkReve" runat="server" style="color:Blue; font-size:x-large">Reverso</asp:LinkButton>
                   </div>
                   <div class="6u" style="text-align:right"><br />
                    <asp:LinkButton ID="lnkLimp" runat="server" style="color:Blue; font-size:x-large" href="#" class="form-button-reset">Cancelar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="lnkGuar" runat="server" style="color:Blue; font-size:x-large">Guardar</asp:LinkButton>
                   </div>
                </footer>
            </article>
            </div>
        </div>
    </form>
</body>
</html>
