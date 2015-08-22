<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewAdmin.aspx.cs" Inherits="NewAdmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
    <title></title>
</head>
<body background="img/wall9.png">
    <form id="form1" runat="server">

        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <div>
            <div>
                <div class="container" id="ventas">
                    <div class="header">
                        <div class="col-md-4">
                            <asp:Label ID="lblEmpleado" runat="server" Style="text-align: left; font-size: x-large;" ForeColor="DarkBlue" Text="Empleado 1"></asp:Label>
                        </div>
                        <div class="col-md-4" style="text-align: center">
                            <asp:Label ID="Label1" Text="Administrador" runat="server" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>
                        </div>
                        <div class="col-md-4" style="text-align: right">
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
                    <br />
                    <br />
                    <div style="height: 20px"></div>
                    <div>
                        <div class="row">
                            <nav class="navbar navbar-default">
                                <div class="container-fluid">
                                    <div class="navbar-header">
                                        <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                            <div class="btn-group" role="group">
                                                <asp:Button ID="btnAltaProd" runat="server" Text="Alta de Producto" type="button" class="btn btn-success" OnClick="btnAltaProd_Click" />
                                            </div>
                                            <div class="btn-group" role="group">
                                                <asp:Button ID="btnAltaUsua" runat="server" Text="Alta de Usuario" type="button" class="btn btn-info" OnClick="btnAltaUsua_Click" />
                                            </div>
                                            <div class="btn-group" role="group">
                                                <asp:Button ID="btnExis" runat="server" Text="Existencias" type="button" class="btn btn-warning" OnClick="btnExis_Click" />
                                            </div>
                                            <div class="btn-group" role="group">
                                                <asp:Button ID="btnReportes" runat="server" Text="Reportes" type="button" class="btn btn-danger" OnClick="btnReportes_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </div>

                        <div class="row">
                            <asp:Panel ID="PanelProd" runat="server">
                                <div id="Producto" class="panel panel-success" style="width: 800px; margin: auto">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Alta de Producto</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-top: 40px">
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sProducto"></span>
                                                <asp:TextBox ID="txtProducto" runat="server" class="form-control" placeholder="Nombre del Producto" Width="300px" aria-describedby="sProducto" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Static" runat="server" ErrorMessage="*** Campo Requerido" Text="***"
                                                    ForeColor="Red" ControlToValidate="txtProducto" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sSustancia"></span>
                                                <asp:TextBox ID="txtSustancia" runat="server" class="form-control" placeholder="Sustancia del Producto" Width="300px" aria-describedby="sSustancia" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtSustancia" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sCategoria"></span>
                                                <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control" Width="200px" aria-describedby="sCategoria">
                                                </asp:DropDownList>

                                            </div>

                                        </div>

                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sTipo"></span>
                                                <asp:DropDownList ID="ddlTipo" runat="server" class="form-control" Width="200px" aria-describedby="sTipo">
                                                </asp:DropDownList>

                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sCantidad"></span>

                                                <asp:TextBox ID="txtCantidad" runat="server" class="form-control" placeholder="Cantidad del Producto" Width="200px" aria-describedby="sCantidad" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtCantidad" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sExistencia">#</span>
                                                <asp:TextBox ID="txtExistencia" runat="server" class="form-control" placeholder="No. de Existencias" Width="200px" aria-describedby="sExistencia" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtExistencia" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sPrecio">$</span>
                                                <asp:TextBox ID="txtPrecio" runat="server" class="form-control" placeholder="Precio del Producto" Width="200px" aria-describedby="sPrecio" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtPrecio" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <br />
                                        <div class="row">
                                            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="new" ForeColor="red" runat="server" />
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="btn-group">
                                                <asp:Button ID="btnGuardar" Text="Guardar Producto" runat="server" ValidationGroup="new" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" OnClick="btnGuardar_Click" />
                                                <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" OnClick="btnCancelar_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelUsua" runat="server">
                                <div id="Usuario" class="panel panel-info" style="width: 800px; margin: auto">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Alta de Usuario</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-top: 40px">
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sNombre"></span>

                                                <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre del Usuario" Width="300px" aria-describedby="sNombre" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sApaterno"></span>
                                                <asp:TextBox ID="txtApaterno" runat="server" class="form-control" placeholder="Apellido Paterno" Width="300px" aria-describedby="sApaterno" />
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sAmaterno"></span>
                                                <asp:TextBox ID="txtAmaterno" runat="server" class="form-control" placeholder="Apellido Materno" Width="300px" aria-describedby="sAmaterno" />
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sDireccion"></span>
                                                <asp:TextBox ID="txtDireccion" runat="server" class="form-control" placeholder="Calle,Numero,Colonia" Width="500px" aria-describedby="sDireccion" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sTelefono"></span>
                                                <asp:TextBox ID="txtTel" runat="server" class="form-control" placeholder="Telefono de Casa" Width="300px" aria-describedby="sAmaterno" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sCel"></span>
                                                <asp:TextBox ID="txtCel" runat="server" class="form-control" placeholder="No. Celular" Width="300px" aria-describedby="sCel" />
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sUsuario"></span>
                                                <asp:TextBox ID="txtUsua" runat="server" class="form-control" placeholder="Ingresa tu Usuario" Width="300px" aria-describedby="sUsuario" />
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sPass"></span>
                                                <asp:TextBox ID="txtPass" runat="server" class="form-control" placeholder="Ingresa tu Password" Width="300px" aria-describedby="sPass" />
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="btn-group">
                                                <asp:Button ID="btnGuardarU" Text="Guardar Usuario" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" />
                                                <asp:Button ID="btnCancelaU" Text="Cancelar" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelExis" runat="server">
                                <div id="Existencia" class="panel panel-warning" style="width: 800px; margin: auto; background-color: aliceblue;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Actualización de Existencias y Costos</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-top: 20px">
                                        <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                            MinimumPrefixLength="2" UseContextKey="True"
                                            TargetControlID="txtBuscadorE" ServiceMethod="GetCompletionList">
                                        </asp:AutoCompleteExtender>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Producto:</span>
                                                    <asp:TextBox ID="txtBuscadorE" runat="server" Font-Bold="false" ForeColor="Black" Height="35px" Width="400px" placeholder="Buscador" BackColor="Beige" AutoPostBack="True" OnTextChanged="txtBuscadorE_TextChanged1" />
                                                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Sustancia:</span>
                                                    <asp:TextBox ID="txtSustaciaE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="Sustancia/Nombre" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Categoria:</span>
                                                    <asp:TextBox ID="txtCateE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="Categoria" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Tipo:</span>
                                                    <asp:TextBox ID="txtTipoE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="Tipo" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Catidad:</span>
                                                    <asp:TextBox ID="txtCantidadE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="Cantidad" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Existencias:</span>
                                                    <asp:TextBox ID="txtExistenciaE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="50px" placeholder="N°" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Piezas a Agregar:</span>
                                                    <asp:TextBox ID="txtPiezasAgregar" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="50px" BackColor="Beige" Enabled="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Piezas a Descontar:</span>
                                                    <asp:TextBox ID="txtPiezasDescontar" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="50px" BackColor="Beige" Enabled="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Costo:</span>
                                                    <asp:TextBox ID="txtCostoE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="80px" placeholder="Costo:" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: LightBlue;">Costo Nuevo:</span>
                                                    <asp:TextBox ID="txtCostoNuevo" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="80px" BackColor="Beige" Enabled="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <div class="row">
                                            <div style="text-align: center;">
                                                <asp:Button ID="btnActualizarE" runat="server" Text="Actualizar Producto" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" Style="color: black; font-size: large" OnClientClick="return confirm('Se Actualizara el Producto.')" OnClick="btnActualizarE_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnCancelarE" runat="server" Text="Cancelar" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" Style="color: black; font-size: large" OnClientClick="return confirm('¿Está Seguro de Cancelar la Actualización?')" OnClick="btnCancelarE_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelRepo" runat="server">
                                <div id="Reportes" class="panel panel-danger" style="width: 800px; margin: auto; background-color: aliceblue;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Generación de Reportes</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-right: 30px; margin-top: 10px">
                                        <h4>*** Reporte de Existencias Agotadas. (Reporte para Pedido de Productos) ***</h4>
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <asp:LinkButton ID="lnkReportePedido" runat="server" CssClass="btn btn-success btn-sm" Font-Bold="true" BackColor="LightBlue" Style="color: black; font-size: large" >Reporte Pedido</asp:LinkButton>
                                            </div>
                                        </div>
                                        <hr style="border: double" />
                                        <h4>*** Reporte de Ventas. (Seleccione el Rango de Fechas) ***</h4>
                                        <div class="row">
                                            <div class="col-sm-4 col-xs-12" style="text-align: center;">
                                                <div class="form-inline" style="padding: 4px;">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon" style="color: White;">
                                                                Fecha Inicial:
                                                            </div>
                                                            <div class="btn-group" style="width: 100%">
                                                                <asp:TextBox runat="server" ID="datepicker" Style="width: 100%" class="btn btn-default btn-sm sandbox-container" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 col-xs-12" style="text-align: center;">
                                                <div class="form-inline" style="padding: 4px;">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon" style="color: White;">
                                                                Fecha Final:
                                                            </div>
                                                            <div class="btn-group" style="width: 100%">
                                                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                                                <%--<asp:TextBox runat="server" ID="datepicker1" Style="width: 100%" class="btn btn-default btn-sm sandbox-container" />--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <asp:RadioButtonList ID="rdoReportes" runat="server">
                                                <asp:ListItem Text="Prueba1" />
                                                <asp:ListItem Text="Prueba2" />
                                                <asp:ListItem Text="Prueba3" />
                                                <asp:ListItem Text="Prueba4" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="btn-group">
                                                <asp:Button ID="btnReporte" Text="Generar Reporte" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" />
                                                <asp:Button ID="btnCancelaReporte" Text="Cancelar" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hfIdProductoE" runat="server" />
    </form>
</body>
</html>
