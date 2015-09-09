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
            Response.Redirect("Default.aspx");
        }
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)Session["Login"];

        lblEmpleado.Text = usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno;
        if (!IsPostBack)
        {
            cargaddlCat();
            cargaddlTipo();
            cargaddlCatE();
            cargaddlTipoE();
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
    public void cargaddlCatE()
    {
        BusProductos bprod = new BusProductos();
        ddlCatE.DataTextField = "Nombre_Categoria";
        ddlCatE.DataValueField = "Id_Categoria";
        ddlCatE.DataSource = bprod.ObtenerCatB();
        ddlCatE.DataBind();

    }
    public void cargaddlTipoE()
    {
        BusProductos bprod = new BusProductos();
        ddlTipoE.DataTextField = "Nombre_Tipo";
        ddlTipoE.DataValueField = "Id_Tipo";
        ddlTipoE.DataSource = bprod.ObtenerTipoB();
        ddlTipoE.DataBind();

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy HH:mm");
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        bool lbExis;
        bool lbCosto;
        try
        {
            lbCosto = IsNumeric(txtPrecio.Text);
            if (lbCosto == true)
            {
                lbExis = IsNumeric(txtExistencia.Text);
                if (lbExis == true)
                {
                    if (ddlCategoria.SelectedValue != "0")
                    {
                        if (ddlTipo.SelectedValue != "0")
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

                            BusBitacora obj2 = new BusBitacora();
                            EntUsuarios usua = new EntUsuarios();
                            obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 4, "AltaNuevoProducto", "ALTA DE PRODUCTO : " + DateTime.Now + "Producto: " + txtProducto.Text + " Existencia: " + txtExistencia.Text + " Costo: " + txtPrecio.Text);

                            txtProducto.Text = "";
                            txtSustancia.Text = "";
                            ddlCategoria.SelectedValue = "0";
                            ddlTipo.SelectedValue = "0";
                            txtCantidad.Text = "";
                            txtExistencia.Text = "";
                            txtPrecio.Text = "";
                        }

                        else
                        {
                            throw new SystemException("No ha seleccionado el Tipo de Medicamento");
                        }
                    }
                    else
                    {
                        throw new SystemException("No ha seleccionado la Categoria del Medicamento");
                    }
                }
                else
                {
                    throw new SystemException("Solo se admiten valores numericos en numeros de existencia");
                }
            }
            else
            {
                throw new SystemException("Solo se admiten valores numericos en el costo del producto");
            }

        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }

    }
    private bool IsNumeric(string num)
    {
        try
        {
            double x = Convert.ToDouble(num);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        txtProducto.Text = "";
        txtSustancia.Text = "";
        ddlCategoria.SelectedValue = "0";
        ddlTipo.SelectedValue = "0";
        txtCantidad.Text = "";
        txtExistencia.Text = "";
        txtPrecio.Text = "";
    }
    protected void btnGuardarU_Click(object sender, EventArgs e)
    {
        bool lbTel;
        bool lbCel;
        try
        {
            lbTel = IsNumeric(txtTel.Text);
            if (lbTel == true)
            {
                lbCel = IsNumeric(txtCel.Text);
                if (lbCel == true)
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
                    eusua.Pregunta_Secreta = txtPregunta.Text;

                    BusUsuarios busua = new BusUsuarios();
                    busua.InsertaUsuario(eusua);

                    BusBitacora obj2 = new BusBitacora();
                    EntUsuarios usua = new EntUsuarios();
                    obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 7, "AltaNuevoEmpleado", "ALTA DE USUARIO : " + DateTime.Now + "Nuevo Usuario: " + eusua.NombreUsuario + " " + eusua.ApellidoPaterno + " " + eusua.ApellidoMaterno + " como Empleado para Ventas ");

                    txtNombre.Text = "";
                    txtApaterno.Text = "";
                    txtAmaterno.Text = "";
                    txtDireccion.Text = "";
                    txtTel.Text = "";
                    txtCel.Text = "";
                    txtUsua.Text = "";
                    txtPass.Text = "";
                    txtPregunta.Text = "";
                }
                else
                {
                    throw new SystemException("Solo se admiten valores numericos en el numero Celular");
                }
            }
            else
            {
                throw new SystemException("Solo se admiten valores numericos en el numero Telefonico");
            }
        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }

    }
    protected void btnCancelaU_Click(object sender, EventArgs e)
    {
        txtNombre.Text = "";
        txtApaterno.Text = "";
        txtAmaterno.Text = "";
        txtDireccion.Text = "";
        txtTel.Text = "";
        txtCel.Text = "";
        txtUsua.Text = "";
        txtPass.Text = "";
        txtPregunta.Text = "";


    }

    protected void txtBuscadorE_TextChanged1(object sender, EventArgs e)
    {
        try
        {
            Label2.Text = txtBuscadorE.Text;
            Session["Prod"] = Label2.Text;

            BusProductos obj = new BusProductos();
            EntProductos prod = new EntProductos();

            prod = (obj.ObtenerProd(Session["Prod"].ToString()));

            if (Session["Prod"].ToString() == prod.Sustancia)
            {
                txtSustaciaE.Text = prod.Nombre_Producto;
            }
            else
            {
                txtSustaciaE.Text = prod.Sustancia;
            }

            if (prod.Existencia == 0)
            {
                txtProdE.Text = prod.Nombre_Producto.ToString();
                hfIdProductoE.Value = Convert.ToString(prod.Id_Producto);
                ddlCatE.SelectedValue = Convert.ToString(prod.IdCategoria);
                ddlCatE.Enabled = false;
                txtCantidadE.Text = prod.Cantidad;
                txtExistenciaE.Text = prod.Existencia.ToString();
                txtCostoE.Text = prod.Costo.ToString("C");
                ddlTipoE.SelectedValue = Convert.ToString(prod.IdTipo);
                ddlTipoE.Enabled = false;
                txtExistenciaE.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                txtProdE.Text = prod.Nombre_Producto.ToString();
                hfIdProductoE.Value = Convert.ToString(prod.Id_Producto);
                ddlCatE.SelectedValue = Convert.ToString(prod.IdCategoria);
                txtCantidadE.Text = prod.Cantidad;
                txtExistenciaE.Text = prod.Existencia.ToString();
                txtCostoE.Text = prod.Costo.ToString("C");
                ddlTipoE.SelectedValue = Convert.ToString(prod.IdTipo);

                txtExistenciaE.ForeColor = System.Drawing.Color.Black;
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

    protected void btnCancelarE_Click(object sender, EventArgs e)
    {
        try
        {
            txtBuscadorE.Text = "";
            txtSustaciaE.Text = "";
            ddlCatE.SelectedValue = "0";
            ddlTipoE.SelectedValue = "0";
            txtCantidadE.Text = "";
            txtExistenciaE.Text = "";
            txtCostoE.Text = "";
            txtPiezasAgregar.Text = "";
            txtPiezasDescontar.Text = "";
            txtCostoNuevo.Text = "";
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void btnActualizarE_Click(object sender, EventArgs e)
    {
        try
        {

            EntUsuarios usua = new EntUsuarios();
            usua = (EntUsuarios)Session["Login"];


            if (ddlCatE.SelectedValue == "0" && ddlTipoE.SelectedValue == "0")
            {
                throw new SystemException("favor de seleccionar categoria y tipo");
            }
            else
            {
                string piezasAgregar;
                string piezasDescontar;
                string costoNuevo;
                piezasAgregar = string.IsNullOrEmpty(txtPiezasAgregar.Text) ? "0" : txtPiezasAgregar.Text;
                piezasDescontar = string.IsNullOrEmpty(txtPiezasDescontar.Text) ? "0" : txtPiezasDescontar.Text;
                costoNuevo = string.IsNullOrEmpty(txtCostoNuevo.Text) ? "0" : txtCostoNuevo.Text;
                BusProductos obj = new BusProductos();
                obj.updateProducto(Convert.ToInt32(hfIdProductoE.Value), Convert.ToInt32(piezasAgregar), Convert.ToInt32(piezasDescontar), Convert.ToDouble(costoNuevo));
                ActualizaExtraProducto();

                BusBitacora obj2 = new BusBitacora();
                obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 5, "ActualizacionProducto", "ACTUALIZACION PRODUCTO : " + DateTime.Now + "Producto: " + txtBuscadorE.Text + " Existencia: " + txtExistenciaE.Text + " Piezas Agregadas: " + txtPiezasAgregar.Text + " Piezas Descontar: " + txtPiezasDescontar.Text + " Costo Actual: " + txtCostoE.Text + " Costo Nuevo: $" + txtCostoNuevo.Text);

                txtBuscadorE.Text = "";
                txtProdE.Text = "";
                txtSustaciaE.Text = "";
                ddlCatE.SelectedValue = "0";
                ddlTipoE.SelectedValue = "0";
                txtCantidadE.Text = "";
                txtExistenciaE.Text = "";
                txtCostoE.Text = "";
                txtPiezasAgregar.Text = "";
                txtPiezasDescontar.Text = "";
                txtCostoNuevo.Text = "";

                txtProdE.Enabled = false;
                txtSustaciaE.Enabled = false;
                ddlCatE.Enabled = false;
                ddlTipoE.Enabled = false;
                txtCantidadE.Enabled = false;
                txtExistenciaE.Enabled = false;
                txtCostoE.Enabled = false;
                txtPiezasAgregar.Text = "";
                txtPiezasDescontar.Text = "";
                txtCostoNuevo.Text = "";
            }

        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }

    }
    protected void lnkReportePedido_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReportePedidoProductos.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtProdE.Enabled = true;
        txtProdE.BackColor = System.Drawing.Color.White;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtSustaciaE.Enabled = true;
        txtSustaciaE.BackColor = System.Drawing.Color.White;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        ddlCatE.Enabled = true;
        ddlCatE.BackColor = System.Drawing.Color.White;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        ddlTipoE.Enabled = true;
        ddlTipoE.BackColor = System.Drawing.Color.White;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        txtCantidadE.Enabled = true;
        txtCantidadE.BackColor = System.Drawing.Color.White;
    }
    public void ActualizaExtraProducto()
    {
        string prod = txtProdE.Text;
        string sust = txtSustaciaE.Text;
        string cat = ddlCatE.SelectedValue;
        string tipo = ddlTipoE.SelectedValue;
        string cant = txtCantidadE.Text;
        int id = Convert.ToInt32(hfIdProductoE.Value);

        BusProductos bs = new BusProductos();
        bs.updateExProducto(prod, sust, cat, tipo, cant, id);


    }
}