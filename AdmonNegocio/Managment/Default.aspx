<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>
<html>
<head>
    <title>Estrella de la Mañana</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Pagina de Logueo" />
    <meta name="author" content="Jorge Romero Olguin" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
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
                                            <span class="icon"><i class="fa fa-user"></i></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="txtUser" Title="Ingresa tu nombre de Usuario" AutoCompleteType="DisplayName" class="form-control" MaxLength="20" placeholder="Usuario" required="required" />
                                    </div>
                                    <br />
                                    <div class="input-group input-group-icon">
                                        <span class="input-group-addon">
                                            <span class="icon"><i class="fa fa-key"></i></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="txtPass" class="form-control" Title="Ingresa tu Contraseña" MaxLength="20" type="password" placeholder="Contraseña" required="required" />
                                    </div>
                                </section>
                            </div>
                            <br />
                            <div style="text-align: center">
                                <asp:Button ID="btnEntarxs" runat="server" class="btn btn-lg btn-success" Style="background-color: #8EC640" ValidationGroup="loginxs" Text="Entrar" OnClick="btnEntarxs_Click"></asp:Button>
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
</body>
</html>
