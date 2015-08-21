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
}