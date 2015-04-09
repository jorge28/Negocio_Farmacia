using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RS_ProyectoFarmacia.Business;
using RS_ProyectoFarmacia.Business.Entity;

public partial class Ventas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            string prod = TextBox1.Text;
            CargarGvProd(prod);
            TextBox1.Text = "";

        }
        if (!IsPostBack)
        {
          

        }

    }

    public void CargarGvProd(string prod)
    {
        BusProductos obj = new BusProductos();
        gvResBus.DataSource = obj.ObtenerProd(prod);
        gvResBus.DataBind();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        List<EntProductos> pers = new List<EntProductos>();
        List<string> producto_Buscado = new List<string>();
        pers = new BusProductos().Obtener();

        foreach (EntProductos per in pers)
        {
            string prod = per.Nombre_Producto;
            string sust = per.Sustancia;
            producto_Buscado.Add(prod);
            producto_Buscado.Add(sust);
        }

        string[] pates = producto_Buscado.ToArray();

        return (from m in pates where m.StartsWith(prefixText, StringComparison.CurrentCultureIgnoreCase) select m).Take(count).ToArray();
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy HH:mm:ss");
    }
}