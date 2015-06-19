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

        public DataTable SelectEmpleado(string usuario, string contraseña)
        {
            SqlCommand comando = new SqlCommand("sp_SelectUsuario", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Usuario", usuario);
            comando.Parameters.AddWithValue("@Contraseña", contraseña);
            comando.Parameters.AddWithValue("@Nivel_Usua", 3);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable SelectAdmon(string usuario, string contraseña)
        {
            SqlCommand comando = new SqlCommand("sp_SelectUsuario", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Usuario", usuario );
            comando.Parameters.AddWithValue("@Contraseña", contraseña );
            comando.Parameters.AddWithValue("@Nivel_Usua", 2);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

    }
}
