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
            return dt.Rows[0];
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
