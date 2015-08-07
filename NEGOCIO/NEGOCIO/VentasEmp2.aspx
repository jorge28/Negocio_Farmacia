<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp2.aspx.cs" Inherits="VentasEmp2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%--<html>
<head>
    <title>VentasEmp2</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
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
    <!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><script src="js/html5shiv.js"></script><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
    <!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
</head>
<body bgcolor="#ffcc66">
    <form id="form1" method="post" action="#" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div>
        <div>
            <article class="container" id="ventas">
                <header>
                <div class="4u">
                    <h2 style="text-align:left; font-size:medium">Empleado 2</h2>
                </div>
                <div class="4u" style="text-align:center">
                <asp:Label ID="lblCliente" runat="server" Font-Size="Large" Text="Cliente #" ForeColor="Blue"></asp:Label>
                </div>
                <div class="4u" style="text-align:right">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                               <ContentTemplate>
                                 <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
                                 </asp:Timer>
                                 <asp:Label ID="lblFecha" runat="server" Font-Size="Medium" ForeColor="Black"></asp:Label>
                               </ContentTemplate>
                             </asp:UpdatePanel>    
                </div>  
                <div class="12u">
                 <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="35px" placeholder="Producto:" BackColor="Beige" />
                </div>
                <div class="row half">
                </div>                         
                </header>
                <div>
                    <div class="row">
                        <div class="12u">
                       
                                <div>
                                    <div class="row half">                                                                 
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />                                                        
                                </div>                    
                        </div>
                    </div>
                    
                </div>
                <footer>
                    <div class="12u" style="text-align:right">
                   <span style="color:Black">Subtotal Medicamento: $</span>
                    <asp:TextBox ID="txtSubtMedi" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />                 
                   <span style="color:Black">Subtotal Farmacia: $</span>
                    <asp:TextBox ID="txtSubtFarm" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />              
                   <span style="color:Black">Subtotal Otros: $</span>
                    <asp:TextBox ID="txtSubtOtro" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="35px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige"></asp:TextBox><br />                
                   <span style="color:Black">------------------------------</span><br />
                   <span style="color:Black; font-size:x-large">Total: $</span>
                    <asp:TextBox ID="txtTotal" runat="server" Text="0000.00" Enabled="false" Width="100px" Height="50px" ForeColor="Black" BorderWidth="1px" BorderColor="Black" BackColor="Beige" Font-Size="Large"></asp:TextBox><br />     
                   </div>                   
                   <div class="6u" style="text-align:left"><br />
                    <asp:LinkButton ID="lnkTota" runat="server" style="color:Blue; font-size:x-large">Totales</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="lnkReve" runat="server" style="color:Blue; font-size:x-large">Reverso</asp:LinkButton>
                   </div>
                   <div class="6u" style="text-align:right"><br />
                    <asp:LinkButton ID="lnkLimp" runat="server" style="color:Blue; font-size:x-large" href="#" class="form-button-reset">Cancelar</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="lnkGuar" runat="server" style="color:Blue; font-size:x-large">Guardar</asp:LinkButton>
                   </div>
                </footer>
            </article>
        </div>
    </div>
    </form>
</body>
</html>--%>

<%--<html>
<head> SUMA DE 2 NUMEROS</head>
<body>
<script>
function fncSumar(){
caja=document.forms["sumar"].elements;
var numero1 = Number(caja["numero1"].value);
var numero2 = Number(caja["numero2"].value);
resultado=numero1+numero2;
if(!isNaN(resultado)){
caja["resultado"].value=numero1+numero2;
}
}
</script>
<form method="post" name="sumar">

Primer numero: <input type="text" name="numero1" size="2" onKeyUp="fncSumar()"/>
Segundo numero: <input type="text" name="numero2" size="2" onKeyUp="fncSumar()"/>
Resultado: <input type="text" name="resultado"/>
</form>
</body>
</html>--%>

 <html>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<body>

<div data-ng-app="" data-ng-init="quantity=1;price=5">

<h2>Cost Calculator</h2>

Quantity: <input type="number" ng-model="quantity">
Price: <input type="number" ng-model="price">
 
<p><b>Total in dollar:</b> {{quantity * price}}</p>
<input type="number" value="{{quantity * price}}">
</div>

</body>
</html> 
