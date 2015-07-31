using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Data
{
    public class DatProductos:DatAbstract_Conexion 
    {
        public DatProductos() { }

           public DataTable Obtener()
        {
            SqlCommand comando = new SqlCommand("sp_SelectProductos", con);
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds.Tables[0];      
        }
        public DataRow Obtenerprod(string prod)
        {
          
                SqlCommand comando = new SqlCommand("sp_SelectProductos1", con);
                comando.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(comando);
                comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = prod, ParameterName = "@producto" });
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt.Rows[0];

          
            
        }
    }
}
