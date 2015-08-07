using RS_ProyectoFarmacia.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RS_ProyectoFarmacia.Business
{
    public class BusBitacora
    {
        public BusBitacora() { }

        public void InsertBitacoraFarmacia(int usuarioId, string usuarioNombre, DateTime fechaOperacion, int operacionId, string operacion, string mensaje)
        {
            DatBitacora obj = new DatBitacora();
            bool Inserto = obj.InsertBitacoraFarmacia(usuarioId,usuarioNombre,fechaOperacion,operacionId,operacion,mensaje);
            if (Inserto == false)
            {
                throw new SystemException("Error en la Capa de Negocios al Guardar la Bitacora.");
            }

        }
    }
}
