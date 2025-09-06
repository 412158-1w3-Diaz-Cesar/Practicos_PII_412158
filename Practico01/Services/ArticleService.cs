using Practico01.Data;
using Practico01.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Services
{
    public class ArticleService
    {
        private IArticleRepository _repositorio;
        public ArticleService()
        {
            _repositorio = new ArticleRepository();
        }
        public List<Article> GetArticles()
        {
            return _repositorio.GetAll();
        }
        public bool SaveArticle(Article article)
        {
            bool exito;

            // El Service sirve para agregar lógica de negocio según corresponda
            // En este caso, verificamos que no exista un producto con el mismo código
            var productEnBD = _repositorio.GetById(article.Id);

            // Si no existe, lo guardamos
            if (productEnBD == null)
            {
                exito = _repositorio.Save(article);
            }
            else
            {
                exito = false;
            }

            return exito;
        

            //return _repositorio.Save(article);
        }
    }
}
