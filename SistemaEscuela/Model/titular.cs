//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SistemaEscuela.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class titular
    {
        public titular()
        {
            this.matriculas = new HashSet<matricula>();
            this.pagos = new HashSet<pago>();
        }
    
        public int idTitular { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Telefono_Particular { get; set; }
        public string Telefono_Oficina { get; set; }
        public string RFC { get; set; }
        public string Compania { get; set; }
        public string Profesion { get; set; }
        public int Dom_Titular_idDom_Titular1 { get; set; }
        public string Telefono_Celular { get; set; }
        public Nullable<int> No_Confidencial { get; set; }
    
        public virtual dom_titular dom_titular { get; set; }
        public virtual ICollection<matricula> matriculas { get; set; }
        public virtual ICollection<pago> pagos { get; set; }
    }
}