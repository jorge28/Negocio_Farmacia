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
using System.Web.Services;
using System.Web.Script.Serialization;


public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Login"] = null;
        txtUser.Focus();

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
                BusBitacora obj2 = new BusBitacora();
                obj2.InsertBitacoraFarmacia(log.Id_Usuario, log.NombreUsuario + " " + log.ApellidoPaterno + " " + log.ApellidoMaterno, DateTime.Now, 10, "InicioSession", "INICIO DE SESSION: En el modulo de Administrador " + DateTime.Now);

                Session["Login"] = log;
                Response.Redirect("tabsAdmin.aspx");

            }
            else if (Nivel == 3)
            {
                BusBitacora obj2 = new BusBitacora();
                obj2.InsertBitacoraFarmacia(log.Id_Usuario, log.NombreUsuario + " " + log.ApellidoPaterno + " " + log.ApellidoMaterno, DateTime.Now, 10, "InicioSession", "INICIO DE SESSION: En el modulo de Ventas " + DateTime.Now);

                Session["Login"] = log;
                Response.Redirect("VentasEmp1.aspx");
            }           
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }
    [WebMethod]
    public static string validaPalabra(string usuarioModal, string palabraModal)
    {
        DataTable dt = new DatUsuarios().SelectCambioPass(usuarioModal, palabraModal);
        string valida = Convert.ToString(dt.Rows.Count);

        JavaScriptSerializer oSerializer = new JavaScriptSerializer();
        string sJson = oSerializer.Serialize(valida);
        return sJson;
    }
    [WebMethod]
    public static void CambiaPass(string usua, string palabra, string pass)
    {
        BusUsuarios bu = new BusUsuarios();
        bu.InsertaNuevoPass(usua, palabra, pass);

        BusBitacora obj2 = new BusBitacora();
        obj2.InsertBitacoraFarmacia(0, usua, DateTime.Now, 8, "CambioPassword", "CAMBIO DE PASSWORD : " + DateTime.Now + " Usuario: " + usua + " Palabra Secreta: " + palabra + " Nuevo Password:" + pass + ".");
    } 
}