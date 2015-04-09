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
        public List<EntProductos> ObtenerProd(string prod)
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.Obtenerprod(prod);
            List<EntProductos> lista = new List<EntProductos>();

            foreach (DataRow r in dt.Rows)
            {
                EntProductos per = new EntProductos();
                per.Nombre_Producto = r["Nombre_Producto"].ToString();
                per.Sustancia = r["Sustancia"].ToString();
                //per.IdCategoria = Convert.ToInt32(r["Id_Categoria"]);
                //per.IdTipo = Convert.ToInt32(r["Id_Tipo"]);
                per.Categoria = r["Nombre_Categoria"].ToString();
                per.Tipo = r["Nombre_Tipo"].ToString();
                per.Cantidad = r["Cantidad"].ToString();
                per.Existencia = Convert.ToInt32(r["Existencia"]);
                per.Costo = Convert.ToInt32(r["Costo"]);

                lista.Add(per);
            }

            return lista;
        }
    }
}
