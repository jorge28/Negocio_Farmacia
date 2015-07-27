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
<body background="img/wall5.jpg">    

    <form id="form1" method="post" action="#" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <div>
                <article class="container" id="ventas">
                   <header>
                       <div class="4u">
                           <asp:Label ID="lblEmpleado" runat="server" style="text-align:left; font-size:x-large;" ForeColor="Yellow"  Text="Empleado 1"></asp:Label>
                            <%--<h2 style="text-align:left; font-size:medium">Empleado 1</h2>--%>
                       </div>
                       <div class="4u" style="text-align:center">
                            <asp:Label ID="lblCliente" runat="server" Font-Size="x-Large" Text="Cliente #" ForeColor="Yellow"></asp:Label>&nbsp;
                            <asp:Label ID="lnlNumCliente" runat="server" Font-Size="x-Large" Text="0" ForeColor="Yellow"></asp:Label> 
                       </div>
                       <div class="4u" style="text-align:right">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                               <ContentTemplate>
                                 <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
                                 </asp:Timer>
                                 <asp:Label ID="lblFecha" runat="server" Font-Size="X-Large" ForeColor="Yellow"></asp:Label>
                               </ContentTemplate>
                            </asp:UpdatePanel>    
                       </div>  
                       <div class="12u">
                            <div style="height:35px">
                                <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="35px" Width="75%" placeholder="Producto:" BackColor="Beige" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged1"  />
                                      &nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" ForeColor="Black" Height="35px" Text="AGREGAR" OnClick="Button1_Click1" ></asp:Button> 
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false" ></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnSalir" runat="server" ForeColor="Black" Height="35px" Text="SALIR" OnClick="btnSalir_Click"></asp:Button>
                           </div>
                           <div></div>   
                           <br />
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                                                          MinimumPrefixLength="2" UseContextKey="True"
                                                          TargetControlID="TextBox1" ServiceMethod="GetCompletionList">

                                </asp:AutoCompleteExtender>  
                           <div class="12u" style="text-align:left">
                               <asp:Panel ID="Panel1" runat="server" Height="175px" >
                                     <asp:GridView ID="gvResBus" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataKeyNames="Nombre_Producto,Sustancia">
                                            <AlternatingRowStyle BackColor="#DCDCDC" />
                                            <Columns>                                           
                                                <asp:TemplateField HeaderText="Producto">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre_Producto") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProducto" runat="server" Text='<%# Bind("Nombre_Producto") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sustancia">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Sustancia") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSustancia" runat="server" Text='<%# Bind("Sustancia") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Categoria">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Categoria") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tipo">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Tipo") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cantidad">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cantidad") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Existencia" ItemStyle-HorizontalAlign="Center" >
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Existencia") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblExistencia" runat="server" Text='<%# Bind("Existencia") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Costo" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Costo", "{0:C}") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCosto" runat="server" Text='<%# Bind("Costo", "{0:C}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Piezas A Vender" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"  >                                                    
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPiezas" runat="server" Text="" ForeColor="Black"  BackColor="White" Height="33px" BorderWidth="1px" 
                                                            BorderColor="Black" Width="50px" AutoPostBack="True" OnTextChanged="txtPiezas_TextChanged"  CommandArgument='<%# Container.DataItemIndex %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" Text=""></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotalXProd" runat="server"  Text="$0.00"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEliminar" runat="server" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" OnClick="lnkEliminar_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#000065" />
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
                   <span style="color:Black">Subtotal Perfumería: $</span>
                    <asp:TextBox ID="txtSubtFarm" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />              
                   <span style="color:Black">Subtotal Otros: $</span>
                    <asp:TextBox ID="txtSubtOtro" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />                
                   <span style="color:Black">------------------------------</span><br />
                   <span style="color:Black; font-size:x-large;">Total: $</span>
                    <asp:TextBox ID="txtTotal" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" Font-Size="Large"></asp:TextBox><br />     
                    <span style="color:Black">Ingreso: $</span>
                    <asp:TextBox ID="txtIngreso" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />                 
                    <span style="color:Black; font-size:x-large">Cambio: $</span>
                    <asp:TextBox ID="TextBox8" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />   
                   </div>                   
                   <div class="6u" style="text-align:left"><br />
                    <asp:LinkButton ID="lnkTota" runat="server" style="color:yellow; font-size:x-large">Totales</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="lnkReve" runat="server" style="color:yellow; font-size:x-large">Reverso</asp:LinkButton>
                   </div>
                   <div class="6u" style="text-align:right"><br />
                    <asp:LinkButton ID="lnkLimp" runat="server" style="color:yellow; font-size:x-large" href="#" class="form-button-reset">Cancelar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="lnkGuar" runat="server" style="color:yellow; font-size:x-large">Guardar</asp:LinkButton>
                   </div>
                </footer>
            </article>
            </div>
        </div>
    </form>
</body>
</html>
