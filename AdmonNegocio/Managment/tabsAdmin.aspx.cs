using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using Managment.Business.Entity;
using Managment.Business;

public partial class tabsAdmin : System.Web.UI.Page
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
                      
        }

    }
    [WebMethod]
    public static string GetCategoria() {

        List<EntDdlAlta> productos = new List<EntDdlAlta>();
        productos = new BusProductos().ObtenerCatB();

    JavaScriptSerializer oSerializer = new JavaScriptSerializer();
    string sJson = oSerializer.Serialize(productos);
    return sJson;
    }
    [WebMethod]
    public static string GetTipo()
    {

        List<EntDdlAlta> productos = new List<EntDdlAlta>();
        productos = new BusProductos().ObtenerTipoB();

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(productos);
        return sJson;
    }
    [WebMethod]
    public static void AgregaProducto(string prod, string sust, int cat, int tipo, string cant, int exis, double costo, string codigo)
    {
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)HttpContext.Current.Session["Login"];

        BusProductos bp = new BusProductos();
        bp.InsertaProducto(prod, sust, cat, tipo, cant, exis, costo, codigo);

        BusBitacora obj2 = new BusBitacora();
        obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 4, "AltaNuevoProducto", "ALTA NUEVO PRODUCTO : " + DateTime.Now + " Producto: " + prod + " Existencia: " + exis + " Costo: " + costo + " Código de Barras: " + codigo);
    }

    [WebMethod]
    public static void AgregaUsuario(string nombre, string paterno, string materno, string direccion, string tel, string cel, string usua, string pass, string pregunta) 
    {
        EntUsuarios usuario = new EntUsuarios();
        usuario = (EntUsuarios)HttpContext.Current.Session["Login"];  

        BusUsuarios bu = new BusUsuarios();
        bu.InsertaUsuario(nombre,paterno,materno,direccion,tel,cel,usua,pass,pregunta);

        BusBitacora obj2 = new BusBitacora();
        obj2.InsertBitacoraFarmacia(usuario.Id_Usuario, usuario.NombreUsuario + " " + usuario.ApellidoPaterno + " " + usuario.ApellidoMaterno, DateTime.Now, 7, "AltaNuevoUsuario", "ALTA NUEVO USUARIO : " + DateTime.Now + " Usuario: " + nombre + " " + paterno + " " + materno + " como Empleado para Ventas ");
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
    public static string SelectVentasEmpleados(string fechaVentas)
    {
        List<EntProductosVentas> productos = new List<EntProductosVentas>();
        productos = new BusReportes().SelectVentasEmpleados(fechaVentas);

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(productos);
        return sJson;
    }

    [WebMethod]
    public static string SelectExistenciasProducto(string piezas)
    {
        List<EntProductosPedido> productos = new List<EntProductosPedido>();
        productos = new BusReportes().SelectPedidoProductos(Convert.ToInt32(piezas));

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(productos);
        return sJson;
    }
}