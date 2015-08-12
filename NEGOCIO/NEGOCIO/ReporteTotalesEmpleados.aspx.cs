using CrystalDecisions.CrystalReports.Engine;
using RS_ProyectoFarmacia.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReporteTotalesEmpleados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           int IdUsuario = Convert.ToInt32(Session["IdUsuario"].ToString());
            ReportDocument rep = new ReportDocument();
            rep.Load(Server.MapPath("Reportes\\crTotalesEmpleados.rpt"));
            rep.SetDataSource(new BusReportes().SelectVentasEmpleados(IdUsuario));
            crTotalesEmpleados.ReportSource = rep;
        }
        catch (Exception ex)
        {
       
        string script = "alert('" + ex.Message.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ERROR", script, true);
    
        }
    
    }
}