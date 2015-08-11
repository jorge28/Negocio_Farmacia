using RS_ProyectoFarmacia.Business.Entity;
using RS_ProyectoFarmacia.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Business
{
    public class BusReportes
    {
        public BusReportes() { }

        public List<EntProductosVentas> SelectVentasEmpleados(int usuario)
        {
            DataTable dt = new DatReportes().SelectVentasEmpleados(usuario);
            List<EntProductosVentas> lista = new List<EntProductosVentas>();
            if (dt.Rows.Count == 0)
                throw new ApplicationException("No hay Ventas Registradas :(");

            foreach (DataRow dr in dt.Rows)
            {
                EntProductosVentas venta = new EntProductosVentas();
                venta.NombreUsuario = dr["Venta_Nombre_Usuario"].ToString();
                venta.NumCliente = Convert.ToInt32(dr["Venta_Num_cliente"]);
                venta.FechaAlta = Convert.ToDateTime(dr["Venta_Fecha_Alta"]);
                venta.CategoriaProd = dr["Nombre_Categoria"].ToString();
                venta.NombreProducto = dr["Venta_Nombre_Producto"].ToString();
                venta.PiezasVendidas = Convert.ToInt32(dr["Venta_Piezas_Vendidas"]);
                venta.CostoUnitario = Convert.ToDouble(dr["Venta_Costo_Unitario"]);
                venta.CostoTotal = Convert.ToDouble(dr["Venta_Costo_Total"]);

                lista.Add(venta);
            }
            return lista;
        }
    }
}
