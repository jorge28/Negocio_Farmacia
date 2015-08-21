using RS_ProyectoFarmacia.Business;
using RS_ProyectoFarmacia.Business.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewAdmin : System.Web.UI.Page
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
        {
            cargaddlCat();
            cargaddlTipo();
            PanelExis.Visible = false;
            PanelProd.Visible = false;
            PanelRepo.Visible = false;
            PanelUsua.Visible = false;
        }


       
    }
    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);
    }
    protected void btnAltaProd_Click(object sender, EventArgs e)
    {
        PanelExis.Visible = false;
        PanelProd.Visible = true;
        PanelRepo.Visible = false;
        PanelUsua.Visible = false;
    }
    protected void btnAltaUsua_Click(object sender, EventArgs e)
    {
        PanelExis.Visible = false;
        PanelProd.Visible = false;
        PanelRepo.Visible = false;
        PanelUsua.Visible = true;
    }
    protected void btnExis_Click(object sender, EventArgs e)
    {
        PanelExis.Visible = true;
        PanelProd.Visible = false;
        PanelRepo.Visible = false;
        PanelUsua.Visible = false;
    }
    protected void btnReportes_Click(object sender, EventArgs e)
    {
        PanelExis.Visible = false;
        PanelProd.Visible = false;
        PanelRepo.Visible = true;
        PanelUsua.Visible = false;
    }
    public void cargaddlCat()
    {
        BusProductos bprod = new BusProductos();
        ddlCategoria.DataTextField = "Nombre_Categoria";
        ddlCategoria.DataValueField = "Id_Categoria";
        ddlCategoria.DataSource = bprod.ObtenerCatB();
        ddlCategoria.DataBind();

    }
    public void cargaddlTipo()
    {
        BusProductos bprod = new BusProductos();
        ddlTipo.DataTextField = "Nombre_Tipo";
        ddlTipo.DataValueField = "Id_Tipo";
        ddlTipo.DataSource = bprod.ObtenerTipoB();
        ddlTipo.DataBind();

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy HH:mm");
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            EntProductos eprod = new EntProductos();
            //List<EntProductos> InsertaProd = new List<EntProductos>();
            eprod.Nombre_Producto = txtProducto.Text;
            eprod.Sustancia = txtSustancia.Text;
            eprod.IdCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
            eprod.IdTipo = Convert.ToInt32(ddlTipo.SelectedValue);
            eprod.Cantidad = txtCantidad.Text;
            eprod.Existencia = Convert.ToInt32(txtExistencia.Text);
            eprod.Costo = Convert.ToDouble(txtPrecio.Text);

            BusProductos bprod = new BusProductos();
            bprod.InsertaProducto(eprod);





        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAdmin.aspx");
    }
    protected void btnGuardarU_Click(object sender, EventArgs e)
    {
        try
        {
            EntUsuarios eusua = new EntUsuarios();

            eusua.NombreUsuario = txtNombre.Text;
            eusua.ApellidoPaterno = txtApaterno.Text;
            eusua.ApellidoMaterno = txtAmaterno.Text;
            eusua.Direccion = txtDireccion.Text;
            eusua.Telefono = txtTel.Text;
            eusua.Celular = txtCel.Text;
            eusua.Usuario = txtUsua.Text;
            eusua.Contraseña = txtPass.Text;

            BusUsuarios busua = new BusUsuarios();




        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }
    }
    protected void btnCancelaU_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAdmin.aspx");
    }

    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        try
        {
            Label2.Text = TextBox1.Text;
            Session["Prod"] = Label2.Text;

            BusProductos obj = new BusProductos();
            EntProductos prod = new EntProductos();

            prod = (obj.ObtenerProd(Session["Prod"].ToString()));

            if (Session["Prod"].ToString() == prod.Sustancia)
            {
                TextBox2.Text = prod.Nombre_Producto;
            }
            else
            {
                TextBox2.Text = prod.Sustancia;
            }

            if (prod.Existencia == 0)
            {
                txtTipo.Text = prod.Tipo;
                TextBox3.Text = prod.Cantidad;
                TextBox4.Text = "Existencia:" + prod.Existencia.ToString();
                txtCosto.Text = prod.Costo.ToString("C");
                txtCate.Text = prod.Categoria.ToString();

                TextBox4.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                txtTipo.Text = prod.Tipo;
                TextBox3.Text = prod.Cantidad;
                TextBox4.Text = "Existencia:" + prod.Existencia.ToString();
                txtCosto.Text = prod.Costo.ToString("C");
                txtCate.Text = prod.Categoria.ToString();

                TextBox4.ForeColor = System.Drawing.Color.Black;
            }

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

}