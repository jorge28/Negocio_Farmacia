<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>
<html>
<head>
    <title>Estrella de la Mañana</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Pagina de Logueo" />
    <meta name="author" content="Jorge Romero Olguin" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body style="background-color: #EDEDF2;">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row " style="margin-top: 50px;">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading" style="background-color: #FAFAFA;">
                            <h3 style="color: black; text-align: center; margin-top: 0px; font: bold; font-family: webkit-body; color: darkgray;">Inicio de Sesión</h3>
                            <h2 style="color: black; text-align: center; margin-top: 0px; font: bold; font-family: webkit-body; color: darkgray;">¡¡¡ ESTRELLA DE LA MAÑANA !!!</h2>
                            <h4 style="color: black; text-align: center; margin-top: 0px; font: bold; font-family: webkit-body; color: darkgray;">Consultorio & Farmacia.</h4>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-6">
                                <section class="form-group-vertical">
                                    <div class="input-group input-group-icon">
                                        <span class="input-group-addon">
                                            <span class="icon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="txtUser" Title="Ingresa tu nombre de Usuario" AutoCompleteType="DisplayName" class="form-control" MaxLength="20" placeholder="Usuario" required="required" />
                                    </div>
                                    <br />
                                    <div class="input-group input-group-icon">
                                        <span class="input-group-addon">
                                            <span class="icon"><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="txtPass" class="form-control" Title="Ingresa tu Contraseña" MaxLength="20" type="password" placeholder="Contraseña" required="required" />
                                    </div>
                                </section>
                            </div>
                            <br />
                            <div style="text-align: center">
                                <asp:Button ID="btnEntarxs" runat="server" class="btn btn-lg btn-success" Style="background-color: #8EC640" ValidationGroup="loginxs" Text="Entrar" OnClick="btnEntarxs_Click"></asp:Button>
                            </div>
                            <div style="text-align: center">
                                <button type="button" id="NuevoPass" class="btn-link" style="font-size:xx-small" data-toggle="modal" data-target="#myModal">¿Olvido Contraseña?</button>
                            </div>
                        </div>
                        <div class="panel-footer" style="text-align: center">
                            <div class="logo" style="text-align: -webkit-center;">
                                <img src="imagenes/banner-medicina-general-jpg.jpg" class="img-responsive" />
                            </div>
                            <br />                            
                            <br />
                            <p style="text-align: center; font-family: 'webkit-body'; font-size: large; color: darkgray">
                                Administra tu negocio de una forma sencilla y clara.
                            <br />
                                Controla tus Ventas, Inventarios y Compras...
                            </p>
                            <p style="text-align: center; font-family: 'webkit-body'; font-size: small; color: darkgray">&copy; ROMA SYSTEMS.2015 BusinessManagment. Todos los derechos reservados. <a href="Default.aspx">Estrella de la Mañana</a> by <a href="#">ROMA-SYSTEMS</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
       <div class="modal-header">
        <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
        <h4 class="modal-title">Recuperar/Cambiar Contraseña</h4>
      </div>
      <div class="modal-body">
          <input type="text" id="txtUsuarioModal" required="required" name="txtUsuarioModal" class="form-control" placeholder="Usuario:" />
          <br />
          <input type="text" id="txtPalabraSecretaModal" required="required" name="txtPalabraSecretaModal" class="form-control" placeholder="Palabra Secreta:"/>
          <br />
          <input type="password" id="txtNuevaContraseñaModal"  required="required" name="txtNuevaContraseñaModal" class="form-control" placeholder="Nueva Contraseña:"/>
          <br />
          <input type="password" id="txtConfirmaContraseñaModal" required="required" name="txtConfirmaContraseñaModal" class="form-control" placeholder="Confirmar Contraseña:"/>
      </div>
      <div class="modal-footer">
          <div class="form-group">
              <div class="col-md-6">
                  <button type="button" id="btnGuardarNuevaContraseña" class="btn btn-primary">Guardar</button>
              </div>
              <div class="col-md-6">
                  <button type="button" id="btnCancelarModal" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
              </div>
          </div>
        
      </div>
    </div>
  </div>
</div>
        <script>
            $(document).ready(function () {
                function ValidaContenido() {
                    var usuarioModal = $('#txtUsuarioModal').val();
                    var palabraModal = $('#txtPalabraSecretaModal').val();
                    var NuevaModal = $('#txtNuevaContraseñaModal').val();
                    var ConfirmaModal = $('#txtConfirmaContraseñaModal').val();

                    if (usuarioModal == '' || palabraModal == '' || NuevaModal == '' || ConfirmaModal == '') {
                        alert('Debe ingresar todos los Datos :(');
                    }
                    else if (NuevaModal != ConfirmaModal) {
                        alert('Debe confirmar la misma contraseña a guardar :(');
                    }
                    else {
                        VerificaUsuayPalabra(usuarioModal, palabraModal, NuevaModal);
                    }

                }
                function VerificaUsuayPalabra(usuarioModal, palabraModal, nuevaModal) {
                    var validado;
                    var misDatos = '{}';
                    misDatos = '{"usuarioModal":"' + usuarioModal + '","palabraModal":"' + palabraModal + '"}';
                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/validaPalabra",
                        data: misDatos,
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            validado = $.parseJSON(msg.d);
                            if (validado == '0') {
                                alert('Usuario y/o Palabra invalidos :(');
                            }
                            else {
                                InsertaNuevaContraseña(usuarioModal, palabraModal, nuevaModal);
                            }
                        },
                        error: function (msg) {
                            alert('Error' + msg.responseText);
                        }

                    }); //fin de ajax
                }
                function InsertaNuevaContraseña(usua, palabra, pass) {
                    var misDatos = '{}';
                    misDatos = '{"usua":"' + usua + '","palabra":"' + palabra + '","pass":"' + pass + '"}';
                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/CambiaPass",
                        data: misDatos,
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            alert('Operacion Exitosa');
                            $('#txtUsuarioModal').val('');
                            $('#txtPalabraSecretaModal').val('');
                            $('#txtNuevaContraseñaModal').val('');
                            $('#txtConfirmaContraseñaModal').val('');
                        },
                        error: function (msg) {
                            alert('Error' + msg.responseText);
                        }

                    }); //fin de ajax
                }
                $('#btnGuardarNuevaContraseña').on("click", function () {
                    ValidaContenido();
                });
                $('#btnCancelarModal').on("click", function () {
                    $('#txtUsuarioModal').val('');
                    $('#txtPalabraSecretaModal').val('');
                    $('#txtNuevaContraseñaModal').val('');
                    $('#txtConfirmaContraseñaModal').val('');
                });
            });//fin del document ready
    </script>
</body>
</html>
