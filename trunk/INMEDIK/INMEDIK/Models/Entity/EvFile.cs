//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace INMEDIK.Models.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class EvFile
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EvFile()
        {
            this.Service1 = new HashSet<Service>();
        }
    
        public int Id { get; set; }
        public Nullable<int> EvolutionNoteId { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public string OriginalName { get; set; }
        public string ContentType { get; set; }
        public string Description { get; set; }
        public Nullable<int> ServiceId { get; set; }
    
        public virtual EvolutionNote EvolutionNote { get; set; }
        public virtual Service Service { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Service> Service1 { get; set; }
    }
}