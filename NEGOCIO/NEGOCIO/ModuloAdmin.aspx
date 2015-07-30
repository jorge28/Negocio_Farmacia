<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModuloAdmin.aspx.cs" Inherits="ModuloAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    

    <link href="StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    
     <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
    </noscript>

</head>
    <body background="img/wall5.jpg">
        <form runat="server">
            <br />
            <br />
<div class="container">

	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1" style="color:white;font-family:'Comic Sans MS';font-size:larger;font-weight:bold">Alta de Productos</li>
		<li class="tab-link" data-tab="tab-2" style="color:white;font-family:'Comic Sans MS';font-size:larger;font-weight:bold">Alta de Usuario</li>
		<li class="tab-link" data-tab="tab-3" style="color:white;font-family:'Comic Sans MS';font-size:larger;font-weight:bold">Existencias</li>
		<li class="tab-link" data-tab="tab-4" style="color:white;font-family:'Comic Sans MS';font-size:larger;font-weight:bold">Reportes</li>
	</ul>

	<div id="tab-1" class="tab-content current">
        <br />
		<div class="row">
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Producto:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtProducto" placeholder="Nombre del Producto" class="btn btn-default btn-lg" style="width:110%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
    <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Sustancia:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:TextBox runat="server" ID="txtSustancia" placeholder="Nombre de la Sustancia" class="btn btn-default btn-lg" style="width:125%" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
        <br />
        <div class="row">
            <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Categoria:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:DropDownList runat="server" ID="ddlCategoria" class="btn btn-default btn-lg" style="width:200px">
                           
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
            <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Tipo:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:DropDownList runat="server" ID="ddlTipo" class="btn btn-default btn-lg" style="width:200px">
                           
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
        <br />
        <div class="row">
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Existencia:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtExistencia" placeholder="No.existente" class="btn btn-default btn-lg" style="width:50%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
    <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Precio:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:TextBox runat="server" ID="txtCosto" placeholder="Precio" class="btn btn-default btn-lg" style="width:50%" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
        <br />
        <br />
        <div class="row">
    <div class="col-xs-6" style="text-align:right;">
        <asp:Button Text="G U A R D A R" runat="server" ID="btnGuardar" class="btn btn-success btn-lg"/>
    </div>
    <div class="col-xs-6" style="text-align:center;">
        <asp:Button Text="C A N C E L A R" runat="server" ID="btnExportar" class="btn btn-warning btn-lg"/>
    </div>
</div>
	</div>
	<div id="tab-2" class="tab-content">
        <br />
		<div class="row">
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Nombre:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtNomUsua" placeholder="Nombre de Usuario" class="btn btn-default btn-lg" style="width:110%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
    <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Apellido Paterno:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:TextBox runat="server" ID="txtApaterno" placeholder="Paterno" class="btn btn-default btn-lg" style="width:125%" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Apellido Materno:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtAmaterno" placeholder="Materno" class="btn btn-default btn-lg" style="width:110%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
</div>
        <br />
        <div class="row">
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Usuario:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtUsuario" placeholder="Usuario" class="btn btn-default btn-lg" style="width:110%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
    <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Contraseña:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:TextBox runat="server" ID="txtContraseña" placeholder="Contraseña" class="btn btn-default btn-lg" style="width:125%" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
        <br />
        <div class="row">
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Direccion:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Direccion" class="btn btn-default btn-lg" style="width:400%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
    
    
</div>
        <br />
        <div class="row">
    <div class="col-sm-4 col-xs-12" style="text-align:center;">
      <div class="form-inline" style="padding:4px">
        <div class="form-group" >
            <div class="input-group">
                <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                 Telefono:
                </div>
                <div class="btn-group" style="width:100%">
                    <asp:TextBox runat="server" ID="txtTel" placeholder="No.Telefonico" class="btn btn-default btn-lg" style="width:110%" />
                </div>  
            </div>
        </div>
       </div>
    </div>
    <div class="col-sm-4 col-xs-12" style="text-align: center;">
        <div class="form-inline" style="padding:4px">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" style="color:White;background-color:#ff6a00">
                    Celular:
                    </div>
                    <div class="btn-group" style="width:100%">
                        <asp:TextBox runat="server" ID="txtCelular" placeholder="No.Celular" class="btn btn-default btn-lg" style="width:125%" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
        <br />
        <br />
        <div class="row">
    <div class="col-xs-6" style="text-align:right;">
        <asp:Button Text="G U A R D A R" runat="server" ID="Button1" class="btn btn-success btn-lg"/>
    </div>
    <div class="col-xs-6" style="text-align:center;">
        <asp:Button Text="C A N C E L A R" runat="server" ID="Button2" class="btn btn-warning btn-lg"/>
    </div>
</div>
	</div>
	<div id="tab-3" class="tab-content">
        hoola que tal
		    </div>
                
	<div id="tab-4" class="tab-content">
		Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	</div>

</div><!-- container -->
        </form>
        <script type="text/javascript">
            $(document).ready(function () {

                $('ul.tabs li').click(function () {
                    var tab_id = $(this).attr('data-tab');

                    $('ul.tabs li').removeClass('current');
                    $('.tab-content').removeClass('current');

                    $(this).addClass('current');
                    $("#" + tab_id).addClass('current');
                })

            })
        </script>
        
    </body>
    
</html>

