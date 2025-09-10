using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace Practico01.Data.Helpers
{
    public class DataHelper
    {
        private static DataHelper _instancia;
        private SqlConnection _connection;

        private DataHelper()
        {
            _connection = new SqlConnection(Properties.Resources.CadenaConexionLocal);
            //_connection = new SqlConnection(@"Data Source=ING-DIAZCES\SQLEXPRESS;Initial Catalog=DB_PRACTICA01;Integrated Security=True;Encrypt=False");
        }
        public static DataHelper GetInstance()
        {
            if (_instancia == null)
            {
                _instancia = new DataHelper();
            }
            return _instancia;
        }
        public DataTable ExecuteSPQuery(string sp, List<ParametroSP>? param = null)
        {
            DataTable dt = new DataTable();
            try
            {
                _connection.Open();
                var cmd = new SqlCommand(sp, _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = sp;

                if (param != null)
                {
                    foreach (ParametroSP p in param)
                    {
                        cmd.Parameters.AddWithValue(p.Nombre, p.Valor);
                    }
                }

                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                dt = null;
            }
            finally
            {
                _connection.Close();
            }

            return dt;
        }

    }
}
