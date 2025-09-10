using Practico01.Data.Interfaces;
using Practico01.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Practico01.Data.Implementations
{
    public class FacturaRepository : IFacturaRepository
    {
        private readonly List<Factura> _facturas = new();

        public List<Factura> GetAll()
        {
            return _facturas;
        }

        public Factura? GetById(int nroFactura)
        {
            return _facturas.FirstOrDefault(f => f.NroFactura == nroFactura);
        }

        public bool Save(Factura factura)
        {
            var existente = GetById(factura.NroFactura);
            if (existente != null)
            {
                return false; // ya existe con mismo nro
            }

            _facturas.Add(factura);
            return true;
        }

        public bool Delete(int nroFactura)
        {
            var factura = GetById(nroFactura);
            if (factura != null)
            {
                _facturas.Remove(factura);
                return true;
            }
            return false;
        }
    }
}
