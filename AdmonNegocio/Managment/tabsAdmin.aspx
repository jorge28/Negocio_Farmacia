<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tabsAdmin.aspx.cs" Inherits="tabsAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Responsive CSS Tabs</title>
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />

    <script src="js/bootstrap.js"></script>
    <script src="tabs/tabs/js/prefixfree.min.js"></script>
    <link href="tabs/tabs/css/style.css" rel="stylesheet" />
    <link href="EasyAutocomplete/EasyAutocomplete/easy-autocomplete.min.css" rel="stylesheet" />
    <link href="EasyAutocomplete/EasyAutocomplete/easy-autocomplete.themes.min.css" rel="stylesheet" />
</head>
<body>

    <div class="container-fluid" style="padding-left: 15px; padding-right: 15px;">
        <div class="row " style="margin-top: 15px;">
            <div class="col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading" style="background-color: #FAFAFA; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">
                        <div class="row">
                            <div class="col-md-5" style="text-align: left;">
                                <asp:Label ID="lblEmpleado" runat="server" Style="font-size: large; color: darkblue;"></asp:Label>
                            </div>
                            <div class="col-md-5" style="text-align: left;">
                            </div>
                            <div class="col-md-2" style="text-align: right;">
                                <label id="btnSalir" class="btn btn-primary btn-sm">Salir</label>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body" style="height: 820px; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px;">
                        <%--                        <h1>Responsive CSS Tabs</h1>--%>
                         <main> 
                        <input id="tab1" type="radio" name="tabs" checked />
                        <label for="tab1">Alta de Producto</label>

                        <input id="tab2" type="radio" name="tabs" />
                        <label for="tab2">Alta de Usuario</label>

                        <input id="tab3" type="radio" name="tabs" />
                        <label for="tab3">Existencias</label>

                        <input id="tab4" type="radio" name="tabs" />
                        <label for="tab4">Reportes</label>

                        <section id="content1">
                            <br />
                            <br />
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="txtCodigo" class="col-lg-2 control-label" style="font-size: smaller">Codigo de Barras:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-barcode"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCodigo" style="width: 70%" name="txtCodigo" placeholder="Ingresa Codigo de Barras" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtProducto" class="col-lg-2 control-label" style="font-size: smaller">Producto:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtProducto" style="width: 60%" name="txtProducto" placeholder="Ingresa Nombre del Producto" />
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
                                            <select id="ddlCategoria" class="form-control input-sm" style="width: 60%">
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
                                            <select id="ddlTipo" class="form-control input-sm" style="width: 60%">
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
                                            <input type="text" class="form-control input-sm" id="txtExistencia" style="width: 60%" name="txtExistencia" placeholder="Ingrese No. de Existencias" />
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
                                            <input type="text" class="form-control input-sm" id="txtCosto" style="width: 60%" name="txtCosto" placeholder="Ingresa Costo del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3">
                                        <button id="btnGuardarProducto" class="btn btn-warning">Guardar Producto</button>
                                    </div>
                                    <div class="col-lg-3">
                                        <button id="btnCancelarProducto" class="btn btn-warning">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </section>

                        <section id="content2">
                            <br />
                            <br />
                            <form class="form-horizontal" role="form">
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
                                            <input type="text" class="form-control input-sm" id="txtTelefono" style="width: 60%" name="txtTelefono" placeholder="Ingresa el Telefono del Usuario" />
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
                                            <input type="text" class="form-control input-sm" id="txtCelular" style="width: 60%" name="txtCelular" placeholder="Ingresa el No. Celular del Usuario" />
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
                                    <label for="txtPreguntaSecreta" class="col-lg-2 control-label" style="font-size: smaller">Pregunta Secreta:</label>
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
                                        <button id="btnGuardarUsuario" class="btn btn-warning">Guardar Usuario</button>
                                    </div>
                                    <div class="col-lg-3">
                                        <button id="btnCancelarUsuario" class="btn btn-warning">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </section>

                        <section id="content3">
                            <br />
                            <br />
                            <p>
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
                                        <input type="text" class="form-control input-sm" id="txtProductoBuscador" style="width: 300px" name="txtCodigo" placeholder="Ingresa Nombre del Producto" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <form class="form-horizontal" role="form" id="formExistencia" style="display: none">
                                <div class="form-group">
                                    <label for="txtCodigoExis" class="col-lg-2 control-label" style="font-size: smaller">Codigo de Barras:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-barcode"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCodigoExis" style="width: 70%" name="txtCodigoExis" placeholder="Ingresa Codigo de Barras" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtProductoExis" class="col-lg-2 control-label" style="font-size: smaller">Producto:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtProductoExis" style="width: 60%" name="txtProductoExis" placeholder="Ingresa Nombre del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtSustanciaExis" class="col-lg-2 control-label" style="font-size: smaller">Sustancia:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-flask"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtSustanciaExis" style="width: 60%" name="txtSustanciaExis" placeholder="Ingresa Nombre de la Sustancia" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategoriaExis" class="col-lg-2 control-label" style="font-size: smaller">Categoria:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-sitemap"></i></span>
                                            </span>
                                            <select id="ddlCategoriaExis" class="form-control input-sm" style="width: 60%">
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlTipoExis" class="col-lg-2 control-label" style="font-size: smaller">Tipo:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-cubes"></i></span>
                                            </span>
                                            <select id="ddlTipoExis" class="form-control input-sm" style="width: 60%">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCantidadExis" class="col-lg-2 control-label" style="font-size: smaller">Cantidad:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-tint"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCantidadExis" style="width: 60%" name="txtCantidadExis" placeholder="Ingrese Cantidad del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtExistenciaExis" class="col-lg-2 control-label" style="font-size: smaller">Existencia:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-list"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtExistenciaExis" style="width: 60%" name="txtExistenciaExis" placeholder="Ingrese No. de Existencias" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCostoExis" class="col-lg-2 control-label" style="font-size: smaller">Costo:</label>
                                    <div class="col-lg-10">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon" style="background-color: white; border-color: orange">
                                                <span class="icon"><i class="fa fa-usd"></i></span>
                                            </span>
                                            <input type="text" class="form-control input-sm" id="txtCostoExis" style="width: 60%" name="txtCostoExis" placeholder="Ingresa Costo del Producto" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-3">
                                        <button id="btnActualizarExis" class="btn btn-warning">Actualizar Producto</button>
                                    </div>
                                    <div class="col-lg-3">
                                        <button id="btnCancelarExis" class="btn btn-warning">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </section>

                        <section id="content4">
                            <p>
                                Bacon ipsum dolor sit amet landjaeger sausage brisket, jerky drumstick fatback boudin ball tip turducken. Pork belly meatball t-bone bresaola tail filet mignon kevin turkey ribeye shank flank doner cow kielbasa shankle. Pig swine chicken hamburger, tenderloin turkey rump ball tip sirloin frankfurter meatloaf boudin brisket ham hock. Hamburger venison brisket tri-tip andouille pork belly ball tip short ribs biltong meatball chuck. Pork chop ribeye tail short ribs, beef hamburger meatball kielbasa rump corned beef porchetta landjaeger flank. Doner rump frankfurter meatball meatloaf, cow kevin pork pork loin venison fatback spare ribs salami beef ribs.
                            </p>
                            <p>
                                Jerky jowl pork chop tongue, kielbasa shank venison. Capicola shank pig ribeye leberkas filet mignon brisket beef kevin tenderloin porchetta. Capicola fatback venison shank kielbasa, drumstick ribeye landjaeger beef kevin tail meatball pastrami prosciutto pancetta. Tail kevin spare ribs ground round ham ham hock brisket shoulder. Corned beef tri-tip leberkas flank sausage ham hock filet mignon beef ribs pancetta turkey.
                            </p>
                        </section>

                        </main>
                    </div>
                    <div class="panel-footer" style="text-align: center;">
                        <div class="row" style="width: 97%;">
                            <div class="col-md-1">
                                <label id="RomaSystems" style="font-size: x-small; color: darkgray"><a href="#">&copy; ROMA SYSTEMS.</a></label>
                            </div>
                            <div class="col-md-2" style="text-align: left;">
                                <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>   
                                            <asp:Label ID="lblFecha" runat="server" Font-Size="Large" ForeColor="darkblue"></asp:Label>                
                                        </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                            </div>
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-5" style="text-align: right; padding-right: 0px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="EasyAutocomplete/EasyAutocomplete/jquery.easy-autocomplete.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#lnkCodigoExis').on("click", function () {
                $('#divBuscador').show();
                $('#divCodigoBus').show();
                $('#divProductoBus').hide();
            });
            $('#lnkProductoExis').on("click", function () {
                $('#divBuscador').show();
                $('#divCodigoBus').hide();
                $('#divProductoBus').show();
            });

            var options = {
                data: BusquedaProducto(),
            };
            $('#txtProductoBuscador').easyAutocomplete(valor);

            var valor;
            $.ajax({
                type: "POST",
                url: "tabsAdmin.aspx/BuscaProducto",
                //data: misDatos,
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    valor = $.parseJSON(msg.d);
                    $('#txtProductoBuscador').empty();
                    $(valor).each(function () {
                        $('#txtProductoBuscador').append($('<option>', { text: this.Producto }));

                    });
                },
                error: function (msg) {
                    alert('Error al cargar los Paises' + msg.responseText);
                }
            });

        });
    </script>
</body>

</html>
