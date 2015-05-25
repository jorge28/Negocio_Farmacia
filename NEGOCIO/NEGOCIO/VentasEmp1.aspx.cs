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
      
    if(!IsPostBack )

       
            Session["Productos"] = new List<EntProductos>();
   
    }

   

    public void CargarGvProd(string prod)
    {
        BusProductos obj = new BusProductos();
        List<EntProductos> productos = (List<EntProductos>)Session["Productos"];

        productos.Add(obj.ObtenerProd(prod));
        gvResBus.DataSource = productos;
        gvResBus.DataBind();
        Session["Productos"] = productos;
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
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        // string prod = TextBox1.Text;
        Label1.Text = TextBox1.Text;
        Label1.Visible = false;
        Session["Prod"] = Label1.Text;
        //  prod = TextBox1.Text;

        //CargarGvProd(Session["Prod"].ToString());
        //TextBox1.Text = "";      

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        CargarGvProd(Session["Prod"].ToString());

    }



}