using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RS_ProyectoFarmacia.Business.Utility;

namespace RS_ProyectoFarmacia.Data
{
    public abstract class DatAbstract_Conexion
    {
        public SqlConnection con;
        public DatAbstract_Conexion() {
            con = new SqlConnection();
            string cadena = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            //string desencriptar = UtiCrypto.DesEncriptar(cadena);
            con.ConnectionString = cadena;
        }

    }
}
