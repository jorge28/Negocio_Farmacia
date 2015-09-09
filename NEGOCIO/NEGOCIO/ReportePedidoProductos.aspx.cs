using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using RS_ProyectoFarmacia.Business;
using RS_ProyectoFarmacia.Business.Entity;

public partial class ReportePedidoProductos : System.Web.UI.Page
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
   
            ReportDocument rep = new ReportDocument();
            rep.Load(Server.MapPath("Reportes\\crPedidoProductos.rpt"));
            rep.SetDataSource(new BusReportes().SelectPedidoProductos());
            crPedidoProductos.ReportSource = rep;
        }
        catch (Exception ex)
        {

            string script = "alert('" + ex.Message.Replace("'", "\"") + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);

        }
    }

    // private void ConfigureCrystalReports()
    // {
    //    ReportDocument rep = new ReportDocument();
    //        rep.Load(Server.MapPath("Reportes\\crPedidoProductos.rpt"));
    //        rep.SetDataSource(new BusReportes().SelectPedidoProductos());
    //        crPedidoProductos.ReportSource = rep;
    // }

    //protected void crReporteGastos_Navigate(object source, crystalDecisions.Web.NavigateEventArgs e) Handles crReporteFacturacion.Navigate

    //    numpag.Text = CStr(e.NewPageNumber)

    //End Sub

    protected void btnRegresar_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAdmin.aspx");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Now.ToString("dd/MMM/yyyy");
    }

    protected void btnImprimir_Click(object sender, EventArgs e)
    {
        ReportDocument rep = new ReportDocument();
        rep.Load(Server.MapPath("Reportes\\crPedidoProductos.rpt"));
        rep.SetDataSource(new BusReportes().SelectPedidoProductos());
        rep.PrintOptions.PrinterName = "HP DeskJet 840C/841C/842C/843C";
        rep.PrintToPrinter(1, false, 0, 0);
    }
}