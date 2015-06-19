using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RS_ProyectoFarmacia.Business;
using RS_ProyectoFarmacia.Business.Entity;
using System.Data;
using RS_ProyectoFarmacia.Data;

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
            EntUsuarios log = new BusUsuarios().SelectUsuario(usua.Usuario, usua.Contraseña);
            if (log == null)
                throw new ApplicationException("Usuario y/o Contraseña incorrecta :(");

            int Nivel;
            DataTable dt = new DatUsuarios().SelectUsuario(usua.Usuario, usua.Contraseña);
            DataRow dr = dt.Rows[0];
            EntUsuarios nivel = new EntUsuarios();
            nivel.Nivel_Usuario = dr["Nivel_Usuario"].ToString();
            Nivel = Convert.ToInt32(nivel.Nivel_Usuario);

            if (Nivel == 3)
            {
                Session["Login"] = log;
                Response.Redirect("VentasEmp1.aspx");
            }
            else if (Nivel == 2)
            {
                Session["Login"] = log;
                Response.Redirect("VentasEmp1.aspx");
            }
            else if (Nivel == 1)
            {
                Session["Login"] = log;
                Response.Redirect("VentasEmp1.aspx");
            }
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
            EntUsuarios log = new BusUsuarios().SelectUsuario(usua.Usuario, usua.Contraseña);
            if (log == null)
                throw new ApplicationException("Usuario y/o Contraseña incorrecta :(");

            int Nivel;
            DataTable dt = new DatUsuarios().SelectUsuario(usua.Usuario, usua.Contraseña);
            DataRow dr = dt.Rows[0];
            EntUsuarios nivel = new EntUsuarios();
            nivel.Nivel_Usuario = dr["Nivel_Usuario"].ToString();
            Nivel = Convert.ToInt32(nivel.Nivel_Usuario);

            if (Nivel == 2)
            {
                Session["Login"] = log;
                Response.Redirect("Inventarios.aspx");
            }
            else if (Nivel == 1)
            {
                Session["Login"] = log;
                Response.Redirect("Inventarios.aspx");
            }
            else
                throw new ApplicationException("Usuario Sin Permisos para Administrar :(");
            

        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }


}