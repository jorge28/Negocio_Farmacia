<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewAdmin.aspx.cs" Inherits="NewAdmin" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                <div class="container" id="Administracion">
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
                                <div id="Producto" class="panel panel-success" style="width: 800px; margin: auto; background-color: #d8f8ec">
                                    <div class="panel-heading" style="background-color: #26a929; color: white">
                                        <h3 class="panel-title">Alta de Producto</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-top: 40px">
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sProducto" style="width: 100px; background-color: #26a929; color: white">Producto:</span>
                                                <asp:TextBox ID="txtProducto" runat="server" class="form-control" placeholder="Nombre del Producto" Width="300px" aria-describedby="sProducto" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Static" runat="server" ErrorMessage="*** Campo Requerido" Text="***"
                                                    ForeColor="Red" ControlToValidate="txtProducto" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sSustancia" style="width: 100px; background-color: #26a929; color: white">Sustancia:</span>
                                                <asp:TextBox ID="txtSustancia" runat="server" class="form-control" placeholder="Sustancia del Producto" Width="300px" aria-describedby="sSustancia" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtSustancia" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sCategoria" style="width: 100px; background-color: #26a929; color: white">Categoria:</span>
                                                <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control" Width="200px" aria-describedby="sCategoria">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sTipo" style="width: 100px; background-color: #26a929; color: white">Presentacion:</span>
                                                <asp:DropDownList ID="ddlTipo" runat="server" class="form-control" Width="200px" aria-describedby="sTipo">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sCantidad" style="width: 100px; background-color: #26a929; color: white">Contenido:</span>
                                                <asp:TextBox ID="txtCantidad" runat="server" class="form-control" placeholder="Cantidad del Producto" Width="200px" aria-describedby="sCantidad" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtCantidad" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sExistencia" style="width: 100px; background-color: #26a929; color: white">Existencia:</span>
                                                <asp:TextBox ID="txtExistencia" runat="server" class="form-control" placeholder="No. de Existencias" Width="200px" aria-describedby="sExistencia" ValidationGroup="new" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtExistencia" ValidationGroup="new"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sPrecio" style="width: 100px; background-color: #26a929; color: white">Costo:</span>
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
                                            <div style="text-align: center;">
                                                <asp:Button ID="btnGuardar" Text="Guardar Producto" runat="server" ValidationGroup="new" type="button" CssClass="btn btn-success btn-sm" aria-haspopup="true" aria-expanded="false" Font-Bold="true" class="btn btn-success" Style="font-size: large" OnClientClick="return confirm('Se Guardara el Producto.')" OnClick="btnGuardar_Click" />
                                                &nbsp;&nbsp;
                                                <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" type="button" CssClass="btn btn-success btn-sm" aria-haspopup="true" aria-expanded="false" Font-Bold="true" class="btn btn-success" Style="font-size: large" OnClientClick="return confirm('¿Está Seguro de Cancelar el Alta de Producto?')" OnClick="btnCancelar_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelUsua" runat="server">
                                <div id="Usuario" class="panel panel-info" style="width: 800px; margin: auto; background-color: #d3f0fb">
                                    <div class="panel-heading" style="background-color: #0094ff; color: white">
                                        <h3 class="panel-title">Alta de Usuario</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-top: 40px">
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sNombre" style="width: 100px; background-color: #0094ff; color: white">Nombre:</span>

                                                <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre del Usuario" Width="300px" aria-describedby="sNombre" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtNombre" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sApaterno" style="width: 100px; background-color: #0094ff; color: white">Paterno:</span>
                                                <asp:TextBox ID="txtApaterno" runat="server" class="form-control" placeholder="Apellido Paterno" Width="300px" aria-describedby="sApaterno" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtApaterno" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sAmaterno" style="width: 100px; background-color: #0094ff; color: white">Materno</span>
                                                <asp:TextBox ID="txtAmaterno" runat="server" class="form-control" placeholder="Apellido Materno" Width="300px" aria-describedby="sAmaterno" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtAmaterno" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sDireccion" style="width: 100px; background-color: #0094ff; color: white">Direccion:</span>
                                                <asp:TextBox ID="txtDireccion" runat="server" class="form-control" placeholder="Calle,Numero,Colonia" Width="500px" aria-describedby="sDireccion" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtDireccion" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sTelefono" style="width: 100px; background-color: #0094ff; color: white">Telefono:</span>
                                                <asp:TextBox ID="txtTel" runat="server" class="form-control" placeholder="Telefono de Casa" Width="300px" aria-describedby="sAmaterno" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtTel" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sCel" style="width: 100px; background-color: #0094ff; color: white">Celular:</span>
                                                <asp:TextBox ID="txtCel" runat="server" class="form-control" placeholder="No. Celular" Width="300px" aria-describedby="sCel" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtCel" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sUsuario" style="width: 100px; background-color: #0094ff; color: white">Usuario:</span>
                                                <asp:TextBox ID="txtUsua" runat="server" class="form-control" placeholder="Ingresa tu Usuario" Width="300px" aria-describedby="sUsuario" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtUsua" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="sPass" style="width: 100px; background-color: #0094ff; color: white">Password:</span>
                                                <asp:TextBox ID="txtPass" runat="server" class="form-control" placeholder="Ingresa tu Password" Width="300px" aria-describedby="sPass" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtPass" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="Span1" style="width: 100px; background-color: #0094ff; color: white">Pregunta Secreta</span>
                                                <asp:TextBox ID="txtPregunta" runat="server" class="form-control" placeholder="Ingresa Pregunta Secreta" Width="300px" aria-describedby="span1" ValidationGroup="newU" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*** Campo Requerido" Text="***" Display="Static" ForeColor="Red" ControlToValidate="txtPregunta" ValidationGroup="newU"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="newU" ForeColor="red" runat="server" />
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div style="text-align: center;">
                                                <asp:Button ID="btnGuardarU" Text="Guardar Usuario" ValidationGroup="newU" class="btn btn-info" runat="server" type="button" CssClass="btn btn-info btn-sm" aria-haspopup="true" aria-expanded="false" Font-Bold="true" Style="font-size: large" OnClientClick="return confirm('Se Guardara el Usuario.')" OnClick="btnGuardarU_Click" />
                                                &nbsp;&nbsp;
                                                <asp:Button ID="btnCancelaU" Text="Cancelar" runat="server" type="button" CssClass="btn btn-info btn-sm" aria-haspopup="true" aria-expanded="false" Font-Bold="true" class="btn btn-info" Style="font-size: large" OnClientClick="return confirm('¿Está Seguro de Cancelar el Alta de Usuario?')" OnClick="btnCancelaU_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelExis" runat="server">
                                <div id="Existencia" class="panel panel-warning" style="width: 800px; margin: auto; background-color: #fcfed1;">
                                    <div class="panel-heading" style="background-color: #ffa20f; color: white">
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
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Buscar:</span>
                                                    <asp:TextBox ID="txtBuscadorE" runat="server" Font-Bold="false" ForeColor="Black" Height="35px" Width="400px" placeholder="Buscador" BackColor="Beige" AutoPostBack="True" OnTextChanged="txtBuscadorE_TextChanged1" />
                                                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                         <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Producto:</span>
                                                    <asp:TextBox ID="txtProdE" runat="server" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="producto" BackColor="Beige" Enabled="false"/>
                                                    &nbsp;&nbsp;&nbsp;
                                                  <div class="btn-group">
                                                    <asp:Button ID="Button1" class="btn btn-default" runat="server"  Text="Editar" OnClick="Button1_Click" />
                                                  </div>
                                                </div>
                                                 
                                                </div>
                                            </div>
                                        
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Sustancia:</span>
                                                    <asp:TextBox ID="txtSustaciaE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="Sustancia/Nombre" BackColor="Beige" Enabled="false" />
                                                    &nbsp;&nbsp;&nbsp;
                                                  <div class="btn-group">
                                                    <asp:Button ID="Button2" class="btn btn-default" runat="server"  Text="Editar" OnClick="Button2_Click" />
                                                  </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Categoria:</span>
                                                    <asp:DropDownList ID="ddlCatE" class="form-control" Width="200px" runat="server" BackColor="Beige" ></asp:DropDownList>
                                                    &nbsp;&nbsp;&nbsp;
                                                  <div class="btn-group">
                                                    <asp:Button ID="Button3" class="btn btn-default" runat="server"  Text="Editar" OnClick="Button3_Click" />
                                                  </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Prsentacion:</span>
                                                    <asp:DropDownList ID="ddlTipoE" class="form-control" Width="200px" runat="server" BackColor="Beige" ></asp:DropDownList>
                                                    &nbsp;&nbsp;&nbsp;
                                                  <div class="btn-group">
                                                    <asp:Button ID="Button4" class="btn btn-default" runat="server"  Text="Editar" OnClick="Button4_Click" />
                                                  </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Contenido:</span>
                                                    <asp:TextBox ID="txtCantidadE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="300px" placeholder="Cantidad" BackColor="Beige" Enabled="false" />
                                                    &nbsp;&nbsp;&nbsp;
                                                  <div class="btn-group">
                                                    <asp:Button ID="Button5" class="btn btn-default" runat="server"  Text="Editar" OnClick="Button5_Click" />
                                                  </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Existencias:</span>
                                                    <asp:TextBox ID="txtExistenciaE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="50px" placeholder="N°" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Piezas a Agregar:</span>
                                                    <asp:TextBox ID="txtPiezasAgregar" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="50px" BackColor="Beige" Enabled="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Piezas a Descontar:</span>
                                                    <asp:TextBox ID="txtPiezasDescontar" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="50px" BackColor="Beige" Enabled="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Costo:</span>
                                                    <asp:TextBox ID="txtCostoE" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="80px" placeholder="Costo:" BackColor="Beige" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px; background-color: #ffa20f; color: white;">Costo Nuevo:</span>
                                                    <asp:TextBox ID="txtCostoNuevo" runat="server" Font-Size="Medium" Font-Bold="false" ForeColor="Black" Height="35px" Width="80px" BackColor="Beige" Enabled="true" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <br />
                                        <br />
                                        <div class="row">
                                            <div style="text-align: center;">
                                                <asp:Button ID="btnActualizarE" runat="server" Text="Actualizar Producto" CssClass="btn btn-warning btn-sm" Font-Bold="true" Style="font-size: large" OnClientClick="return confirm('Se Actualizara el Producto.')" OnClick="btnActualizarE_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnCancelarE" runat="server" Text="Cancelar" CssClass="btn btn-warning btn-sm" Font-Bold="true" Style="font-size: large" OnClientClick="return confirm('¿Está Seguro de Cancelar la Actualización?')" OnClick="btnCancelarE_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelRepo" runat="server">
                                <div id="Reportes" class="panel panel-danger" style="width: 800px; margin: auto; background-color: #fce9e9;">
                                    <div class="panel-heading" style="background-color: #de4141; color: white;">
                                        <h3 class="panel-title">Generación de Reportes</h3>
                                    </div>
                                    <div class="panel-body" style="margin-left: 30px; margin-right: 30px; margin-top: 10px">
                                        <h4>*** Reporte de Existencias Agotadas. (Reporte para Pedido de Productos) ***</h4>
                                        <div class="row">
                                            <div class="col-md-12" style="text-align: center;">
                                                <asp:LinkButton ID="lnkReportePedido" runat="server" CssClass="btn btn-danger btn-sm" Font-Bold="true" Style="font-size: large" OnClick="lnkReportePedido_Click">Reporte Pedido</asp:LinkButton>
                                            </div>
                                        </div>
                                        <hr style="border: double" />
                                        <%--<h4>*** Reporte de Ventas y/o Cancelaciones. (Seleccione el Rango de Fechas) ***</h4>
                                        <div class="row">
                                            <div class="col-md-6" style="text-align: center;">
                                                <div class="form-inline" style="padding: 4px;">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon" style="background-color: #de4141; color: white;">
                                                                Fecha Inicial:
                                                            </div>
                                                            <div class="input-group" style="width: 100%">
                                                                <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Height="29px" EnableTyping="False">
                                                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"
                                                                        Culture="es-ES" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                                    </Calendar>
                                                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%"
                                                                        ReadOnly="True">
                                                                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                                                        <FocusedStyle Resize="None"></FocusedStyle>
                                                                        <DisabledStyle Resize="None"></DisabledStyle>
                                                                        <InvalidStyle Resize="None"></InvalidStyle>
                                                                        <HoveredStyle Resize="None"></HoveredStyle>
                                                                        <EnabledStyle Resize="None"></EnabledStyle>
                                                                    </DateInput>
                                                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                                </telerik:RadDatePicker>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6" style="text-align: center;">
                                                <div class="form-inline" style="padding: 4px;">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon" style="background-color: #de4141; color: white;">
                                                                Fecha Final:
                                                            </div>
                                                            <div class="input-group" style="width: 100%">
                                                                <telerik:RadDatePicker ID="RadDatePicker2" runat="server" Height="29px" EnableTyping="False">
                                                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"
                                                                        Culture="es-ES" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                                    </Calendar>
                                                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%"
                                                                        ReadOnly="True">
                                                                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                                                        <FocusedStyle Resize="None"></FocusedStyle>
                                                                        <DisabledStyle Resize="None"></DisabledStyle>
                                                                        <InvalidStyle Resize="None"></InvalidStyle>
                                                                        <HoveredStyle Resize="None"></HoveredStyle>
                                                                        <EnabledStyle Resize="None"></EnabledStyle>
                                                                    </DateInput>
                                                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                                </telerik:RadDatePicker>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5" style="text-align: center;">
                                            </div>
                                            <div class="col-md-3" style="text-align: left;">
                                                <asp:RadioButton ID="rdbVentas" runat="server" Text="Ventas" GroupName="ReporVC" Font-Size="Small" />
                                            </div>
                                            <div class="col-md-4" style="text-align: center;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5" style="text-align: center;">
                                            </div>
                                            <div class="col-md-3" style="text-align: left;">
                                                <asp:RadioButton ID="rdvCancelaciones" runat="server" Text="Cancelaciones" GroupName="ReporVC" Font-Size="Small" />
                                            </div>
                                            <div class="col-md-4" style="text-align: center;">
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12" style="text-align: center;">
                                                <asp:LinkButton ID="lnkReporteVenCan" runat="server" CssClass="btn btn-danger btn-sm" Font-Bold="true" Style="font-size: large">Reporte Ventas/Cancelaciones</asp:LinkButton>
                                            </div>
                                        </div>
                                        <hr style="border: double" />
                                        <h4>*** Reporte de Entrada de Articulos. (Seleccione el Rango de Fechas) ***</h4>
                                        <div class="row">
                                            <div class="col-md-6" style="text-align: center;">
                                                <div class="form-inline" style="padding: 4px;">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon" style="background-color: #de4141; color: white;">
                                                                Fecha Inicial:
                                                            </div>
                                                            <div class="input-group" style="width: 100%">
                                                                <telerik:RadDatePicker ID="RadDatePicker3" runat="server" Height="29px" EnableTyping="False">
                                                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"
                                                                        Culture="es-ES" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                                    </Calendar>
                                                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%"
                                                                        ReadOnly="True">
                                                                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                                                        <FocusedStyle Resize="None"></FocusedStyle>
                                                                        <DisabledStyle Resize="None"></DisabledStyle>
                                                                        <InvalidStyle Resize="None"></InvalidStyle>
                                                                        <HoveredStyle Resize="None"></HoveredStyle>
                                                                        <EnabledStyle Resize="None"></EnabledStyle>
                                                                    </DateInput>
                                                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                                </telerik:RadDatePicker>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6" style="text-align: center;">
                                                <div class="form-inline" style="padding: 4px;">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon" style="background-color: #de4141; color: white;">
                                                                Fecha Final:
                                                            </div>
                                                            <div class="input-group" style="width: 100%">
                                                                <telerik:RadDatePicker ID="RadDatePicker4" runat="server" Height="29px" EnableTyping="False">
                                                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"
                                                                        Culture="es-ES" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                                    </Calendar>
                                                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%"
                                                                        ReadOnly="True">
                                                                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                                                        <FocusedStyle Resize="None"></FocusedStyle>
                                                                        <DisabledStyle Resize="None"></DisabledStyle>
                                                                        <InvalidStyle Resize="None"></InvalidStyle>
                                                                        <HoveredStyle Resize="None"></HoveredStyle>
                                                                        <EnabledStyle Resize="None"></EnabledStyle>
                                                                    </DateInput>
                                                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                                </telerik:RadDatePicker>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12" style="text-align: center;">
                                                <asp:LinkButton ID="lnkReporteEntArt" runat="server" CssClass="btn btn-danger btn-sm" Font-Bold="true" Style="font-size: large">Reporte Entrada Articulos</asp:LinkButton>
                                            </div>
                                        </div>--%>
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

