using Practico01.Data.Helpers;
using Practico01.Data.Interfaces;
using Practico01.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Data.Implementations
{
    public class ArticleRepository : IArticleRepository
    {
        public bool Delete(int id)
        {
            List<ParametroSP> param = new List<ParametroSP>()
            {
                new ParametroSP()
                {
                    Nombre = "@id_articulo",
                    Valor = id
                }
            };

            var dt = DataHelper.GetInstance().ExecuteSPQuery("SP_REGISTRAR_BAJA_ARTICULO", param);

            return dt != null;
        }

        public List<Article> GetAll()
        {
            List<Article> lst = new List<Article>();
            var dt = DataHelper.GetInstance().ExecuteSPQuery("SP_RECUPERAR_ARTICULOS");
            foreach (DataRow fila in dt.Rows)
            {
                Article A = new Article();
                A.Id = (int)fila["Id_articulo"];
                A.Nombre = (string)fila["n_articulo"];
                A.PrecioUnitario = (double)fila["precio"];
                A.Stock = (int)fila["stock"];
                A.Esta_activo = (bool)fila["esta_activo"];
                lst.Add(A);
            }
            return lst;
        }

        public Article GetById(int id)
        {
            List<ParametroSP> param = new List<ParametroSP>()
            {
                new ParametroSP()
                {
                    Nombre = "@codigo",
                    Valor = id
                }
            };
            var dt = DataHelper.GetInstance().ExecuteSPQuery("SP_RECUPERAR_PRODUCTO_POR_CODIGO", param);

            if (dt != null && dt.Rows.Count > 0)
            {
                Article A = new Article()
                {
                    Id = (int)dt.Rows[0]["id_articulo"],
                    Nombre = (string)dt.Rows[0]["n_articulo"],
                    PrecioUnitario = (double)dt.Rows[0]["precio"],
                    Stock = (int)dt.Rows[0]["stock"],
                    Esta_activo = (bool)dt.Rows[0]["esta_activo"]
                };

                return A;
            }
            return null;
        }
        public bool Save(Article article)
        {
            throw new NotImplementedException();
        }
    }
}
