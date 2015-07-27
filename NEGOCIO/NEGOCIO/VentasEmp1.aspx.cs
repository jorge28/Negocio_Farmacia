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

            productos.Add(obj.ObtenerProd(prod));
            gvResBus.DataSource = productos;
            gvResBus.DataBind();
            Session["Productos"] = productos;
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message );
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
            else
            {
                CargarGvProd(Session["Prod"].ToString());
                TextBox1.Text = "";
                Session["Prod"] = "";
            }
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
      
    }

    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text;
        Session["Prod"] = Label1.Text;

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
                if (ent.Nombre_Producto == Producto && ent.Sustancia == Sustancia )
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
    protected void txtPiezas_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txtPiezas = sender as TextBox;
            if (txtPiezas != null)
            {

                GridViewRow row = txtPiezas.NamingContainer as GridViewRow;
                int fila = Convert.ToInt32(gvResBus.DataKeys[row.RowIndex].Value);
                Label CostoMedi = (gvResBus.Rows[fila].FindControl("lblCosto")) as Label;
                Label Total = (gvResBus.Rows[fila].FindControl("lblTotalXProd")) as Label;
                double txtNumPiezas = Convert.ToDouble(txtPiezas.Text);
                double TotalGasto = Convert.ToDouble((CostoMedi.Text));
                Total.Text = (TotalGasto * txtNumPiezas).ToString();   
                
            }
            gvResBus.EditIndex = -1;
                    
              
        }
        catch (Exception ex)
        {            
            mostrarMensaje(ex.Message);
        }

    }
}