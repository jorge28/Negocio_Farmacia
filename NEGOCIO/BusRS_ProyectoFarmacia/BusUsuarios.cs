using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RS_ProyectoFarmacia.Business.Entity;
using RS_ProyectoFarmacia.Data;

namespace RS_ProyectoFarmacia.Business
{
    public class BusUsuarios
    {
        public BusUsuarios() { }

        public EntUsuarios SelectUsuario(string usuario, string contraseña)
        {
            DataTable dt = new DatUsuarios().SelectUsuario(usuario, contraseña);
            if (dt.Rows.Count == 0)
                throw new ApplicationException("Usuario y/o Contraseña invalidos :(");

            DataRow dr = dt.Rows[0];
            EntUsuarios usua = new EntUsuarios();
            usua.Id_Usuario = Convert.ToInt32(dr["Id_Usuario"]);
            usua.NombreUsuario = dr["Nombre_Usuario"].ToString();
            usua.ApellidoPaterno = dr["Apellido_Paterno"].ToString();
            usua.ApellidoMaterno = dr["Apellido_Materno"].ToString();
            usua.Usuario = dr["Usuario"].ToString();
            usua.Contraseña = dr["Contraseña"].ToString();
            usua.Nivel_Usuario = dr["Nivel_Usuario"].ToString();                
            usua.FechaAlta = Convert.ToDateTime(dr["Fecha_Alta"]);
            usua.Telefono = dr["Telefono"].ToString();
            usua.Celular = dr["Celular"].ToString();
            usua.Direccion = dr["Direccion"].ToString();
            usua.Estatus = Convert.ToBoolean(dr["Estatus"]);
            usua.Pregunta_Secreta = dr["Pregunta_Secreta"].ToString();
            return usua;
        }
        public void InsertaUsuario(EntUsuarios ent)
        {

            DatUsuarios dusua = new DatUsuarios();
            int lintFilas = dusua.agregaUsuarioD(ent.NombreUsuario, ent.ApellidoPaterno, ent.ApellidoMaterno, ent.Direccion, ent.Telefono, ent.Celular, ent.Usuario, ent.Contraseña, ent.Pregunta_Secreta);
            if (lintFilas != 1)
            {
                throw new System.Exception("error en la capa de negocio al insertar un usuario");
            }
        }

    }
}
