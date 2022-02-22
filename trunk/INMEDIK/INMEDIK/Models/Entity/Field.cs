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
    
    public partial class Field
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Field()
        {
            this.FieldOption = new HashSet<FieldOption>();
            this.RelModuleField = new HashSet<RelModuleField>();
            this.RelFormField = new HashSet<RelFormField>();
        }
    
        public int id { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public int FieldTypeId { get; set; }
        public string Unit { get; set; }
        public string Reference { get; set; }
        public Nullable<decimal> UpperLimit { get; set; }
        public Nullable<decimal> LowerLimit { get; set; }
        public bool Deleted { get; set; }
        public int ModifiedById { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public Nullable<System.DateTime> Updated { get; set; }
    
        public virtual FieldType FieldType { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FieldOption> FieldOption { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RelModuleField> RelModuleField { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RelFormField> RelFormField { get; set; }
    }
}
