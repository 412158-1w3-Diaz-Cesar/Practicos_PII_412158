using Practico01.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Data.Interfaces
{
    public interface IFormaPagoRepository
    {
        List<FormadePago> GetAll();
        FormadePago? GetById(int codigo);
    }
}
