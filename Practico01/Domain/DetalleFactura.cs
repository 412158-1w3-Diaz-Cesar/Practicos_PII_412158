using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Domain
{
    public class DetalleFactura
    {
        public Article Article { get; set; }
        public int Cantidad { get; set; }
    }
}
