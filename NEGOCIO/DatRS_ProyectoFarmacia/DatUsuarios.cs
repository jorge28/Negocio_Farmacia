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

        public DataTable SelectCambioPass(string usuario, string palabra)
        {
            SqlCommand comando = new SqlCommand("sp_SelectCambioPass", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Usuario", usuario);
            comando.Parameters.AddWithValue("@Palabra", palabra);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;

        }
        public int agregaUsuarioD(string nombre, string paterno, string materno, string direccion, string tel, string cel, string usua, string pass, string pregunta)
        {

            SqlCommand comando = new SqlCommand("sp_InsertaUsuario", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = nombre, ParameterName = "@nombre" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = paterno, ParameterName = "@paterno" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = materno, ParameterName = "@materno" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = direccion, ParameterName = "@direccion" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = tel, ParameterName = "@tel" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = cel, ParameterName = "@cel" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = usua, ParameterName = "@usuario" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = pass, ParameterName = "@password" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = pregunta, ParameterName = "@pregunta" });
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

        public int InsertaNuevoPass(string usuario, string palabra, string contraseña)
        {

            SqlCommand comando = new SqlCommand("sp_InsertaNuevoPass", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = usuario, ParameterName = "@Usuario" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = palabra, ParameterName = "@Palabra" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = contraseña, ParameterName = "@Contrasenia" });
            
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
