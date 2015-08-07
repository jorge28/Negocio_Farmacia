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
    }
}
