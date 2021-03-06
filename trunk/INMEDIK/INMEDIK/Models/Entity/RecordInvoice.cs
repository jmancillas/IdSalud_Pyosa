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
    
    public partial class RecordInvoice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RecordInvoice()
        {
            this.RecordTransactionInvoice = new HashSet<RecordTransactionInvoice>();
        }
    
        public int RecordInvoiceId { get; set; }
        public int InvoiceId { get; set; }
        public string Code { get; set; }
        public int ClinicId { get; set; }
        public int Version { get; set; }
        public System.DateTime Created { get; set; }
        public int CreatedBy { get; set; }
    
        public virtual Clinic Clinic { get; set; }
        public virtual Invoice Invoice { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecordTransactionInvoice> RecordTransactionInvoice { get; set; }
    }
}
