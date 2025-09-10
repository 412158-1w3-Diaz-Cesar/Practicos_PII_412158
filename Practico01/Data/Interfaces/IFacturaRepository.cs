using Practico01.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Data.Interfaces
{
    public interface IFacturaRepository
    {
        List<Factura> GetAll();
        Factura? GetById(int nroFactura);
        bool Save(Factura factura);
        bool Delete(int nroFactura);
    }
}
