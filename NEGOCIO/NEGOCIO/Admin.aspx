<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administración</title>
    <%--<script src="js/tabs.js"></script>--%>
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

    <link href="css/style%20(2).css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet2.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link href="css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="css/bootstrap-datepicker3.css" rel="stylesheet" />
    <link href="css/bootstrap-datepicker3.min.css" rel="stylesheet" />
</head>
<body background="img/wall9.png">
    <form id="form1" runat="server" >
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <div>
            <div>
                <div class="container" id="ventas">
                    <div class="header">
                        <div class="4u">
                            <asp:Label ID="lblEmpleado" runat="server" Style="text-align: left; font-size: x-large;" ForeColor="DarkBlue" Text="Empleado 1"></asp:Label>
                        </div>
                        <div class="4u" style="text-align:center">    
                            <asp:Label ID="Label1" text="Administrador" runat="server" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>                      
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
                   <div style="height:20px"></div>
    <div>
        <ul id="tabs">
    <li class="active">Producto</li>
    <li>Usuario</li>
    <li>Existencias</li>
    <li>Repotes</li>
    
</ul>
        <ul id="tab"  style="width:900px;">
            <li class="active">
                <h2>Alta de Producto</h2>
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sProducto"></span>
                        <asp:TextBox ID="txtProducto" runat="server" class="form-control" placeholder="Nombre del Producto" Width="300px" aria-describedby="sProducto" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sSustancia"></span>
                        <asp:TextBox ID="txtSustancia" runat="server" class="form-control" placeholder="Sustancia del Producto" Width="300px" aria-describedby="sSustancia" />
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sCategoria"></span>
                        <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control" Width="200px" aria-describedby="sCategoria">
                            <asp:ListItem Text="text1" />
                            <asp:ListItem Text="text2" />
                        </asp:DropDownList>
                        
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sTipo"></span>
                        <asp:DropDownList ID="ddlTipo" runat="server" class="form-control" Width="200px" aria-describedby="sTipo">
                            <asp:ListItem Text="text1" />
                            <asp:ListItem Text="text2" />
                        </asp:DropDownList>
                        
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sCantidad" ></span>
                        
                        <asp:TextBox ID="txtCantidad" runat="server" class="form-control" placeholder="Cantidad del Producto" Width="200px" aria-describedby="sCantidad" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sExistencia">#</span>
                        <asp:TextBox ID="txtExistencia" runat="server" class="form-control" placeholder="No. de Existencias" Width="200px" aria-describedby="sExistencia" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sPrecio">$</span>
                        <asp:TextBox ID="txtPrecio" runat="server" class="form-control" placeholder="Precio del Producto" Width="200px" aria-describedby="sPrecio" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="btn-group">
                        <asp:Button ID="btnGuardar" Text="Guardar Producto" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" OnClick="btnGuardar_Click"/>
                        <asp:Button ID="btnCancelar" Text="Cancelar"  runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false"/>
                </div>
                    </div>
            </li>
            <li>
                <h2>Alta de Usuario</h2>
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-addon" id="sNombre" ></span>
                        
                        <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre del Usuario" Width="300px" aria-describedby="sNombre" />
                    </div>
                     </div>
                    <br />
                    <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sApaterno" ></span>
                        <asp:TextBox ID="txtApaterno" runat="server" class="form-control" placeholder="Apellido Paterno" Width="300px" aria-describedby="sApaterno" />
                    </div>

                </div>
                <br />
                <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sAmaterno" ></span>
                        <asp:TextBox ID="txtAmaterno" runat="server" class="form-control" placeholder="Apellido Materno" Width="300px" aria-describedby="sAmaterno" />
                    </div>

                </div>
                <br />
                <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sDireccion" ></span>
                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control" placeholder="Calle,Numero,Colonia" Width="500px" aria-describedby="sDireccion" />
                    </div>
                </div>
                <br />
                <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sTelefono" ></span>
                        <asp:TextBox ID="txtTel" runat="server" class="form-control" placeholder="Telefono de Casa" Width="300px" aria-describedby="sAmaterno" />
                    </div>
                </div>
                <br />
                <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sCel" ></span>
                        <asp:TextBox ID="txtCel" runat="server" class="form-control" placeholder="No. Celular" Width="300px" aria-describedby="sCel" />
                    </div>

                </div>
                <br />
                <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sUsuario" ></span>
                        <asp:TextBox ID="txtUsua" runat="server" class="form-control" placeholder="Ingresa tu Usuario" Width="300px" aria-describedby="sUsuario" />
                    </div>

                </div>
                <br />
                <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sPass" ></span>
                        <asp:TextBox ID="txtPass" runat="server" class="form-control" placeholder="Ingresa tu Password" Width="300px" aria-describedby="sPass" />
                    </div>

                </div>
                <br />
                 <div class="row">
                    <div class="btn-group">
                        <asp:Button ID="btnGuardarU" Text="Guardar Usuario" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false" OnClick="btnGuardarU_Click"/>
                        <asp:Button ID="btnCancelaU" Text="Cancelar"  runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false"/>
                </div>
                    </div>
            </li>
            <li>
                <h2>Cambios en Existencias</h2>
                   <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sAcomplete" ></span>
                        <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="35px" Width="75%" placeholder="Producto:" BackColor="Beige" AutoPostBack="True" class="form-control" aria-describedby="sAcomplete"/>
                          <%-- <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                        MinimumPrefixLength="2" UseContextKey="True"
                        TargetControlID="TextBox1" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>--%>
                    </div>

                </div>
                <br />
                   <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sSus" ></span>
                        <asp:TextBox ID="txtSustanciaE" runat="server" class="form-control" aria-describedby="sSus" ForeColor="Black" Height="35px" Width="22%" placeholder="Sustancia/Nombre:" BackColor="Beige" Enabled="false" />
                       
                    </div>

                </div>
                <br />
                   <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sTipoe" ></span>
                          <asp:TextBox ID="txtTipoE" runat="server" ForeColor="Black" Height="35px" Width="10%" placeholder="Tipo:" BackColor="Beige" Enabled="false" class="form-control"  aria-describedby="sTipoe"/>

                    </div>

                </div>
                <br />
                   <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sCantE" ></span>
                        <asp:TextBox ID="txtCantidadE" runat="server" ForeColor="Black" Height="35px" Width="10%" placeholder="Cantidad:" BackColor="Beige" Enabled="false" class="form-control" aria-describedby="sCantE"/>
                        
                    </div>

                </div>
                <br />
                   <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sExisE" ></span>
                        <asp:TextBox ID="txtExisE" runat="server" ForeColor="Black" Height="35px" Width="11%" placeholder="Existencia:" BackColor="Beige" Enabled="false" class="form-control" aria-describedby="sExisE"/>
                    </div>

                </div>
                <br />
                   <div class="row">  
                    <div class="input-group">
                        <span class="input-group-addon" id="sCostoe" ></span>
                        <asp:TextBox ID="txtCostoE" runat="server" ForeColor="Black" Height="35px" Width="7%" placeholder="Costo:" BackColor="Beige" Enabled="false" class="form-control" aria-describedby="sCostoe"/>
                    </div>

                </div>
                <br />
                  <div class="row">
                    <div class="btn-group">
                        <asp:Button ID="btnActualizaE" Text="Actualizar Producto" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false"/>
                        <asp:Button ID="btnCancelaE" Text="Cancelar"  runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false"/>
                </div>
                    </div>
            </li>
            <li>
                <h2>Reportes</h2>
                <div class="row">
                     <div class="col-sm-4 col-xs-12" style="text-align: center;">
            <div class="form-inline" style="padding: 4px;">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon" style="color:White;">
                            Fecha Inicial:
                        </div>
                        <div class="btn-group" style="width: 100%">
                            <asp:TextBox runat="server" ID="datepicker" Style="width: 100%" class="btn btn-default btn-lg sandbox-container" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="col-sm-4 col-xs-12" style="text-align: center;">
            <div class="form-inline" style="padding: 4px;">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon" style="color:White;">
                            Fecha Final:
                        </div>
                        <div class="btn-group" style="width: 100%">
                            <asp:TextBox runat="server" ID="datepicker1" Style="width: 100%" class="btn btn-default btn-lg sandbox-container" />
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
                        <asp:Button ID="btnReporte" Text="Generar Reporte" runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false"/>
                        <asp:Button ID="btnCancelaReporte" Text="Cancelar"  runat="server" type="button" class="btn btn-default dropdown-toggle" aria-haspopup="true" aria-expanded="false"/>
                </div>
                </div>
            </li>

        </ul>
    </div>
                      </div>
            </div>
        </div>
        <script>
          
            $(document).ready(function () {
                $("ul#tabs li").click(function (e) {
                    if (!$(this).hasClass("active")) {
                        var tabNum = $(this).index();
                        var nthChild = tabNum + 1;
                        $("ul#tabs li.active").removeClass("active");
                        $(this).addClass("active");
                        $("ul#tab li.active").removeClass("active");
                        $("ul#tab li:nth-child(" + nthChild + ")").addClass("active");
                    }
                });
            });
        </script>
    </form>
    
</body>
</html>
