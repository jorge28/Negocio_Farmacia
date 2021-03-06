﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Managment.Business.Entity
{
    public class EntUsuarios
    {
        public EntUsuarios() { }

        public int Id_Usuario { get; set; }
        public string NombreUsuario { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Nivel_Usuario { get; set; }
        public DateTime FechaAlta { get; set; }
        public string Telefono { get; set; }
        public string Celular { get; set; }
        public string Direccion { get; set; }
        public bool Estatus { get; set; }
        public string Usuario { get; set; }
        public string Contraseña { get; set; }
        public string Pregunta_Secreta { get; set; }

    }
}
