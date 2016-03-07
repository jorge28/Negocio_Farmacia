using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Managment.Business.Entity;
using Managment.Business;
using Managment.Data;


public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Login"] = null;

    }

    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);
    }  

    protected void btnEntarxs_Click(object sender, EventArgs e)
    {
        try
        {

            if (string.IsNullOrEmpty(txtUser.Text) || string.IsNullOrEmpty(txtPass.Text))
            {
                txtUser.Focus();
                txtPass.Text = "";
                txtUser.Text = "";
                throw new ApplicationException("Debe ingresar Usuario y Contraseña :(");

            }


            EntUsuarios usua = new EntUsuarios();
            usua.Usuario = txtUser.Text.Trim();
            usua.Contraseña = txtPass.Text.Trim();
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
                Response.Redirect("tabsAdmin.aspx");
            }
            else if (Nivel == 3)
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

    //protected void lnkGuardarNuevaCont_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (string.IsNullOrEmpty(txtUsuarioCC.Text) || string.IsNullOrEmpty(txtPalabraSecreta.Text) || string.IsNullOrEmpty(txtNuevaCont.Text) || string.IsNullOrEmpty(txtConfirmarCont.Text))
    //        {
    //            txtUsuarioCC.Focus();
    //            throw new ApplicationException("Debe ingresar todos los Datos :(");
    //        }
    //        else if (txtConfirmarCont.Text != txtNuevaCont.Text)
    //        {
    //            txtConfirmarCont.Focus();
    //            throw new ApplicationException("Debe confirmar la misma contraseña a guardar :(");
    //        }

    //        EntUsuarios usua = new EntUsuarios();
    //        usua.Usuario = txtUsuarioCC.Text.Trim();
    //        usua.Pregunta_Secreta = txtPalabraSecreta.Text.Trim();
    //        usua.Contraseña = txtNuevaCont.Text.Trim();
    //        EntUsuarios log = new BusUsuarios().SelectCambioPass(usua.Usuario, usua.Pregunta_Secreta);
    //        if (log == null)
    //        {
    //            txtUsuarioCC.Focus();
    //            throw new ApplicationException("Usuario y/o Palabra invalidos :(");
    //        }

    //        BusUsuarios obj = new BusUsuarios();
    //        obj.InsertaNuevoPass(usua);

    //        BusBitacora obj2 = new BusBitacora();
    //        obj2.InsertBitacoraFarmacia(log.Id_Usuario, log.NombreUsuario + " " + log.ApellidoPaterno + " " + log.ApellidoMaterno, DateTime.Now, 8, "CambioPass", "CAMBIO PASS : " + DateTime.Now + "El Usuario: " + log.NombreUsuario + " " + log.ApellidoPaterno + " " + log.ApellidoMaterno + " cambo su Password por: " + txtNuevaCont.Text);

    //        txtUsuarioCC.Text = "";
    //        txtPalabraSecreta.Text = "";
    //        txtNuevaCont.Text = "";
    //        txtConfirmarCont.Text = "";

    //        throw new ApplicationException("Nueva Contraseña Guardada con Exito. :)");

    //    }
    //    catch (Exception ex)
    //    {
    //        mostrarMensaje(ex.Message);
    //    }

    //}

   
}