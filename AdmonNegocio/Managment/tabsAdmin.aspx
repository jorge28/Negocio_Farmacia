<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tabsAdmin.aspx.cs" Inherits="tabsAdmin" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Control de inventarios e interfaces para ventas." />
    <meta name="author" content="Jorge Romero Olguin" />
    <title>Administrador</title>
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />

    <script src="js/bootstrap.js"></script>
    <script src="tabs/tabs/js/prefixfree.min.js"></script>
    <link href="tabs/tabs/css/style.css" rel="stylesheet" />
    <link href="EasyAutocomplete/EasyAutocomplete/easy-autocomplete.min.css" rel="stylesheet" />
    <link href="EasyAutocomplete/EasyAutocomplete/easy-autocomplete.themes.min.css" rel="stylesheet" />

    <link href="css/jquery.datetimepicker.css" rel="stylesheet" />
</head>
<body>
    
    <div class="container-fluid" style="padding-left: 15px; padding-right: 15px;">
        <div class="row " style="margin-top: 15px;">
            <div class="col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading" style="background-color: whitesmoke; background-image: linear-gradient(to bottom, whitesmoke 0%, whitesmoke 100%); padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; height: 50px;">
                        <div class="row">
                            <div class="col-md-9" style="text-align: left;">
                                <label style="font-size: medium; color: darkblue;">Administrador:</label>&nbsp&nbsp
                                <asp:Label ID="lblEmpleado" runat="server" Style="font-size: medium; color: darkblue;"></asp:Label>
                            </div>
                             <div class="col-md-2" style="text-align: right; margin-top: 15px;">
                                <form id="form1" runat="server">        
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>   
                                            <asp:Label ID="lblFecha" runat="server" Font-Size="Large" ForeColor="darkblue"></asp:Label>                
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </form> 
                            </div>                          
                            <div class="col-md-1" style="text-align: right; margin-top: 5px;">
                                <label id="btnSalir" class="btn btn-primary btn-sm">Salir</label>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body" style="height: 710px; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px;">
                        <main>

                        <input id="tab1" type="radio" name="tabs" />
                        <label for="tab1">Nuevo Producto</label>

                        <input id="tab2" type="radio" name="tabs" />
                        <label for="tab2">Nuevo Usuario</label>

                        <input id="tab3" type="radio" name="tabs" checked />
                        <label for="tab3">Edicion Producto</label>

                        <input id="tab4" type="radio" name="tabs" />
                        <label for="tab4">Reportes</label>

                        <section id="content1">
                            <br />
                            <br />
                            <form class="form-horizontal" id="formAlta" autocomplete="off" method="post" action="javascript:void(0)">
                                <div class="form-group">
                                    <label for="txtCodigo" class="col-lg-2 control-label" style="font-size: smaller;">Codigo de Barras:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-barcode"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCodigo" style="width: 70%" name="txtCodigo" autofocus="autofocus" placeholder="Ingresa Codigo de Barras" required="required" title="Ingresa Codigo de Barras" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtProducto" class="col-lg-2 control-label" style="font-size: smaller">Producto:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange;">
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtProducto" style="width: 60%" name="txtProducto" placeholder="Ingresa Nombre del Producto" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtSustancia" class="col-lg-2 control-label" style="font-size: smaller">Sustancia:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-flask"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtSustancia" style="width: 60%" name="txtSustancia" placeholder="Ingresa Nombre de la Sustancia" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategoria" class="col-lg-2 control-label" style="font-size: smaller">Categoria:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-sitemap"></i></span>
                                            </span>
                                            <select id="ddlCategoria" class="form-control input-sm" style="width: 150px">
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlTipo" class="col-lg-2 control-label" style="font-size: smaller">Tipo:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-cubes"></i></span>
                                            </span>
                                            <select id="ddlTipo" class="form-control input-sm" style="width: 150px">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCantidad" class="col-lg-2 control-label" style="font-size: smaller">Cantidad:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-tint"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCantidad" style="width: 60%" name="txtCantidad" placeholder="Ingrese Cantidad del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtExistencia" class="col-lg-2 control-label" style="font-size: smaller">Existencia:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-list"></i></span>
                                            </span>
                                            <input type="number" class="form-control input-sm" id="txtExistencia" min="0" max="100" style="width: 80px" name="txtExistencia" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCosto" class="col-lg-2 control-label" style="font-size: smaller">Costo:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-usd"></i></span>
                                            </span>
                                            <input type="number" class="form-control input-sm" step="any" id="txtCosto" style="width: 80px" name="txtCosto" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div class="alert alert-success" id="alertListoProd" style="display: none;"><strong>Felicidades:</strong>&nbsp El producto ha sido agregado</div>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3">
                                        <button type="button" id="btnGuardarProducto" class="btn btn-warning">Guardar Producto</button>
                                    </div>
                                    <div class="col-lg-3">
                                        <label id="btnCancelarProducto" class="btn btn-primary">Limpiar</label>
                                    </div>
                                </div>
                            </form>
                        </section>

                        <section id="content2">
                            <br />
                            <br />
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="txtNombre" class="col-lg-2 control-label" style="font-size: smaller">Nombre de Usuario:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-child"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtNombre" style="width: 60%" name="txtNombre" placeholder="Ingresa Nombre de Usuario" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtApaterno" class="col-lg-2 control-label" style="font-size: smaller">Apellido Paterno:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-pinterest"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtApaterno" style="width: 60%" name="txtApaterno" placeholder="Ingresa Apellido Paterno" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtAmaterno" class="col-lg-2 control-label" style="font-size: smaller">Apellido Materno:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-maxcdn"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtAmaterno" style="width: 60%" name="txtAmaterno" placeholder="Ingresa Apellido Materno" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtDireccion" class="col-lg-2 control-label" style="font-size: smaller">Direccion:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-map-marker"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtDireccion" style="width: 60%" name="txtDireccion" placeholder="Ingresa Direccion del Usuario" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtTelefono" class="col-lg-2 control-label" style="font-size: smaller">Telefono Casa:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-phone-square"></i></span>
                                            </span>
                                            <input type="tel" class="form-control input-sm" id="txtTelefono" style="width: 60%" name="txtTelefono" placeholder="Ingresa el Telefono del Usuario" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCelular" class="col-lg-2 control-label" style="font-size: smaller">Telefono Celular:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-mobile"></i></span>
                                            </span>
                                            <input type="tel" class="form-control input-sm" id="txtCelular" style="width: 60%" name="txtCelular" placeholder="Ingresa el No. Celular del Usuario" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtUsuario" class="col-lg-2 control-label" style="font-size: smaller">Usuario:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-user"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtUsuario" style="width: 60%" name="txtUsuario" placeholder="Ingresa un Usuario" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtContraseña" class="col-lg-2 control-label" style="font-size: smaller">Contraseña:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-unlock"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtContraseña" style="width: 60%" name="txtContraseña" placeholder="Ingresa una Contraseña" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtPreguntaSecreta" class="col-lg-2 control-label" style="font-size: smaller">Palabra Secreta:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-puzzle-piece"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtPreguntaSecreta" style="width: 60%" name="txtPreguntaSecreta" placeholder="Ingresa una Pregunta Secreta" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3">
                                        <label id="btnGuardarUsuario" class="btn btn-warning">Guardar Usuario</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <label id="btnCancelarUsuario" class="btn btn-primary">Limpiar</label>
                                    </div>
                                </div>
                            </form>
                        </section>

                        <section id="content3">
                            <br />
                            <br />
                            <p id="pBuscador">
                                Buscar por <a href="#" role="button" id="lnkCodigoExis">Codigo de Barras</a> o por <a href="#" role="button" id="lnkProductoExis">Nombre del Producto</a>.
                            </p>
                            <br />
                            <div class="form-group" id="divBuscador" style="display: none">
                                <label for="txtPreguntaSecreta" class="col-lg-2 control-label" style="font-size: smaller"></label>
                                <div class="col-lg-10">
                                    <div class="input-group input-group-icon" style="display: none" id="divCodigoBus">
                                        <span class="input-group-addon" style="background-color: white; border-color: orange">
                                            <span class="icon"><i class="fa fa-barcode"></i></span>
                                        </span>
                                        <input type="text" class="form-control input-sm" id="txtCodigoBuscador" style="width: 70%" name="txtCodigo" placeholder="Ingresa Codigo de Barras" />
                                    </div>
                                    <div class="input-group input-group-icon" style="display: none" id="divProductoBus">
                                        <span class="input-group-addon" style="background-color: white; border-color: orange">
                                            <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                        </span>
                                        <input type="text" class="form-control input-sm" id="txtProductoBuscador" style="width: 300px" name="Producto" placeholder="Ingresa Nombre del Producto" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <form class="form-horizontal" role="form" id="formExistencia" style="display: none">
                                <div class="form-group">
                                    <label for="txtCodigoExis" class="col-lg-1 control-label" style="font-size: smaller">Codigo de Barras:</label>
                                    <div class="col-lg-6">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-barcode"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCodigoExis" name="txtCodigoExis" placeholder="Ingresa Codigo de Barras" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtProductoExis" class="col-lg-1 control-label" style="font-size: smaller">Producto:</label>
                                    <div class="col-lg-7">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtProductoExis" name="txtProductoExis" placeholder="Ingresa Nombre del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtSustanciaExis" class="col-lg-1 control-label" style="font-size: smaller">Sustancia:</label>
                                    <div class="col-lg-5">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-flask"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtSustanciaExis" name="txtSustanciaExis" placeholder="Ingresa Nombre de la Sustancia" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategoriaExis" class="col-lg-1 control-label" style="font-size: smaller">Categoria:</label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-sitemap"></i></span>
                                            </span>
                                            <select id="ddlCategoriaExis" class="form-control input-sm">
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlTipoExis" class="col-lg-1 control-label" style="font-size: smaller">Tipo:</label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-cubes"></i></span>
                                            </span>
                                            <select id="ddlTipoExis" class="form-control input-sm">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCantidadExis" class="col-lg-1 control-label" style="font-size: smaller">Cantidad:</label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-tint"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCantidadExis" name="txtCantidadExis" placeholder="Ingrese Cantidad del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtExistenciaExis" class="col-lg-1 control-label" style="font-size: smaller">Existencia:</label>
                                    <div class="col-lg-3">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-list"></i></span>
                                            </span>
                                            <input type="number" min="0" max="100" class="form-control input-sm" id="txtExistenciaExis" name="txtExistenciaExis" />
                                        </div>
                                    </div>
                                    <label for="txtAgregarPiezasExis" class="col-lg-1 control-label" style="font-size: smaller">Agregar Piezas:</label>
                                    <div class="col-lg-3">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-list"></i></span>
                                            </span>
                                            <input type="number" min="0" max="100" class="form-control input-sm" id="txtAgregarPiezasExis" name="txtAgregarPiezasExis" />
                                        </div>
                                    </div>
                                    <label for="txtQuitarPiezasExis" class="col-lg-1 control-label" style="font-size: smaller">Quitar Piezas:</label>
                                    <div class="col-lg-3">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-list"></i></span>
                                            </span>
                                            <input type="number" min="0" max="100" class="form-control input-sm" id="txtQuitarPiezasExis" name="txtQuitarPiezasExis" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCostoExis" class="col-lg-1 control-label" style="font-size: smaller">Costo:</label>
                                    <div class="col-lg-3">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-usd"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCostoExis" name="txtCostoExis" placeholder="" />
                                        </div>
                                    </div>

                                    <label for="txtCostoNuevoExis" class="col-lg-1 control-label" style="font-size: smaller">Costo Nuevo:</label>
                                    <div class="col-lg-3">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-usd"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCostoNuevoExis" name="txtCostoNuevoExis" placeholder="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3">
                                        <label id="btnActualizarExis" class="btn btn-warning">Actualizar Producto</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <label id="btnCancelarExis" class="btn btn-primary">Cancelar</label>
                                    </div>
                                </div>
                            </form>
                        </section>

                        <section id="content4">
                            <form class="form-horizontal" role="form" id="formReportes">
                                <br />
                                <h4 style="font-weight: bold">Generar reporte por Existencia.
                                </h4>
                                <hr />
                                <h5>Si quiere consultar que productos tienen de cierto número de existencias hacia abajo, seleccione el número deseado.</h5>
                                <div class="form-group">
                                    <label for="txtExistenciaExis" class="col-lg-1 control-label" style="font-size: smaller"></label>
                                    <div class="col-lg-2">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-list"></i></span>
                                            </span>
                                            <input type="number" min="0" max="100" class="form-control input-sm" id="txtPiezasRepor" name="txtPiezasRepor" />
                                        </div>
                                        <div class="col-md-12" style="display: none">
                                            <div id="TablaProdExis" class="table table-responsive" style="text-align: -webkit-center; height: 400px; margin-bottom: 0px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <button type="button" id="btnExistencias" class="btn btn-warning">Generar</button>
                                    </div>
                                </div>
                                <hr />

                                <br />
                                <h4 style="font-weight: bold">Generar reporte de ventas por Dia.
                                </h4>
                                <hr />
                                <h5>Si quiere consultar el reporte de ventas de un día diferente, seleccione la fecha deseada en el calendario.</h5>
                                <div class="form-group">
                                    <label for="txtFechaRepor" class="col-lg-1 control-label" style="font-size: smaller"></label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-calendar"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtFechaRepor" name="txtFechaRepor" />
                                        </div>
                                        <div class="col-md-12" style="display: none">
                                            <div id="TablaVenDias" class="table table-responsive" style="text-align: -webkit-center; height: 400px; margin-bottom: 0px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <button type="button" id="btnVentasDia" class="btn btn-warning">Generar</button>
                                    </div>
                                </div>
                                <hr />
                            </form>
                        </section>
                      </main>
                    </div>
                    <div class="panel-footer" style="text-align: center;">
                        <div class="row">
                            <div class="col-md-12" style="text-align: center;">
                                <label id="RomaSystems" style="font-size: x-small; color: darkgray"><a href="#">&copy; ROMA SYSTEMS.</a></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="jquery-validate/jquery-validate.js"></script>
    <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <link href="jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet" />
    <script src="js/base64.js"></script>
    <script src="build/jquery.datetimepicker.full.min.js"></script>
    <script>
        $(document).ready(function () {
            //Variables Globales
            var lista;
            var today = new Date(); // Fecha Actual

            var dd = today.getDate();
            var mm = today.getMonth() + 1
            var yy = today.getFullYear();

            if ($('#txtFechaRepor').val() == '')
                $('#txtFechaRepor').val(yy + '/' + mm + '/' + dd);
            //------------------------------------------- A L T A   D E   P R O D U C T O S ---------------------------------------
            //Llena ddlCategoria
            var categoria;
            $.ajax({
                type: "POST",
                url: "tabsAdmin.aspx/GetCategoria",
                //data: misDatos,
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    categoria = $.parseJSON(msg.d);
                    $('#ddlCategoria').empty();
                    $('#ddlCategoria').append($('<option>', { value: '', text: '[Seleccione]' }));
                    $(categoria).each(function () {
                        $('#ddlCategoria').append($('<option>', { value: this.Id_Categoria, text: this.Nombre_Categoria }));

                    });
                },
                error: function (msg) {
                    alert('Error al cargar las Categorias' + msg.responseText);
                }
            });
            //Llena ddlTipo
            var tipo;
            $.ajax({
                type: "POST",
                url: "tabsAdmin.aspx/GetTipo",
                //data: misDatos,
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    tipo = $.parseJSON(msg.d);
                    $('#ddlTipo').empty();
                    $('#ddlTipo').append($('<option>', { value: '', text: '[Seleccione]' }));
                    $(tipo).each(function () {
                        $('#ddlTipo').append($('<option>', { value: this.Id_Tipo, text: this.Nombre_Tipo }));

                    });
                },
                error: function (msg) {
                    alert('Error al cargar las Categorias' + msg.responseText);
                }
            });
            //Funcion para Guardar Producto
            function AgregaProducto() {
                var codigo = $('#txtCodigo').val() == '' ? 'S/C' : $('#txtCodigo').val();
                var prod = $('#txtProducto').val();
                var sust = $('#txtSustancia').val();
                var cat = $('#ddlCategoria').val();
                var tipo = $('#ddlTipo').val();
                var cant = $('#txtCantidad').val();
                var exis = $('#txtExistencia').val();
                var costo = $('#txtCosto').val();
                var misDatos = '{}';

                if (prod == '' || sust == '' || cat == '' || tipo == '' || cant == '' || exis == '' || costo == '')
                    alert("Debe llenar todos los campos.");
                else {
                    misDatos = '{"prod":"' + prod + '","sust":"' + sust + '","cat":"' + cat + '","tipo":"' + tipo + '","cant":"' + cant + '","exis":"' + exis + '","costo":"' + costo + '","codigo":"' + codigo + '"}';
                    $.ajax({
                        type: "POST",
                        url: "tabsAdmin.aspx/AgregaProducto",
                        data: misDatos,
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#txtCodigo').val('');
                            $('#txtProducto').val('');
                            $('#txtSustancia').val('');
                            $('#ddlCategoria').val('');
                            $('#ddlTipo').val('');
                            $('#txtCantidad').val('');
                            $('#txtExistencia').val('');
                            $('#txtCosto').val('');
                        },
                        error: function (msg) {
                            alert('Error' + msg.responseText);
                        }

                    }); //fin de ajax
                    alert('Producto Agregado con Exito.');
                }
            }
            //Boton de Guardado de Producto
            $('#btnGuardarProducto').on("click", function () {
                AgregaProducto();
            });

            //Evento Click del Boton Limpiar Campos Nuevo Producto
            $('#btnCancelarProducto').on("click", function () {
                $('#txtCodigo').val('');
                $('#txtProducto').val('');
                $('#txtSustancia').val('');
                $('#ddlCategoria').val('');
                $('#ddlTipo').val('');
                $('#txtCantidad').val('');
                $('#txtExistencia').val('');
                $('#txtCosto').val('');
            });
            // ---------------------------------T E R M I N A   A L T A   D E  P R O D U C T O --------------------------------------------
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // ----------------------------------------A L T A   D E   U S U A R I O -----------------------------------------------------
            //Funcion para Agregar Usuario
            function AgregaUsuario() {

                //nombre,paterno,materno,direccion,tel,cel,usua,pass,pregunta
                var nombre = $('#txtNombre').val();
                var paterno = $('#txtApaterno').val();
                var materno = $('#txtAmaterno').val();
                var direccion = $('#txtDireccion').val();
                var tel = $('#txtTelefono').val();
                var cel = $('#txtCelular').val();
                var usua = $('#txtUsuario').val();
                var pass = $('#txtContraseña').val();
                var pregunta = $('#txtPreguntaSecreta').val();
                var misDatos = '{}';

                if (nombre == '' || paterno == '' || materno == '' || direccion == '' || tel == '' || cel == '' || usua == '' || pass == '' || pregunta == '')
                    alert("Debe llenar todos los campos.");
                else {
                    misDatos = '{"nombre":"' + nombre + '","paterno":"' + paterno + '","materno":"' + materno + '","direccion":"' + direccion + '","tel":"' + tel + '","cel":"' + cel + '","usua":"' + usua + '","pass":"' + pass + '","pregunta":"' + pregunta + '"}';
                    $.ajax({
                        type: "POST",
                        url: "tabsAdmin.aspx/AgregaUsuario",
                        data: misDatos,
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#txtNombre').val('');
                            $('#txtApaterno').val('');
                            $('#txtAmaterno').val('');
                            $('#txtDireccion').val('');
                            $('#txtTelefono').val('');
                            $('#txtCelular').val('');
                            $('#txtUsuario').val('');
                            $('#txtContraseña').val('');
                            $('#txtPreguntaSecreta').val('');
                        },
                        error: function (msg) {
                            alert('Error' + msg.responseText);
                        }

                    }); //fin de ajax
                    alert('Usuario Agregado con Exito');
                }
            }
            //Boton de Guardado de Usuario
            $('#btnGuardarUsuario').on("click", function () {
                AgregaUsuario();
            });

            //Evento Click del Boton Limpiar Campos Nuevo Usuario
            $('#btnCancelarUsuario').on("click", function () {
                $('#txtNombre').val('');
                $('#txtApaterno').val('');
                $('#txtAmaterno').val('');
                $('#txtDireccion').val('');
                $('#txtTelefono').val('');
                $('#txtCelular').val('');
                $('#txtUsuario').val('');
                $('#txtContraseña').val('');
                $('#txtPreguntaSecreta').val('');
            });
            // ----------------------------------------T E R M I N A   A L T A  D E   U S U A R I O-----------------------------------
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // -----------------------------------------------E X I S T E N C I A S --------------------------------------------------
            var productoIDcodigo = '';
            var productoIDautocomplete = '';
            //Funcion que se carga primero para obtener todos los productos...
            (function JsonProductos() {
                $.ajax({
                    type: "POST",
                    url: "tabsAdmin.aspx/BusquedaProductos",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        lista = $.parseJSON(msg.d);
                        return lista
                    },
                    error: function (msg) {
                        alert('Error al obtener todos los Productos' + msg.responseText);
                    }
                });
            })();
            //Funcion para el Buscador --Autocomplete--
            $(function () {
                var arrLinks = lista;
                $("input[name=Producto]").autocomplete({
                    source: arrLinks,
                    minLength: 3
                }).data("ui-autocomplete")._renderItem = function (ul, item) {
                    $("<li>").data("ui-autocomplete-item", item).append("<a>" + item.label + "</a>").appendTo(ul);
                    return $("<li>");
                };
            });

            //Evento Select del Buscador
            $("#txtProductoBuscador").autocomplete({
                select: function (event, ui) {

                    $('#divBuscador').hide("fast");
                    $('#pBuscador').hide();
                    $('#formExistencia').show("fast");
                    productoIDautocomplete = ui.item.Id_Producto;
                    var codigo = ui.item.CodigoBarras
                    var producto = ui.item.label;
                    var sustancia = ui.item.Sustancia;
                    var categoria = ui.item.IdCategoria;
                    var tipo = ui.item.IdTipo;
                    var cantidad = ui.item.Cantidad
                    var existencia = ui.item.Existencia;
                    var costo = ui.item.Costo;

                    $('#txtCodigoExis').val(codigo);
                    $('#txtProductoExis').val(producto);
                    $('#txtSustanciaExis').val(sustancia);
                    $('#ddlCategoriaExis').val(categoria);
                    $('#ddlTipoExis').val(tipo);
                    $('#txtCantidadExis').val(cantidad);
                    $('#txtExistenciaExis').val(existencia);
                    $('#txtCostoExis').val(costo);
                }
            });
            //codigo para buscar por codigo de barras
            $('#txtCodigoBuscador').change(function () {
                var codigo1 = '';
                codigo1 = $('#txtCodigoBuscador').val();
                $(lista).each(function () {
                    if (this.CodigoBarras == codigo1) {
                        $('#divBuscador').hide("fast");
                        $('#formExistencia').show("fast");
                        $('#pBuscador').hide();

                        productoIDcodigo = this.Id_Producto;
                        var codigo = this.CodigoBarras;
                        var producto = this.label;
                        var sustancia = this.Sustancia;
                        var categoria = this.IdCategoria;
                        var tipo = this.IdTipo;
                        var cantidad = this.Cantidad;
                        var existencia = this.Existencia;
                        var costo = this.Costo;

                        $('#txtCodigoExis').val(codigo);
                        $('#txtProductoExis').val(producto);
                        $('#txtSustanciaExis').val(sustancia);
                        $('#ddlCategoriaExis').val(categoria);
                        $('#ddlTipoExis').val(tipo);
                        $('#txtCantidadExis').val(cantidad);
                        $('#txtExistenciaExis').val(existencia);
                        $('#txtCostoExis').val(costo);
                    }
                });

            });
            //buscador por codigo de barras
            $('#lnkCodigoExis').on("click", function () {
                $('#divBuscador').show();
                $('#divCodigoBus').show();
                $('#divProductoBus').hide();
                $('#txtCodigoBuscador').focus();
            });
            //buscador por producto
            $('#lnkProductoExis').on("click", function () {
                $('#divBuscador').show();
                $('#divCodigoBus').hide();
                $('#divProductoBus').show();
            });

            //evento click del cancelar
            $('#btnCancelarExis').on("click", function () {
                $('#txtCodigoExis').val('');
                $('#txtProductoExis').val('');
                $('#txtSustanciaExis').val('');
                $('#ddlCategoriaExis').val('');
                $('#ddlTipoExis').val('');
                $('#txtCantidadExis').val('');
                $('#txtExistenciaExis').val('');
                $('#txtCostoExis').val('');
                $('#txtAgregarPiezasExis').val('');
                $('#txtQuitarPiezasExis').val('');
                $('#txtCostoNuevoExis').val('');

                $('#formExistencia').hide();
                $('#pBuscador').show();
                $('#txtProductoBuscador').val('');
                $('#txtCodigoBuscador').val('');
            });

            //var options = {
            //    data: BusquedaProducto(),
            //};
            //$('#txtProductoBuscador').easyAutocomplete(valor);

            //var valor;

            //Llena ddlCategoria
            var categoriaExis;
            $.ajax({
                type: "POST",
                url: "tabsAdmin.aspx/GetCategoria",
                //data: misDatos,
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    categoriaExis = $.parseJSON(msg.d);
                    $('#ddlCategoriaExis').empty();
                    $('#ddlCategoriaExis').append($('<option>', { value: '', text: '[Seleccione]' }));
                    $(categoriaExis).each(function () {
                        $('#ddlCategoriaExis').append($('<option>', { value: this.Id_Categoria, text: this.Nombre_Categoria }));

                    });
                },
                error: function (msg) {
                    alert('Error al cargar las Categorias' + msg.responseText);
                }
            });


            //});

            //Llena ddlTipo
            var tipoExis;
            $.ajax({
                type: "POST",
                url: "tabsAdmin.aspx/GetTipo",
                //data: misDatos,
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    tipoExis = $.parseJSON(msg.d);
                    $('#ddlTipoExis').empty();
                    $('#ddlTipoExis').append($('<option>', { value: '', text: '[Seleccione]' }));
                    $(tipoExis).each(function () {
                        $('#ddlTipoExis').append($('<option>', { value: this.Id_Tipo, text: this.Nombre_Tipo }));

                    });
                },
                error: function (msg) {
                    alert('Error al cargar las Categorias' + msg.responseText);
                }
            });
            //Funcion para Agregar Usuario
            function ActualizaProductoPiezasCosto() {

                var codigo = $('#txtCodigoExis').val() == '' ? 'S/C' : $('#txtCodigoExis').val();
                var producto = $('#txtProductoExis').val();
                var sustancia = $('#txtSustanciaExis').val();
                var categoria = $('#ddlCategoriaExis').val();
                var tipo = $('#ddlTipoExis').val();
                var cantidad = $('#txtCantidadExis').val();
                var existencias = $('#txtExistenciaExis').val();
                var costoInicial = $('#txtCostoExis').val();
                var piezasAgregar = $('#txtAgregarPiezasExis').val();
                var piezasDescontar = $('#txtQuitarPiezasExis').val();
                var costoNuevo = $('#txtCostoNuevoExis').val();
                var costo;
                var existencia;
                var productoID;

                if (producto == '' || sustancia == '' || categoria == '' || tipo == '' || cantidad == '' || existencias == '' || costoInicial == '')
                    alert("Debe llenar todos los campos.");
                else {

                    if (piezasAgregar != '' && piezasAgregar != '0') {
                        existencia = parseInt(existencias) + parseInt(piezasAgregar);
                    }
                    else if (piezasDescontar != '' && piezasDescontar != '0') {
                        existencia = parseInt(existencias) - parseInt(piezasDescontar);
                    }
                    else {
                        existencia = existencias
                    }

                    if (costoNuevo != '') {
                        costo = costoNuevo;
                    }
                    else {
                        costo = costoInicial;
                    }
                    if (productoIDautocomplete != '') {
                        productoID = productoIDautocomplete
                    }
                    else if (productoIDcodigo != '') {
                        productoID = productoIDcodigo
                    }

                    var misDatos = '{}';
                    misDatos = '{"producto":"' + producto + '","sustancia":"' + sustancia + '","categoria":"' + categoria + '","tipo":"' + tipo + '","cantidad":"' + cantidad + '","existencia":"' + existencia + '","costo":"' + costo + '","codigo":"' + codigo + '","productoID":"' + productoID + '"}';
                    $.ajax({
                        type: "POST",
                        url: "tabsAdmin.aspx/ActualizarProducto",
                        data: misDatos,
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {

                            alert('Se actualizo con exito el producto');

                            $('#txtCodigoExis').val('');
                            $('#txtProductoExis').val('');
                            $('#txtSustanciaExis').val('');
                            $('#ddlCategoriaExis').val('');
                            $('#ddlTipoExis').val('');
                            $('#txtCantidadExis').val('');
                            $('#txtExistenciaExis').val('');
                            $('#txtCostoExis').val('');
                            $('#txtAgregarPiezasExis').val('');
                            $('#txtQuitarPiezasExis').val('');
                            $('#txtCostoNuevoExis').val('');

                            $('#formExistencia').hide();
                            $('#pBuscador').show();
                            $('#txtProductoBuscador').val('');
                            $('#txtCodigoBuscador').val('');
                        },
                        error: function (msg) {
                            alert('Error' + msg.responseText);
                        }

                    }); //fin de ajax
                }
            }
            $('#btnActualizarExis').on("click", function () {
                ActualizaProductoPiezasCosto();
                window.location = 'tabsAdmin.aspx';
            });
            $('#txtAgregarPiezasExis').change(function () {
                var agregarP = $('#txtAgregarPiezasExis').val();
                if (agregarP == '') {
                    $('#txtQuitarPiezasExis').attr("disabled", false);
                }
                else if (agregarP == 0) {
                    $('#txtQuitarPiezasExis').attr("disabled", false);
                }
                else {
                    $('#txtQuitarPiezasExis').attr("disabled", true);
                }
            });
            $('#txtQuitarPiezasExis').change(function () {
                var quitarP = $('#txtQuitarPiezasExis').val();
                if (quitarP == '') {
                    $('#txtAgregarPiezasExis').attr("disabled", false);
                }
                else if (quitarP == 0) {
                    $('#txtAgregarPiezasExis').attr("disabled", false);
                }
                else {
                    $('#txtAgregarPiezasExis').attr("disabled", true);
                }
            });
            // --------------------------------------------T E R M I N A   E X I S T E N C I A S -------------------------------------------------
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // -----------------------------------------------R E P O R T E S -------------------------------------------------------------------
            $('#txtFechaRepor').datetimepicker({
                timepicker: false,
                format: 'Y/m/d',
                formatDate: 'Y/m/d'
            });
            $.datetimepicker.setLocale('es');


            //$('#formAlta').submit(function (e) {
            //    e.preventDefault();
            //}).validate({
            //    debug: false,
            //    rules: {
            //        "txtCodigo": {
            //            required: true
            //        }
            //    },
            //    messages: {
            //        "txtCodigo": {
            //            required: "Introduce el Codigo de Barras"
            //        }
            //    }
            //});

            //Exceles

            $('#btnVentasDia').on("click", function () {
                var fecha = $('#txtFechaRepor').val();
                var misDatos = '{"fechaVentas":"' + fecha + '"}';
                $.ajax({
                    type: "POST",
                    url: "tabsAdmin.aspx/SelectVentasEmpleados",
                    data: misDatos,
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        list = $.parseJSON(msg.d);
                        if (list.length == 0)
                            alert('No hay ventas para el día seleccionado');
                        TablaVenDias = '';
                        TablaVenDias += '<table class="table table-responsive table-hover" border="1" id="body_gvQuejas" style="border-collapse:collapse;font-size: 0.7em; overflow-x: auto">'
                        TablaVenDias += '<tr style="background-color: #F2F7FA;"; text-align:center;">';
                        TablaVenDias += ' <td>[Cliente]</td>';
                        TablaVenDias += ' <td>[Fecha]</td>';
                        TablaVenDias += ' <td>[Usuario]</td>';
                        TablaVenDias += ' <td>[IdProducto]</td>';
                        TablaVenDias += ' <td>[Código Barras]</td>';
                        TablaVenDias += ' <td>[Nombre Producto]</td>';
                        TablaVenDias += ' <td>[Piezas Vendidas]</td>';
                        TablaVenDias += ' <td>[Costo Unitario]</td>';
                        TablaVenDias += ' <td>[Costo Total]</td>';
                        TablaVenDias += ' <td>[Gran TOTAL]</td>';
                        TablaVenDias += '</tr>';
                        $(list).each(function () {
                            TablaVenDias += '<tr style="text-align:center;">';
                            TablaVenDias += ' <td>' + this.NumCliente + '</td>';
                            TablaVenDias += ' <td>' + this.fAlta + '</td>';
                            TablaVenDias += ' <td>' + this.NombreUsuario + '</td>';
                            TablaVenDias += ' <td>' + this.ProductoId + '</td>';
                            TablaVenDias += ' <td>' + this.CodigoBarras + '</td>';
                            TablaVenDias += ' <td>' + this.NombreProducto + '</td>';
                            TablaVenDias += ' <td>' + this.PiezasVendidas; + '</td>';
                            TablaVenDias += ' <td>' + this.CostoUnitario + '</td>';
                            TablaVenDias += ' <td>' + this.CostoTotal + '</td>';
                            TablaVenDias += ' <td>' + this.CostoTotalVenta; + '</td>';
                            TablaVenDias += '</tr>';
                        });
                        TablaVenDias += '</table>';
                        $('#TablaVenDias').empty();
                        $('#TablaVenDias').append(TablaVenDias);
                    },
                    error: function (msg) {
                        alert('Error al generar el reporte de Ventas X Día' + msg.responseText);
                    }
                });//Fin .ajax()

                var dt = new Date();
                var day = dt.getDate();
                var month = dt.getMonth() + 1;
                var year = dt.getFullYear();
                var hour = dt.getHours();
                var mins = dt.getMinutes();
                var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
                //creating a temporary HTML link element (they support setting file names)
                var a = document.createElement('a');
                //getting data from our div that contains the HTML table
                var table = document.getElementById('TablaVenDias');
                var html = table.outerHTML;
                var data_type = 'data:application/vnd.ms-excel;base64,' + $.base64.encode(html);
                a.href = data_type;
                ////setting the file name
                a.download = 'Ventas del Día: ' + postfix + '.xls';
                ////triggering the function
                a.click();
                ////just in case, prevent default behaviour
                e.preventDefault();
            });


            $('#btnExistencias').on("click", function () {
                var piezas = $("#txtPiezasRepor").val() == '' ? "500" : $("#txtPiezasRepor").val();
                var misDatos = '{"piezas":"' + piezas + '"}';
                $.ajax({
                    type: "POST",
                    url: "tabsAdmin.aspx/SelectExistenciasProducto",
                    data: misDatos,
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        list = $.parseJSON(msg.d);
                        if (list.length == 0)
                            alert('No hay Productos con esas Existencias');
                        TablaProdExis = '';
                        TablaProdExis += '<table class="table table-responsive table-hover" border="1" id="body_gvQuejas" style="border-collapse:collapse;font-size: 0.7em; overflow-x: auto">'
                        TablaProdExis += '<tr style="background-color: #F2F7FA;"; text-align:center;">';
                        TablaProdExis += ' <td>[IdProducto]</td>';
                        TablaProdExis += ' <td>[Código Barras]</td>';
                        TablaProdExis += ' <td>[Producto]</td>';
                        TablaProdExis += ' <td>[Sustancia]</td>';
                        TablaProdExis += ' <td>[Costo]</td>';
                        TablaProdExis += ' <td>[Existencia]</td>';
                        TablaProdExis += '</tr>';
                        $(list).each(function () {
                            TablaProdExis += '<tr style="text-align:center;">';
                            TablaProdExis += ' <td>' + this.Id_Producto + '</td>';
                            TablaProdExis += ' <td>' + this.CodigoBarras + '</td>';
                            TablaProdExis += ' <td>' + this.Nombre_Producto + '</td>';
                            TablaProdExis += ' <td>' + this.Sustancia + '</td>';
                            TablaProdExis += ' <td>' + this.Costo + '</td>';
                            TablaProdExis += ' <td>' + this.Existencia + '</td>';
                            TablaProdExis += '</tr>';
                        });
                        TablaProdExis += '</table>';
                        $('#TablaProdExis').empty();
                        $('#TablaProdExis').append(TablaProdExis);
                    },
                    error: function (msg) {
                        alert('Error al generar el reporte para Pedido' + msg.responseText);
                    }
                });//Fin .ajax()

                var dt = new Date();
                var day = dt.getDate();
                var month = dt.getMonth() + 1;
                var year = dt.getFullYear();
                var hour = dt.getHours();
                var mins = dt.getMinutes();
                var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
                //creating a temporary HTML link element (they support setting file names)
                var a = document.createElement('a');
                //getting data from our div that contains the HTML table
                var table = document.getElementById('TablaProdExis');
                var html = table.outerHTML;
                var data_type = 'data:application/vnd.ms-excel;base64,' + $.base64.encode(html);
                a.href = data_type;
                ////setting the file name
                a.download = 'ExistenciaProductos: ' + postfix + '.xls';
                ////triggering the function
                a.click();
                ////just in case, prevent default behaviour
                e.preventDefault();
            });

            // --------------------------------------------T E R M I N A   R E P O R T E S -------------------------------------------------

            //Evento Click del Boton Salir
            $('#btnSalir').on("click", function () {
                if (confirm("¿Seguro de Salir del Modulo de Administración?")) {
                    window.location = 'Default.aspx';
                }
            });


        }); //fin del document ready
    </script>

</body>

</html>
