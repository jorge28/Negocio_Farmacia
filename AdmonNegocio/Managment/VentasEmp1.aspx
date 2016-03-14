<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp1.aspx.cs" Inherits="VentasEmp1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Estrella de la Mañana</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Control de inventarios e interfaces para ventas." />
    <meta name="author" content="Jorge Romero Olguin" />
    <meta name="keywords" content="" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="tabs/tabs/css/style.css" rel="stylesheet" />--%>
    <script src="tabs/tabs/js/prefixfree.min.js"></script>
    <%--<script src="js/bootstrap.min.js"></script>--%>
</head>
<body style="background-color: #EDEDF2;">
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 15px; padding-right: 15px;">
            <div class="row " style="margin-top: 15px;">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading" style="background-color: #FAFAFA; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">
                            <div class="row">
                                <div class="col-md-5" style="text-align: left;">
                                    <label id="lblEmpleado" style="font-size: large; color: darkblue;">Bianca Cruz</label>
                                </div>
                                <div class="col-md-5" style="text-align: left;">
                                    <label id="lblNumCliente" style="font-size: large; color: darkblue;" class="col-md-4">Cliente N°</label>
                                    <input type="text" id="txtCodigoBarras" class="form-control input-sm col-md-1" placeholder="Código Barras" style="width: 100px;" />
                                </div>
                                <div class="col-md-2" style="text-align: right;">
                                    <label id="btnSalir" class="btn btn-primary">Salir</label>
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
                                                <span class="icon"><i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i></span>
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
                                <div class="row" id="tablaVentas">
                                    <div class="col-xs-12">
                                        <div id="Tabla" class="table table-responsive" style="text-align: -webkit-center;">
                                        </div>
                                    </div>
                                </div>

                            </section>
                        </div>
                        <div class="panel-footer" style="text-align: center;">
                            <div class="row">
                                <div class="col-md-1">
                                    <label id="RomaSystems" style="font-size: x-small; color: darkgray"><a href="#">&copy; ROMA SYSTEMS.</a></label>
                                </div>
                                <div class="col-md-5" style="text-align: center;">
                                    <button type="button" id="btnTotales" class="btn btn-primary" disabled="disabled">Totales</button>
                                </div>
                                <div class="col-md-1">
                                </div>
                                <div class="col-md-5" style="text-align: center;">
                                    <button type="button" id="btnCancelar" class="btn btn-primary">Cancelar</button>&nbsp&nbsp&nbsp
                                     <button type="button" id="btnGuardar" class="btn btn-success">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <link href="jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            //Variables Globales
            var lista;
            var productoID = 0;
            var producto = '';
            var sustancia = '';
            var existencia = 0;
            var costo = 0;
            var codigoBarras = '';
            var piezasVenta = 0;
            var costoTotalProd = 0;

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
            $("#txtBuscador").autocomplete({
                select: function (event, ui) {
                    productoID = ui.item.Id_Producto;
                    producto = ui.item.label;
                    sustancia = ui.item.Sustancia;
                    existencia = ui.item.Existencia;
                    costo = ui.item.Costo;
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
                            alert('No hay Existencias de: ' + ui.item.label);
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
                //$('#txtPiezasVenta').val() != '' ? $('#txtPiezasVenta').removeClass("error") : $('#txtPiezasVenta').addClass("error");
                if ($("#txtPiezasVenta").val() != '') {
                    if ($("#txtPiezasVenta").val() <= existencia) {
                        piezasVenta = $("#txtPiezasVenta").val();
                        costoTotalProd = (piezasVenta * costo);
                        if (window.sessionStorage) {
                            var datosProducto = { "Id_Producto": productoID, "Producto": producto, "Sustancia": sustancia, "Existencia": existencia, "Costo": costo, "PiezasVenta": piezasVenta, "CostoTotalProd": costoTotalProd, "EliminarProd": "EliminarProd" + productoID }
                            var jsonDatosProducto = JSON.stringify(datosProducto);
                            sessionStorage.setItem("ProductoAgregar" + productoID, jsonDatosProducto);
                        }
                        else {
                            throw new Error('Tu Navegador no soporta SessionStorage!');
                        }
                        $('#txtCodigoBarras').focus();
                        cargarTablaVentas();
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

            function cargarTablaVentas() {

                tabla = '';
                tabla += '<table class="table table-responsive table-hover" border="1" id="body_gvTablaVentas" style="width:75%;border-collapse:collapse;font-size: 0.7em; overflow-x: auto">'
                tabla += '<tr style="background-color: #EDEDF2; text-align:center;">';
                tabla += ' <td>[CLV_PROD]</td>';
                tabla += ' <td>[PRODUCTO]</td>';
                tabla += ' <td>[SUSTANCIA]</td>';
                tabla += ' <td>[EXISTENCIA]</td>';
                tabla += ' <td>[COSTO]</td>';
                tabla += ' <td>[PIEZAS A VENDER]</td>';
                tabla += ' <td>[TOTAL]</td>';
                tabla += ' <td>[ELIMINAR]</td>';
                tabla += '</tr>';

                if (sessionStorage.length == 0) {
                    $("#btnCancelar").attr("disabled", true);
                    $("#btnGuardar").attr("disabled", true);
                    tabla += '<tr style="text-align:center;">';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += ' <td>Ingrese Producto</td>';
                    tabla += '</tr>';
                }
                else {
                    $("#btnCancelar").attr("disabled", false);
                    $("#btnGuardar").attr("disabled", false);
                    for (var x = 0; x <= sessionStorage.length; x++) {
                        if (sessionStorage.getItem(sessionStorage.key(x)) != null) {
                            list = $.parseJSON(sessionStorage.getItem(sessionStorage.key(x)));
                            tabla += '<tr style="text-align:center;">';
                            $.each(list, function (key, value) {
                                if (key == "EliminarProd") {
                                    tabla += '<td><span id="lnkSup' + value + '" class="glyphicon glyphicon-remove" style="font-size: 1.5em; padding: 0 15px;" title="Eliminar Producto"></span></td>';
                                }
                                else if (key == "Costo" || key == "CostoTotalProd") {
                                    tabla += ' <td>$ ' + value + '</td>';
                                }
                                else {
                                    tabla += ' <td>' + value + '</td>';
                                }
                            });
                            tabla += '</tr>';
                        }
                    }
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
                    cargarTablaVentas();
                });
            }

            //Evento change para lectora de Código de Barras
            $('#txtCodigoBarras').change(function () {
                var codigo = '';
                var encontrado = '';
                var numPiezas = 0;
                var costoNumPiezas = 0;
                codigo = $('#txtCodigoBarras').val();
                $('#txtCodigoBarras').val('');
                $('#txtCodigoBarras').focus();
                $(lista).each(function () {
                    if (this.CodigoBarras == codigo) {
                        encontrado = 'TRUE';
                        if (this.Costo != 0) {
                            if (this.Existencia != 0) {
                                if (window.sessionStorage) {
                                    if (sessionStorage.getItem("ProductoAgregar" + this.Id_Producto) != null) {
                                        list2 = $.parseJSON(sessionStorage.getItem("ProductoAgregar" + this.Id_Producto));
                                        $.each(list2, function (key, value) {
                                            if (key == "PiezasVenta") {
                                                numPiezas = value + 1;
                                            }
                                        })
                                        costoNumPiezas = numPiezas * this.Costo;
                                    }
                                    else {
                                        numPiezas = 1;
                                        costoNumPiezas = this.Costo;
                                    }
                                    var datosProductoLectora = { "Id_Producto": this.Id_Producto, "Producto": this.label, "Sustancia": this.Sustancia, "Existencia": this.Existencia, "Costo": this.Costo, "PiezasVenta": numPiezas, "CostoTotalProd": costoNumPiezas, "EliminarProd": "EliminarProd" + this.Id_Producto }
                                    var jsonDatosProductoLectora = JSON.stringify(datosProductoLectora);
                                    sessionStorage.setItem("ProductoAgregar" + this.Id_Producto, jsonDatosProductoLectora);
                                }
                                else {
                                    throw new Error('Tu Navegador no soporta SessionStorage!');
                                }
                                cargarTablaVentas();
                            }
                            else {
                                alert('No hay Existencias de: ' + this.label);
                            }
                        }
                        else {
                            alert('Producto ' + this.label + ' SIN costo registrado. Avise al Encargado.');
                        }

                    }
                })
                if (encontrado != 'TRUE') {
                    alert('Producto No Registrado: Código de Barras ' + codigo);
                }

            });


        });
    </script>
</body>
</html>
