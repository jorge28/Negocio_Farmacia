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
                venta.TipoProd = dr["Nombre_Tipo"].ToString();
                venta.NombreProducto = dr["Venta_Nombre_Producto"].ToString();
                venta.PiezasVendidas = Convert.ToInt32(dr["Venta_Piezas_Vendidas"]);
                venta.CostoUnitario = Convert.ToDouble(dr["Venta_Costo_Unitario"]);
                venta.CostoTotal = Convert.ToDouble(dr["Venta_Costo_Total"]);

                lista.Add(venta);
            }
            return lista;
        }

        public List<EntProductosPedido> SelectPedidoProductos()
        {

            DataTable dt = new DatReportes().SelectPedidoProductos();
            List<EntProductosPedido> lista = new List<EntProductosPedido>();
            if (dt.Rows.Count == 0)
                throw new ApplicationException("No hay Productos Agotados :)");

            foreach (DataRow dr in dt.Rows)
            {
                EntProductosPedido pedido = new EntProductosPedido();

                pedido.Id_Producto = Convert.ToInt32(dr["Id_Producto"]);
                pedido.Nombre_Producto = dr["Nombre_Producto"].ToString();
                pedido.Sustancia = dr["Sustancia"].ToString();
                pedido.Cantidad = dr["Cantidad"].ToString();
                pedido.Existencia = Convert.ToInt32(dr["Existencia"]);
                pedido.Costo = Convert.ToDouble(dr["Costo"]);
                pedido.Categoria = dr["Categoria"].ToString();
                pedido.Tipo = dr["Tipo"].ToString();

                lista.Add(pedido);
            }
            return lista;
        }
    }
}
