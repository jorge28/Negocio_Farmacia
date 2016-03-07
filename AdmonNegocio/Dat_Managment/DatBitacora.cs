using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Managment.Data
{
    public class DatBitacora : DatAbstract_Conexion
    {
        public DatBitacora() { }

        public bool InsertBitacoraFarmacia(int usuarioId, string usuarioNombre, DateTime fechaOperacion, int operacionId, string operacion, string mensaje)
        {
            SqlTransaction objtrans = null;
            try
            {
                con.Open();
                objtrans = con.BeginTransaction();
                SqlCommand comando = new SqlCommand("sp_Insert_Bitacora", con);
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@UsuarioId", usuarioId);
                comando.Parameters.AddWithValue("@UsuarioNombre", usuarioNombre);
                comando.Parameters.AddWithValue("@FechaOperacion", fechaOperacion);
                comando.Parameters.AddWithValue("@OperacionId", operacionId);
                comando.Parameters.AddWithValue("@Operacion", operacion);
                comando.Parameters.AddWithValue("@Mensaje", mensaje);

                var _with1 = comando;
                _with1.Transaction = objtrans;
                _with1.ExecuteNonQuery();

                comando.Parameters.Clear();

                objtrans.Commit();
                return true;
            }
            catch (DataException)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Guardar la Bitacora.");
            }
            catch (Exception)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Guardar la Bitacora.");
            }
            finally
            {
                con.Close();
                con.Dispose();
            }

        }
    }
}
