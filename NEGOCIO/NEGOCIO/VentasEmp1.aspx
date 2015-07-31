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
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
    </noscript>
</head>
<body background="img/wall9.png">

    <form id="form1" method="post" action="#" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <div>
                <div class="container" id="ventas">
                    <div class="header">
                        <div class="4u">
                            <asp:Label ID="lblEmpleado" runat="server" Style="text-align: left; font-size: x-large;" ForeColor="DarkBlue" Text="Empleado 1"></asp:Label>
                        </div>
                        <div class="4u" style="text-align: center">
                            <asp:Label ID="lblCliente" runat="server" Font-Size="x-Large" Text="Cliente #" ForeColor="DarkBlue"></asp:Label>&nbsp;
                            <asp:Label ID="lnlNumCliente" runat="server" Font-Size="x-Large" Text="0" ForeColor="DarkBlue"></asp:Label>
                        </div>
                        <div class="4u" style="text-align: right">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                                    </asp:Timer>
                                    <asp:Label ID="lblFecha" runat="server" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>
                                    <asp:Button ID="btnSalir" runat="server" CssClass="btn btn-success close" BackColor="LightBlue" ForeColor="Black" Height="35px" Text="SALIR" OnClick="btnSalir_Click" OnClientClick="return confirm('¿Está Seguro de Salir del Sistema?')"></asp:Button>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="12u">
                        <div style="height: 35px">
                            <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="35px" Width="75%" placeholder="Producto:" BackColor="Beige" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged1" />
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                        </div>
                        <div style="height: 5px"></div>
                        <div>
                            <asp:TextBox ID="txtSustancia" runat="server" ForeColor="Black" Height="35px" Width="22%" placeholder="Sustancia/Nombre:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtTipo" runat="server" ForeColor="Black" Height="35px" Width="10%" placeholder="Tipo:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtCantidad" runat="server" ForeColor="Black" Height="35px" Width="10%" placeholder="Cantidad:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtExistencia" runat="server" ForeColor="Black" Height="35px" Width="11%" placeholder="Existencia:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtCosto" runat="server" ForeColor="Black" Height="35px" Width="7%" placeholder="Costo:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtPiezasV" runat="server" MaxLength="3" ForeColor="Black" Height="35px" Width="13%" placeholder="Piezas a Vender:" BorderWidth="1px" BorderColor="Green" BackColor="LightBlue" />
                            &nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-sm" BackColor="LightBlue" ForeColor="Black" Height="35px" Text="AGREGAR" OnClick="Button1_Click1"></asp:Button>
                        </div>
                    </div>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                        MinimumPrefixLength="2" UseContextKey="True"
                        TargetControlID="TextBox1" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    <div class="12u" style="text-align: left">
                        <asp:Panel ID="Panel1" runat="server" Height="175px">
                            <div style="height: 10px"></div>
                            <asp:GridView ID="gvResBus" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Blue" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" GridLines="Both" DataKeyNames="Nombre_Producto,Sustancia,Costo">
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
                                    <asp:TemplateField HeaderText="Categoria" Visible="false" >
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
                                    <asp:TemplateField HeaderText="Existencia" ItemStyle-HorizontalAlign="Center">
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
                                    <asp:TemplateField HeaderText="Piezas Venta" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPiezas" runat="server" Text='<%# Bind("Piezas") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotalVentaProd" runat="server" Text='<%# Bind("TotalVentaProd", "{0:C}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center"/>
                                    </asp:TemplateField>
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
                    <div class="row half">
                    </div>
                    <div class="footer">
                        <div class="12u" style="text-align: right" >
                            <span style="color: Black">Medicamento:</span>
                            <asp:TextBox ID="txtSubtMedi" runat="server" placeholder="$000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />
                            <span style="color: Black">Perfumería:</span>
                            <asp:TextBox ID="txtSubtFarm" runat="server" placeholder="$000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />
                            <span style="color: Black">Otros:</span>
                            <asp:TextBox ID="txtSubtOtro" runat="server" placeholder="$000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />
                            <span style="color: Black">------------------------------</span><br />

                            <span style="color: Black; font-size: x-large;">Total:</span>
                            <%--<input id="txtTotal" runat="server" name="total" type="text"  ng-model="total" />--%>
                            <asp:TextBox ID="txtTotal" runat="server" placeholder="$00.00" Font-Size="Large" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" ></asp:TextBox><br />
                            
                            <span style="color: Black">Ingreso:</span>
                            <%--<input type="text" ng-model="ingreso" />--%>
                            <asp:TextBox ID="txtIngreso" runat="server" placeholder="$000.00" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" AutoPostBack="True" OnTextChanged="txtIngreso_TextChanged"></asp:TextBox><br />
                            
                            <span style="color: Black; font-size: x-large">Cambio:</span>
                            <%--<input value="{{ingreso - total}}"/>--%>
                            <asp:TextBox ID="txtCambio" runat="server" placeholder="$00.00" Font-Size="Large" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox>
                        
                        </div>
                        <div class="6u" style="text-align: left">
                            <br />
                            
                            <asp:LinkButton ID="lnkTota" runat="server" CssClass="btn btn-success btn-sm" BackColor="LightBlue" Style="color: black; font-size: large">Totales</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                        </div>
                        <div class="6u" style="text-align: right">
                            <br />
                            <asp:LinkButton ID="lnkLimp" runat="server" CssClass="btn btn-success btn-sm" BackColor="LightBlue" Style="color: black; font-size: large" href="#" class="form-button-reset" OnClientClick="return confirm('¿Está Seguro de Cancelar la Operación?')">Cancelar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                            <asp:LinkButton ID="lnkGuar" runat="server" CssClass="btn btn-success btn-sm" BackColor="LightBlue" Style="color: black; font-size: large" OnClientClick="return confirm('Se Registrara la Venta.')">Guardar</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hfMedi" runat="server" />
        <asp:HiddenField ID="hfPerf" runat="server" />
        <asp:HiddenField ID="hfOtro" runat="server" />
        <asp:HiddenField ID="hfTotal" runat="server" />
    </form>
</body>
</html>
