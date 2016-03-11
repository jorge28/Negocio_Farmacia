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
                                    <input type="text" id="txtCodigoBarras" class="form-control input-sm col-md-1" placeholder="Código Barras" style="width: 100px; display: none;" />
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
                                            <input type="text" name="Sustancia" id="txtBuscador" class="form-control input-sm" placeholder="Buscador" style="background-color: #fffbd4" />
                                            <%--<input id="txtBuscador" />--%>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i></span>
                                            </span>
                                            <input type="text" id="txtProductoSustancia" class="form-control input-sm" placeholder="Producto / Sustancia" disabled="disabled" style="background-color: white;" />
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
                                            <input type="number" min="1" max="100" id="txtPiezasVenta" class="form-control input-sm" placeholder="#" style="background-color: #fffbd4" />
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <label id="btnAgregar" class="btn btn-success btn-sm">Agregar</label>
                                    </div>
                                </div>
                                <div id="TablaVentas" style="display: none; overflow-x: scroll; font-size: 0.8em; height: 400px; text-align: center;">
                                </div>
                            </section>
                        </div>
                        <div class="panel-footer" style="text-align: center;">
                            <div class="row">
                                <div class="col-md-1">
                                    <label id="RomaSystems" style="font-size: x-small; color: darkgray"><a href="#">&copy; ROMA SYSTEMS.</a></label>
                                </div>
                                <div class="col-md-5" style="text-align: center;">
                                    <label id="btnTotales" class="btn btn-primary">Totales</label>
                                </div>
                                <div class="col-md-1">
                                </div>
                                <div class="col-md-5" style="text-align: center;">
                                    <label id="btnCancelar" class="btn btn-primary">Cancelar</label>&nbsp&nbsp&nbsp
                                     <label id="btnGuardar" class="btn btn-success">Guardar</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="js/jquery-2.1.4.min.js"></script>
    <%--<script src="EasyAutocomplete/EasyAutocomplete/jquery.easy-autocomplete.min.js"></script>--%>
    <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>

    <script>
         $(document).ready(function () {
            var lista;
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
                        //lista2 = JSON.stringify(lista);
                        return lista
                    },
                    error: function (msg) {
                        alert('Error al cargar el Buscador' + msg.responseText);
                    }
                });
            })();

            $(function () {
                var arrLinks = lista;
                $("input[name=Sustancia]").autocomplete({
                    source: arrLinks
                }).data("ui-autocomplete")._renderItem = function (ul, item) {
                    $("<li>").data("ui-autocomplete-item", item).append("<a>" + item.label + "</a>").appendTo(ul);
                    //$("<li>").data("ui-autocomplete-item", item).append("<a>" + item.Sustancia + "</a>").appendTo(ul);
                    return $("<li>");
                };
            });
            //.data("autocomplete")._renderItem = function(ul, item) {
            //    return $("<li>").data("item.autocomplete", item).append("<a>" + item.url + "</a>").appendTo(ul);
        });
    </script>
</body>
</html>
