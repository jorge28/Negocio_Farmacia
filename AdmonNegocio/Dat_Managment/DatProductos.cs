using Managment.Business.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Managment.Data
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
        public int agregaProducto(string prod, string sust, int cat, int tipo, string cant, int exis, double precio,string codigo)
        {

            SqlCommand comando = new SqlCommand("sp_InsertaProd", con);
            comando.CommandType = CommandType.StoredProcedure;
            
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = prod, ParameterName = "@producto" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = sust, ParameterName = "@sustancia" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = cat, ParameterName = "@categoria" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = tipo, ParameterName = "@tipo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = cant, ParameterName = "@cantidad" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = exis, ParameterName = "@existencia" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Float, Value = precio, ParameterName = "@costo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = codigo, ParameterName = "@codigoBarras" });
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
        public bool updateProducto(int productoID, int piezasAgregar, int piezasDescontar, double costoNuevo)
        {

            SqlTransaction objtrans = null;
            try
            {
                con.Open();
                objtrans = con.BeginTransaction();
                SqlCommand comando = new SqlCommand("sp_Update_Productos", con);
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@ProductoId", productoID);
                comando.Parameters.AddWithValue("@PiezasAgregar", piezasAgregar);
                comando.Parameters.AddWithValue("@PiezasDescontar", piezasDescontar);
                comando.Parameters.AddWithValue("@CostoNuevo", costoNuevo);

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
                throw new SystemException("Error en Capa de Datos al Actualizar el Producto.");
            }
            catch (Exception)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Actualizar el Producto.");
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        public bool updateExtraProducto(string prod, string sust, string cat, string tipo, string cant, int productoID)
        {

            SqlTransaction objtrans = null;
            try
            {
                con.Open();
                objtrans = con.BeginTransaction();
                SqlCommand comando = new SqlCommand("sp_UpdateExtraProd", con);
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@prod", prod);
                comando.Parameters.AddWithValue("@sust", sust);
                comando.Parameters.AddWithValue("@cat", cat);
                comando.Parameters.AddWithValue("@tipo", tipo);
                comando.Parameters.AddWithValue("@cant", cant);
                comando.Parameters.AddWithValue("@idProd", productoID);

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
                throw new SystemException("Error en Capa de Datos al Actualizar el Producto.");
            }
            catch (Exception)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Actualizar el Producto.");
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        public bool ActualizaProd(string prod, string sust, int cat, int tipo, string cant,int exist,double costo,string codigo, int productoID)
        {

            SqlTransaction objtrans = null;
            try
            {
                con.Open();
                objtrans = con.BeginTransaction();
                SqlCommand comando = new SqlCommand("sp_UpdateProductosCompleto", con);
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@producto", prod);
                comando.Parameters.AddWithValue("@sustancia", sust);
                comando.Parameters.AddWithValue("@categoria", cat);
                comando.Parameters.AddWithValue("@tipo", tipo);
                comando.Parameters.AddWithValue("@cantidad", cant);
                comando.Parameters.AddWithValue("@existencia", exist);
                comando.Parameters.AddWithValue("@costo", costo);
                comando.Parameters.AddWithValue("@codigoBarras", codigo);
                comando.Parameters.AddWithValue("@idProducto", productoID);

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
                throw new SystemException("Error en Capa de Datos al Actualizar el Producto.");
            }
            catch (Exception)
            {
                objtrans.Rollback();
                return false;
                throw new SystemException("Error en Capa de Datos al Actualizar el Producto.");
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        public bool ValidarUpdateProducto(string codigoBarras, int productoID)
        {
            bool existe = false;
            int idProd;
            SqlCommand comando = new SqlCommand(string.Format("SELECT * FROM tbl_Productos WHERE CodigoBarras ='{0}'", codigoBarras), con);

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(comando);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count != 0)                 
                {
                    if (dt.Rows.Count > 1)
                        existe = true;
                    else
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            idProd = Convert.ToInt32(dr["Id_Producto"]);
                            if (idProd != productoID)
                                existe = true;
                        }
                    }
                }
                 
                return existe;
            }
            catch (Exception ex)
            {

                throw new ApplicationException(ex.Message);
            }

        }
        public bool ValidarInsertProducto(string codigoBarras)
        {
            bool existe = false;
            SqlCommand comando = new SqlCommand(string.Format("SELECT 1 FROM tbl_Productos WHERE CodigoBarras ='{0}'", codigoBarras), con);

            try
            {
                con.Open();
                existe = Convert.ToBoolean(comando.ExecuteScalar());
                con.Close();

                return existe;
            }
            catch (Exception ex)
            {

                throw new ApplicationException(ex.Message);
            }

        }
        public bool eliminaProducto(int productoID)
        {
            
            bool existe = false;
            SqlCommand comando = new SqlCommand(string.Format("DELETE FROM tbl_Productos WHERE Id_Producto ='{0}'", productoID), con);

            try
            {
                con.Open();
                int filas = comando.ExecuteNonQuery();
                con.Close();

                if (filas == 1)
                    existe = true;

                return existe;
            }
            catch (Exception ex)
            {

                throw new ApplicationException(ex.Message);
            }

        }

    }
}
