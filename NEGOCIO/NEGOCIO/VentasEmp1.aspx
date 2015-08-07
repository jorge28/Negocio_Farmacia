<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp1.aspx.cs" Inherits="Ventas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Ventas_EstrellaDeLaMañana</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/bootstrap.js"></script>
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
                            <asp:Label ID="lnlNumCliente" runat="server" Font-Size="x-Large" Text="" ForeColor="DarkBlue"></asp:Label>
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
                            <asp:TextBox ID="TextBox1" runat="server" Font-Bold="true" ForeColor="Black" Height="35px" Width="62%" placeholder="Buscador:" BackColor="Beige" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged1" />
                            <asp:TextBox ID="txtCate" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="Black" Height="35px" Width="21%" placeholder="Categoria:" BackColor="Beige" Enabled="false" />
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                        </div>
                        <div style="height: 5px"></div>
                        <div>
                            <asp:TextBox ID="txtSustancia" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="Black" Height="35px" Width="22%" placeholder="Sustancia/Nombre:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtTipo" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="Black" Height="35px" Width="10%" placeholder="Tipo:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtCantidad" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="Black" Height="35px" Width="10%" placeholder="Cantidad:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtExistencia" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="Black" Height="35px" Width="11%" placeholder="Existencia:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtCosto" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="Black" Height="35px" Width="7%" placeholder="Costo:" BackColor="Beige" Enabled="false" />
                            <asp:TextBox ID="txtPiezasV" runat="server" Font-Size="Small" Font-Bold="true" MaxLength="3" ForeColor="Black" Height="35px" Width="13%" placeholder="Piezas a Vender:" BorderWidth="1px" BorderColor="Green" BackColor="Beige" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" ForeColor="Black" Height="35px" Text="AGREGAR" OnClick="Button1_Click1"></asp:Button>
                        </div>
                    </div>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                        MinimumPrefixLength="2" UseContextKey="True"
                        TargetControlID="TextBox1" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    <div class="12u" style="text-align: left">
                        <asp:Panel ID="Panel1" runat="server" Height="200px">
                            <div style="height: 20px"></div>
                            <asp:GridView ID="gvResBus" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="5px" CellPadding="4" DataKeyNames="Nombre_Producto,Sustancia,Costo,TotalVentaProd,Categoria">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID_Producto" Visible="false"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIDProducto" runat="server" Text='<%# Bind("Id_Producto") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Producto" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProducto" runat="server" Text='<%# Bind("Nombre_Producto") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sustancia" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSustancia" runat="server" Text='<%# Bind("Sustancia") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Categoria" Visible="false" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tipo" Visible="false" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cantidad" Visible="false" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Existencia" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblExistencia" runat="server" Text='<%# Bind("Existencia") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Costo" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCosto" runat="server" Text='<%# Bind("Costo", "{0:C}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Piezas Venta" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPiezas" runat="server" Text='<%# Bind("Piezas") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotalVentaProd" runat="server" Text='<%# Bind("TotalVentaProd", "{0:C}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="Green" HeaderStyle-BorderWidth="1px" ItemStyle-BorderColor="Green" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEliminar" runat="server" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" OnClick="lnkEliminar_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                        <ItemStyle BorderColor="Green" BorderWidth="1px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Wrap="True" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="Beige" ForeColor="#003399" BorderColor="Black" Font-Bold="True" Font-Italic="False" Font-Size="Small" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                    <div class="footer">
                        <div class="12u" style="text-align: right">
                            <span style="color: Black">Medicamento:</span>
                            <asp:TextBox ID="txtSubtMedi" runat="server" placeholder="$0.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />
                            <span style="color: Black">Perfumería:</span>
                            <asp:TextBox ID="txtSubtFarm" runat="server" placeholder="$0.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />
                            <span style="color: Black">Otros:</span>
                            <asp:TextBox ID="txtSubtOtro" runat="server" placeholder="$0.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />
                            <span style="color: Black">------------------------------</span><br />
                            <span style="color: Black; font-size: x-large;">Total:</span>
                            <asp:TextBox ID="txtTotal" runat="server" placeholder="$0.00" Font-Size="Large" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" Font-Bold="true"></asp:TextBox><br />
                            <%--<input id="txtTotal" runat="server" type="text" ng-model="total" style="width: 100px; height: 50px; color: black; background-color: beige;" /><br />--%>
                            <span style="color: Black">Ingreso:</span>
                            <%--<input type="text" ng-model="ingreso" style="width: 100px; height: 50px;" />--%>
                            <asp:TextBox ID="txtIngreso" runat="server" placeholder="$0.00" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" AutoPostBack="True" OnTextChanged="txtIngreso_TextChanged" Font-Bold="true" EnableTheming="True" EnableViewState="True" ViewStateMode="Inherit"></asp:TextBox><br />
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="txtIngreso" EventName="TextChanged" />
                                </Triggers>
                                <ContentTemplate>
                                    <span style="color: Black; font-size: x-large">Cambio:</span>
                                    <%--<input type="text" value="{{total * ingreso}}" style="width: 100px; height: 50px;" />--%>
                                    <asp:TextBox ID="txtCambio" runat="server" placeholder="$0.00" Font-Size="Large" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" Font-Bold="true"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="6u" style="text-align: left">
                            <div style="height: 5px"></div>
                            <asp:LinkButton ID="lnkTota" runat="server" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" Style="color: black; font-size: large">Totales</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                        </div>
                        <div class="6u" style="text-align: right">
                            <div style="height: 5px"></div>
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Enabled="false" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" Style="color: black; font-size: large" OnClientClick="return confirm('¿Está Seguro de Cancelar la Operación?')" OnClick="btnCancelar_Click"></asp:Button>
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" Style="color: black; font-size: large" OnClientClick="return confirm('Se Registrara la Venta.')" OnClick="btnGuardar_Click"></asp:Button>
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
