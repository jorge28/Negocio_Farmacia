using Managment.Business.Entity;
using Managment.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Managment.Business
{
    public class BusProductos
    {
        public BusProductos() { }

        public List<EntProductosBuscador> Obtener()
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.Obtener();
            List<EntProductosBuscador> lista = new List<EntProductosBuscador>();

            foreach (DataRow r in dt.Rows)
            {
                EntProductosBuscador per = new EntProductosBuscador();
                per.Id_Producto = Convert.ToInt32(r["Id_Producto"]);
                per.Nombre_Producto = r["Nombre_Producto"].ToString();
                per.label = r["Buscador"].ToString();
                per.Sustancia = r["Sustancia"].ToString();
                per.IdCategoria = Convert.ToInt32(r["Id_Categoria"]);
                per.IdTipo = Convert.ToInt32(r["Id_Tipo"]);
                per.Cantidad = r["Cantidad"].ToString();
                per.Existencia = Convert.ToInt32(r["Existencia"]);
                per.Costo = Convert.ToDouble(r["Costo"]);
                per.CodigoBarras = r["CodigoBarras"].ToString();

                lista.Add(per);
            }

            return lista;
        }
        public EntProductos ObtenerProd(string prod, string piezas = "")
        {
            DatProductos obj = new DatProductos();
            DataRow dr = obj.Obtenerprod(prod);

            EntProductos per = new EntProductos();
            per.Id_Producto = Convert.ToInt32(dr["Id_Producto"]);
            per.Nombre_Producto = dr["Nombre_Producto"].ToString();
            per.Sustancia = dr["Sustancia"].ToString();
            per.Categoria = dr["Nombre_Categoria"].ToString();
            per.Tipo = dr["Nombre_Tipo"].ToString();
            per.Cantidad = dr["Cantidad"].ToString();
            per.Existencia = Convert.ToInt32(dr["Existencia"]);
            per.Costo = Convert.ToDouble(dr["Costo"]);
            per.Piezas = piezas == "" ? "0" : piezas;
            per.TotalVentaProd = Convert.ToDouble(per.Piezas) * per.Costo;
            per.IdCategoria = Convert.ToInt32(dr["Id_Categoria"]);
            per.IdTipo = Convert.ToInt32(dr["Id_Tipo"]);

            return per;
        }
        public List<EntDdlAlta> ObtenerCatB()
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.ObtenerCategoria();
            List<EntDdlAlta> lista = new List<EntDdlAlta>();

            foreach (DataRow r in dt.Rows)
            {
                EntDdlAlta objC = new EntDdlAlta();
                objC.Id_Categoria = Convert.ToInt32(r["Id_Categoria"]);
                objC.Nombre_Categoria = r["Nombre_Categoria"].ToString();
                lista.Add(objC);
            }

            return lista;
        }
        public List<EntDdlAlta> ObtenerTipoB()
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.ObtenerTipo();
            List<EntDdlAlta> lista = new List<EntDdlAlta>();

            foreach (DataRow r in dt.Rows)
            {
                EntDdlAlta objT = new EntDdlAlta();
                objT.Id_Tipo = Convert.ToInt32(r["Id_Tipo"]);
                objT.Nombre_Tipo = r["Nombre_Tipo"].ToString();
                lista.Add(objT);
            }

            return lista;
        }
        public string InsertaProducto(string prod, string sust, int cat, int tipo, string cant, int exis, double precio, string codigo)
        {
            DatProductos dprod = new DatProductos();
            string mensaje = "OK";
            bool existe = dprod.ValidarInsertProducto(codigo);
            if (existe)
                mensaje = (string.Format("Ya existe el código {0}, favor de verificar.", codigo));
            else
            {
                int lintFilas = dprod.agregaProducto(prod, sust, cat, tipo, cant, exis, precio, codigo);
                if (lintFilas != 1)
                    mensaje = ("Error en la capa de negocio al guardar el nuevo producto");
            }
            return mensaje;
        }
        public void InsertVentas(List<EntProductosVentas> ListaProductos)
        {
            DatProductos obj = new DatProductos();
            bool Inserto = obj.InsertVentas(ListaProductos);
            if (Inserto == false)
            {
                throw new SystemException("Error en la Capa de Negocios al Guardar la Venta.");
            }

        }
        public void InsertCancelaciones(List<EntProductosVentas> ListaProductos)
        {
            DatProductos obj = new DatProductos();
            bool Inserto = obj.InsertCancelaciones(ListaProductos);
            if (Inserto == false)
            {
                throw new SystemException("Error en la Capa de Negocios al Guardar la Cancelacion.");
            }

        }
        public EntUltimoCliente SelectUltimoCliente(int usuarioID)
        {
            DatProductos obj = new DatProductos();
            DataRow dr = obj.SelectUltimoCliente(usuarioID);

            EntUltimoCliente ultimo = new EntUltimoCliente();

            ultimo.Fecha = Convert.ToDateTime(dr["Fecha"] is DBNull ? "01/01/1900" : dr["Fecha"]);
            ultimo.Venta_Num_Cliente = Convert.ToInt32(dr["Venta_Num_Cliente"] is DBNull ? "0" : dr["Venta_Num_Cliente"]);

            return ultimo;
        }
        public void updateProducto(int productoID, int piezasAgregar, int piezasDescontar, double costoNuevo)
        {
            DatProductos obj = new DatProductos();
            bool Actualizo = obj.updateProducto(productoID, piezasAgregar, piezasDescontar, costoNuevo);
            if (Actualizo == false)
            {
                throw new SystemException("Error en la Capa de Negocios al Actualizar el Producto.");
            }
        }
        public string actualizaProdBus(string prod, string sust, int cat, int tipo, string cant, int exist, double costo, string codigo, int productoID)
        {
            DatProductos obj = new DatProductos();
            string mensaje = "OK";
            bool existe = obj.ValidarUpdateProducto(codigo, productoID);
            if (existe)
                mensaje = (string.Format("Ya existe el código {0}, favor de verificar.", codigo));
            else
            {
                bool Actualizo = obj.ActualizaProd(prod, sust, cat, tipo, cant, exist, costo, codigo, productoID);
                if (Actualizo == false)
                    mensaje = ("Error en la Capa de Negocios al Actualizar el Producto.");
            }
            return mensaje;
        }

    }
}
