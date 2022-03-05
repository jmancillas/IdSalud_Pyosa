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
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.AlmOrder = new HashSet<AlmOrder>();
            this.AlmSupplierProducts = new HashSet<AlmSupplierProducts>();
            this.ProductWarehouse = new HashSet<ProductWarehouse>();
        }
    
        public int id { get; set; }
        public Nullable<bool> LicenseRequired { get; set; }
        public Nullable<int> ConceptId { get; set; }
        public string Code { get; set; }
        public Nullable<bool> Nurse { get; set; }
        public string Notes { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public Nullable<int> ProductNoteId { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> EvolutionNoteId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AlmOrder> AlmOrder { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AlmSupplierProducts> AlmSupplierProducts { get; set; }
        public virtual Concept Concept { get; set; }
        public virtual Concept Concept1 { get; set; }
        public virtual EvolutionNote EvolutionNote { get; set; }
        public virtual ProductNote ProductNote { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductWarehouse> ProductWarehouse { get; set; }
    }
}
