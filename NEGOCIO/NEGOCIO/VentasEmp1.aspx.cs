using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RS_ProyectoFarmacia.Business;
using RS_ProyectoFarmacia.Business.Entity;
using System.Data;

public partial class Ventas : System.Web.UI.Page
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
            Session["Productos"] = new List<EntProductos>();

            BusProductos obj = new BusProductos();
            EntUltimoCliente ultimo = new EntUltimoCliente();
            ultimo = obj.SelectUltimoCliente(usua.Id_Usuario);
            if (ultimo.Fecha.Day != DateTime.Now.Day)
            {
                lnlNumCliente.Text = "1";
            }
            else
            {
                int cliente = ultimo.Venta_Num_Cliente;
                lnlNumCliente.Text = Convert.ToString(cliente + 1);
            }
        }
    }

    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);
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

            else if (producto.Categoria == "Medico")
            {
                hfMedico.Value = Convert.ToString((hfMedico.Value == "" ? 0 : Convert.ToDouble(hfMedico.Value)) + producto.TotalVentaProd);
                txtSubMedico.Text = Convert.ToDouble(hfMedico.Value).ToString("C");
            }

            hfTotal.Value = Convert.ToString((hfMedi.Value == "" ? 0 : Convert.ToDouble(hfMedi.Value)) + (hfPerf.Value == "" ? 0 : Convert.ToDouble(hfPerf.Value)) + (hfOtro.Value == "" ? 0 : Convert.ToDouble(hfOtro.Value)) + (hfMedico.Value == "" ? 0 : Convert.ToDouble(hfMedico.Value)));
            txtTotal.Text = Convert.ToDouble(hfTotal.Value).ToString("C");


            //txtTotal.Value = Convert.ToDouble(hfTotal.Value).ToString("C");

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
              bool piezas;

            piezas = IsNumeric(txtPiezasV.Text);
            if (piezas == true)
            {
                BusProductos obj = new BusProductos();
                EntProductos prod = (obj.ObtenerProd(Session["Prod"].ToString()));

                if (string.IsNullOrEmpty(TextBox1.Text))
                {
                    TextBox1.Focus();
                    throw new ApplicationException("Ingrese un Producto en el Buscador.");
                }
                else if (string.IsNullOrEmpty(txtPiezasV.Text))
                {
                    txtPiezasV.Focus();
                    throw new ApplicationException("Ingrese las piezas a Vender.");
                }
                else if (Convert.ToInt32(txtPiezasV.Text) > prod.Existencia)
                {
                    throw new ApplicationException("No hay Existencias Suficientes: 'Verifique'");
                }
                else
                {
                    CargarGvProd(Session["Prod"].ToString());
                    gvResBus.Visible = true;
                    Session["Prod"] = "";
                    TextBox1.Text = "";
                    txtSustancia.Text = "";
                    txtTipo.Text = "";
                    txtCantidad.Text = "";
                    txtExistencia.Text = "";
                    txtCosto.Text = "";
                    txtPiezasV.Text = "";
                    txtCate.Text = "";
                    txtIngreso.Text = "";
                    txtCambio.Text = "";
                    txtPiezasV.BackColor = System.Drawing.Color.Beige;
                    btnCancelar.Enabled = true;
                }
            }
            else
            {
                throw new SystemException("Debe ingresar valores numericos.");
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

            if (prod.Existencia == 0)
            {
                txtTipo.Text = prod.Tipo;
                txtCantidad.Text = prod.Cantidad;
                txtExistencia.Text = "Existencia:" + prod.Existencia.ToString();
                txtCosto.Text = prod.Costo.ToString("C");
                txtCate.Text = prod.Categoria.ToString();
                txtPiezasV.BackColor = System.Drawing.Color.White;
                txtPiezasV.Text = "";
                txtExistencia.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                txtTipo.Text = prod.Tipo;
                txtCantidad.Text = prod.Cantidad;
                txtExistencia.Text = "Existencia:" + prod.Existencia.ToString();
                txtCosto.Text = prod.Costo.ToString("C");
                txtCate.Text = prod.Categoria.ToString();
                txtPiezasV.BackColor = System.Drawing.Color.White;
                txtPiezasV.Text = "";
                txtExistencia.ForeColor = System.Drawing.Color.Black;
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

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy HH:mm");
    }

    protected void lnkEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            int fila = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string Producto = gvResBus.DataKeys[fila].Values["Nombre_Producto"].ToString();
            string Sustancia = gvResBus.DataKeys[fila].Values["Sustancia"].ToString();
            string totalventaProd = gvResBus.DataKeys[fila].Values["TotalVentaProd"].ToString();
            string Categoria = gvResBus.DataKeys[fila].Values["Categoria"].ToString();

            if (Categoria == "Medicamento")
            {
                hfMedi.Value = Convert.ToString((hfMedi.Value == "" ? 0 : Convert.ToDouble(hfMedi.Value)) - (totalventaProd == "" ? 0 : Convert.ToDouble(totalventaProd)));
                txtSubtMedi.Text = Convert.ToDouble(hfMedi.Value).ToString("C");
            }
            else if (Categoria == "Perfumeria")
            {
                hfPerf.Value = Convert.ToString((hfPerf.Value == "" ? 0 : Convert.ToDouble(hfPerf.Value)) - (totalventaProd == "" ? 0 : Convert.ToDouble(totalventaProd)));
                txtSubtFarm.Text = Convert.ToDouble(hfPerf.Value).ToString("C");
            }
            else if (Categoria == "Otros")
            {
                hfOtro.Value = Convert.ToString((hfOtro.Value == "" ? 0 : Convert.ToDouble(hfOtro.Value)) - (totalventaProd == "" ? 0 : Convert.ToDouble(totalventaProd)));
                txtSubtOtro.Text = Convert.ToDouble(hfOtro.Value).ToString("C");
            }
            else if (Categoria == "Medico")
            {
                hfMedico.Value = Convert.ToString((hfMedico.Value == "" ? 0 : Convert.ToDouble(hfMedico.Value)) - (totalventaProd == "" ? 0 : Convert.ToDouble(totalventaProd)));
                txtSubMedico.Text = Convert.ToDouble(hfMedico.Value).ToString("C");
            }

            hfTotal.Value = Convert.ToString((hfMedi.Value == "" ? 0 : Convert.ToDouble(hfMedi.Value)) + (hfPerf.Value == "" ? 0 : Convert.ToDouble(hfPerf.Value)) + (hfOtro.Value == "" ? 0 : Convert.ToDouble(hfOtro.Value)) + (hfMedico.Value == "" ? 0 : Convert.ToDouble(hfMedico.Value)));
            txtTotal.Text = Convert.ToDouble(hfTotal.Value).ToString("C");

            txtIngreso.Text = "";
            txtCambio.Text = "";

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
        Response.Redirect("Default.aspx");
    }

    protected void txtIngreso_TextChanged(object sender, EventArgs e)
    {
        try
        {
            bool ingreso;

            ingreso = IsNumeric(txtIngreso.Text);
            if (ingreso == true)
            {

                double Cambio = 0;
                Cambio = Convert.ToDouble(Convert.ToDouble(txtIngreso.Text == "" ? "0" : txtIngreso.Text) - Convert.ToDouble(txtTotal.Text == "" ? "0" : txtTotal.Text.Replace("$", "")));
                txtCambio.Text = Cambio.ToString("C");
                if (Cambio >= 0.0)
                    txtCambio.ForeColor = System.Drawing.Color.Blue;
                else
                    txtCambio.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                throw new SystemException("Debe ingresar valores numericos.");
            }
        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtTotal.Text == "$0.00" || txtTotal.Text.Replace("$", "") == "")
                throw new SystemException("No hay operación a Cancelar.");
            else
            {
                List<EntProductosVentas> listaProdCancelacion = new List<EntProductosVentas>();
                EntUsuarios usua = new EntUsuarios();
                usua = (EntUsuarios)Session["Login"];
                int cont = 0;

                foreach (GridViewRow row in gvResBus.Rows)
                {
                    Label lblIdProducto = (Label)gvResBus.Rows[cont].FindControl("lblIDProducto");
                    Label lblProducto = (Label)gvResBus.Rows[cont].FindControl("lblProducto");
                    Label lblPiezas = (Label)gvResBus.Rows[cont].FindControl("lblPiezas");
                    Label lblCosto = (Label)gvResBus.Rows[cont].FindControl("lblCosto");
                    Label lblTotalVentaProd = (Label)gvResBus.Rows[cont].FindControl("lblTotalVentaProd");

                    listaProdCancelacion.Add(new EntProductosVentas { UsuarioId = usua.Id_Usuario, NombreUsuario = usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, FechaAlta = DateTime.Now, NumCliente = Convert.ToInt32(lnlNumCliente.Text), ProductoId = Convert.ToInt32(lblIdProducto.Text), NombreProducto = lblProducto.Text, PiezasVendidas = Convert.ToInt32(lblPiezas.Text), CostoUnitario = Convert.ToDouble(lblCosto.Text.Replace("$", "")), CostoTotal = Convert.ToDouble(lblTotalVentaProd.Text.Replace("$", "")) });

                    cont = cont + 1;
                }

                BusProductos obj = new BusProductos();
                obj.InsertCancelaciones(listaProdCancelacion);

                BusBitacora obj2 = new BusBitacora();
                obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 3, "Cancelacion", "CANCELACIONES FARMACIA : " + DateTime.Now + " Cancelacion por un Costo Total de: " + txtTotal.Text + " Ingresando: " + "$" + txtIngreso.Text + " Cambio: " + txtCambio.Text + " Cliente: " + lnlNumCliente.Text);


                Session["Productos"] = new List<EntProductos>();
                Session["Prod"] = "";
                hfMedico.Value = "";
                hfMedi.Value = "";
                hfOtro.Value = "";
                hfPerf.Value = "";
                hfTotal.Value = "";
                TextBox1.Text = "";
                txtSustancia.Text = "";
                txtTipo.Text = "";
                txtCantidad.Text = "";
                txtExistencia.Text = "";
                txtCosto.Text = "";
                txtPiezasV.Text = "";
                txtCate.Text = "";
                gvResBus.Visible = false;
                txtSubtFarm.Text = "";
                txtSubMedico.Text = "";
                txtSubtMedi.Text = "";
                txtSubtOtro.Text = "";
                txtTotal.Text = "";
                txtIngreso.Text = "";
                txtCambio.Text = "";
                btnCancelar.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {

            if (txtTotal.Text == "$0.00" || txtTotal.Text.Replace("$", "") == "")
                throw new SystemException("No hay operación a Guardar.");
            else if ((txtTotal.Text != "$0.00" || txtTotal.Text != "") && (txtIngreso.Text == "$0.00" || txtIngreso.Text == ""))
            {
                txtIngreso.Focus();
                throw new SystemException("Debe ingresar Dinero para cobro.");
            }
            else
            {
                List<EntProductosVentas> listaProdVenta = new List<EntProductosVentas>();
                EntUsuarios usua = new EntUsuarios();
                usua = (EntUsuarios)Session["Login"];
                int cont = 0;

                foreach (GridViewRow row in gvResBus.Rows)
                {
                    Label lblIdProducto = (Label)gvResBus.Rows[cont].FindControl("lblIDProducto");
                    Label lblProducto = (Label)gvResBus.Rows[cont].FindControl("lblProducto");
                    Label lblPiezas = (Label)gvResBus.Rows[cont].FindControl("lblPiezas");
                    Label lblCosto = (Label)gvResBus.Rows[cont].FindControl("lblCosto");
                    Label lblTotalVentaProd = (Label)gvResBus.Rows[cont].FindControl("lblTotalVentaProd");

                    listaProdVenta.Add(new EntProductosVentas { UsuarioId = usua.Id_Usuario, NombreUsuario = usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno , FechaAlta = DateTime.Now, NumCliente = Convert.ToInt32(lnlNumCliente.Text), ProductoId = Convert.ToInt32(lblIdProducto.Text), NombreProducto = lblProducto.Text, PiezasVendidas = Convert.ToInt32(lblPiezas.Text), CostoUnitario = Convert.ToDouble(lblCosto.Text.Replace("$", "")), CostoTotal = Convert.ToDouble(lblTotalVentaProd.Text.Replace("$", "")) });

                    cont = cont + 1;
                }

                BusProductos obj = new BusProductos();
                obj.InsertVentas(listaProdVenta);

                BusBitacora obj2 = new BusBitacora();
                obj2.InsertBitacoraFarmacia(usua.Id_Usuario, usua.NombreUsuario + " " + usua.ApellidoPaterno + " " + usua.ApellidoMaterno, DateTime.Now, 1, "Ventas", "VENTAS FARMACIA : " + DateTime.Now + " Venta por un Costo Total de: " + txtTotal.Text + " Ingresando: " + "$" + txtIngreso.Text + " Cambio: " + txtCambio.Text + " Cliente: " + lnlNumCliente.Text);

                Session["Productos"] = new List<EntProductos>();
                Session["Prod"] = "";
                hfMedico.Value = "";
                hfMedi.Value = "";
                hfOtro.Value = "";
                hfPerf.Value = "";
                hfTotal.Value = "";
                TextBox1.Text = "";
                txtSustancia.Text = "";
                txtTipo.Text = "";
                txtCantidad.Text = "";
                txtExistencia.Text = "";
                txtCosto.Text = "";
                txtPiezasV.Text = "";
                txtCate.Text = "";
                gvResBus.Visible = false;
                txtSubtFarm.Text = "";
                txtSubMedico.Text = "";
                txtSubtMedi.Text = "";
                txtSubtOtro.Text = "";
                txtTotal.Text = "";
                txtIngreso.Text = "";
                txtCambio.Text = "";
                btnCancelar.Enabled = false;

                int ProxNumCliente =
                ProxNumCliente = Convert.ToInt32(lnlNumCliente.Text) + 1;
                lnlNumCliente.Text = ProxNumCliente.ToString();
            }
        }
        catch (Exception ex)
        {

            mostrarMensaje(ex.Message);
        }        
    }

    protected void lnkTota_Click(object sender, EventArgs e)
    {
        EntUsuarios usua = new EntUsuarios();
        usua = (EntUsuarios)Session["Login"];

        Session["IdUsuario"] = usua.Id_Usuario;
        Response.Redirect("ReporteTotalesEmpleados.aspx");
    }
}