<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportePedidoProductos.aspx.cs" Inherits="ReportePedidoProductos" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
    <title></title>
</head>
<body background="img/wall9.png">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="header">
            <div class="col-md-4">
                <asp:Label ID="lblEmpleado" runat="server" Style="text-align: left; font-size: x-large;" ForeColor="DarkBlue" Text="Empleado 1"></asp:Label>
            </div>
            <div class="col-md-4" style="text-align: center">
                <asp:Label ID="Label1" Text="Pedido de Productos" runat="server" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>
            </div>
            <div class="col-md-4" style="text-align: right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                        </asp:Timer>
                        <asp:Label ID="lblFecha" runat="server" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>
                        <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-success close" BackColor="LightBlue" ForeColor="Black" Height="35px" Text="Regresar" OnClick="btnRegresar_Click"></asp:Button>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div>
            <CR:CrystalReportViewer ID="crPedidoProductos" runat="server" AutoDataBind="true" />
        </div>
    </form>
</body>
</html>
