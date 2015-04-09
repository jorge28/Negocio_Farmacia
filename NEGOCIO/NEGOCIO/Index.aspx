<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Estrella de la mañana</title>
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
<body bgcolor="#58D3F7" >
   
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <br />
            <br />
            <br />
            <article class="container" id="top">                     
					<div class="row"> 
						<div class="4u" style="text-align:center">                                        
							<span class="me image image-full"><img src="img/star.png" alt="" /></span>       
                            <br />
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                               <ContentTemplate>
                                 <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                                 </asp:Timer>
                                 <asp:Label ID="lblFecha" runat="server" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
                               </ContentTemplate>
                             </asp:UpdatePanel>                                                                                                            
		            	</div>             
						<div class="8u">
							<header>
								<h1>Bienvenido a<br /><br /><strong>Estrella de la Mañana</strong>.</h1>
							</header>
							<p style="color: #000000">Controlar tu negocio es muy sencillo, si deseas ir a la pagina donde tus empleados registren sus ventas solo da clic en "Ventas", o si deseas hacer modificaciones entra en "Administración".</p>
							
                            <asp:linkbutton ID="lnkVentas" runat="server" class="button button-big">Ventas</asp:linkbutton>&nbsp&nbsp&nbsp&nbsp&nbsp
                            
                              <asp:Panel ID="Panel1" runat="server" Style="display: none" CssClass="modalPopup">
                                <asp:Panel ID="Panel3" runat="server" >
                                  <div style="text-align:center; background-color:Gray; color:Yellow; font-size:xx-large;">
                                    Seleccione el Empleado                                 
                                  </div>                                     
                                </asp:Panel>                                
                                  <div style="background-color:White">               
                                     <p style="text-align: center;"><br />
                                      <a href="VentasEmp1.aspx" style="color:Blue" >Empleado 1</a><br />
                                      <a href="VentasEmp2.aspx" style="color:Blue" >Empleado 2</a>                                                                       
                                     </p>
                                      <div style="background-color:Yellow">
                                    <p style="text-align: center;">
                                   <asp:LinkButton ID="lnkCancelar" runat="server" style="color:Blue" >Cancelar</asp:LinkButton>
                                   </p>
                                   </div>            
                                   </div>     
                                                                  
                              </asp:Panel>
                     <asp:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="lnkVentas"
                       PopupControlID="Panel1" BackgroundCssClass="modalBackground" CancelControlID="lnkCancelar" DropShadow="true" PopupDragHandleControlID="Panel3" />

                            <asp:LinkButton ID="lnkAdmon" runat="server" class="button button-big">Administración</asp:LinkButton>  
                            
                            <asp:Panel ID="Panel2" runat="server" Style="display: none" CssClass="modalPopup">
                                <asp:Panel ID="Panel4" runat="server" >
                                  <div style="text-align:center; background-color:Gray; color:Yellow; font-size:medium;">
                                  Ingresar Datos
                                    <asp:TextBox ID="txtUsuario" runat="server" PlaceHolder="Usuario:" BackColor="White"></asp:TextBox><br />
                                    <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" PlaceHolder="Contraseña:" BackColor="White"></asp:TextBox>    
                                  </div>                                     
                                </asp:Panel>                                
                                  <div style="background-color:Yellow">               
                                     <p style="text-align: center;">
                                      <asp:LinkButton ID="lnkEntrar" runat="server" style="color:Blue">Entrar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                      <asp:LinkButton ID="lnkCancelar2" runat="server" style="color:Blue">Cancelar</asp:LinkButton><br />
                                      <asp:LinkButton ID="lnkCambCont" runat="server" Font-Size="Medium" style="color:Blue">Cambiar Contraseña</asp:LinkButton>
                                           
                                             
                                     </p>
                                      <asp:Panel ID="Panel5" runat="server" Style="display: none" CssClass="modalPopup">
                                                 <asp:Panel ID="Panel6" runat="server" >
                                                   <div style="text-align:center; background-color:Gray; color:Yellow; font-size:medium;">
                                                       Cambiar Contraseña
                                                       <asp:TextBox ID="txtContAnte" runat="server" TextMode="Password" PlaceHolder="Contraseña Anterior:" BackColor="White"></asp:TextBox><br />
                                                       <asp:TextBox ID="txtContNuev" runat="server" TextMode="Password" PlaceHolder="Contraseña Nueva:" BackColor="White"></asp:TextBox> 
                                                       <asp:TextBox ID="txtConfNuev" runat="server" TextMode="Password" PlaceHolder="Confirmar Contraeña:" BackColor="White"></asp:TextBox>    
                                                   </div>                                     
                                                 </asp:Panel>                                
                                                   <div style="background-color:Yellow">               
                                                     <p style="text-align: center;">
                                                       <asp:LinkButton ID="lnkGuar" runat="server" style="color:Blue">Guardar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                                       <asp:LinkButton ID="lnkCanc3" runat="server" style="color:Blue">Cancelar</asp:LinkButton><br />                                                     
                                                     </p>
                                                   </div>                                                                 
                                             </asp:Panel>
                                                  <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="lnkCambCont"
                                                   PopupControlID="Panel5" BackgroundCssClass="modalBackground" CancelControlID="lnkCanc3" DropShadow="true" PopupDragHandleControlID="Panel6" />
                                   </div>                                                                 
                              </asp:Panel>
                     <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="lnkAdmon"
                       PopupControlID="Panel2" BackgroundCssClass="modalBackground" CancelControlID="lnkCancelar2" DropShadow="true" PopupDragHandleControlID="Panel4" />
                                                
						</div>
                        
					</div>                    
				</article>
        </div>
    </form>

    <footer>
						<p id="copyright" style="text-align:center">
							&copy; 2015 BusinessControl. Todos los derechos reservados. <a href="Index.aspx">Estrella de la Mañana</a> by <a href="#">ROMA-SYSTEMS</a>
						</p>
					</footer>
</body>
</html>
