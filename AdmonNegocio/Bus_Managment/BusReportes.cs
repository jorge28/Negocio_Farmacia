using Managment.Business.Entity;
using Managment.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Managment.Business
{
    public class BusReportes
    {
        public BusReportes() { }

        public List<EntProductosVentas> SelectVentasEmpleados(string fechaVentas)
        {
            DataTable dt = new DatReportes().SelectVentasEmpleados(fechaVentas);
            List<EntProductosVentas> lista = new List<EntProductosVentas>();
            //if (dt.Rows.Count == 0)
            //    throw new ApplicationException("No hay Ventas Registradas :(");

            foreach (DataRow dr in dt.Rows)
            {
                EntProductosVentas venta = new EntProductosVentas();
                venta.NumCliente = Convert.ToInt32(dr["Venta_Num_cliente"]);
                venta.FechaAlta = Convert.ToDateTime(dr["Venta_Fecha_Alta"]);
                venta.fAlta = venta.FechaAlta.ToString("dd/MM/yyyy HH:mm");
                venta.NombreUsuario = dr["Venta_Nombre_Usuario"].ToString();
                venta.ProductoId = Convert.ToInt32(dr["Venta_Producto_Id"]);
                venta.CodigoBarras = dr["CodigoBarras"].ToString();
                venta.NombreProducto = dr["Venta_Nombre_Producto"].ToString();
                venta.PiezasVendidas = Convert.ToInt32(dr["Venta_Piezas_Vendidas"]);
                venta.CostoUnitario = Convert.ToDouble(dr["Venta_Costo_Unitario"]);
                venta.CostoTotal = Convert.ToDouble(dr["Venta_Costo_Total"]);
                venta.CostoTotalVenta = Convert.ToDouble(dr["GranTotal"]);
               
                lista.Add(venta);
            }
            return lista;
        }

        public List<EntTotales> SelectVentasEmpleadosNEW(int usuarioID)
        {
  
           DataRow dr = new DatReportes().SelectVentasEmpleadosNEW(usuarioID);
           List<EntTotales> lista = new List<EntTotales>();

           EntTotales totales = new EntTotales();
            totales.Nombre_Empleado = (dr["Venta_Nombre_Usuario"] is DBNull ? "Aun No hay Ventas" : dr["Venta_Nombre_Usuario"]).ToString();
            totales.Ventas_Medico = (dr["VentasMedico"] is DBNull ? 0 : Convert.ToDouble(dr["VentasMedico"]));
            totales.Ventas_Farmacia = (dr["VentasFarmacia"] is DBNull ? 0 : Convert.ToDouble(dr["VentasFarmacia"]));
            totales.Ventas_Total = totales.Ventas_Medico + totales.Ventas_Farmacia;

            lista.Add(totales);

            return lista; 
        }

        public List<EntVentasMedico> SelectVentasMedicoNEW(int usuarioID)
        {
            DataTable dt = new DatReportes().SelectVentasMedicoNEW(usuarioID);
            List<EntVentasMedico> lista = new List<EntVentasMedico>();
            if (dt.Rows.Count == 0)
            {
                EntVentasMedico venta = new EntVentasMedico();
                venta.productoMedico = "Sin Ventas";
                venta.piezasProducto = 0;
               
                lista.Add(venta);
            }
            else
            {
                foreach (DataRow dr in dt.Rows)
                {
                    EntVentasMedico venta = new EntVentasMedico();
                    venta.productoMedico = dr["Venta_Nombre_Producto"].ToString().Replace("(Servicio Medico)","");
                    venta.piezasProducto = Convert.ToInt32(dr["Piezas"]);
                   
                    lista.Add(venta);
                }
            }
            return lista;
        }

        public List<EntProductosPedido> SelectPedidoProductos(int piezas)
        {

            DataTable dt = new DatReportes().SelectPedidoProductos(piezas);
            List<EntProductosPedido> lista = new List<EntProductosPedido>();
            //if (dt.Rows.Count == 0)
            //    throw new ApplicationException("No hay Productos Agotados :)");

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
                pedido.CodigoBarras = dr["CodigoBarras"].ToString();

                lista.Add(pedido);
            }
            return lista;
        }
    }
}
