using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RS_ProyectoFarmacia.Business;
using RS_ProyectoFarmacia.Business.Entity;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy");
    }

    protected void lnkEntrarVentas_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtUsuarioVenta.Text) || string.IsNullOrEmpty(txtContraseñaVenta.Text))
            {
                throw new ApplicationException("Debe ingresar Usuario y Contraseña :(");
            }


            EntUsuarios usua = new EntUsuarios();
            usua.Usuario = txtUsuarioVenta.Text.Trim();
            usua.Contraseña = txtContraseñaVenta.Text.Trim();
            EntUsuarios log = new BusUsuarios().SelectEmpleado(usua.Usuario, usua.Contraseña);
            if (log == null)
                throw new ApplicationException("Usuario y/o Contraseña incorrecta :(");
            Session["LoginEmpleado"] = log;
            Response.Redirect("VentasEmp1.aspx");

        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }

    protected void lnkEntrarAdmon_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtUsuarioAdmon.Text) || string.IsNullOrEmpty(txtContraseñaAdmon.Text))
            {
                throw new ApplicationException("Debe ingresar Usuario y Contraseña :(");
            }

            EntUsuarios usua = new EntUsuarios();
            usua.Usuario = txtUsuarioAdmon.Text.Trim();
            usua.Contraseña = txtContraseñaAdmon.Text.Trim();
            EntUsuarios log = new BusUsuarios().SelectAdmon (usua.Usuario, usua.Contraseña);
            if (log == null)
                throw new ApplicationException("Usuario y/o Contraseña incorrecta :(");
            Session["LoginAdmon"] = log;
            Response.Redirect("Inventarios.aspx");

        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }


}