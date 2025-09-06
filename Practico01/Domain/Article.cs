using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Domain
{
    public class Article
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public double PrecioUnitario { get; set; }
        public int Stock {  get; set; }
        public bool Esta_activo { get; set; }

        public override string ToString()
        {
            return Id + " _ " + Nombre + " _ " + Stock;

        }
    }

}
