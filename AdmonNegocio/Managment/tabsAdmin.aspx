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
<main>
  
  <input id="tab1" type="radio" name="tabs" checked/>
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
      <form class="form-horizontal" id="formAlta" autocomplete="off" method="post" action="javascript:void(0)">
          <div class="form-group">
              <label for="txtCodigo" class="col-lg-2 control-label" style="font-size:smaller;" >Codigo de Barras:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-barcode"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCodigo" style="width:70%" name="txtCodigo" autofocus="autofocus" placeholder="Ingresa Codigo de Barras" required="required" title="Ingresa Codigo de Barras"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtProducto" class="col-lg-2 control-label" style="font-size:smaller">Producto:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange;">
                          <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtProducto" style="width:60%" name="txtProducto" placeholder="Ingresa Nombre del Producto" required/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtSustancia" class="col-lg-2 control-label" style="font-size:smaller">Sustancia:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-flask"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtSustancia" style="width:60%" name="txtSustancia" placeholder="Ingresa Nombre de la Sustancia"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="ddlCategoria" class="col-lg-2 control-label" style="font-size:smaller">Categoria:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-sitemap"></i></span>
                      </span>
                      <select id="ddlCategoria" class="form-control input-sm" style="width:150px">
                     </select>
                   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="ddlTipo" class="col-lg-2 control-label" style="font-size:smaller">Tipo:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-cubes"></i></span>
                      </span>
                    <select id="ddlTipo" class="form-control input-sm" style="width:150px">
                     </select>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtCantidad" class="col-lg-2 control-label" style="font-size:smaller">Cantidad:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-tint"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCantidad" style="width:60%" name="txtCantidad" placeholder="Ingrese Cantidad del Producto"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtExistencia" class="col-lg-2 control-label" style="font-size:smaller">Existencia:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-list"></i></span>
                      </span>
                   <input type="number" class="form-control input-sm" id="txtExistencia" min="0" max="30" style="width:60px" name="txtExistencia"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtCosto" class="col-lg-2 control-label" style="font-size:smaller">Costo:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-usd"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCosto" style="width:60px" name="txtCosto" placeholder="Ingresa Costo del Producto"/>   
                  </div>
              </div>
          </div>
           <div class="form-group">
              <div class="col-lg-12">
                  <div class="alert alert-success" id="alertListoProd" style="display:none;"><strong>Felicidades:</strong>&nbsp El producto ha sido agregado</div>
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
                  <label id="btnCancelarProducto" class="btn btn-primary">Cancelar</label>
              </div>
          </div>
      </form>
  </section>
    
  <section id="content2">
      <br />
      <br />
      <form class="form-horizontal">
      <div class="form-group">
              <label for="txtNombre" class="col-lg-2 control-label" style="font-size:smaller">Nombre de Usuario:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-child"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtNombre" style="width:60%" name="txtNombre" placeholder="Ingresa Nombre de Usuario"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtApaterno" class="col-lg-2 control-label" style="font-size:smaller">Apellido Paterno:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-pinterest"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtApaterno" style="width:60%" name="txtApaterno" placeholder="Ingresa Apellido Paterno"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtAmaterno" class="col-lg-2 control-label" style="font-size:smaller">Apellido Materno:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-maxcdn"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtAmaterno" style="width:60%" name="txtAmaterno" placeholder="Ingresa Apellido Materno"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtDireccion" class="col-lg-2 control-label" style="font-size:smaller">Direccion:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-map-marker"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtDireccion" style="width:60%" name="txtDireccion" placeholder="Ingresa Direccion del Usuario"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtTelefono" class="col-lg-2 control-label" style="font-size:smaller">Telefono Casa:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-phone-square"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtTelefono" style="width:60%" name="txtTelefono" placeholder="Ingresa el Telefono del Usuario"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtCelular" class="col-lg-2 control-label" style="font-size:smaller">Telefono Celular:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-mobile"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCelular" style="width:60%" name="txtCelular" placeholder="Ingresa el No. Celular del Usuario"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtUsuario" class="col-lg-2 control-label" style="font-size:smaller">Usuario:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-user"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtUsuario" style="width:60%" name="txtUsuario" placeholder="Ingresa un Usuario"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtContraseña" class="col-lg-2 control-label" style="font-size:smaller">Contraseña:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-unlock"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtContraseña" style="width:60%" name="txtContraseña" placeholder="Ingresa una Contraseña"/>   
                  </div>
              </div>
          </div>
      <div class="form-group">
              <label for="txtPreguntaSecreta" class="col-lg-2 control-label" style="font-size:smaller">Pregunta Secreta:</label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-puzzle-piece"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtPreguntaSecreta" style="width:60%" name="txtPreguntaSecreta" placeholder="Ingresa una Pregunta Secreta"/>   
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
                  <label id="btnCancelarUsuario" class="btn btn-primary">Cancelar</label>
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
      <div class="form-group" id="divBuscador" style="display:none">
              <label for="txtPreguntaSecreta" class="col-lg-2 control-label" style="font-size:smaller"></label>
              <div class="col-lg-10">
                  <div class="input-group input-group-icon" style="display:none" id="divCodigoBus">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-barcode"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCodigoBuscador" style="width:70%" name="txtCodigo" placeholder="Ingresa Codigo de Barras"/>   
                  </div>
                  <div class="input-group input-group-icon" style="display:none" id="divProductoBus">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtProductoBuscador" style="width:300px" name="Producto" placeholder="Ingresa Nombre del Producto"/>   
                  </div>
              </div>
          </div>
      <br />
      <form class="form-horizontal" role="form" id="formExistencia" style="display:none">
          <div class="form-group">
              <label for="txtCodigoExis" class="col-lg-1 control-label" style="font-size:smaller">Codigo de Barras:</label>
              <div class="col-lg-6">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-barcode"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCodigoExis"  name="txtCodigoExis" placeholder="Ingresa Codigo de Barras"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtProductoExis" class="col-lg-1 control-label" style="font-size:smaller">Producto:</label>
              <div class="col-lg-7">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtProductoExis" name="txtProductoExis" placeholder="Ingresa Nombre del Producto"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtSustanciaExis" class="col-lg-1 control-label" style="font-size:smaller">Sustancia:</label>
              <div class="col-lg-5">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-flask"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtSustanciaExis" name="txtSustanciaExis" placeholder="Ingresa Nombre de la Sustancia"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="ddlCategoriaExis" class="col-lg-1 control-label" style="font-size:smaller">Categoria:</label>
              <div class="col-lg-4">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-sitemap"></i></span>
                      </span>
                      <select id="ddlCategoriaExis" class="form-control input-sm">
                     </select>
                   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="ddlTipoExis" class="col-lg-1 control-label" style="font-size:smaller">Tipo:</label>
              <div class="col-lg-4">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-cubes"></i></span>
                      </span>
                    <select id="ddlTipoExis" class="form-control input-sm">
                     </select>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtCantidadExis" class="col-lg-1 control-label" style="font-size:smaller">Cantidad:</label>
              <div class="col-lg-4">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-tint"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCantidadExis" name="txtCantidadExis" placeholder="Ingrese Cantidad del Producto"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtExistenciaExis" class="col-lg-1 control-label" style="font-size:smaller">Existencia:</label>
              <div class="col-lg-3">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-list"></i></span>
                      </span>
                   <input type="number" min="0" max="100" class="form-control input-sm" id="txtExistenciaExis" name="txtExistenciaExis"/>   
                  </div>
              </div>
              <label for="txtAgregarPiezasExis" class="col-lg-1 control-label" style="font-size:smaller">Agregar Piezas:</label>
              <div class="col-lg-3">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-list"></i></span>
                      </span>
                   <input type="number" min="1" max="100" class="form-control input-sm" id="txtAgregarPiezasExis" name="txtAgregarPiezasExis" />   
                  </div>
              </div>
              <label for="txtQuitarPiezasExis" class="col-lg-1 control-label" style="font-size:smaller">Quitar Piezas:</label>
              <div class="col-lg-3">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-list"></i></span>
                      </span>
                   <input type="number" min="1" max="100" class="form-control input-sm" id="txtQuitarPiezasExis" name="txtQuitarPiezasExis"/>   
                  </div>
              </div>
          </div>
          <div class="form-group">
              <label for="txtCostoExis" class="col-lg-1 control-label" style="font-size:smaller">Costo:</label>
              <div class="col-lg-3">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-usd"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCostoExis" name="txtCostoExis" placeholder=""/>
                  </div>
              </div>
              
              <label for="txtCostoNuevoExis" class="col-lg-1 control-label" style="font-size:smaller">Costo Nuevo:</label>
              <div class="col-lg-3">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-usd"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtCostoNuevoExis" name="txtCostoNuevoExis" placeholder=""/> 
                  </div>
              </div>
              <div class="col-lg-4"></div>
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
    <form class="form-horizontal" role="form" id="formReportes">
        <br />
       <h4 style="font-weight:bold">
          Generar reporte por Existencia.
      </h4>
        <hr />
        <div class="form-group">
              <label for="txtExistenciaExis" class="col-lg-1 control-label" style="font-size:smaller"></label>
              <div class="col-lg-2">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-list"></i></span>
                      </span>
                   <input type="number" min="0" max="100" class="form-control input-sm" id="txtPiezasRepor" name="txtPiezasRepor"/>   
                  </div>
              </div>
              <div class="col-lg-3">
                   <label id="GeneraReportexPiezas" class="btn btn-warning">Generar</label>  
              </div>
        </div>
        <hr />

        <br />
        <h4 style="font-weight:bold">
          Generar reporte de ventas por Dia.
      </h4>
        <hr />
        <div class="form-group">
              <label for="txtFechaRepor" class="col-lg-1 control-label" style="font-size:smaller"></label>
              <div class="col-lg-4">
                  <div class="input-group input-group-icon">
                      <span class="input-group-addon" style="background-color:white;border-color:orange">
                          <span class="icon"><i class="fa fa-calendar"></i></span>
                      </span>
                   <input type="text" class="form-control input-sm" id="txtFechaRepor" name="txtFechaRepor"/>   
                  </div>
              </div>
              <div class="col-lg-3">
                   <label id="btnGeneraxDiaVentas" class="btn btn-warning">Generar</label>  
              </div>
        </div>
        <hr />
    </form>
  </section>
    
