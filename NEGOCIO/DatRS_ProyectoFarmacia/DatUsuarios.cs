using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Data
{
    public class DatUsuarios : DatAbstract_Conexion
    {
        public DatUsuarios() { }

        public DataTable SelectUsuario(string usuario, string contraseña)
        {
            SqlCommand comando = new SqlCommand("sp_SelectUsuario", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Usuario", usuario);
            comando.Parameters.AddWithValue("@Contraseña", contraseña);           
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public int agregaUsuarioD(string nombre, string paterno, string materno, string direccion, string tel, string cel, string usua,string pass)
        {

            SqlCommand comando = new SqlCommand("", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = nombre, ParameterName = "@nombre" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = paterno, ParameterName = "@paterno" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = materno, ParameterName = "@materno" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = direccion, ParameterName = "@direccion" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = tel, ParameterName = "@telefono" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = cel, ParameterName = "@celular" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = usua, ParameterName = "@usuario" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = pass, ParameterName = "@password" });
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
