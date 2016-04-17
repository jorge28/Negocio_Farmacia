using Managment.Business.Entity;
using Managment.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Managment.Business
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

        public EntUsuarios SelectCambioPass(string usuario, string palabra)
        {
            DataTable dt = new DatUsuarios().SelectCambioPass(usuario, palabra);
            if (dt.Rows.Count == 0)
                throw new ApplicationException("Usuario y/o Palabra Secreta incorrectos :(");
            DataRow dr = dt.Rows[0];
            EntUsuarios usua = new EntUsuarios();
            usua.Id_Usuario = Convert.ToInt32(dr["Id_Usuario"]);
            usua.NombreUsuario = dr["Nombre_Usuario"].ToString();
            usua.ApellidoPaterno = dr["Apellido_Paterno"].ToString();
            usua.ApellidoMaterno = dr["Apellido_Materno"].ToString();
            usua.Usuario = dr["Usuario"].ToString();
            usua.Pregunta_Secreta = usua.Pregunta_Secreta = dr["Pregunta_Secreta"].ToString();

            return usua;
        }

        public void InsertaUsuario(string nombre, string paterno, string materno, string direccion, string tel, string cel, string usua, string pass, string pregunta)
        {

            DatUsuarios dusua = new DatUsuarios();
            int lintFilas = dusua.agregaUsuarioD(nombre, paterno, materno, direccion, tel, cel, usua, pass, pregunta);
            if (lintFilas != 1)
            {
                throw new System.Exception("error en la capa de negocio al insertar un usuario");
            }
        }

        public void InsertaNuevoPass(EntUsuarios ent)
        {
            DatUsuarios usua = new DatUsuarios();
            int filas = usua.InsertaNuevoPass(ent.Usuario, ent.Pregunta_Secreta, ent.Contraseña);
            if (filas != 1)
                throw new ApplicationException("Error en la capa de Negocios al Guardar la Nueva COntraseña. :(");
        }

    }
}
