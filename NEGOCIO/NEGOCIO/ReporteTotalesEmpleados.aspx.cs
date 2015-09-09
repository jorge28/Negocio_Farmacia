using CrystalDecisions.CrystalReports.Engine;
using RS_ProyectoFarmacia.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RS_ProyectoFarmacia.Business.Entity;

public partial class ReporteTotalesEmpleados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
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
                int IdUsuario = Convert.ToInt32(Session["IdUsuario"].ToString());
                ReportDocument rep = new ReportDocument();
                rep.Load(Server.MapPath("Reportes\\crTotalesEmpleados.rpt"));
                rep.SetDataSource(new BusReportes().SelectVentasEmpleados(IdUsuario));
                crTotalesEmpleados.ReportSource = rep;
            }
        }
        catch (Exception ex)
        {

            string script = "alert('" + ex.Message.Replace("'", "\"") + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);

        }

    }
    protected void btnRegresar_Click(object sender, EventArgs e)
    {
        Response.Redirect("VentasEmp1.aspx");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy");
    }

    protected void btnImprimir_Click(object sender, EventArgs e)
    {
        int IdUsuario = Convert.ToInt32(Session["IdUsuario"].ToString());
        ReportDocument rep = new ReportDocument();
        rep.Load(Server.MapPath("Reportes\\crTotalesEmpleados.rpt"));
        rep.SetDataSource(new BusReportes().SelectVentasEmpleados(IdUsuario));
        rep.PrintOptions.PrinterName = "HP DeskJet 840C/841C/842C/843C";
        rep.PrintToPrinter(1, false, 0, 0);
    }
}