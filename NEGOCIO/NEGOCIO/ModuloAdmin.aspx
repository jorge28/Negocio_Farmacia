<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModuloAdmin.aspx.cs" Inherits="ModuloAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
     <script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
 <body onload="javascript:cambiarPestanna(pestanas,pestana1);" />
      <%--<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>--%>

        <div class="contenedor">
            <div class="titulo">Bienvenida!!</div>
            <div id="pestanas">
                <ul id=lista>
                    <li id="pestana1"><a href='javascript:cambiarPestanna(pestanas,pestana1);'>Alta de Producto</a></li>
                    <li id="pestana2"><a href='javascript:cambiarPestanna(pestanas,pestana2);'>Alta Usuario</a></li>
                    <li id="pestana3"><a href='javascript:cambiarPestanna(pestanas,pestana3);'>Existencias</a></li>
                    <li id="pestana4"><a href='javascript:cambiarPestanna(pestanas,pestana4);'>Reportes</a></li>
                    
            </div>
            
            
       
            <div id="contenidopestanas">
                <div id="cpestana1">
                  <div class="modal-dialog" style="width:1300px;height:400px">
                                <div class="modal-content" style="width:1352px;">
                                    <div class="modal-header" >
                                     
                                        
                                    </div>
                                    <div class="modal-body" >
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                 Detalle Pagos a Gestor
<div>Del Periodo:
                                                <asp:Label ID="lblfi" runat="server" Text="Label"></asp:Label>
     &nbsp;al&nbsp; <asp:Label ID="lblff" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            </div>
                                            
                                            <div class="panel-body" >
                                         <asp:GridView ID="gvDetallePagoxServicio" runat="server"  AutoGenerateColumns="False" 
            EnableModelValidation="True" 
            Font-Names="Arial Unicode MS" Font-Size="X-Small"
            style="margin-bottom: 0px;"   CssClass="table table-hover table-responsive">
            <Columns>
                <asp:TemplateField HeaderText="No. de Servicio">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Servicio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Servicio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo de Servicio">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("Servicio_NomServicio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Bind("Servicio_NomServicio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contrato/Cliente">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("Cliente")%>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cliente")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Regional">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("region")%>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("region")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gestor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("gestor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("gestor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo de Atencion">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("tipo_atencion") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("tipo_atencion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Honorarios">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("pago_Honorarios") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("PagoHonorarios") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario que Requisito">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("USUARIO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("USUARIO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de Requisición">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("FECHAREGISTRO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("FECHAREGISTRO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gastos Requisitados">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" 
                            Text='<%# Bind("GastosReq") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" 
                            Text='<%# Bind("GastosReq") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gastos Comprobados">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" 
                            Text='<%# Bind("GastosComp") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("GastosComp") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gastos No Comprobados">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" 
                            Text='<%# Bind("gastosNoComprobados") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" 
                            Text='<%# Bind("gastosNoComprobados") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fondo Solicitado">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" 
                            Text='<%# Bind("FondoSol") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("FondoSol") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fondeo Comprobado">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" 
                            Text='<%# Bind("FondeoCom") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("FondeoCom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Diferencia">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("diferencia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("diferencia") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reembolso">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("reembolso") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("reembolso") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total a Pagar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox17"  runat="server" Text='<%# Bind("MontoTotalaPagar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("MontoTotalaPagar") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle Font-Size="Small" />
         <HeaderStyle BackColor="#8EC640" HorizontalAlign="Center" ForeColor="White" />
        </asp:GridView>
                                            </div>
                                        </div>
                                        
                                        
                                       
                                    </div>
                                </div>
                            </div>
                <div id="cpestana2">
                    El nombre hojas de estilo en cascada viene del inglés Cascading Style Sheets, del que toma sus siglas. CSS es un lenguaje usado para definir la presentación de un documento estructurado escrito en HTML o XML2 (y por extensión en XHTML). El W3C (World Wide Web Consortium) es el encargado de formular la especificación de las hojas de estilo que servirán de estándar para los agentes de usuario o navegadores.
                </div>
                <div id="cpestana3">
                    JavaScript es un lenguaje de programación interpretado, dialecto del estándar ECMAScript. Se define como orientado a objetos,3 basado en prototipos, imperativo, débilmente tipado y dinámico.
                </div>
                <div id="cpestana4">
                    PHP es un lenguaje de programación de uso general de script del lado del servidor originalmente diseñado para el desarrollo web de contenido dinámico. Fue uno de los primeros lenguajes de programación del lado del servidor que se podían incorporar directamente en el documento HTML en lugar de llamar a un archivo externo que procese los datos. El código es interpretado por un servidor web con un módulo de procesador de PHP que genera la página Web resultante. PHP ha evolucionado por lo que ahora incluye también una interfaz de línea de comandos que puede ser usada en aplicaciones gráficas independientes. PHP puede ser usado en la mayoría de los servidores web al igual que en casi todos los sistemas operativos y plataformas sin ningún costo.
                </div>
               
            </div>
        </div>
    

    <script type="text/javascript">
        // Dadas la division que contiene todas las pestañas y la de la pestaña que se 
        // quiere mostrar, la funcion oculta todas las pestañas a excepcion de esa.
        function cambiarPestanna(pestannas, pestanna) {

            // Obtiene los elementos con los identificadores pasados.
            pestanna = document.getElementById(pestanna.id);
            listaPestannas = document.getElementById(pestannas.id);

            // Obtiene las divisiones que tienen el contenido de las pestañas.
            cpestanna = document.getElementById('c' + pestanna.id);
            listacPestannas = document.getElementById('contenido' + pestannas.id);

            i = 0;
            // Recorre la lista ocultando todas las pestañas y restaurando el
            // padding de las pestañas.
            while (typeof listacPestannas.getElementsByTagName('div')[i] != 'undefined') {
                $(document).ready(function () {
                    $(listacPestannas.getElementsByTagName('div')[i]).css('display', 'none');
                    $(listaPestannas.getElementsByTagName('li')[i]).css('padding-bottom', '');
                });
                i += 1;
            }

            $(document).ready(function () {
                // Muestra el contenido de la pestaña pasada como parametro a la funcion,
                // cambia el color de la pestaña y aumenta el padding para que tape el  
                // borde superior del contenido que esta juesto debajo y se vea de este 
                // modo que esta seleccionada.
                $(cpestanna).css('display', '');
                $(pestanna).css('padding-bottom', '2px');
            });

        }
    </script>
</html>

