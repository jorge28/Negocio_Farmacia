using Managment.Business;
using Managment.Business.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VentasEmp1 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            EntUsuarios usua = new EntUsuarios();
            usua = (EntUsuarios)Session["Login"];

            lblEmpleado.Text = usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno;

            BusProductos obj = new BusProductos();
            EntUltimoCliente ultimo = new EntUltimoCliente();
            ultimo = obj.SelectUltimoCliente(usua.Id_Usuario);
            if (ultimo.Fecha.Day != DateTime.Now.Day)
            {
                lblNumCliente.Text = "1";
            }
            else
            {
                int cliente = ultimo.Venta_Num_Cliente;
                lblNumCliente.Text = Convert.ToString(cliente + 1);
            }
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMMM/yyyy HH:mm");
    }

    [WebMethod]
    public static string BusquedaProductos()
    {
        List<EntProductosBuscador> productos = new List<EntProductosBuscador>();
        productos = new BusProductos().Obtener();

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(productos);
        return sJson;
    }

    [WebMethod]
    public static void InsertaVentas(string idProducto, string nombreProducto, string piezasVendidas, string costoUnitario, string costoTotal, string numCliente, string costoTotalVenta)
    {
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)HttpContext.Current.Session["Login"];

        BusProductos obj = new BusProductos();
        List<EntProductosVentas> listaProdVenta = new List<EntProductosVentas>();
        EntProductosVentas ent = new EntProductosVentas();

        ent.UsuarioId = usua.Id_Usuario;
        ent.NombreUsuario = usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno;
        ent.FechaAlta = DateTime.Now;
        ent.NumCliente = Convert.ToInt32(numCliente);
        ent.ProductoId = Convert.ToInt32(idProducto);
        ent.NombreProducto = nombreProducto;
        ent.PiezasVendidas = Convert.ToInt32(piezasVendidas);
        ent.CostoUnitario = Convert.ToDouble(costoUnitario);
        ent.CostoTotal = Convert.ToDouble(costoTotal);

        listaProdVenta.Add(ent);
        obj.InsertVentas(listaProdVenta);

        BusBitacora obj2 = new BusBitacora();
        obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 1, "Ventas", "VENTAS FARMACIA : " + DateTime.Now + " Venta por un Costo Total de: " + costoTotalVenta + " Cliente: " + numCliente);
    }

    [WebMethod]
    public static string SelectVentasEmpleadosNEW() 
    {
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)HttpContext.Current.Session["Login"];

        List<EntTotales> totales = new List<EntTotales>();
        totales = new BusReportes().SelectVentasEmpleadosNEW(usua.Id_Usuario);

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(totales);
        return sJson;       
    }

    [WebMethod]
    public static string SelectVentasMedicoNEW()
    {
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)HttpContext.Current.Session["Login"];

        List<EntVentasMedico> ventas = new List<EntVentasMedico>();
        ventas = new BusReportes().SelectVentasMedicoNEW(usua.Id_Usuario);

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(ventas);
        return sJson;
    }
       
}