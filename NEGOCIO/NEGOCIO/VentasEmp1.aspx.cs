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
        if (Session["Login"] == null)
        {
            Response.Redirect("Index.aspx");
        }
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)Session["Login"];

        lblEmpleado.Text = usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno;

        if (!IsPostBack)

            Session["Productos"] = new List<EntProductos>();

    }

    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);
    }

    public void CargarGvProd(string prod)
    {
        try
        {

            BusProductos obj = new BusProductos();
            List<EntProductos> productos = (List<EntProductos>)Session["Productos"];


            productos.Add(obj.ObtenerProd(prod, txtPiezasV.Text));
            EntProductos producto = obj.ObtenerProd(prod, txtPiezasV.Text);
            gvResBus.DataSource = productos;
            gvResBus.DataBind();
            Session["Productos"] = productos;

            if (producto.Categoria == "Medicamento")
            {
                hfMedi.Value = Convert.ToString((hfMedi.Value == "" ? 0 : Convert.ToDouble(hfMedi.Value)) + producto.TotalVentaProd);
                txtSubtMedi.Text = Convert.ToDouble(hfMedi.Value).ToString("C");

            }
            else if (producto.Categoria == "Perfumeria")
            {
                hfPerf.Value = Convert.ToString((hfPerf.Value == "" ? 0 : Convert.ToDouble(hfPerf.Value)) + producto.TotalVentaProd);
                txtSubtFarm.Text = Convert.ToDouble(hfPerf.Value).ToString("C");
            }
            else if (producto.Categoria == "Otros")
            {
                hfOtro.Value = Convert.ToString((hfOtro.Value == "" ? 0 : Convert.ToDouble(hfOtro.Value)) + producto.TotalVentaProd);
                txtSubtOtro.Text = Convert.ToDouble(hfOtro.Value).ToString("C");
            }

            hfTotal.Value = Convert.ToString((hfMedi.Value == "" ? 0 : Convert.ToDouble(hfMedi.Value)) + (hfPerf.Value == "" ? 0 : Convert.ToDouble(hfPerf.Value)) + (hfOtro.Value == "" ? 0 : Convert.ToDouble(hfOtro.Value)));
            txtTotal.Text = Convert.ToDouble(hfTotal.Value).ToString("C");

        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                TextBox1.Focus();
                throw new ApplicationException("Ingrese un Producto en el Buscador.");
            }
            else if (string.IsNullOrEmpty(txtPiezasV.Text))
            {
                txtPiezasV.Focus();
                throw new ApplicationException("Engrese las piezas a Vender.");
            }
            else
            {
                CargarGvProd(Session["Prod"].ToString());
                TextBox1.Text = "";
                Session["Prod"] = "";
                txtSustancia.Text = "";
                txtTipo.Text = "";
                txtCantidad.Text = "";
                txtExistencia.Text = "";
                txtCosto.Text = "";
                txtPiezasV.Text = "";
                txtIngreso.Text = "";
                txtCambio.Text = "";
            }
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }

    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        try
        {
            Label1.Text = TextBox1.Text;
            Session["Prod"] = Label1.Text;

            BusProductos obj = new BusProductos();
            EntProductos prod = new EntProductos();

            prod = (obj.ObtenerProd(Session["Prod"].ToString()));

            if (Session["Prod"].ToString() == prod.Sustancia)
            {
                txtSustancia.Text = prod.Nombre_Producto;
            }
            else
            {
                txtSustancia.Text = prod.Sustancia;
            }

            txtTipo.Text = prod.Tipo;
            txtCantidad.Text = prod.Cantidad;
            txtExistencia.Text = "Existencia:" + prod.Existencia.ToString();
            txtCosto.Text = prod.Costo.ToString("C");

        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }


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

    protected void lnkEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            int fila = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string Producto = gvResBus.DataKeys[fila].Values["Nombre_Producto"].ToString();
            string Sustancia = gvResBus.DataKeys[fila].Values["Sustancia"].ToString();

            foreach (EntProductos ent in (List<EntProductos>)Session["Productos"])
            {
                if (ent.Nombre_Producto == Producto && ent.Sustancia == Sustancia)
                {
                    ((List<EntProductos>)Session["Productos"]).Remove(ent);
                    gvResBus.DataSource = ((List<EntProductos>)Session["Productos"]);
                    gvResBus.DataBind();
                    break;
                }
            }
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }

    protected void txtIngreso_TextChanged(object sender, EventArgs e)
    {
        try
        {
            double Cambio = 0;
            Cambio = Convert.ToDouble(Convert.ToDouble(txtIngreso.Text) - Convert.ToDouble(txtTotal.Text.Replace("$", "")));
            txtCambio.Text = Cambio.ToString("C");
            if (Cambio >= 0.0)
                txtCambio.ForeColor = System.Drawing.Color.Blue;
            else
                txtCambio.ForeColor = System.Drawing.Color.Red;
        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }
    }
}