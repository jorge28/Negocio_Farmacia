<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp1.aspx.cs" Inherits="VentasEmp1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Estrella de la Mañana</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Control de inventarios e interfaces para ventas." />
    <meta name="author" content="Jorge Romero Olguin" />
    <meta name="keywords" content="" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>
</head>
<body style="background-color: #EDEDF2;">
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 15px; padding-right: 15px;">
            <div class="row " style="margin-top: 15px;">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading" style="background-color: #FAFAFA;">
                            <div class="row">
                                <div class="col-md-5" style="text-align: left;">
                                    <label id="lblEmpleado" style="font-size: large; color: darkblue;">Bianca Cruz</label>
                                </div>
                                <div class="col-md-5" style="text-align: left;">
                                    <label id="lblNumCliente" style="font-size: large; color: darkblue;">Cliente N°</label>
                                </div>
                                <div class="col-md-2" style="text-align: right;">
                                    <label id="btnSalir" class="btn btn-primary">Salir</label>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body" style="height: 520px;">
                            <section class="form-group-horizontal">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="input-group input-group-icon ">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="fa fa-key"></i></span>
                                            </span>
                                            <input type="text" id="txtCodigoBarras" class="form-control" placeholder="Código de Barras" />
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="fa fa-key"></i></span>
                                            </span>
                                            <input type="text" id="txtBuscador" class="form-control" placeholder="Buscador" />
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="input-group input-group-icon">
                                            <span class="input-group-addon">
                                                <span class="icon"><i class="fa fa-key"></i></span>
                                            </span>
                                            <input type="text" id="txtProductoSustancia" class="form-control" placeholder="Producto / Sustancia" disabled="disabled" style="background-color: white;" />
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <br />
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="input-group input-group-icon">
                                        <span class="input-group-addon">
                                            <span class="icon"><i class="fa fa-key"></i></span>
                                        </span>
                                        <input type="number" id="txtExistencia" class="form-control" placeholder="Existencia" disabled="disabled" style="background-color: white;" />
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group input-group-icon">
                                        <span class="input-group-addon">
                                            <span class="icon"><i class="fa fa-key"></i></span>
                                        </span>
                                        <input type="number" id="txtCosto" class="form-control input-sm" placeholder="Costo" disabled="disabled" style="background-color: white;" />
                                    </div>
                                </div>           
                                <div class="col-md-2">
                                    <div class="input-group input-group-icon">
                                        <span class="input-group-addon">
                                            <span class="icon"><i class="fa fa-key"></i></span>
                                        </span>
                                        <input type="number" id="txtPiezasVenta" class="form-control" placeholder="Piezas Venta" />
                                    </div>
                                </div>                          
                                <div class="col-md-3">
                                    <label id="btnAgregar" class="btn btn-success">Agregar</label>
                                </div>
                            </div>
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
</body>
</html>
