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
}