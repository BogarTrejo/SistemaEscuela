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
    
    public partial class dom_titular
    {
        public dom_titular()
        {
            this.titulars = new HashSet<titular>();
        }
    
        public int idDom_Titular { get; set; }
        public string Calle { get; set; }
        public Nullable<int> Numero { get; set; }
        public string Colonia { get; set; }
        public string Ciudad { get; set; }
    
        public virtual ICollection<titular> titulars { get; set; }
    }
}
