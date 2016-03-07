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

    }
    [WebMethod]
    public static string BuscaProducto() {

        List<EntProductos> productos = new List<EntProductos>();
    //productos = new BusProductos().BuscaProductos1();

    JavaScriptSerializer oSerializer = new JavaScriptSerializer();
    string sJson = oSerializer.Serialize(productos);
    return sJson;
    }
}