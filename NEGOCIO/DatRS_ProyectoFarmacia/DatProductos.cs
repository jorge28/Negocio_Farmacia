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
        public DataTable ObtenerCategoria()
        {
            SqlCommand comando = new SqlCommand("sp_SelectCategoria", con);
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds.Tables[0];
        }
        public DataTable ObtenerTipo()
        {
            SqlCommand comando = new SqlCommand("sp_SelectTipo", con);
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds.Tables[0];
        }
        public int agregaProducto(string prod,string sust,int cat,int tipo,string cant,int exis,double precio) {

            SqlCommand comando = new SqlCommand("",con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = prod, ParameterName = "@producto" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = sust, ParameterName = "@sustancia" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = cat, ParameterName = "@categoria" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = tipo, ParameterName = "@tipo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = cant, ParameterName = "@cantidad" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = exis, ParameterName = "@existencia" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Float, Value = precio, ParameterName = "@precio" });
            try
            {
                con.Open();
                int filas = comando.ExecuteNonQuery();
                con.Close();

                return filas;
            }
            catch (Exception ex)
            {
                
                throw new ApplicationException(ex.Message);
            }
        
        }
    }
}
