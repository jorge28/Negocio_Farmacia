﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Managment.Business.Entity
{
    public class EntProductosVentas
    {
        public EntProductosVentas() { }
         
        public int UsuarioId { get; set; }
        public string NombreUsuario { get; set; }
        public DateTime FechaAlta { get; set; }
        public string fAlta { get; set; }
        public int NumCliente { get; set; }
        public string CategoriaProd { get; set; }
        public string TipoProd { get; set; }
        public int ProductoId { get; set; }
        public string NombreProducto { get; set; }
        public int PiezasVendidas { get; set; }
        public double CostoUnitario { get; set; }
        public double CostoTotal { get; set; }
        public double CostoTotalVenta { get; set; }
        public string CodigoBarras { get; set; }
    }

    public class EntProductosPedido
    {
        public EntProductosPedido() { }

        public int Id_Producto { get; set; }
        public string Nombre_Producto { get; set; }
        public string Sustancia { get; set; }
        public int IdCategoria { get; set; }
        public int IdTipo { get; set; }
        public string Cantidad { get; set; }
        public int Existencia { get; set; }
        public double Costo { get; set; }
        public string Categoria { get; set; }
        public string Tipo { get; set; }
        public string CodigoBarras { get; set; }

    }   
}
