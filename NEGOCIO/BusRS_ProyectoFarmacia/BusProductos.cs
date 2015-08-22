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
    public class BusProductos
    {
        public BusProductos() { }

        public List<EntProductos> Obtener()
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.Obtener();
            List<EntProductos> lista = new List<EntProductos>();

            foreach (DataRow r in dt.Rows)
            {
                EntProductos per = new EntProductos();
                per.Nombre_Producto = r["Nombre_Producto"].ToString();
                per.Sustancia = r["Sustancia"].ToString();
                per.IdCategoria = Convert.ToInt32(r["Id_Categoria"]);
                per.IdTipo = Convert.ToInt32(r["Id_Tipo"]);
                per.Cantidad = r["Cantidad"].ToString();
                per.Existencia = Convert.ToInt32(r["Existencia"]);
                per.Costo = Convert.ToInt32(r["Costo"]);

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

        public void InsertaProducto(EntProductos ent) {

            DatProductos dprod = new DatProductos();
            int lintFilas =dprod.agregaProducto(ent.Nombre_Producto,ent.Sustancia,ent.IdCategoria,ent.IdTipo,ent.Cantidad,ent.Existencia,ent.Costo);
            if(lintFilas != 1){
                throw new System.Exception("error en la capa de negocio al insertar un producto");
            }
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

            return ultimo ;
        }

        public void updateProducto(int productoID, int piezasAgregar, int piezasDescontar, double costoNuevo)
        {
            DatProductos obj = new DatProductos();
            bool Actualizo = obj.updateProducto(productoID,piezasAgregar,piezasDescontar,costoNuevo);
            if (Actualizo == false)
            {
                throw new SystemException("Error en la Capa de Negocios al Actualizar el Producto.");
            }
        }

    }
}
