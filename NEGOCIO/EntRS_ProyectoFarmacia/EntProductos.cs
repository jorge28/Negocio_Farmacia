using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Business.Entity
{
    public class EntProductos
    {
        public EntProductos() { }

        public string Nombre_Producto { get; set; }
        public string Sustancia { get; set; }
        public int IdCategoria { get; set; }
        public int IdTipo { get; set; } 
        public string Cantidad { get; set; }
        public int Existencia { get; set; }
        public double Costo { get; set; }
        public string Categoria { get; set; }
        public string Tipo { get; set; }
        public string Piezas { get; set; }
        public double TotalVentaProd { get; set; }
    }
}
