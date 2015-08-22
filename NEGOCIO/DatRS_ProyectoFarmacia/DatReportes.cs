using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Data
{
    public class DatReportes : DatAbstract_Conexion 
    {
        public DatReportes() { }

        public DataTable SelectVentasEmpleados(int usuario)
        {
            SqlCommand comando = new SqlCommand("sp_Select_VentasEmpleado", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@UsuarioId", usuario);            
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable SelectPedidoProductos()
        {
            SqlCommand comando = new SqlCommand("sp_Select_Pedido_Productos", con);
            comando.CommandType = CommandType.StoredProcedure;           
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }      

    }
}
