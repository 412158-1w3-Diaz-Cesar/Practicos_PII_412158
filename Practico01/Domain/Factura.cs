using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Domain
{
    public class Factura
    {
        public int NroFactura { get; set; }
        public DateTime Fecha { get; set; }
        public FormadePago FormadePago { get; set; }
        public string Cliente { get; set; }
        public List<DetalleFactura> Detalles { get; set; } = new List<DetalleFactura>();


        public void AgregarDetalle(Article article, int cantidad)
        {
            var detalleExistente = Detalles.FirstOrDefault(d => d.Article.Id == article.Id);
            if (detalleExistente != null)
            {
                detalleExistente.Cantidad += cantidad;
            }
            else
            {
                Detalles.Add(new DetalleFactura { Article = article, Cantidad = cantidad });
            }
        }
    }
}
