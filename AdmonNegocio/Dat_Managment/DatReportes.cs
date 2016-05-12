using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Managment.Data
{
    public class DatReportes : DatAbstract_Conexion
    {
        public DatReportes() { }

        public DataTable SelectVentasEmpleados(string fechaVentas)
        {
            SqlCommand comando = new SqlCommand("sp_Select_VentasEmpleado", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@fechaVentas", fechaVentas);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataRow SelectVentasEmpleadosNEW(int usuario)
        {
            SqlCommand comando = new SqlCommand("sp_Select_VentasEmpleadoNEW", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@UsuarioId", usuario);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dr["Venta_Nombre_Usuario"] = "No hay Ventas Registradas";
                dr["VentasMedico"] = 0;
                dr["VentasFarmacia"] = 0;
                dt.Rows.Add(dr);
                return dt.Rows[0];
            }
            else
            {
                return dt.Rows[0];
            }

        }

        public DataTable SelectVentasMedicoNEW(int usuario)
        {
            SqlCommand comando = new SqlCommand("sp_Select_VentasMedicoNEW", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@UsuarioId", usuario);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable SelectPedidoProductos(int piezas)
        {
            SqlCommand comando = new SqlCommand("sp_Select_Pedido_Productos", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Piezas", piezas);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

    }
}
