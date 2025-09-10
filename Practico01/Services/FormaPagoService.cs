using Practico01.Data.Interfaces;
using Practico01.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practico01.Services
{
    public class FormaPagoService
    {
        private readonly IFormaPagoRepository _repository;

        public FormaPagoService(IFormaPagoRepository repository)
        {
            _repository = repository;
        }

        public List<FormadePago> GetFormasPago()
        {
            return _repository.GetAll();
        }

        public FormadePago? GetFormaPago(int codigo)
        {
            return _repository.GetById(codigo);
        }
    }
}
