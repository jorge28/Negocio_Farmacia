using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Managment.Data
{
    public abstract class DatAbstract_Conexion
    {
        public SqlConnection con;
        public DatAbstract_Conexion()
        {
            con = new SqlConnection();
            string cadena = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            //string desencriptar = UtiCrypto.DesEncriptar(cadena);
            con.ConnectionString = cadena;
        }
    }
}
