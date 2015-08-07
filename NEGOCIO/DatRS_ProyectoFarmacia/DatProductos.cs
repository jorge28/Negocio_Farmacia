using RS_ProyectoFarmacia.Business.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Data
{
    public class DatProductos : DatAbstract_Conexion
    {
        public DatProductos() { }

        public DataTable Obtener()
        {
            SqlCommand comando = new SqlCommand("sp_SelectProductos", con);
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables.Count == 0)
                throw new ApplicationException("No se encontraron Productos :(");

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

            if (dt.Rows.Count == 0)
                throw new ApplicationException("No se encontraron Productos :(");

            return dt.Rows[0];
        }

        public bool InsertVentas(List<EntProductosVentas> ListaProductos)
        {
            SqlTransaction objtrans = null;
            try
            {
                con.Open();
                objtrans = con.BeginTransaction();
                SqlCommand comando = new SqlCommand("sp_Insert_Venta", con);
                comando.CommandType = CommandType.StoredProcedure;

                foreach (EntProductosVentas prodV in ListaProductos)
                {
                    comando.Parameters.AddWithValue("@UsuarioId", prodV.UsuarioId);
                    comando.Parameters.AddWithValue("@NombreUsuario", prodV.NombreUsuario);
                    comando.Parameters.AddWithValue("@FechaAlta", prodV.FechaAlta);
                    comando.Parameters.AddWithValue("@NumCliente", prodV.NumCliente);
                    comando.Parameters.AddWithValue("@ProductoId", prodV.ProductoId);
                    comando.Parameters.AddWithValue("@NombreProducto", prodV.NombreProducto);
                    comando.Parameters.AddWithValue("@PiezasVendidas", prodV.PiezasVendidas);
                    comando.Parameters.AddWithValue("@CostoUnitario", prodV.CostoUnitario);
                    comando.Parameters.AddWithValue("@CostoTotal", prodV.CostoTotal);

                    var _with1 = comando;
                    _with1.Transaction = objtrans;
                    _with1.ExecuteNonQuery();

                    comando.Parameters.Clear();
                }
                objtrans.Commit();
                return true;
            }
            catch (DataException)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Guardar la Venta.");
            }
            catch (Exception)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Guardar la Venta.");
            }
            finally
            {
                con.Close();
                con.Dispose();
            }

        }

        public bool InsertCancelaciones(List<EntProductosVentas> ListaProductos)
        {
            SqlTransaction objtrans = null;
            try
            {
                con.Open();
                objtrans = con.BeginTransaction();
                SqlCommand comando = new SqlCommand("sp_Insert_Cancelación", con);
                comando.CommandType = CommandType.StoredProcedure;

                foreach (EntProductosVentas prodV in ListaProductos)
                {
                    comando.Parameters.AddWithValue("@UsuarioId", prodV.UsuarioId);
                    comando.Parameters.AddWithValue("@NombreUsuario", prodV.NombreUsuario);
                    comando.Parameters.AddWithValue("@FechaAlta", prodV.FechaAlta);
                    comando.Parameters.AddWithValue("@NumCliente", prodV.NumCliente);
                    comando.Parameters.AddWithValue("@ProductoId", prodV.ProductoId);
                    comando.Parameters.AddWithValue("@NombreProducto", prodV.NombreProducto);
                    comando.Parameters.AddWithValue("@PiezasVendidas", prodV.PiezasVendidas);
                    comando.Parameters.AddWithValue("@CostoUnitario", prodV.CostoUnitario);
                    comando.Parameters.AddWithValue("@CostoTotal", prodV.CostoTotal);

                    var _with1 = comando;
                    _with1.Transaction = objtrans;
                    _with1.ExecuteNonQuery();

                    comando.Parameters.Clear();
                }
                objtrans.Commit();
                return true;
            }
            catch (DataException)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Guardar la Cancelacion.");
            }
            catch (Exception)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Guardar la Cancelacion.");
            }
            finally
            {
                con.Close();
                con.Dispose();
            }

        }
        public DataRow SelectUltimoCliente(int usuarioID)
        {
            SqlCommand comando = new SqlCommand("sp_Select_UltiCliente", con);
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(comando);
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = usuarioID, ParameterName = "@UsuarioId" });
            DataTable dt = new DataTable();
            da.Fill(dt);
            
            return dt.Rows[0];
        }
    }
}
