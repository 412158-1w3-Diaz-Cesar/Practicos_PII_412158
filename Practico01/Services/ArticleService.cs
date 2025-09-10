using Practico01.Data;
using Practico01.Data.Implementations;
using Practico01.Data.Interfaces;
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


            var ArticleEnBD = _repositorio.GetById(article.Id);

            if (ArticleEnBD == null)
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
