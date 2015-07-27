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
    
     <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
    </noscript>

</head>
    <body>
 <body onload="javascript:cambiarPestanna(pestanas,pestana1);" />
     <form id="form1" method="post" action="#" runat="server">
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
            
            
       
            <div id="contenidopestanas" >
                
                
                <div id="cpestana1" class="six columns">
                    
                    
          
   
      <label for="exampleEmailInput">Your email</label>
      <input class="u-full-width" type="email" placeholder="test@mailbox.com" id="exampleEmailInput">
    
                    
                        
                 

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
            </form>
    </body>
</html>

