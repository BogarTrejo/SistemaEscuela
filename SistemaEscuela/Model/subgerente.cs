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
    
    public partial class subgerente
    {
        public subgerente()
        {
            this.matriculas = new HashSet<matricula>();
        }
    
        public int idSubgerente { get; set; }
        public string Nombre { get; set; }
        public int Organizacion_idOrganizacion { get; set; }
    
        public virtual ICollection<matricula> matriculas { get; set; }
        public virtual organizacion organizacion { get; set; }
    }
}
