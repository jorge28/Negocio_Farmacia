<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VentasEmp1.aspx.cs" Inherits="Ventas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>VentasEmp1</title>
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
<body bgcolor="#58D3F7">
    <form id="form1" method="post" action="#" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <div>
                <article class="container" id="ventas">
                <header>
                <div class="4u">
                    <h2 style="text-align:left; font-size:medium">Empleado 1</h2>
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
                 <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="35px" placeholder="Producto:" BackColor="Beige" AutoPostBack="True" />
                    <div></div>   
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                         MinimumPrefixLength="2" UseContextKey="True"
    TargetControlID="TextBox1" ServiceMethod="GetCompletionList"></asp:AutoCompleteExtender>                      
       <%-- <cc1:autocompleteextender ID="AutoCompleteExtender1" runat="server"  MinimumPrefixLength="2"
    UseContextKey="True"
    TargetControlID="TextBox1" ServiceMethod="GetCompletionList">
        </cc1:autocompleteextender>--%>
        <br />
        <asp:GridView ID="gvResBus" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="Nombre_Producto" HeaderText="Producto" />
                <asp:BoundField DataField="Sustancia" HeaderText="Sustancia" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                <asp:BoundField DataField="Existencia" HeaderText="Existencia" />
                <asp:BoundField DataField="Costo" HeaderText="Costo" />
                <asp:ButtonField Text="Eliminar" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
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
                    <%--<div class="row row-special">
                        <div class="12u">
                            <h3>Find me on ...</h3>
                            <ul class="social">
                                <li class="twitter"><a href="http://twitter.com/n33co" class="icon icon-twitter"><span>Twitter</span></a></li>
                                <li class="facebook"><a href="#" class="icon icon-facebook"><span>Facebook</span></a></li>
                                <li class="dribbble"><a href="http://dribbble.com/n33" class="icon icon-dribbble"><span>Dribbble</span></a></li>
                                <li class="linkedin"><a href="#" class="icon icon-linkedin"><span>LinkedIn</span></a></li>
                                <li class="tumblr"><a href="#" class="icon icon-tumblr"><span>Tumblr</span></a></li>
                                <li class="googleplus"><a href="#" class="icon icon-google-plus"><span>Google+</span></a></li>
                                <li class="github"><a href="http://github.com/n33" class="icon icon-github"><span>Github</span></a></li>
                                <!--
									<li class="rss"><a href="#" class="icon icon-rss"><span>RSS</span></a></li>
									<li class="instagram"><a href="#" class="icon icon-instagram"><span>Instagram</span></a></li>
									<li class="foursquare"><a href="#" class="icon icon-foursquare"><span>Foursquare</span></a></li>
									<li class="skype"><a href="#" class="icon icon-skype"><span>Skype</span></a></li>
									<li class="soundcloud"><a href="#" class="icon icon-soundcloud"><span>Soundcloud</span></a></li>
									<li class="youtube"><a href="#" class="icon icon-youtube"><span>YouTube</span></a></li>
									<li class="blogger"><a href="#" class="icon icon-blogger"><span>Blogger</span></a></li>
									<li class="flickr"><a href="#" class="icon icon-flickr"><span>Flickr</span></a></li>
									<li class="vimeo"><a href="#" class="icon icon-vimeo"><span>Vimeo</span></a></li>
									-->
                            </ul>
                        </div>
                    </div>--%>
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
</html>
