<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Estrella de la Mañana</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Control de inventarios e interfaces para ventas." />
    <meta name="author" content="Jorge Romero Olguin" />
    <meta name="keywords" content="" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/skel.min.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
    </noscript>
</head>

<body background="img/wall5.jpg">
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <br />
            <br />
            <br />
            <div class="container" id="top">
                <div class="row">
                    <div class="4u" style="text-align: center">
                        <span class="me image image-full">
                            <img src="img/star.png" alt="" /></span>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                                </asp:Timer>
                                <asp:Label ID="lblFecha" runat="server" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:LinkButton ID="lnkRecContraseña" runat="server" Style="color: blue">Recuperar/Cambiar Contraseña</asp:LinkButton>
                        <asp:Panel ID="pnlCamCont" runat="server" Style="display: none; width: 100%;" CssClass="modalPopup">
                            <asp:Panel ID="pnlDatosCamCont" runat="server">
                                <div style="text-align: center; background-color: Gray; color: Yellow; font-size: medium;">
                                    Recuperar/Cambiar Contraseña                                    
                                    <asp:TextBox ID="txtUsuarioCC" runat="server" PlaceHolder="Usuario:" BackColor="White"></asp:TextBox><br />
                                    <asp:TextBox ID="txtPalabraSecreta" runat="server" PlaceHolder="Palabra Secreta:" BackColor="White"></asp:TextBox><br />
                                    <asp:TextBox ID="txtNuevaCont" runat="server" PlaceHolder="Nueva Contraseña:" BackColor="White"></asp:TextBox><br />
                                    <asp:TextBox ID="txtConfirmarCont" runat="server" PlaceHolder="Confirmar Nueva Contraseña:" BackColor="White"></asp:TextBox><br />
                                </div>
                            </asp:Panel>
                            <div style="background-color: blue; text-align: center;">
                                <asp:Panel ID="Panel5" runat="server" BackColor="Blue" Height="60px" HorizontalAlign="Center">
                                    <asp:LinkButton ID="lnkGuardarNuevaCont" runat="server" Style="color: yellow" OnClick="lnkGuardarNuevaCont_Click">Guardar</asp:LinkButton><br />                                    
                                    <asp:LinkButton ID="lnlCancelarNuevaCOnt" runat="server" Style="color: yellow">Cancelar</asp:LinkButton>
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                        <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="lnkRecContraseña"
                            PopupControlID="pnlCamCont" BackgroundCssClass="modalBackground" CancelControlID="lnlCancelarNuevaCOnt" DropShadow="true" PopupDragHandleControlID="pnlDatosCamCont" />
                    </div>
                    <div class="8u">
                        <div class="header">
                            <h1>¡ Hola ! Bienvenido a<br />
                                <br />
                                <strong>Estrella de la Mañana</strong>.</h1>
                        </div>
                        <p style="color: #000000">Para inciar el registro de tus Ventas da Click en "Empleados". Si eres nuestro administrador da Click en "Administración". Excelente Día.</p>
                        <asp:LinkButton ID="lnkVentas" runat="server" class="button button-big">Empleados</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp                             
                            <asp:Panel ID="pnlLoginVentas" runat="server" Style="display: none" CssClass="modalPopup">
                                <asp:Panel ID="pnlDatosLoginVentas" runat="server">
                                    <div style="text-align: center; background-color: Gray; color: Yellow; font-size: medium;">
                                        Acceso "Empleado"
                                        <asp:TextBox ID="txtUsuarioVenta" runat="server" PlaceHolder="Usuario:" BackColor="White"></asp:TextBox><br />
                                        <asp:TextBox ID="txtContraseñaVenta" runat="server" TextMode="Password" PlaceHolder="Contraseña:" BackColor="White"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                                <div style="background-color: blue; text-align: center;">
                                    <asp:Panel ID="Panel1" runat="server" BackColor="Blue" Height="60px" HorizontalAlign="Center">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="lnkEntrarVentas" runat="server" Style="color: yellow" OnClick="lnkEntrarVentas_Click">Entrar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton ID="lnkCancelarVentas" runat="server" Style="color: yellow">Cancelar</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </asp:Panel>
                                </div>
                            </asp:Panel>
                        <asp:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="lnkVentas"
                            PopupControlID="pnlLoginVentas" BackgroundCssClass="modalBackground" CancelControlID="lnkCancelarVentas" DropShadow="true" PopupDragHandleControlID="pnlDatosLoginVentas" />

                        <asp:LinkButton ID="lnkAdmon" runat="server" class="button button-big">Administración</asp:LinkButton>
                        <asp:Panel ID="pnlLoginAdmon" runat="server" Style="display: none" CssClass="modalPopup">
                            <asp:Panel ID="pnlDatosLoginAdmon" runat="server">
                                <div style="text-align: center; background-color: Gray; color: Yellow; font-size: medium;">
                                    Acceso "Administrador"
                                      <asp:TextBox ID="txtUsuarioAdmon" runat="server" PlaceHolder="Usuario:" BackColor="White"></asp:TextBox><br />
                                    <asp:TextBox ID="txtContraseñaAdmon" runat="server" TextMode="Password" PlaceHolder="Contraseña:" BackColor="White"></asp:TextBox>
                                </div>
                            </asp:Panel>
                            <div style="background-color: blue; text-align: center;">
                                <asp:Panel ID="Panel2" runat="server" BackColor="Blue" Height="60px" HorizontalAlign="Center">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:LinkButton ID="lnkEntrarAdmon" runat="server" Style="color: yellow" OnClick="lnkEntrarAdmon_Click">Entrar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:LinkButton ID="lnkCancelarAdmon" runat="server" Style="color: yellow">Cancelar</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="lnkAdmon"
                            PopupControlID="pnlLoginAdmon" BackgroundCssClass="modalBackground" CancelControlID="lnkCancelarAdmon" DropShadow="true" PopupDragHandleControlID="pnlDatosLoginAdmon" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <br />
    <div class="footer">
        <p id="copyright" style="text-align: center">
            &copy; 2015 BusinessControl. Todos los derechos reservados. <a href="Default.aspx">Estrella de la Mañana</a> by <a href="#">ROMA-SYSTEMS</a>
        </p>
    </div>
</body>
</html>
