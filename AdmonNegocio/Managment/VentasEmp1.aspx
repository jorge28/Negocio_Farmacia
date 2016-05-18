<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp1.aspx.cs" Inherits="VentasEmp1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ventas</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Control de inventarios e interfaces para ventas." />
    <meta name="author" content="Jorge Romero Olguin" />
    <meta name="keywords" content="" />
    <%--<meta http-equiv="Cache-control" content="no-cache" />--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="tabs/tabs/css/style.css" rel="stylesheet" />--%>
    <script src="tabs/tabs/js/prefixfree.min.js"></script>
    <%--<script src="js/bootstrap.min.js"></script>--%>
</head>
<body style="background-color: #EDEDF2;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid" style="padding-left: 15px; padding-right: 15px;">
            <div class="row " style="margin-top: 15px;">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading" style="background-color: #FAFAFA; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">
                            <div class="row">
                                <div class="col-md-5" style="text-align: left;">
                                    <asp:Label ID="lblEmpleado" runat="server" Style="font-size: large; color: darkblue;"></asp:Label>
                                </div>

                                <div class="col-md-4" style="text-align: left;">
                                    <asp:Label ID="lblCliente" runat="server" Style="font-size: large; color: darkblue; padding-right: 0px; width: 100px;" class="col-md-4">Cliente N°</asp:Label>
                                    <asp:Label ID="lblNumCliente" runat="server" Style="font-size: large; color: darkblue; padding-left: 2px;" class="col-md-4"></asp:Label>
                                </div>
                                <div class="col-md-3" style="text-align: right;">
                                    <input type="text" id="txtCodigoBarras" class="form-control input-sm col-md-1" style="width: 50%; background-color: #FAFAFA; border-color: #FAFAFA;" placeholder="Código Barras" />&nbsp;
                                    <label id="btnSalir" class="btn btn-primary btn-sm">Salir</label>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body" style="height: 520px; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px;">
                            <section class="form-group-horizontal">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="glyphicon glyphicon-search" aria-hidden="true"></i></span>
                                            </span>
                                            <input type="text" name="Producto" id="txtBuscador" class="form-control input-sm" placeholder="Buscador" style="background-color: #fffbd4" />
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="glyphicon glyphicon-tint" aria-hidden="true"></i></span>
                                            </span>
                                            <input type="text" id="txtSustancia" class="form-control input-sm" placeholder="Sustancia" disabled="disabled" style="background-color: white;" />
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="input-group input-group-icon" style="width: 90px;">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="glyphicon glyphicon-equalizer" aria-hidden="true"></i></span>
                                            </span>
                                            <input type="number" id="txtExistencia" class="form-control input-sm" placeholder="#" disabled="disabled" style="background-color: white;" />
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="input-group input-group-icon" style="width: 90px;">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="glyphicon glyphicon-usd" aria-hidden="true"></i></span>
                                            </span>
                                            <input type="text" id="txtCosto" class="form-control input-sm" placeholder="$" disabled="disabled" style="background-color: white;" />
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="input-group input-group-icon" style="width: 90px;">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i></span>
                                            </span>
                                            <input type="number" min="1" max="100" id="txtPiezasVenta" class="form-control input-sm" placeholder="#" disabled="disabled" style="background-color: #fffbd4" />
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" id="btnAgregar" class="btn btn-success btn-sm" disabled="disabled">Agregar</button>
                                    </div>
                                </div>
                                <br />
                                <div class="row" id="tablaVentas" style="height: 400px;">
                                    <div class="col-md-12">
                                        <div id="Tabla" class="table table-responsive" style="text-align: -webkit-center; height: 400px; margin-bottom: 0px;">
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row" style="width: 97%;">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-5" style="text-align: center;">
                                    </div>
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-5" style="text-align: right;">
                                        <label id="lblVentaT" style="color: #0e41cf; font-size: xx-large;">TOTAL: $</label>
                                        <label id="lblVentaTotal" style="color: #0e41cf; font-size: xx-large;">0.00</label>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="panel-footer" style="text-align: center;">
                            <div class="row" style="width: 97%;">
                                <div class="col-md-1">
                                    <label id="RomaSystems" style="font-size: x-small; color: darkgray"><a href="#">&copy; ROMA SYSTEMS.</a></label>
                                </div>
                                <div class="col-md-2" style="text-align: left;">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                                            <asp:Label ID="lblFecha" runat="server" Font-Size="Large" ForeColor="darkblue"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-5" style="text-align: right; padding-right: 0px;">
                                    <button type="button" id="btnTotales" class="btn btn-primary" data-toggle="modal" data-target="#mdDesglose" data-backdrop="static" data-keyboard="false">Totales</button>&nbsp&nbsp&nbsp                                   
                                    <button type="button" id="btnCancelar" class="btn btn-primary">Cancelar</button>&nbsp&nbsp&nbsp
                                    <button type="button" id="btnGuardar" class="btn btn-success">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Desglose de Ventas-->
        <div class="modal fade" id="mdDesglose" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content" style="width: 100%; height: 601px;">
                    <div class="modal-header" style="padding: 0px;">
                        <section class="page-header" style="margin-bottom: 0px; margin-top: 10px;">
                            <div class="row" style="margin: 0; text-align: -webkit-center;">
                                <div class="col-md-12">
                                    <button type="button" class="close" data-dismiss="modal" style="color: black;">&times;</button>
                                    <h4 style="color: black; font-size: x-large;">- Ventas del Día -</h4>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="modal-body" style="padding-top: 0px;">
                        <div class="row">
                            <div class="col-xs-12">
                                <header class="panel-heading" style="padding-top: 0px; padding-bottom: 0px; border-bottom-width: 0px;">
                                    <div class="row">
                                        <div class="col-sm-6" style="margin: 5px auto; text-align: left;">
                                            <%--<label id="lblEmpDesglose" style="color: black; font-size: large; margin-bottom: 0px;">Empleado:</label>--%>
                                            <label id="lblEmpleadoDesglose" style="color: black; font-size: large; margin-bottom: 0px;"></label>
                                        </div>
                                        <div class="col-sm-6" style="margin: 5px auto; text-align: right;">
                                            <label id="lblTotDesglose" style="color: #0e41cf; font-size: large; margin-bottom: 0px;">TOTAL: $</label>
                                            <label id="lblTotalDesglose" style="color: #0e41cf; font-size: large; margin-bottom: 0px;"></label>
                                        </div>
                                    </div>
                                </header>
                                <div class="panel-body panel-body-nopadding" style="padding-top: 0px;">
                                    <div class="well" style="padding: 5px; margin-bottom: 0px; height: 400px;">
                                        <div id="pnlDesglose">
                                            <div class="row">
                                                <div class="col-sm-6" style="margin: 5px auto; text-align: right; padding-left: 0px;padding-right: 5px;">
                                                    <label id="lblFarmacia" style="color: #0e41cf; font-size: large;">Importe Ventas Farmacia: $</label>
                                                </div>
                                                <div class="col-sm-6" style="margin: 5px auto; text-align: left; padding-left: 0px;padding-right: 0px;">
                                                    <label id="lblVentasFarmacia" style="color: #0e41cf; font-size: large;"></label>
                                                </div>
                                                <br />
                                                <div class="col-sm-6" style="margin: 5px auto; text-align: right; padding-left: 0px;padding-right: 5px;">
                                                    <label id="lblMedico" style="color: #0e41cf; font-size: large;">Importe Ventas Medico: $</label>
                                                </div>
                                                <div class="col-sm-6" style="margin: 5px auto; text-align: left; padding-left: 0px;padding-right: 0px;">
                                                    <label id="lblVentasMedico" style="color: #0e41cf; font-size: large;"></label>
                                                </div>
                                            </div>
                                            <hr style="margin-top: 5px; margin-bottom: 10px;" />
                                            <h5 style="text-align: center; font-size: large; color: black;">Desglose ventas Medico</h5>
                                            <div class="row">
                                                <div class="col-md-2"></div> 
                                                <div class="col-md-8">
                                                    <div id="TablaDesglose" class="table table-responsive" style="text-align: -webkit-center; height: 200px; margin-bottom: 0px;">
                                                    </div>
                                                </div>
                                                 <div class="col-md-2"></div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row" style="text-align: center;">
                            <div class="col-md-12">
                                <button type="button" id="btnCerrarDesgloseVentas" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <link href="jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet" />
    <script src="js/base64.js"></script>
    <script>
        $(document).ready(function () {
            //Variables Globales
            var lista;
            var productoID = 0;
            var producto = '';
            var sustancia = '';
            var existencia = 0;
            var costo = 0.0;
            var codigoBarras = '';
            var piezasVenta = 0;
            var costoTotalProd = 0.0;

            //Obtener Id
            function ObtenerId(cadena) {
                var nuevo = "";
                for (i = cadena.length - 1; i > 0; i--) {
                    if (isNaN(cadena[i])) {
                        continue;
                    }
                    else {
                        nuevo += cadena[i];
                    }
                }
                //Invertir el numero obtenido
                var x = nuevo.length - 1;
                var cadenaInvertida = "";
                while (x >= 0) {
                    cadenaInvertida = cadenaInvertida + nuevo.charAt(x);
                    x--;
                }
                return cadenaInvertida;
            }

            //Carga Inicial Tabla Ventas
            cargarTablaVentas();
            $('#txtCodigoBarras').focus();

            //Funcion que se carga primero para obtener todos los productos...
            (function JsonProductos() {
                $.ajax({
                    type: "POST",
                    url: "VentasEmp1.aspx/BusquedaProductos",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        lista = $.parseJSON(msg.d);
                        return lista;
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
            $("#txtBuscador").autocomplete({
                select: function (event, ui) {
                    productoID = ui.item.Id_Producto;
                    producto = ui.item.Nombre_Producto;
                    sustancia = ui.item.Sustancia;
                    existencia = ui.item.Existencia;
                    costo = ui.item.Costo;
                    $("#txtBuscador").val(ui.item.Nombre_Producto)
                    $("#txtSustancia").val(ui.item.Sustancia);
                    $("#txtExistencia").val(ui.item.Existencia);
                    $("#txtCosto").val(ui.item.Costo);
                    $("#txtPiezasVenta").val('');
                    if (ui.item.Costo != 0) {
                        $("#btnAgregar").attr("disabled", false);
                        $("#txtPiezasVenta").attr("disabled", false);
                        if (ui.item.Existencia != 0) {
                            $("#btnAgregar").attr("disabled", false);
                            $("#txtPiezasVenta").attr("disabled", false);
                        }
                        else {
                            $("#btnAgregar").attr("disabled", true);
                            $("#txtPiezasVenta").attr("disabled", true);
                            $('#txtCodigoBarras').focus();
                            alert('No hay Existencias de: ' + ui.item.Nombre_Producto);
                        }
                    }
                    else {
                        $("#btnAgregar").attr("disabled", true);
                        $("#txtPiezasVenta").attr("disabled", true);
                        $('#txtCodigoBarras').focus();
                        alert('Producto SIN costo registrado. Avise al Encargado.');
                    }

                    return false;
                }
            });

            //Evento Click del boton Agregar
            $('#btnAgregar').on("click", function () {
                var numPiezas = 0;
                var costoNumPiezas = 0;
                if ($("#txtPiezasVenta").val() != '') {
                    if ($("#txtPiezasVenta").val() <= existencia) {
                        piezasVenta = $("#txtPiezasVenta").val();
                        costoTotalProd = (piezasVenta * costo);
                        if (window.sessionStorage) {
                            if (sessionStorage.getItem("ProductoAgregar" + productoID) != null) {
                                list3 = $.parseJSON(sessionStorage.getItem("ProductoAgregar" + productoID));
                                $.each(list3, function (key, value) {
                                    if (key == "PiezasVenta") {
                                        numPiezas = parseInt(value) + parseInt(piezasVenta);
                                    }
                                })
                                costoNumPiezas = (numPiezas * costo);
                            }
                            else {
                                numPiezas = piezasVenta;
                                costoNumPiezas = costoTotalProd;
                            }
                            if (numPiezas <= existencia) {
                                var datosProducto = { "Id_Producto": productoID, "Producto": producto, "Sustancia": sustancia, "Existencia": existencia, "Costo": costo, "PiezasVenta": numPiezas, "CostoTotalProd": costoNumPiezas, "EliminarProd": "EliminarProd" + productoID }
                                var jsonDatosProducto = JSON.stringify(datosProducto);
                                sessionStorage.setItem("ProductoAgregar" + productoID, jsonDatosProducto);
                                $('#txtCodigoBarras').focus();
                                cargarTablaVentas();
                            }
                            else {
                                $('#txtCodigoBarras').focus();
                                alert('No hay existencias suficientes de -' + producto + '- VERIFIQUE.');
                            }
                        }
                        else {
                            throw new Error('Tu Navegador no soporta SessionStorage!');
                        }
                    }
                    else {
                        $('#txtCodigoBarras').focus();
                        alert('No hay existencias suficientes. VERIFIQUE.');
                    }
                }
                else {
                    $('#txtCodigoBarras').focus();
                    alert('Indique el N° de Piezas a Agregar.');
                }

            });

            //Funcion para el llenado de la tabla de ventas dinamicamente.
            function cargarTablaVentas() {

                tabla = '';
                tabla += '<table class="table table-responsive table-hover" border="1" id="body_gvTablaVentas" style="width:90%; border-collapse:collapse; font-size: 0.7em; overflow-x: auto">'
                tabla += '<tr style="background-color: #EDEDF2; text-align:center;">';
                tabla += ' <td style="font-size: small;">[CLV_PROD]</td>';
                tabla += ' <td style="font-size: small;">[PRODUCTO]</td>';
                tabla += ' <td style="font-size: small;">[SUSTANCIA]</td>';
                tabla += ' <td style="font-size: small;">[EXISTENCIA]</td>';
                tabla += ' <td style="font-size: small;">[COSTO]</td>';
                tabla += ' <td style="font-size: small;">[PIEZAS A VENDER]</td>';
                tabla += ' <td style="font-size: small;">[TOTAL]</td>';
                tabla += ' <td style="font-size: small;">[ELIMINAR]</td>';
                tabla += '</tr>';

                if (sessionStorage.length == 0) {
                    $("#btnCancelar").attr("disabled", true);
                    $("#btnGuardar").attr("disabled", true);
                    tabla += '<tr style="text-align:center;">';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += ' <td style="font-size: small;">Ingrese Producto</td>';
                    tabla += '</tr>';
                }
                else {
                    $("#btnCancelar").attr("disabled", false);
                    $("#btnGuardar").attr("disabled", false);
                    var VentaTotal = 0;
                    for (var x = 0; x <= sessionStorage.length; x++) {
                        if (sessionStorage.getItem(sessionStorage.key(x)) != null) {
                            list = $.parseJSON(sessionStorage.getItem(sessionStorage.key(x)));
                            tabla += '<tr style="text-align:center;">';
                            $.each(list, function (key, value) {
                                if (key == "EliminarProd") {
                                    tabla += '<td><span id="lnkSup' + value + '" class="glyphicon glyphicon-remove" style="font-size: 1.5em; padding: 0 15px; color:red;" title="Eliminar Producto"></span></td>';
                                }
                                else if (key == "Costo" || key == "CostoTotalProd") {
                                    tabla += ' <td style="font-size: small;">$ ' + value + '</td>';
                                }
                                else {
                                    tabla += ' <td style="font-size: small;">' + value + '</td>';
                                }
                                if (key == "CostoTotalProd") {
                                    VentaTotal += value
                                }
                            });
                            tabla += '</tr>';
                        }
                    }
                    $('#lblVentaTotal').text(VentaTotal);
                }
                tabla += '</table>';
                $('#Tabla').empty();
                $('#Tabla').append(tabla);
                $("#txtBuscador").val('');
                $("#txtSustancia").val('');
                $("#txtExistencia").val('');
                $("#txtCosto").val('');
                $("#txtPiezasVenta").val('');
                $("#btnAgregar").attr("disabled", true);
                $("#txtPiezasVenta").attr("disabled", true);

                //Evento Click del boton Eliminar del Tablero
                $('.glyphicon-remove').bind("click", function () {
                    productoID = ObtenerId($(this).attr("id"));
                    sessionStorage.removeItem("ProductoAgregar" + productoID);
                    $('#txtCodigoBarras').focus();
                    if (sessionStorage.length == 0) {
                        $('#lblVentaTotal').text("0.00");
                    }
                    cargarTablaVentas();
                });
            }

            //Evento change para lectora de Código de Barras
            $('#txtCodigoBarras').change(function () {
                var codigo = '';
                var encontrado = '';
                var numPiezas = 0;
                var costoNumPiezas = 0;
                var primerCodigo = '';
                codigo = $('#txtCodigoBarras').val();
                $('#txtCodigoBarras').val('');
                $('#txtCodigoBarras').focus();
                $(lista).each(function () {
                    if (primerCodigo != this.CodigoBarras) {
                        if (this.CodigoBarras == codigo) {
                            encontrado = 'TRUE';
                            primerCodigo = this.CodigoBarras;
                            if (this.Costo != 0) {
                                if (this.Existencia != 0) {
                                    if (window.sessionStorage) {
                                        if (sessionStorage.getItem("ProductoAgregar" + this.Id_Producto) != null) {
                                            list2 = $.parseJSON(sessionStorage.getItem("ProductoAgregar" + this.Id_Producto));
                                            $.each(list2, function (key, value) {
                                                if (key == "PiezasVenta") {
                                                    numPiezas = parseInt(value) + 1;
                                                }
                                            })
                                            costoNumPiezas = (numPiezas * this.Costo);
                                        }
                                        else {
                                            numPiezas = 1;
                                            costoNumPiezas = this.Costo;
                                        }
                                        if (numPiezas <= this.Existencia) {
                                            var datosProductoLectora = { "Id_Producto": this.Id_Producto, "Producto": this.Nombre_Producto, "Sustancia": this.Sustancia, "Existencia": this.Existencia, "Costo": this.Costo, "PiezasVenta": numPiezas, "CostoTotalProd": costoNumPiezas, "EliminarProd": "EliminarProd" + this.Id_Producto }
                                            var jsonDatosProductoLectora = JSON.stringify(datosProductoLectora);
                                            sessionStorage.setItem("ProductoAgregar" + this.Id_Producto, jsonDatosProductoLectora);
                                            cargarTablaVentas();
                                        }
                                        else {
                                            $('#txtCodigoBarras').focus();
                                            alert('No hay existencias suficientes de -' + this.Nombre_Producto + '- VERIFIQUE.');
                                        }
                                    }
                                    else {
                                        throw new Error('Tu Navegador no soporta SessionStorage!');
                                    }
                                }
                                else {
                                    alert('No hay Existencias de: ' + this.Nombre_Producto);
                                }
                            }
                            else {
                                alert('Producto ' + this.Nombre_Producto + ' SIN costo registrado. Avise al Encargado.');
                            }
                        }
                    }
                })
                if (encontrado != 'TRUE') {
                    alert('Producto No Registrado: Código de Barras ' + codigo);
                }
            });

            //Evento Click del Boton Cancelar
            $('#btnCancelar').on("click", function () {
                if (confirm("¿Seguro de Cancelar la Operación?")) {
                    sessionStorage.clear();
                    $('#lblVentaTotal').text("0.00");
                    cargarTablaVentas();
                    $('#txtCodigoBarras').focus();
                }
            });

            //Evento Click del Boton Salir
            $('#btnSalir').on("click", function () {
                if (confirm("¿Seguro de Salir del Registro de Ventas?")) {
                    //$('#lblEmpleado').html('');
                    sessionStorage.clear();
                    window.location = 'Default.aspx';
                }
            });

            //Evento Click del Boton Guardar
            $('#btnGuardar').on("click", function () {
                if (confirm("¿Se guardara la venta del Cliente?")) {
                    if (sessionStorage.length != 0) {
                        for (var x = 0; x <= sessionStorage.length; x++) {
                            if (sessionStorage.getItem(sessionStorage.key(x)) != null) {
                                list = $.parseJSON(sessionStorage.getItem(sessionStorage.key(x)));
                                var misDatos = '';
                                var idProducto = 0;
                                var nombreProducto = '';
                                var piezasVendidas = 0;
                                var costoUnitario = 0.0;
                                var costoTotal = 0.0;
                                var numCliente = '';
                                numCliente = $('#lblNumCliente').text();
                                var costoTotalVenta = 0.0;
                                costoTotalVenta = $('#lblVentaTotal').text();
                                $.each(list, function (key, value) {
                                    switch (key) {
                                        case 'Id_Producto': { idProducto = value; }
                                        case "Producto": { nombreProducto = value; }
                                        case "Costo": { costoUnitario = value }
                                        case "PiezasVenta": { piezasVendidas = value }
                                        case "CostoTotalProd": { costoTotal = value }
                                    }
                                });
                                misDatos = '{"idProducto":"' + idProducto + '", "nombreProducto":"' + nombreProducto + '", "piezasVendidas":"' + piezasVendidas + '", "costoUnitario":"' + costoUnitario + '", "costoTotal":"' + costoTotal + '", "numCliente":"' + numCliente + '", "costoTotalVenta":"' + costoTotalVenta + '"}';
                                $.ajax({
                                    type: "POST",
                                    url: "VentasEmp1.aspx/InsertaVentas",
                                    data: misDatos,
                                    async: false,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) {
                                    },
                                    error: function (msg) {
                                        alert('Error al Guardar la Venta' + msg.responseText);
                                    }
                                });
                            }
                        }
                        sessionStorage.clear();
                        $('#lblVentaTotal').text("0.00");
                        var clienteMas = 0;
                        clienteMas = parseInt($('#lblNumCliente').text()) + 1;
                        $('#lblNumCliente').text(clienteMas)
                        cargarTablaVentas();
                        $('#txtCodigoBarras').focus();
                        window.location = 'VentasEmp1.aspx';

                    } else {
                        alert("No hay elementos a Guardar.");
                    }
                }
            });

            //Evento Click del Boton Totales
            $('#btnTotales').on("click", function () {
                $.ajax({
                    type: "POST",
                    url: "VentasEmp1.aspx/SelectVentasEmpleadosNEW",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        list = $.parseJSON(msg.d);
                        $(list).each(function () {
                            $('#lblEmpleadoDesglose').text(this.Nombre_Empleado);
                            $('#lblTotalDesglose').text(this.Ventas_Total);
                            $('#lblVentasFarmacia').text(this.Ventas_Farmacia);
                            $('#lblVentasMedico').text(this.Ventas_Medico);
                        });
                        
                    },
                    error: function (msg) {
                        alert('Error al cargar las Ventas del Día' + msg.responseText);
                    }
                });
                $.ajax({
                    type: "POST",
                    url: "VentasEmp1.aspx/SelectVentasMedicoNEW",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        list = $.parseJSON(msg.d);
                        var tabla = '';
                        tabla += '<table id="tablaMedico" class="table table-responsive table-hover">';
                        tabla += '  <tr style="background-color: #d9edf7; border: 1px solid white; font-weight: 700;">';
                        tabla += '  <td>[Servicio Medico]</td>';
                        tabla += '  <td>[N° Servicios]</td>';                        
                        tabla += '  </tr>';
                        $(list).each(function () {
                            tabla += '<tr>';
                            tabla += '<td>';
                            tabla += '    <label id="lblServicioMedico">' + this.productoMedico + '</label></td>';
                            tabla += '<td>';
                            tabla += '    <label id="lblPiezas">' + this.piezasProducto + '</label></td>';                            
                            tabla += '</tr>';
                        });
                        tabla += '</table>';
                        $('#TablaDesglose').empty();
                        $('#TablaDesglose').append(tabla);
                    },
                    error: function (msg) {
                        alert('Error al cargar el desglose de las ventas del Medico' + msg.responseText);
                    }
                });//Fin del Ajax
            });

        })
    </script>
</body>
</html>
