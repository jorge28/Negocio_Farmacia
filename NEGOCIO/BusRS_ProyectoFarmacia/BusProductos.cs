﻿using System;
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
            //EntProductos lista = new EntProductos();


            EntProductos per = new EntProductos();
                per.Nombre_Producto = dr["Nombre_Producto"].ToString();
                per.Sustancia = dr["Sustancia"].ToString();
                //per.IdCategoria = Convert.ToInt32(r["Id_Categoria"]);
                //per.IdTipo = Convert.ToInt32(r["Id_Tipo"]);
                per.Categoria = dr["Nombre_Categoria"].ToString();
                per.Tipo = dr["Nombre_Tipo"].ToString();
                per.Cantidad = dr["Cantidad"].ToString();
                per.Existencia = Convert.ToInt32(dr["Existencia"]);
                per.Costo = Convert.ToDouble(dr["Costo"]);
                per.Piezas = piezas == "" ? "0" : piezas;
                per.TotalVentaProd = Convert.ToDouble(per.Piezas) * per.Costo;      

            return per;
        }

        public List<EntProductos> ObtenerCatB()
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.ObtenerCategoria();
            List<EntProductos> lista = new List<EntProductos>();

            foreach (DataRow r in dt.Rows)
            {
                EntProductos objP = new EntProductos();
                objP.IdCategoria = Convert.ToInt32(r["Id_Categoria"]);     
                objP.Categoria = r["Nombre_Categoria"].ToString();       
                lista.Add(objP);
            }

            return lista;
        }
        public List<EntProductos> ObtenerTipoB()
        {
            DatProductos obj = new DatProductos();
            DataTable dt = obj.ObtenerCategoria();
            List<EntProductos> lista = new List<EntProductos>();

            foreach (DataRow r in dt.Rows)
            {
                EntProductos objP = new EntProductos();
                objP.IdTipo = Convert.ToInt32(r["Id_Tipo"]);
                objP.Tipo = r["Nombre_Tipo"].ToString();
                lista.Add(objP);
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
        
 
    }
}