</main>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="jquery-validate/jquery-validate.js"></script>
    <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <link href="jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet" />

    <script src="build/jquery.datetimepicker.full.min.js"></script>
    <script>
        $(document).ready(function () {
            //Variables Globales
            var lista;
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
                var codigo = $('#txtCodigo').val();
                var prod = $('#txtProducto').val();
                var sust = $('#txtSustancia').val();
                var cat = $('#ddlCategoria').val();
                var tipo = $('#ddlTipo').val();
                var cant = $('#txtCantidad').val();
                var exis = $('#txtExistencia').val();
                var costo = $('#txtCosto').val();
                var misDatos = '{}';
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
            }
            //Boton de Guardado de Producto
            $('#btnGuardarProducto').on("click", function () {
                AgregaProducto();
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
            }
            //Boton de Guardado de Usuario
            $('#btnGuardarUsuario').on("click", function () {
                AgregaUsuario();
            });
            // ----------------------------------------T E R M I N A   A L T A  D E   U S U A R I O-----------------------------------
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // -----------------------------------------------E X I S T E N C I A S --------------------------------------------------

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
                    $('#formExistencia').show("fast");
                    var productoID = ui.item.Id_Producto;
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
                codigo = $('#txtCodigoBuscador').val();
                $(lista).each(function () {
                    if (this.CodigoBarras == codigo) {
                        $('#divBuscador').hide("fast");
                        $('#formExistencia').show("fast");

                        var codigoBarras = this.CodigoBarras;
                        var prod = this.label;
                        var sust = this.Sustancia;
                        var cat = this.IdCategoria;
                        var tipo = this.IdTipo;
                        var cant = this.Cantidad;
                        var exis = this.Existencia;
                        var costo = this.Costo;

                        $('#txtCodigoExis').val(codigoBarras);
                        $('#txtProductoExis').val(prod);
                        $('#txtSustanciaExis').val(sust);
                        $('#ddlCategoriaExis').val(cat);
                        $('#ddlTipoExis').val(tipo);
                        $('#txtCantidadExis').val(cant);
                        $('#txtExistenciaExis').val(exis);
                        $('#txtCostoExis').val(costo);
                    }
                });
                
            });
            //buscador por codigo de barras
            $('#lnkCodigoExis').on("click", function () {
                $('#divBuscador').show();
                $('#divCodigoBus').show();
                $('#divProductoBus').hide();
            });
            //buscador por producto
            $('#lnkProductoExis').on("click", function () {
                $('#divBuscador').show();
                $('#divCodigoBus').hide();
                $('#divProductoBus').show();
            });
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
            

        }); //fin del document ready
    </script>

</body>
    
</html>
